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
				->get_total_tradehistory_count_member()
		);

		$trade = $this->trade_model->get_tradehistory_member($this->datatables);

		//echo '<pre>'; print_r( $trade );die; //test
		
			$num = 0;
			foreach($trade->result() as $r) {
				$this->datatables->data[] = array(
					$r->symbol,
					($r->type==="SELL")?'<div type="text" class="btn btn-warning btn-xs" >'.$r->type.'</div>':'<div type="text" class="btn btn-success btn-xs" >'.$r->type.'</div>',
					$r->price,
					$r->stoploss,
					$r->target1,
					$r->target2,
					$r->target3,
					$num = $r->total_pips + $num,
					$this->common->date_time($r->opendate),
					$this->common->date_time($r->closedate)
					
				);
			}
		echo json_encode($this->datatables->process());
	}

	public function getdatachart(){
		$users = $this->trade_model->getdataAll();
		$users = $users->result_array();
		$data = array();
		$num = 0;

		foreach ($users as $key => $us) {
				$date = $us["tahun"]."-".$us["bulan"]."-"."1";
				$data[$key][0] = strtotime($date)*1000;
				$num = $num + $us["pips"]; 
				$data[$key][1] =  $num ;

			}
		
		$data = str_replace('"', '',json_encode($data));
		
		echo $data ;
	}	

	
}

?>
