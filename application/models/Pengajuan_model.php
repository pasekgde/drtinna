<?php

class Pengajuan_Model extends CI_Model 
{

	public function update($id,$data) 
	{
    $this->db->trans_start();
		$this->db->where("id", $id)->update("pengajuan_pspbmn", $data);
    $this->db->trans_complete();
    return $this->db->trans_status() ;
	}



	public function insert($data) 
	{
		$this->db->insert("pengajuan_pspbmn", $data);
		$insert_id = $this->db->insert_id();
		return  $insert_id;
	}

	public function showAll(){
		$status = array('DJKN Pusat', 'PKNSI');
      	$query = $this->db
       				->where_not_in('status_proses',$status)
       				->order_by('id', 'DESC')
       				->get('pengajuan_pspbmn');
        if($query->num_rows() > 0){
            return $query->result();
        }else{
            return false;
        }
    }

    public function showAllbyID($idPengajuan){
		$status = array('DJKN Pusat', 'PKNSI');
      	$query = $this->db
       				->where('id',$idPengajuan)
       				->where_not_in('status_proses',$status)
       				->get('pengajuan_pspbmn');
        if($query->num_rows() > 0){
            return $query->result();
        }else{
            return false;
        }
    }

	
}

?>