<?php


defined('BASEPATH') OR exit('No direct script access allowed');
class Join extends CI_Controller
{
	public $redirect = "";
	function __construct()
	{
		parent::__construct();
		$this->load->helper("url");
		$this->load->model("user_model");
		$this->load->model("funds_model");
		$this->load->model("user_model");
		$this->load->model("duration_model");
		$this->load->model("register_model");
		$this->load->model("content_model");

/*		if (defined('REQUEST') && REQUEST == "external") {
	        return;
	    }*/


		$this->template->loadData("activeLink",
			array("homie" => array("general" => 1)));

			$this->load->library('Frontweb');
	}

	public function index()
	{
		$this->package();
      //redirect( base_url() );
	}

	public function convertcurrency()
	{
		
		$val = $this->input->get('value');
		$format = $this->input->get('format');
		$origin = $this->input->get('origin');
		
		$result = $this->common->formatIDR($this->currencyconverter->convert($origin , $format, $val, 0, 0)); 
		 $json_arr = array( 
				"res" => $result,
				"format" => $format = $this->input->get('format')
			);

      echo json_encode( $json_arr );
		
		
	}	

	public function package()
	{
		
		$this->templatefront->loadExternalCSS(
			array('frontpage/css/cssJoin')
		);		
		$data["plan"] = $this->admin_model->get_payment_plans();
		
		$this->templatefront->loadData("activeLink",array("registrasi" => 1));
		$this->templatefront->set_layout('layout/layout_featurefront');
		$this->templatefront->loadContent('frontpage/paket_view',$data);
	}	
	
	public function pembayaran()
	{
		
		$this->templatefront->loadExternalCSS(
			array('frontpage/css/cssJoin')
		);		
		
		$this->templatefront->loadData("activeLink",array("registrasi" => 1));
		$this->templatefront->set_layout('layout/layout_featurefront');
		//$this->templatefront->loadContent('frontpage/payment_view');
		$this->templatefront->loadContent('frontpage/confirm_view');
	}



	

	public function plan($plan)
	{

		$plans = $this->funds_model->get_plan($plan);
		$planselected=$plans->row();
		
		if($plans->num_rows()==0) {
			redirect(site_url("join"));			
		} 

		$dur = $this->duration_model->get_duration();	
		$duration = $dur;	

		$data["planselected"]=$planselected;		
		$data["dos"]=$duration; 
	

		
		$listDos = array();
		$planpriceonduration=array();
		$totalplanpriceonduration=array();
		
		foreach($duration as $key=>$ds){
			$planpriceonduration[$key] = number_format(floor((1-($ds->discount/100)) * $planselected->cost),2);
			$totalplanpriceonduration[$key] = number_format(($planpriceonduration[$key] * $ds->total_month),2);
			//listDos[$key] = $ds->duration. " (price plan USD ".$planpriceonduration[$key].")";
		}
		$data['listDos']=$listDos; 
		$data['planpriceonduration']=$planpriceonduration;
		$data['totalplanpriceonduration']=$totalplanpriceonduration;
		
		$data["phonecode"] = json_decode($this->common->phonecode(),true);
		$data["dial_code"] = "+62"; 

 		$this->templatefront->loadExternalJsArr(
			array('frontpage/js/jsJoin')
		);  
		$this->templatefront->loadData("activeLink",array("registrasi" => 1));
		$this->templatefront->set_layout('frontpage/layout/layout_featurefront');
		$this->templatefront->loadContent('frontpage/form_view',$data);
		
	}
	
