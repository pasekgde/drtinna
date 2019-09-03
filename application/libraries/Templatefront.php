<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Templatefront
{

	var $cssincludes="";
	var $jsincludes="";
	var $bread_crumb=array();
	var $sidebar;
	var $arrjs='';
	var $arrcss='';
	var $faqpskk;
	var $csrfhash;
	var $elements=array();
	var $searchbar;
	var $responsive_sidebar;
	var $layout_featurefront = 'frontpage/layout/layout_featurefront.php';
	var $layout_tour = 'frontpage/layout/layout_tour.php';
	var $data = array();
	var $error_layout = 0;
	var $error_view = "error/error.php";
	var $page_title = "";
	var $classtype = "";
	var $author = "manik";
	var $og_image = "https://bossforexsignal.com/theme_costume//images/slider/slider-01.jpg";
	var $og_url = "https://bossforexsignal.com/";
	var $og_title = "Top Global Invest";
	var $og_desc = "Signal Forex Provider";
	var $og_image_type = "jpg";

	public function loadContent($view,$data=array(),$die=0)	{
		$CI =& get_instance();
		$site = array();
		$CI->load->model("site_slugs_m");
		$CI->load->model("content_model");
		$CI->load->library('Frontweb');
		$site['cssincludes']='';
		$site['jsincludes']='';

		if(isset($this->cssincludesArr)){
			foreach ($this->cssincludesArr as $css){
				$site['cssincludes'] .= $CI->load->view($css,'',true);
			}
		}		

		if(isset($this->jsincludesArr)){
			foreach ($this->jsincludesArr as $js){
				$site['jsincludes'] .= $CI->load->view($js,'',true);
			}
		}
		$site['jsincludes'] .= $this->jsincludes;
		$site['cssincludes'] .= $this->cssincludes;
		$jsdata['hash'] = $this->csrfhash;
		$data['breadCrumb'] = $CI->frontweb->getBreadCrumb();
		foreach ($this->elements as $element){
			$link_el = explode('/',$element);
			$name = end($link_el);
			$data[$name] = $CI->load->view($element,$site,true);
		}


		$site['content'] = $CI->load->view($view,$data,true);
		$postcontent = $CI->content_model->get_post_front($CI->settings->info->post_front_num);
		$site['posts'] = $postcontent->result();

		if($this->page_title) {
			$site['page_title'] = $this->page_title;
		}
		
		$site['classtype'] = $this->classtype;

		

		if(isset($data["og_image"]) && $data["og_image"]!=''){
			$site['og_image'] = $data["og_image"];
		}else{
			$site['og_image'] = $this->og_image;
		}	

		if(isset($data["og_title"]) && $data["og_title"]!=''){
			$site['og_title'] = $data["og_title"];
		}else{
			$site['og_title'] = $this->og_title;
		}	

		if(isset($data["og_desc"]) && $data["og_desc"]!=''){
			$site['og_desc'] = $data["og_desc"];
		}else{
			$site['og_desc'] = $this->og_desc;
		}	

		if(isset($data["og_url"]) && $data["og_url"]!=''){
			$site['og_url'] = $data["og_url"];
		}else{
			$site['og_url'] = $this->og_url;
		}		

		if(isset($data["og_image_type"]) && $data["og_image_type"]!=''){
			$site['og_image_type'] = $data["og_image_type"];
		}else{
			$site['og_image_type'] = $this->og_image_type;
		}	
		
		//echo $this->classtype;die;
		if($this->author) {
			$site['author'] = $this->author;
		}
		
		if($this->responsive_sidebar) {
			$site['responsive_sidebar'] = $CI->load
				->view($this->responsive_sidebar,$data,true);
		}
		//load dan throw slug menu from here

		$CI->load->view($this->layout_featurefront, $site);
		if($die) die($CI->output->get_output());
	}

	public function loadContentTour($view,$data=array(),$die=0)	{
		$CI =& get_instance();
		$site = array();
		$site['content'] = $CI->load->view($view,$data,true);

		if($this->page_title) {
			$site['page_title'] = $this->page_title;
		}
		if($this->author) {
			$site['author'] = $this->author;
		}

		$CI->load->view($this->layout_tour, $site);
		if($die) die($CI->output->get_output());
	}

	public function loadAjax($view,$data=array(),$die=0)
	{
		$CI =& get_instance();
		$site = array();
		$site['cssincludes'] = $this->cssincludes;
		$CI->load->view($view,$data);
		if($die) die($CI->output->get_output());
	}

	public function set_page_title($title)
	{
		$this->page_title = $title;
	}	
	
	public function set_classtype($class)
	{
		$this->classtype = $class;
		
	}


	public function loadElement($elements)
	{

		$this->elements = $elements;
	}


	public function loadSearchbar($view)
	{
		$this->searchbar = $view;
	}

	public function loadResponsiveSidebar($view)
	{
		$this->responsive_sidebar = $view;
	}


	public function set_error_layout($error)
	{
		$this->error_layout = $error;
	}

	public function set_error_view($view)
	{
		$this->error_view = $view;
	}

	public function set_layout($view)
	{
		$this->layout_featurefront = $view;
	}

	public function loadData($key, $data)
	{
		$this->data[$key] = $data;
	}

	public function loadExternalCssArr($code)
	{
		$this->cssincludesArr = $code;
	}

	public function loadExternal($code)
	{
		$this->cssincludes = $code;
	}
	public function loadExternalJs($code)
	{
		$this->jsincludes = $code;
	}

	public function loadExternalJsArr($code)
	{
		$this->jsincludesArr = $code;
	}

	public function setcsrfhash($hash)
	{
		$this->csrfhash = $hash;

	}

	public function error($message)
	{
		if(!$this->error_layout) {
			$this->loadContent($this->error_view,array(
				"message" => $message),1);
		} else {
			$this->loadContent($this->error_view,array(
				"message" => $message),1);
		}
	}

	public function errori($msg)
	{
		echo "ERROR: " . $msg;
		exit();
	}

	public function jsonError($msg)
	{
		echo json_encode(array("error"=>1, "error_msg" => $msg));
		exit();
	}

}

?>
