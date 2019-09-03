<?php

class Tour_model extends CI_Model
{

	public function add_tour($data)
	{
		$this->db->insert("tour-details", $data);
		return $this->db->insert_id();
	}
	

}

?>
