<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Members extends CI_Controller 
{

	public function __construct() 
	{
		parent::__construct();
		$this->load->model("user_model");

		if(!$this->user->loggedin) $this->template->error(lang("error_1"));
		


		// If the user does not have premium. 
		// -1 means they have unlimited premium
		if($this->settings->info->global_premium && 
			($this->user->info->premium_time != -1 && 
				$this->user->info->premium_time < time()) ) {
			$this->session->set_flashdata("globalmsg", lang("success_29"));
			redirect(site_url("hideend/funds/plans"));
		}
	}

	public function index() 
	{
				$this->template->loadData("activeLink", 
			array("members" => array("general" => 1)));
		if($this->user->loggedin && isset($this->user->info->user_role_id) &&
           !($this->user->info->admin || $this->user->info->admin_settings || $this->user->info->admin_members || $this->user->info->admin_payment)

           ) {
			redirect(site_url("hideend/"));
		}
		$this->template->loadData("activeLink",
			array("data" => array("members" => 1)));
			
		$javascript = '$(document).ready(function() {
			   var st = $("#search_type").val();
				var table = $("#content-table").DataTable({
					"dom" : "<\'row\'<\'col-sm-12\'tr>>" +
							"<\'row\'<\'col-sm-5\'i><\'col-sm-7\'p>>",
				  "processing": false,
					"pagingType" : "full_numbers",
					"postLength" : 15,
					"serverSide": true,
					"orderMulti": false,
					"order": [
					  [4, "desc" ]
					],
				    "columns": [
				        null,
				        null,
				        null,
				        null,
				        null,
				        null
				    ],
					"ajax": {
						url : "'.site_url("hideend/members/members_page").'",
						type : "GET",
						data : function ( d ) {
							d.search_type = $("#search_type").val();
						}
					},
					"drawCallback": function(settings, json) {
					 $(\'[data-toggle="tooltip"]\').tooltip();
				  }
				});
				$("#form-search-input").on("keyup change", function () {
				table.search(this.value).draw();
			});

			} );
			function change_search(search)
				{
				  var options = [
					"search-like",
					"search-exact",
					"user-exact",
					"title-exact",
					"summary-exact",
					"category-exact"
				  ];
				  set_search_icon(options[search], options);
					$("#search_type").val(search);
					$( "#form-search-input" ).trigger( "change" );
				}

			function set_search_icon(icon, options)
				{
				  for(var i = 0; i<options.length;i++) {
					if(options[i] == icon) {
					  $("#" + icon).fadeIn(10);
					} else {
					  $("#" + options[i]).fadeOut(10);
					}
				  }
				}';	
			
		$this->template->loadExternalJs(
			'<script src="'.base_url().'/theme_hideend/ltetheme/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
			<script src="'.base_url().'/theme_hideend/ltetheme/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js">
			</script>
			<script>'.$javascript.'</script>'
		);
		
		
		
		$this->template->loadExternal(
			'<link href="'.base_url().'theme_hideend/ltetheme/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css">'
		);
	
		$this->template->loadContent("hidepage/members/index.php", array(
			)
		);
	}
	public function getdatachart(){
		$users = $this->user_model->getuserAll();
		$users = $users->result_array();
		$data = array();
		foreach ($users as $key => $us) {
			$data[$key][0] =  $us["joined"]*1000;
			$data[$key][1] =  $us["num"];

		}
		$data = str_replace('"', '',json_encode($data));
		
		echo $data ;
	}
	public function members_page() 
	{
		$this->load->library("datatables");

		$this->datatables->set_default_order("users.joined", "desc");

		// Set page ordering options that can be used
		$this->datatables->ordering(
			array(
				 0 => array(
				 	"users.username" => 0
				 ),
				 1 => array(
				 	"users.first_name" => 0
				 ),
				 2 => array(
				 	"users.last_name" => 0
				 ),
				 3 => array(
				 	"user_roles.name" => 0
				 ),
				 4 => array(
				 	"users.joined" => 0
				 ),
				 5 => array(
				 	"users.oauth_provider" => 0
				 )
			)
		);

		$this->datatables->set_total_rows(
			$this->user_model
				->get_total_members_count()
		);
		$members = $this->user_model->get_members($this->datatables);

		foreach($members->result() as $r) {
			if($r->oauth_provider == "google") {
				$provider = "Google";
			} elseif($r->oauth_provider == "twitter") {
				$provider = "Twitter";
			} elseif($r->oauth_provider == "facebook") {
				$provider = "Facebook";
			} else {
				$provider =  lang("ctn_196");
			}
			$this->datatables->data[] = array(
				$this->common->get_user_display(array("username" => $r->username, "avatar" => $r->avatar, "online_timestamp" => $r->online_timestamp)),
				$r->first_name,
				$r->last_name,
				$this->common->get_user_role($r),
				date($this->settings->info->date_format, $r->joined),
				$provider
			);
		}
		echo json_encode($this->datatables->process());
	}

	public function search() 
	{

		$search = $this->common->nohtml($this->input->post("search"));

		if(empty($search)) $this->template->error(lang("error_49"));

		$members = $this->user_model->get_members_by_search($search);
		if($members->num_rows() == 0) $this->template->error(lang("error_50"));

		$this->template->loadContent("hidepage/members/search.php", array(
			"members" => $members,
			"search" => $search
			)
		);
	}

}

?>