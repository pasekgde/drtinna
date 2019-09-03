<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Mailbox extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("content_model");
		$this->load->model("user_model");
	//	$this->load->helper(array('form', 'url'));
		if (!$this->user->loggedin) $this->template->error(lang("error_1"));
		if(!$this->common->has_permissions(array(
				"admin", "content_manager", "content_worker"), $this->user)) {
				$this->template->error(lang("error_81"));
		}
	}


	public function index()
	{
		$this->template->loadData("activeLink",
			array("content" => array("general" => 1)));

		$this->template->loadContent("hidepage/content/index.php", array(
			)
		);
	}


	


}

?>
