<?php

class Verifikasi_Model extends CI_Model 
{

	public function update($id,$data) 
	{
		$this->db->where("id", $id)->update("verifikasi_pspbmn", $data);
    
	}



	public function insert($data) 
	{
		$this->db->insert("verifikasi_pspbmn", $data);
		$insert_id = $this->db->insert_id();
		return  $insert_id;
	}

    public function showAllbyIDPengajuan($idPengajuan){
      	$query = $this->db
       				->where('idPengajuan',$idPengajuan)
       				->get('verifikasi_pspbmn');
       				// echo $this->db->last_query();
        
        if($query->num_rows() > 0){
            return $query->result();
        }else{
            return false;
        }
        
    }

    	public function showAll(){
		$status = array();
      	$query = $this->db
       				->where_not_in('status_proses',$status)
       				->order_by('id', 'DESC')
       				->get('verifikasi_pspbmn');
        if($query->num_rows() > 0){
            return $query->result();
        }else{
            return false;
        }
    }





	
}

?>