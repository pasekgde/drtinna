<?php

class Forex_model extends CI_Model
{

	public function get_Symbol($search)
	{
		return $this->db
			->select("id, code text")
			->like("code", $search, 'both')
			->or_like("description", $search, 'both')
			->get("forex_symbols");
	}

	
	
	public function add_point($data)
	{
		$this->db->insert("trade_history", $data);
		return $this->db->insert_id();
	}	

	public function get_tradehistory($datatable) 
	{
		$datatable->db_order();

		$datatable->db_search(array(
			"trade_history.symbol",
			"trade_history.opendate",
			"trade_history.closedate",
			
			)
		);
		
			$sql = $this->db->select("*")
			->limit($datatable->length, $datatable->start)
			->get("trade_history");
		return $sql;
	}	

	public function get_tradehistory_member($datatable) 
	{
		$datatable->db_order();

		$datatable->db_search(array(
			"trade_history.symbol",
			"trade_history.opendate",
			"trade_history.closedate",
			
			)
		);
		
		$sql = $this->db->select("*")
			->limit($datatable->length, $datatable->start)
			->get("trade_history");

		//echo $this->db->last_query();
		return $sql;
	}	



	public function get_total_tradehistory_count_member($month=null) 
	{
		$s= $this->db
				->select("*")			
				->get("trade_history");
				return $s->num_rows();	
		
	}

	public function get_total_tradehistory_count($month=null) 
	{
		$s= $this->db
				->select("*")			
				->where("concat(MONTH(FROM_UNIXTIME(closedate)), '-', YEAR(FROM_UNIXTIME(closedate))) =",$month)
				->get("trade_history");
				return $s->num_rows();	
		
		
		
	}
	
	

}

?>
