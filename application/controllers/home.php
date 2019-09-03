<?php
//header('Access-Control-Allow-Origin: *');

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller
{

	public function __construct()
	{

		parent::__construct();
		if (defined('REQUEST') && REQUEST == "external") {
	        return;
	    }
		$this->template->loadData("activeLink",
			array("home" => array("general" => 1)));

			$this->load->library('Frontweb');

	}

	public function index()
	{
		$this->viewHomePage();

	}

	public function testimonial()
	{
		$this->load->model('content_model');
		$this->templatefront->set_layout('layout/layout_featurefront');
		$this->templatefront->loadContent('frontpage/testimonial_view');
	}


	public function viewHomePage()
	{
		$this->load->model('content_model');

		//load all necessary model 
		$sliders = $this->content_model->get_sliders();
		$posts = $this->content_model->get_post_front($this->settings->info->post_front_num);

		$post_num = 3;  

		

		$contentDir = base_url(). '/theme_costume/static_content/';
		$tourOptionFiles = $contentDir . 'tour-option.json';
		$tourOptions = file_get_contents($tourOptionFiles);
		if (!empty($tourOptions)) $tourOptions = json_decode($tourOptions);

		$this->templatefront->loadData("activeLink",array("home" => 1));
		
		//echo '<pre>'; print_r( $tourOptions );die; //test
		$this->templatefront->loadContent('frontpage/home_view', array(
			"og_image" => "https://bossforexsignal.com/theme_costume//images/slider/slider-01.jpg",
 			"og_title" => "BossForexSignal",
 			"og_desc" => "Forex Signal Provider",
 			"og_url" => "https://bossforexsignal.com",
 			"tourOptions" => $tourOptions
			));

	}	

	public function tour($id)
	{
		
		$contentDir = base_url(). '/theme_costume/static_content/';
		$tourDetailFiles = $contentDir . 'tour-details.json';
		$tourDetails = file_get_contents($tourDetailFiles);
		if (!empty($tourDetails)) $tourDetails = json_decode($tourDetails,TRUE);


   //      	$contentDir = base_url(). '/theme_costume/static_content/';
			// $tourDetailFiles = $contentDir . 'tour-details.json';
			// $tourDetails = file_get_contents($tourDetailFiles);
   //     	 	$collection = collect(json_decode($tourDetails, true));
			// $data = $collection->where('id', $id);

			// $pickup = $data->pluck("pickup");
			// $packages = $data->pluck("package");


			// $pickup = collect($pickup->first());
			// $package = collect($packages->first());

			// $pickupPrice = 	collect($pickup->where('area', 'Nusa Dua / Jimbaran'))->pluck("price")->first();
			// $prices = collect($package->where('id', $id))->pluck("price");

			// $typePrice = collect($prices->first());
			// $infantPrice = $typePrice->where('type', "Infant")->pluck("price")->first(); 
			// $childPrice = $typePrice->where('type', "Child")->pluck("price")->first(); 
			// $adultPrice = $typePrice->where('type', "Adult")->pluck("price")->first(); 


			//echo '<pre>'; print_r( $pickupPrice );die; //test

		//get Tour Details
		$selectTour = $tourDetails[$id];
		if($id=="1"){
			$page="frontpage/tour/downhill";
		}elseif($id=="2"){
			$page="frontpage/tour/electric";
		}elseif($id=="3"){
			$page="frontpage/tour/comboATV";
		}elseif($id=="4"){
			$page="frontpage/tour/comboRafting";
		}elseif($id=="5"){
			$page="frontpage/tour/sunrise";
		}elseif($id=="6"){
			$page="frontpage/tour/greentrek";
		}elseif($id=="7"){
			$page="frontpage/tour/classic";
		}elseif($id=="8"){
			$page="frontpage/tour/tamblingan";
		}
		$this->templatefront->set_layout("frontpage/layout/layout_tour");
		$this->templatefront->loadData("activeLink",array("home" => 1));

		$this->templatefront->loadExternal(
				
			'<link rel="stylesheet" href="'.base_url().'/theme_costume/plugins/css/style-greenbike.css" type="text/css" media="all" />'		
		);

		$this->templatefront->loadExternalJs(
			''			
		); 

		//$this->templatefront->loadExternalJs(
		// 	'<script src="'.base_url().'/theme_costume/plugins/js/vue.min.js"></script>'.
		// 	'<script src="'.base_url().'/theme_costume/plugins/js/pagination.js"></script>'.
		// 	'<script src="'.base_url().'/theme_costume/plugins/js/axios.min.js"></script>'.
		// 	'<script src="'.base_url().'/theme_costume/plugins/js/app.js"></script>'			
		// );

		$this->templatefront->loadContent($page, array(
			"og_image" => "https://bossforexsignal.com/theme_costume//images/slider/slider-01.jpg",
 			"og_title" => "Greenbike Tour",
 			"og_desc" => "Forex Signal Provider",
 			"og_url" => "https://greenbiketour.com",
 			"selectTour" => $selectTour,

			));

	}	


     public function submitTour(){
     	$this->load->library('form_validation');
		$this->load->model("tour_model");

		$result = array();
		$config = array(
        	array(
        		'field' => 'full-name',
              	'label' => 'Full Name',
              	'rules' => 'trim|required'),
            array(
            	'field' => 'country',
              	'label' => 'Country',
              	'rules' => 'trim|required'),
             array(
             	'field' => 'email',
              	'label' => 'Email',
              	'rules' => 'required'),
             array(
             	'field' => 'travel-date',
              	'label' => 'Travel Date',
              	'rules' => 'trim|required'),
             array(
             	'field' => 'person-number',
              	'label' => 'Person Number',
              	'rules' => 'trim|required'),
               array(
                'field' => 'activity',
                'label' => 'Activity',
                'rules' => 'trim|required'
               ),
	        array(
	             'field' => 'pickup-service',
	             'label' => 'Pickup Service',
	              'rules' => 'trim|required' ),
	        array(
	                'field' => 'pickup-area',
	                'label' => 'Pickup Area',
	                'rules' => 'trim'
	        ),
	        array(
	                'field' => 'food-request',
	                'label' => 'Food Request',
	                'rules' => 'trim'
	        ));
		$this->form_validation->set_rules($config);

        if ($this->form_validation->run() == FALSE) {
        	$result['error'] = true;
            $result['msg'] = array(
                'fullname'=> form_error('full-name'),
                'country'=> form_error('country'),
                'email'=> form_error('email'),
                'travel-date'=> form_error('travel-date'),
                'person-number'=> form_error('person-number'),
                'activity'=> form_error('activity'),
                'pickup-service'=> form_error('pickup-service'),
                'pickup-area'=> form_error('pickup-area'),
                'food-request'=> form_error('food-request'),
                'submitdate'=> time()
            );
          	echo json_decode($result);
            
        }else{

        	$date = $this->input->post('travel-date');
        	$date = str_replace('-', '/', $date);
        	$date = str_replace('.', '/', $date);
        	$dt = DateTime::createFromFormat('d/m/yy', $date);


			$contentDir = base_url(). '/theme_costume/static_content/';
			$tourDetailFiles = $contentDir . 'tour-details.json';
			$tourDetails = file_get_contents($tourDetailFiles);
       	 	$collection = collect(json_decode($tourDetails, true));
			$data = $collection->where('id', $id);

			$pickup = $data->pluck("pickup");
			$packages = $data->pluck("package");


			$pickup = collect($pickup->first());
			$package = collect($packages->first());

			$pickupPrice = 	collect($pickup->where('area', 'Nusa Dua / Jimbaran'))->pluck("price")->first();
			$prices = collect($package->where('id', $id))->pluck("price");

			$typePrice = collect($prices->first());
			$infantPrice = $typePrice->where('type', "Infant")->pluck("price")->first(); 
			$childPrice = $typePrice->where('type', "Child")->pluck("price")->first(); 
			$adultPrice = $typePrice->where('type', "Adult")->pluck("price")->first(); 

            

			$tourPay = ($adultPrice * $this->input->post('person-number'));
			$pickupPay = ($pickupPrice * $this->input->post('person-number'));
			$totalAmountPay = $tourPay + $pickupPay;
			
            $data = array(
                'fullname'=> $this->input->post('full-name'),
                'country'=> $this->input->post('country'),
                'tour-id'=> $this->input->post('tour-id'),
                'tour-name'=> $this->input->post('tour-name'),
                'email'=> $this->input->post('email'),
                'travel-date'=> $dt->getTimestamp(),
                'person-number'=> $this->input->post('person-number'),
                'activity'=> $this->input->post('activity'),
                'pickup-service'=> $this->input->post('pickup-service'),
                'pickup-area'=> $this->input->post('pickup-area'),
                'food-request'=> $this->input->post('food-request'),
                'tour-pay'=> $tourPay,
                'pickup-pay'=> $pickupPay,
                'amount-pay'=> $totalAmountPay,
                'submitdate'=> time()                
            );


            
            if($this->tour_model->add_tour($data)){
               $result['error'] = false;
                $result['msg'] ='Booking added successfully';
                $page="frontpage/tour/successbooking";
                $subject = "[BOOKING]"." ".$data["fullname"]."-".$data["tour-name"]."(".$data["activity"].")";
                $email = $data["email"];
                $msg = $this->load->view("frontpage/layout/email/email_confirm_view",true);

                //Activity
                $msg = str_replace("%_activity",$data["tour-name"],$msg);

                //Program
                $msg = str_replace("%_program",$data["activity"],$msg);

                //Travel Date
                $msg = str_replace("%_traveldate",$date,$msg);

                //Amount
                $msg = str_replace("%_amount",$data["person-number"],$msg); 

                //Amount
                $msg = str_replace("%_priceactivity",$tourPay,$msg);

                //Transfer Service
                $msg = str_replace("%_transfer",$data["pickup-servicer"],$msg);

                //Transfer Fee
                $msg = str_replace("%_transferFee",$pickupPay,$msg);

                $this->sendEmail($subject,$msg,$email);
                $this->templatefront->set_layout("frontpage/layout/layout_tour");
                $this->templatefront->loadContent($page);

                
            }
            
        }

        // echo '<pre>'; print_r( $result );die; //test $result;
        // //echo json_encode($result);
    }

	public function sendEmail($subject,$msg,$email)
	{
		$this->common->send_email($subject, $msg, $email);

	}
	public function about()
	{
		$this->load->model('content_model');

		$recentposts = $this->content_model->get_post_front($this->settings->info->post_front_num);
		$this->templatefront->loadData("activeLink",array("home" => 1));
		$this->templatefront->loadContent('frontpage/aboutus_view', array(
			"posts" => $recentposts->result()
			) );
	}	
	
	public function tos()
	{
		$this->load->model('content_model');

		$recentposts = $this->content_model->get_post_front($this->settings->info->post_front_num);
		$this->templatefront->loadData("activeLink",array("home" => 1));
		$this->templatefront->loadContent('frontpage/tos_view', array(
			"posts" => $recentposts->result()
			) );
	}	


	
	
}

?>
