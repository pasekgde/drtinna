 <?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Post extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("content_model");
		$this->load->library("pagination");
		$this->load->helper("url");
	}


	public function index()
	{	
		//echo $categories;die;
		$this->all();
	}
  
	public function all()
	{
	   $search =  "";

	   //==============================Pagination
	   $numRow=$this->content_model->get_total_post_count($search);
	   $baseUrl = base_url() . "post/all/";
	   $segment = 3;
	   $numLink = 4;
       $perPage= 4;
      // $config=$this->common->configPagination($baseUrl,$numRow,$numLink,$perPage,$segment);
 
       $config["base_url"] = $baseUrl;
       $config["total_rows"] = $numRow;
       $config["per_page"] = $perPage;
       $config['cur_tag_open'] = '<li class="active"><a href="#">';
       $config['cur_tag_close'] = '</a></li>';
       $config['next_link'] = 'Next';
       $config['prev_link'] = 'Previous';
       $config['first_link'] = 'First';
       $config['first_tag_open'] = '<li>';
       $config['first_tag_close'] = '</li>';
       $config['last_link'] = 'Last';
       $config['last_tag_open'] = '<li>';
       $config['last_tag_close'] = '</li>';
       $config['prev_link'] = 'Previous';
       $config['prev_tag_open'] = '<li>';
       $config['prev_tag_close'] = '</li>';
       $config['next_link'] = 'Next';
       $config['next_tag_open'] = '<li>';
       $config['next_tag_close'] = '</li>';
       $config['num_tag_open'] = '<li>';
       $config['num_tag_close'] = '</li>';
       $config['full_tag_open'] = '<ul class="pagination">';
       $config['full_tag_close'] = '</ul>';
       $config["uri_segment"] = $segment;
       $config["num_links"] = $numLink;

       $this->pagination->initialize($config); 

       //==============================Eof Pagination
       	$page = ($this->uri->segment($config["uri_segment"])) ? $this->uri->segment($config["uri_segment"]) : 0;	   
		$recentposts = $this->content_model->get_post_front($this->settings->info->post_front_num);
		$catObj= $this->content_model->get_post_categories();
		$post_all = $this->content_model->get_post_front($this->settings->info->post_front_num); 
		$result = $this->content_model->get_post_pagination($config["per_page"], $page,$search);
		$data = array(
			"posts" => $post_all->result(),
			"categories" => $catObj->result(),
			"recentposts" => $recentposts->result(),
			"links" => $this->pagination->create_links(),
			"results" => $result 
			);
			
		$this->templatefront->set_layout('layout/layout_featurefront');	
		$this->templatefront->loadData("activeLink",array("home" => 1));
		$this->templatefront->loadContent('frontpage/post_all_view', $data);
  }

  	public function cat($categories)
	{
	   $search =  "";

	   //==============================Pagination
	   $numRow=$this->content_model->get_total_post_count($search,$categories);
	   $baseUrl = base_url() . "post/cat/".$categories;
	   $segment = 4;
	   $numLink = 4;
       $perPage= 4;
      // $config=$this->common->configPagination($baseUrl,$numRow,$numLink,$perPage,$segment);

       $config["base_url"] = $baseUrl;
       $config["total_rows"] = $numRow;
       $config["per_page"] = $perPage;
       $config['cur_tag_open'] = '<li class="active"><a href="#">';
       $config['cur_tag_close'] = '</a></li>';
       $config['next_link'] = 'Next';
       $config['prev_link'] = 'Previous';
       $config['first_link'] = 'First';
       $config['first_tag_open'] = '<li>';
       $config['first_tag_close'] = '</li>';
       $config['last_link'] = 'Last';
       $config['last_tag_open'] = '<li>';
       $config['last_tag_close'] = '</li>';
       $config['prev_link'] = 'Previous';
       $config['prev_tag_open'] = '<li>';
       $config['prev_tag_close'] = '</li>';
       $config['next_link'] = 'Next';
       $config['next_tag_open'] = '<li>';
       $config['next_tag_close'] = '</li>';
       $config['num_tag_open'] = '<li>';
       $config['num_tag_close'] = '</li>';
       $config['full_tag_open'] = '<ul class="pagination">';
       $config['full_tag_close'] = '</ul>';
       $config["uri_segment"] = $segment;
       $config["num_links"] = $numLink;

       $this->pagination->initialize($config); 

       //==============================Eof Pagination
       	$page = ($this->uri->segment($config["uri_segment"])) ? $this->uri->segment($config["uri_segment"]) : 0;	   
		$recentposts = $this->content_model->get_post_front($this->settings->info->post_front_num);
		$catObj= $this->content_model->get_post_categories();
		$post_all = $this->content_model->get_post_front($this->settings->info->post_front_num,$categories);
		$result = $this->content_model->get_post_pagination($config["per_page"], $page,$search,$categories);
		$data = array(
			"posts" => $post_all->result(),
			"categories" => $catObj->result(),
			"recentposts" => $recentposts->result(),
			"links" => $this->pagination->create_links(),
			"results" => $result 
			);
			
		$this->templatefront->set_layout('layout/layout_featurefront');	
		$this->templatefront->loadData("activeLink",array("home" => 1));
		$this->templatefront->loadContent('frontpage/post_all_view', $data);
  }

  
	public function withid($idpost,$hash='')
	{
		
		$this->load->model('content_model');
	
		//load all necessary model 
		$post_all = $this->content_model->get_post_front($this->settings->info->post_front_num);
		$recentposts = $this->content_model->get_post_front($this->settings->info->post_front_num);
		$posts = $this->content_model->get_content_post($idpost);
		$categories = $this->content_model->get_post_categories();
		$postbyCategories = $this->content_model->get_content_postbyCategories($posts->row()->idCategory,$posts->row()->ID);

		$this->templatefront->loadData("activeLink",array("home" => 1));

		//get post comment	
		$array_all_id = array();
		$result = $this->content_model->get_post_comment_byparent($idpost);
		$resArray = $result->result_array(); 
		foreach ($resArray as $res) {
			array_push($array_all_id, $res['parentid']); 
		}
		$resArray = $result->result_array();
		$comments = $this->common->in_parent(0,$idpost,$array_all_id);
		//end get comment
	
		$this->templatefront->loadExternalJs(
      			array('frontpage/js/jsPostComment')
      		);
			
		$this->templatefront->loadExternalCSS(
      			array('frontpage/css/cssPostComment')
      		);	

		$this->templatefront->loadContent('frontpage/post_view', array(
			"og_image" => site_url().$this->settings->info->upload_path_relative.$posts->row()->image.".".$posts->row()->ext_image,
			"og_image_type" => $posts->row()->ext_image,
 			"og_title" => $posts->row()->title,
 			"og_desc" => $posts->row()->summary,
			"post" => $posts->row(),
			"posts" => $post_all->result(),
			"categories" => $categories->result(),
			"postbyCategories" => $postbyCategories->result(),
			"recentposts" => $recentposts->result(),
			"comments" => $comments,
			));

	}
	
	public function addcomment()
	{
		$this->load->helper('security');
		$this->load->library('form_validation');
		$_GET["parentid"] = $this->common->nohtml($_GET["parentid"]);
		$_GET["postid"] = $this->common->nohtml($_GET["postid"]);
		$_GET["email"] = $this->common->nohtml($_GET["email"]);
		$_GET["name"] = $this->common->nohtml($_GET["name"]);
		$_GET["message"] = $this->common->nohtml($_GET["message"]);
		$config = array(
	         array(
	                 'field'   => 'name',
	                 'label'   => 'Your Name',
	                 'rules'   =>'trim|required'
	              ),
					array(
						'field'   => 'email',
						'label'   => 'Email',
						'rules'   => 'trim|required|valid_email'
					),
			 		array(
                     'field'   => 'message',
                     'label'   => 'Message',
                     'rules'   => 'trim|required'
                  )
          );
		$insertData = $this->content_model->formatInsertDataComment($this->input->get());
		$this->form_validation->set_data($this->input->get());
		$this->form_validation->set_rules($config);
		if ($this->form_validation->run() == FALSE)
		{
		
			$message = form_error('name')."<br>".form_error('email')."<br>".form_error('message');
			$arr = array(
				'success' => "FALSE",
				'message' => $message
			);
			
			echo json_encode($arr);
		}
		else
		{			
			$userid = $this->content_model->add_post_comment($insertData);
			//get post comment	
			$array_all_id = array();
			$result = $this->content_model->get_post_comment_byparent($_GET["postid"]);
			$resArray = $result->result_array(); 
			foreach ($resArray as $res) {
				array_push($array_all_id, $res['parentid']); 
			}
			$resArray = $result->result_array();
			$comments = $this->common->in_parent(0,$_GET["postid"],$array_all_id);
			//end get comment
			
			
			$arr = array(
				'success' => 'TRUE',
				'comment' => $comments 
				);
			echo json_encode($arr);
		}

	}
	

}

?>