	public function submit()
	{	

		if($_SERVER['REQUEST_METHOD'] != 'POST'){
			redirect(site_url("join"));	
		}
		// $recaptcha = $_POST['g-recaptcha-response'];
		// $this->load->library("recaptcha");
		// $responseCaptcha = $this->recaptcha->verifyResponse($recaptcha);

		//echo '<pre>'; print_r( $_POST );die; //test
		$this->load->model("Ipn_model");
		$this->load->model("Account_model");
		$this->load->model("coupon_model");
		$idpaket = $this->common->nohtml($this->input->post("paket"));
		
		

		//kalau dia free, dosID masukkan saja 1 dulu
		$iddos = "1";
		
	
		//get plan data
		$plans = $this->funds_model->get_plan($idpaket);
		$plans = $plans->row();	

		$datenow = date('m/d/Y h:i:s a', time());
		$deadline = new DateTime($datenow);
		$deadline->modify("+12 hours");
		
		
		$_POST["first_name"] = $this->common->nohtml($_POST["first_name"]);
		$_POST["email"] = $this->common->nohtml($_POST["email"]);
		$_POST["phone"] = $this->common->nohtml($_POST["phonecode"]).$this->common->nohtml($_POST["phone"]);
		$_POST["address_1"] = $this->common->nohtml($_POST["address_1"]);
		$_POST["state"] = $this->common->nohtml($_POST["state"]);
		
		$this->load->library('form_validation');
		$config = array(
				 array(
	                 'field'   => 'first_name',
	                 'label'   => 'Full Name',
	                 'rules'   => 'trim|required'
	              ),
			 		array(
                     'field'   => 'email',
                     'label'   => 'Email',
                     'rules'   => 'trim|required|valid_email|is_unique[users.user_name]'
                  ),	
				  array(
                     'field'   => 'phone',
                     'label'   => 'Phone',
                     'rules'   => 'trim|required'
                  ),
					array(
						'field'   => 'address_1',
						'label'   => 'Addres 1',
						'rules'   => 'trim|required'
									),
					array(
                     'field'   => 'state',
                     'label'   => 'State',
                     'rules'   => 'trim|required'
					),
					array(
                     'field'   => 'pass',
                     'label'   => 'Password',
                     'rules'   => 'trim|required'
					),
					array(
                     'field'   => 'pass-confirm',
                     'label'   => 'Pass Confirm',
                     'rules'   => 'trim|required'
					)

            );

		       	
		$_POST['username'] = $_POST['email'];
		$insertData = $this->register_model->formatInsertData($_POST);
		$this->form_validation->set_error_delimiters('','');
		$this->form_validation->set_rules($config);

		$isEqualPass = ($_POST['pass']==$_POST['pass-confirm'])?TRUE:FALSE;

		if ($this->form_validation->run() == FALSE || !isset($_POST['check_agree']) || !$isEqualPass)
		{		
				
				$data["phonecode"] = json_decode($this->common->phonecode(),true);
				$data["dial_code"] = $this->common->nohtml($_POST["phonecode"]);
				$data["planselected"]=$plans; 
				$data['nochecked'] = (isset($_POST['check_agree']))?null:'1';
				$data['datakirim']=$_POST;

				$this->templatefront->loadExternalJsArr(
					array('frontpage/js/jsJoin')
				);  
				$this->templatefront->loadData("activeLink",array("registrasi" => 1));
				$this->templatefront->set_layout('frontpage/layout/layout_featurefront');
				$this->templatefront->loadContent('frontpage/form_view',$data);
			
		}
		else
		{
				$activate_code = md5(rand(1,10000000000) . "fhsf" . rand(1,100000));
				$insertData['activate_code'] = $activate_code;
				$iduser= $this->register_model->add_user($insertData);
				if($iduser)
				{
					
									
					//if free Signal
					if ($idpaket==1){

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
							$email_template = $this->load->view('frontpage/layout/email/payment_free_success', '', true);
							$email_template = $email_template->row();

							$email_template->message = $this->common->replace_keywords(array(
								"[NAME]" => $username,
								"[SITE_URL]" => site_url(),
								"[EMAIL_LINK]" => 
									site_url("hideend/register/activate_account/" . $activate_code . 
										"/" . $username),
								"[SITE_NAME]" =>  $this->settings->info->site_name
								),
							$email_template->message);

							$this->common->send_email($email_template->title,
								 $email_template->message, $email);

						}

						
						$datenow = date('m/d/Y h:i:s a', time());
						


						
						
						$msg = str_replace("%_expdate",$exp_date,$msg);			

						$msg = str_replace("%_code",$planRow->name,$msg);	
						
						$this->common->send_email("Registration Confirm BossForexSignal.com", $msg, $datapayment['email']);
					}
					$datapayment["isdiscount"] = $isdiscount;
					$this->templatefront->set_layout('layout/layout_featurejoin');

					//echo '<pre>'; print_r( $datapayment );die; //test
					$this->templatefront->loadContent('frontpage/confirm_view',$datapayment);
				}
		}
	}
	 
	public function konfirm() {
		$this->templatefront->loadExternalCSS(
					array('frontpage/css/cssJoin')
				);
		$this->templatefront->loadContent('frontpage/confirm_view');
	}	
	
	public function manual_notif() {
		$this->templatefront->loadExternalCSS(
					array('frontpage/css/cssJoin')
				);
		$this->templatefront->loadContent('frontpage/confirm_view');
	}
	

	public function bcaakses() {
		$this->load->library('bca');
		$this->bca->index();
	}
	
	
	
	public function check_email_validation($str) 
	{
		if (filter_var($str, FILTER_VALIDATE_EMAIL)){
			return TRUE;
		}else{
			$this->form_validation->set_message('check_email_validation', $str." ".lang("error_108"));
            return FALSE;
		} 
	}		
	
/* 	public function kirim_email() {
		$this->common->send_email_bck("test", "test", "dode.agung.asmara@gmail.com");
	} */ 
	public function check_paypal_email($str,$payment) 
	{
		$payment = $this->input->post("payment_method");
		$str = $this->input->post("emailpaypal");
		if($payment == "paypal" && empty($str)){
			$this->form_validation->set_message('check_paypal_email', 'If using paypal, this field should not empty !');
			return FALSE;
		}else{
			return true; 
		}
		
	}	


	
}
?>
