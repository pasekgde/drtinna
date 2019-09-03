<?php
//header('Access-Control-Allow-Origin: *');

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Trade extends CI_Controller
{

	public function __construct()
	{

		parent::__construct();
		if (defined('REQUEST') && REQUEST == "external") {
	        return;
	    }
		$this->template->loadData("activeLink",
			array("home" => array("general" => 1)));
			$this->load->model("trade_model");
			$this->load->library('Frontweb');

	}

	public function gethistory($months = null)
	{
		$this->load->library("datatables");
		

		$this->datatables->set_default_order("trade_history.closedate", "asc");

		// Set page ordering options that can be used
		$this->datatables->ordering(
			array(
				 0 => array(
				 	"trade_history.symbol" => 0
				 ),
				 1 => array(
				 	"trade_history.type" => 0
				 ),
				 2 => array(
				 	"trade_history.price" => 0
				 ),
				 3 => array(
				 	"trade_history.target1" => 0
				 ),
				 4 => array(
				 	"trade_history.target2" => 0
				 ),
				 5 => array(
				 	"trade_history.target3" => 0
				 ),
				 6 => array(
				 	"trade_history.total_pips" => 0
				 ),
				 7 => array(
				 	"trade_history.opendate" => 0
				 ),
				 8 => array(
				 	"trade_history.closedate" => 0
				 )
			)
		);

		$this->datatables->set_total_rows(
			$this->trade_model
				->get_total_tradehistory_count($months)
		);

		$trade = $this->trade_model->get_tradehistory($this->datatables,$months);

		if(!isset($months)){
			foreach($trade->result() as $r) {
				$this->datatables->data[] = array(
					$r->year,
					'<a href="'.site_url("home/tradedetails/1/".$r->year).'">'.$r->jan.'</a>',
					'<a href="'.site_url("home/tradedetails/2/".$r->year).'">'.$r->feb.'</a>',
					'<a href="'.site_url("home/tradedetails/3/".$r->year).'">'.$r->mar.'</a>',
					'<a href="'.site_url("home/tradedetails/4/".$r->year).'">'.$r->apr.'</a>',
					'<a href="'.site_url("home/tradedetails/5/".$r->year).'">'.$r->may.'</a>',
					'<a href="'.site_url("home/tradedetails/6/".$r->year).'">'.$r->jun.'</a>',
					'<a href="'.site_url("home/tradedetails/7/".$r->year).'">'.$r->jul.'</a>',
					'<a href="'.site_url("home/tradedetails/8/".$r->year).'">'.$r->aug.'</a>',
					'<a href="'.site_url("home/tradedetails/9/".$r->year).'">'.$r->sep.'</a>',
					'<a href="'.site_url("home/tradedetails/10/".$r->year).'">'.$r->oct.'</a>',
					'<a href="'.site_url("home/tradedetails/11/".$r->year).'">'.$r->nov.'</a>',
					'<a href="'.site_url("home/tradedetails/12/".$r->year).'">'.$r->des.'</a>'
				);
			}
		}else{
			$num = 0;
			foreach($trade->result() as $r) {
				$allowid = json_decode($r->allowid);

				$this->datatables->data[] = array(
					$r->symbol,
					($r->type==="SELL")?'<div type="text" class="btn btn-warning btn-xs" >'.$r->type.'</div>':'<div type="text" class="btn btn-success btn-xs" >'.$r->type.'</div>',
					$r->price,
					(in_array(1, $allowid))?$r->stoploss:'<a href="#" class="datatab btn btn-info" >JOIN!</a>',
					(in_array(1, $allowid))?$r->target1:'<a href="#" class="datatab btn btn-info" role="button">JOIN!</a>',
					(in_array(1, $allowid))?$r->target2:'<a href="#" class="datatab btn btn-info" role="button">JOIN!</a>',
					(in_array(1, $allowid))?$r->target3:'<a href="#" class="datatab btn btn-info" role="button">JOIN!</a>',
					$num = $r->total_pips + $num,
					$this->common->date_time($r->opendate),
					$this->common->date_time($r->closedate)
					
				);
			}
		}
		echo json_encode($this->datatables->process());
	}

	public function getdatachart($month=null){
		$users = $this->trade_model->getdataAll($month);
		//echo $this->db->last_query();
		$users = $users->result_array();
		$data = array();
		$num = 0;

		//echo '<pre>'; print_r( $users );die; //test
		if(isset($month)){
			foreach ($users as $key => $us) {
				$data[$key][0] =  $us["closedate"]*1000;
				$num = $num + $us["pips"]; 
				$data[$key][1] =  $num ;

			}
		}else{
			foreach ($users as $key => $us) {
				$date = $us["tahun"]."-".$us["bulan"]."-"."1";
				$data[$key][0] = strtotime($date)*1000;
				$num = $num + $us["pips"]; 
				$data[$key][1] =  $num ;

			}
		}

		$data = str_replace('"', '',json_encode($data));
		
		echo $data ;
	}	

	public function getdatapiechart($month=null){
		$dataPie = $this->trade_model->getdataAllPie($month);
		//echo $this->db->last_query();
		$dataPie = $dataPie->result_array();
		$data = array();
		$data[0]["name"] =  "Profit";
		$data[0]["y"] =  ($dataPie[0]["profit"]/$dataPie[0]["total"])*100;	
		$data[0]["sliced"] =  true;	
		$data[0]["selected"] =  false;	
		$data[1]["name"] =  "Loss";
		$data[1]["y"] =  ($dataPie[0]["loss"]/$dataPie[0]["total"])*100;
		$data[1]["sliced"] =  true;	
		$data[1]["selected"] =  false;
		
		echo json_encode($data);
	}	


	
}

?>
