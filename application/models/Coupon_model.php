<?php
class Coupon_model extends CI_Model
{
	function __construct()
	{
		parent::__construct();
		$this->load->database("default");
	}

	function getDiscountbyCode($code,$idplan)
	{
		return $this->db
			->where("code", $code)
			->where("idplan", $idplan)
			->get("site_coupon");
	}

}
?>