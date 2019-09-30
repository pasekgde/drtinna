<?php
 if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Register extends CI_Controller 
{

	public function __construct() 
	{
		parent::__construct();
		$this->load->model("register_model");
		$this->load->model("user_model");
	}

	public function index2(){
		$vueComponent = $this->load->view("hidepage/vue/ComponentPspBMNRegister.js",'',true);
		$this->template->loadExternal(
			'<link rel="stylesheet" href="https://unpkg.com/vue-form-wizard/dist/vue-form-wizard.min.css">'.
			'<link rel="stylesheet" href="https://unpkg.com/vue-multiselect@2.1.0/dist/vue-multiselect.min.css">'.
			'<link rel="stylesheet" href="https://unpkg.com/vue-airbnb-style-datepicker@latest/dist/vue-airbnb-style-datepicker.min.css">'
			);

		$this->template->loadExternalJs(
			'<script src="https://unpkg.com/vue-form-wizard/dist/vue-form-wizard.js"></script>'.
			'<script src="https://cdn.jsdelivr.net/npm/vue-the-mask@0.11.1/dist/vue-the-mask.min.js"></script>'.
			'<script src="https://unpkg.com/vee-validate@2.0.0-rc.21/dist/vee-validate.js"></script>'.
			'<script src="https://unpkg.com/vue-multiselect@2.1.6/dist/vue-multiselect.min.js"></script>'.
			'<script src="'.$this->common->theme_hideend().'plugins/js/vue-airbnb-style-datepicker.min.js"></script>'.
			'<script src="'.$this->common->theme_hideend().'plugins/js/date_fns.js"></script>'.
			$vueComponent.
			'<script src="'.$this->common->theme_hideend().'plugins/js/appLogin.js"></script>'
			);
	}
	public function index()
	{

		if ($this->user_model->check_block_ip()) {
			$this->template->error(lang("error_26"));
		}

		$this->template->set_error_view("hidepage/error/login_error.php");
		$this->template->set_layout("hidepage/layout/login_layout.php");
		if ($this->settings->info->register) {
			$this->template->error(lang("error_54"));
		}

		$this->template->loadExternal(
			'<script type="text/javascript" src="'
			.base_url().'scripts/custom/check_username.js" /></script>'
		);

		$fields = $this->user_model->get_custom_fields(array("register"=>1));

		if ($this->user->loggedin) {
			$this->template->error(
				lang("error_27")
			);
		}
		$this->load->helper('email');

		$email = "";
		$fullname = "";
		$jabatan = "";
		$nip = "";
		$phone = "";
		$username = "";
		$fail = "";
		$first_name = "";
		$last_name = "";

		if (isset($_POST['s'])) {
			$email = $this->input->post("email", true);
			$fullname = $this->common->nohtml(
				$this->input->post("fullname", true));
			$jabatan = $this->common->nohtml($this->input->post("jabatan", true));
			$nip = $this->common->nohtml($this->input->post("nip", true));
			$phone = $this->common->nohtml($this->input->post("phone", true));
			$pass = $this->common->nohtml(
				$this->input->post("password", true));
			$pass2 = $this->common->nohtml(
				$this->input->post("password2", true));
			$captcha = $this->input->post("captcha", true);



			if ($pass != $pass2) $fail = lang("error_22");

			if (strlen($pass) <= 5) {
				$fail = lang("error_17");
			}


			if (empty($jabatan)) {
				$fail = lang("error_110");
			}
			if (empty($nip)) {
				$fail = lang("error_111");
			}

			if (empty($phone)) {
				$fail = lang("error_112");
			}

			if (empty($fullname)) {
				$fail = lang("error_58");
			}

			if (empty($email)) {
				$fail = lang("error_18");
			}

			if (!valid_email($email)) {
				$fail = lang("error_19");
			}

			if (!$this->register_model->checkEmailIsFree($email)) {
				$fail = lang("error_20");
			}

			// Custom Fields
			// Process fields
			$answers = array();

			if (empty($fail)) {

				$pass = $this->common->encrypt($pass);
				$active = 1;
				$activate_code = "";
				$success =  lang("success_20");
				if($this->settings->info->activate_account) {
					$active = 0;
					$activate_code = md5(rand(1,10000000000) . "fhsf" . rand(1,100000));
					$success = lang("success_33");

					// Send email
					$this->load->model("home_model");
					$email_template = $this->home_model->get_email_template(2);
					if($email_template->num_rows() == 0) {
						$this->template->error(lang("error_48"));
					}
					$email_template = $email_template->row();

					$email_template->message = $this->common->replace_keywords(array(
						"[NAME]" => $fullname,
						"[SITE_URL]" => site_url(),
						"[EMAIL_LINK]" => 
							site_url("hideend/register/activate_account/" . $activate_code . 
								"/" . $email),
						"[SITE_NAME]" =>  $this->settings->info->site_name
						),
					$email_template->message);

					$this->common->send_email($email_template->title,
						 $email_template->message, $email);
				}

				$userid = $this->register_model->add_user(array(
					"fullname" => $fullname,
					"jabatan" => $jabatan,
					"phone" => $phone,
					"nip" => $nip,
					"email" => $email,
					"password" => $pass,
					"user_role" => $this->settings->info->default_user_role,
					"IP" => $_SERVER['REMOTE_ADDR'],
					"joined" => time(),
					"joined_date" => date("n-Y"),
					"active" => $active,
					"activate_code" => $activate_code,
					)
				);

				// Check for any default user groups
				$default_groups = $this->user_model->get_default_groups();
				foreach($default_groups->result() as $r) {
					$this->user_model->add_user_to_group($userid, $r->ID);
				}

				// Add Custom Fields data
				foreach($answers as $answer) {
					$this->user_model->add_custom_field(array(
						"userid" => $userid,
						"fieldid" => $answer['fieldid'],
						"value" => $answer['answer']
						)
					);
				}
				$this->session->set_flashdata("globalmsg", $success);
				redirect(site_url("hideend/login"));
			}

		}


		$this->load->helper("captcha");
		$rand = rand(4000,100000);
		$_SESSION['sc'] = $rand;
		$vals = array(
		    'word' => $rand,
		    'img_path' => './theme_backend/images/captcha/',
    		'img_url' => base_url() . 'theme_backend/images/captcha/',
		    'img_width' => 150,
		    'img_height' => 30,
		    'expiration' => 7200
		);

		$cap = create_captcha($vals);
		$this->template->loadContent("hidepage/register/index.php", array(
			"cap" => $cap,
			"email" => $email,
			"fullname" => $fullname,
			"jabatan" => $jabatan,
			"nip" => $nip,
			"phone" => $phone,
		    'fail' => $fail,
		    )
		);
	}

	public function add_username() 
	{
		$this->template->loadExternal(
			'<script type="text/javascript" src="'
			.base_url().'scripts/custom/check_username.js" /></script>'
		);
		if (!$this->user->loggedin) {
			$this->template->error(
				lang("error_1")
			);
		}
		$this->template->loadContent("hidepage/register/add_username.php", array());
	}

	public function add_username_pro() 
	{
		$this->load->helper('email');
		$email = $this->input->post("email", true);
		$username = $this->common->nohtml(
				$this->input->post("username", true));
		if (strlen($username) < 3) $fail = lang("error_14");
		


		if (!preg_match("/^[a-z0-9_]+$/i", $username)) {
			$fail = lang("error_15");
		}

		if (!$this->register_model->check_username_is_free($username)) {
			$fail = lang("error_16");
		}

		//echo $this->db->last_query();
		if (empty($email)) {
			$fail = lang("error_18");
		}

		if (!valid_email($email)) {
			$fail = lang("error_19");
		}

		if (!$this->register_model->checkEmailIsFree($email)) {
			$fail = lang("error_20");
		}

		if(!empty($fail)) $this->template->error($fail);



		//add by dode	
		if($this->settings->info->activate_account)
    	{    		
    		if(!$this->user->info->active) {
    			$active = 0;
				$activate_code = md5(rand(1,10000000000) . "fhsf" . rand(1,100000));
				$success = lang("success_33");
    			$data=array(
    					"active"=>$active,
    					"activate_code"=>$activate_code
    					);

    			$this->register_model->update_userdata($this->user->info->ID,$data);
				$email_template = $this->home_model->get_email_template(2);
				
				if($email_template->num_rows() == 0) {
					$this->template->error(lang("error_48"));
				}
				$email_template = $email_template->row();

				$email_template->message = $this->common->replace_keywords(array(
						"[NAME]" => $email,
						"[SITE_URL]" => site_url(),
						"[EMAIL_LINK]" => 
							site_url("hideend/register/activate_account/" . $activate_code . 
								"/" . $email),
						"[SITE_NAME]" =>  $this->settings->info->site_name
						),
					$email_template->message);

				$this->common->send_email($email_template->title,
						 $email_template->message, $email);
    		}
    		$this->session->set_flashdata("globalmsg",  "Please visit your email to activate this account");
    	}else{
    		$this->session->set_flashdata("globalmsg",  lang("success_21"));
    	}     		

		$this->register_model
			->update_username($this->user->info->ID, $username, $email);
		
		redirect(site_url("/hideend"));
	}

	public function check_username() 
	{
		$username = $this->common->nohtml(
				$this->input->get("username", true));
		if (strlen($username) < 3) $fail = lang("error_14");

		if (!preg_match("/^[a-z0-9_]+$/i", $username)) $fail = lang("error_15");

		if (!$this->register_model->check_username_is_free($username)) {
			$fail="$username " . lang("ctn_243");
		}
		if (empty($fail)) {
			echo"<span style='color:#4ea117'>". lang("ctn_244")."</span>";
		} else {
			echo $fail;
		}
		exit();
	}

	public function activate_account($code, $email) 
	{
		$code = $this->common->nohtml($code);
		$email = $this->common->nohtml($email);

		$code = $this->user_model->get_verify_user($code, $email);
		if($code->num_rows() == 0) {
			redirect(site_url("hideend/login"));
			// $this->template->set_error_view("/hidepage/error/login_error.php");
			// $this->template->error(lang("error_69"));
		}
		$code = $code->row();
		if($code->active) {
			redirect(site_url("hideend/login"));
		}

		$this->user_model->update_user($code->ID, array(
			"active" => 1, 
			"activate_code" => ""
			)
		);

		$this->session->set_flashdata("globalmsg", 
			lang("success_34"));
			redirect(site_url("hideend/login"));
	}

	public function send_activation_code($userid, $email) 
	{
		$userid = intval($userid);
		$email = $this->common->nohtml(urldecode($email));

		// Check request
		$request = $this->user_model->get_user_event("email_activation_request");
		if($request->num_rows() > 0) {
			$request = $request->row();
			if($request->timestamp + (15*60) > time()) {
				$this->template->error(lang("error_70"));
			}
		}

		$this->user_model->add_user_event(array(
			"event" => "email_activation_request",
			"IP" => $_SERVER['REMOTE_ADDR'],
			"timestamp" => time()
			)
		);

		// Resend
		$user = $this->user_model->get_user_by_id($userid);
		if($user->num_rows() == 0) {
			$this->template->error(lang("error_71"));
		}
		$user = $user->row();
		if($user->email != $email) 
		{
			$this->template->error(lang("error_71"));
		}
		if($user->active) {
			$this->template->error(lang("error_71"));
		}
		// Send email
		$this->load->model("home_model");
		$email_template = $this->home_model->get_email_template(2);
		if($email_template->num_rows() == 0) {
			$this->template->error(lang("error_48"));
		}
		$email_template = $email_template->row();

		$email_template->message = $this->common->replace_keywords(array(
			"[NAME]" => $user->fullname,
			"[SITE_URL]" => site_url(),
			"[EMAIL_LINK]" => 
				site_url("hideend/register/activate_account/" . $user->activate_code . 
					"/" . $user->email),
			"[SITE_NAME]" =>  $this->settings->info->site_name
			),
		$email_template->message);

		$this->common->send_email($email_template->title,
			 $email_template->message, $user->email);
		$this->session->set_flashdata("globalmsg", 
			lang("success_35"));
		redirect(site_url("hideend/login"));
	}
}

?>