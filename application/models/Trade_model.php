<?php

class Trade_Model extends CI_Model 
{

	public function updateSettings($data) 
	{
		$this->db->where("ID", 1)->update("site_settings", $data);
	}

	public function setCurrency($data) 
	{
		$this->db->insert("currency_converter", $data);
	}	
	
	public function getRatioCurrency($origin,$destination) 
	{
		return $this->db->where("from", $origin)
				->where("to", $destination)
				->order_by("id","DESC")
				->limit("1")
				->get("currency_converter")
				->row();
				
	}

	
	// //Trade Model start
	// public function get_tradehistory($datatable,$month=null) 
	// {
	// 	$datatable->db_order();

	// 	$datatable->db_search(array(
	// 		"trade_history.symbol",
	// 		"trade_history.opendate",
	// 		"trade_history.closedate",
			
	// 		)
	// 	);
	// 	if(!isset($month)) :
	// 		$stmt = "SELECT  YEAR(FROM_UNIXTIME(closedate)) year, (SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1))  as last,
			  	 
	// 		  		(sum(
	// 				        CASE 
	// 				            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 1
	// 				            THEN total_pips
	// 				            ELSE NULL 
	// 				        END
	// 				    ) + 
	// 					   sum(CASE 
	// 					            WHEN MONTH(FROM_UNIXTIME(closedate)) = 1 
	// 					            THEN 0
	// 					            ELSE NULL 
	// 					        END)
	// 					    + IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'jan',
	// 	        	 (sum(
	// 					        CASE 
	// 					            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 2 
	// 					            THEN (total_pips)
	// 					            ELSE NULL 
	// 					        END
	// 					    ) + 
	// 					   sum(CASE 
	// 					            WHEN MONTH(FROM_UNIXTIME(closedate)) = 2 
	// 					            THEN 0
	// 					            ELSE NULL 
	// 					        END)
	// 					    +
	// 					    IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'feb'
					
	// 			,
	// 		    (sum(
	// 		        CASE 
	// 		            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 3 
	// 		            THEN total_pips 
	// 		            ELSE NULL 
	// 		        END
	// 		    ) + 
	// 					   sum(CASE 
	// 					            WHEN MONTH(FROM_UNIXTIME(closedate)) = 3 
	// 					            THEN 0
	// 					            ELSE NULL 
	// 					        END)
	// 					    + IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'mar',
	// 		    (sum(
	// 		        CASE 
	// 		            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 4 
	// 		            THEN total_pips 
	// 		            ELSE NULL 
	// 		        END
	// 		    )+ 
	// 					   sum(CASE 
	// 					            WHEN MONTH(FROM_UNIXTIME(closedate)) = 4 
	// 					            THEN 0
	// 					            ELSE NULL 
	// 					        END)
	// 					    + IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'apr',
	// 		    (sum(
	// 		        CASE 
	// 		            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 5 
	// 		            THEN total_pips 
	// 		            ELSE NULL 
	// 		        END
	// 		    ) + 
	// 					   sum(CASE 
	// 					            WHEN MONTH(FROM_UNIXTIME(closedate)) = 5 
	// 					            THEN 0
	// 					            ELSE NULL 
	// 					        END)
	// 					    + IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'may',
	// 		    (sum(
	// 		        CASE 
	// 		            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 6 
	// 		            THEN total_pips 
	// 		            ELSE NULL 
	// 		        END
	// 		    ) + 
	// 					   sum(CASE 
	// 					            WHEN MONTH(FROM_UNIXTIME(closedate)) = 6 
	// 					            THEN 0
	// 					            ELSE NULL 
	// 					        END)
	// 					    + IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'jun',
	// 		    (sum(
	// 		        CASE 
	// 		            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 7 
	// 		            THEN total_pips 
	// 		            ELSE NULL 
	// 		        END
	// 		    ) + 
	// 					   sum(CASE 
	// 					            WHEN MONTH(FROM_UNIXTIME(closedate)) = 7 
	// 					            THEN 0
	// 					            ELSE NULL 
	// 					        END)
	// 					    + IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'jul',
	// 		    (sum(
	// 		        CASE 
	// 		            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 8 
	// 		            THEN total_pips 
	// 		            ELSE NULL 
	// 		        END
	// 		    ) + 
	// 					   sum(CASE 
	// 					            WHEN MONTH(FROM_UNIXTIME(closedate)) = 8 
	// 					            THEN 0
	// 					            ELSE NULL 
	// 					        END)
	// 					    + IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'aug',
	// 		    (sum(
	// 		        CASE 
	// 		            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 9 
	// 		            THEN total_pips 
	// 		            ELSE NULL 
	// 		        END
	// 		    ) + 
	// 					   sum(CASE 
	// 					            WHEN MONTH(FROM_UNIXTIME(closedate)) = 9 
	// 					            THEN 0
	// 					            ELSE NULL 
	// 					        END)
	// 					    + IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'sep',
	// 		    (sum(
	// 		        CASE 
	// 		            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 10 
	// 		            THEN total_pips 
	// 		            ELSE NULL 
	// 		        END
	// 		    ) + 
	// 					   sum(CASE 
	// 					            WHEN MONTH(FROM_UNIXTIME(closedate)) = 10 
	// 					            THEN 0
	// 					            ELSE NULL 
	// 					        END)
	// 					    + IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'oct',
	// 		    (sum(
	// 		        CASE 
	// 		            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 11 
	// 		            THEN total_pips 
	// 		            ELSE NULL 
	// 		        END
	// 		    ) + 
	// 					   sum(CASE 
	// 					            WHEN MONTH(FROM_UNIXTIME(closedate)) = 11 
	// 					            THEN 0
	// 					            ELSE NULL 
	// 					        END)
	// 					    + IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'nov',
	// 		    (sum(
	// 		        CASE 
	// 		            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 12 
	// 		            THEN total_pips 
	// 		            ELSE NULL 
	// 		        END
	// 		    ) + 
	// 					   sum(CASE 
	// 					            WHEN MONTH(FROM_UNIXTIME(closedate)) = 12 
	// 					            THEN 0
	// 					            ELSE NULL 
	// 					        END)
	// 					    + IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'des'
	// 		FROM
	// 		trade_history t
	// 		GROUP BY YEAR(FROM_UNIXTIME(closedate))
	// 		LIMIT ".$datatable->length." OFFSET ".$datatable->start.";";
	// 		$sql =  $this->db->query($stmt);
	// 	else:
	// 		$sql = $this->db->select("*")
	// 		->limit($datatable->length, $datatable->start)
	// 		->where("concat(MONTH(FROM_UNIXTIME(closedate)), '-', YEAR(FROM_UNIXTIME(closedate))) =",$month)
	// 		->get("trade_history");
	// 	endif;	
	// 	//echo $this->db->last_query();
	// 	return $sql;
	// }	//Trade Model start


	public function get_tradehistory($datatable,$month=null) 
	{
		$datatable->db_order();

		$datatable->db_search(array(
			"trade_history.symbol",
			"trade_history.opendate",
			"trade_history.closedate",
			
			)
		);
		if(!isset($month)) :
			$stmt = "SELECT  YEAR(FROM_UNIXTIME(closedate)) year, (SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1))  as last,
			  	 
			  		(sum(
					        CASE 
					            WHEN MONTH(FROM_UNIXTIME(closedate)) = 1
					            THEN total_pips
					            ELSE NULL 
					        END
					    ) 
						   ) AS 'jan',
		        	 (sum(
						        CASE 
						            WHEN MONTH(FROM_UNIXTIME(closedate)) = 2 
						            THEN (total_pips)
						            ELSE NULL 
						        END
						    ) ) AS 'feb'
					
				,
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) = 3 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    ) ) AS 'mar',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) = 4 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    )) AS 'apr',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) = 5 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    ) ) AS 'may',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) = 6 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    ) ) AS 'jun',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) = 7 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    ) ) AS 'jul',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) = 8 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    ) ) AS 'aug',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) = 9 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    ) ) AS 'sep',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) = 10 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    ) ) AS 'oct',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) = 11 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    ) ) AS 'nov',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) = 12 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    ) ) AS 'des'
			FROM
			trade_history t
			GROUP BY YEAR(FROM_UNIXTIME(closedate))
			LIMIT ".$datatable->length." OFFSET ".$datatable->start.";";
			$sql =  $this->db->query($stmt);
		else:
			$sql = $this->db->select("*")
			->limit($datatable->length, $datatable->start)
			->where("concat(MONTH(FROM_UNIXTIME(closedate)), '-', YEAR(FROM_UNIXTIME(closedate))) =",$month)
			->get("trade_history");
		endif;	
		//echo $this->db->last_query();
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
		if(!isset($month)){
			$s= $this->db
				->select("COUNT(*) as num")			
				->group_by("YEAR(FROM_UNIXTIME(closedate))")
				->get("trade_history");
				return $s->num_rows();	
		}else{
			$s= $this->db
				->select("*")			
				->where("concat(MONTH(FROM_UNIXTIME(closedate)), '-', YEAR(FROM_UNIXTIME(closedate))) =",$month)
				->get("trade_history");
				return $s->num_rows();	
		}
		
		
	}

	public function getdataAll($month=null) 
	{
		if(isset($month)){
			$stmt = 'SELECT  closedate, sum(total_pips) pips
			FROM 
            trade_history t
            where concat(MONTH(FROM_UNIXTIME(closedate)), "-", YEAR(FROM_UNIXTIME(closedate))) ="'.$month.'"
            GROUP BY closedate
			ORDER BY closedate';
		}else{
			$stmt = 'SELECT  month(FROM_UNIXTIME(closedate)) bulan,year(FROM_UNIXTIME(closedate)) tahun, sum(total_pips) pips
			FROM 
            trade_history t
			GROUP BY month(FROM_UNIXTIME(closedate)), year(FROM_UNIXTIME(closedate))
			ORDER BY closedate';
		}	



			// $stmt = 'SELECT  concat(month(FROM_UNIXTIME(closedate)),"-",year(FROM_UNIXTIME(closedate))) tgl, sum(total_pips) pips
			// FROM 
   //          trade_history t
			// GROUP BY month(FROM_UNIXTIME(closedate)), year(FROM_UNIXTIME(closedate))
			// ORDER BY closedate';
		$sql =  $this->db->query($stmt);	
		//echo $this->db->last_query();die;
		// $sql = $this->db->select("sum(total_pips) num, closedate");
		// if(isset($month)){
		// 	$sql = $sql->where("concat(MONTH(FROM_UNIXTIME(closedate)), '-', YEAR(FROM_UNIXTIME(closedate))) =",$month);
		// }
		// $sql = $sql->group_by('closedate')	
		// 		->get("trade_history");

		return $sql;		
	}

	public function getdataAllPie($month=null) 
	{


		$stmt = 'SELECT  sum(CASE WHEN total_pips>0 THEN 1 ELSE 0 END) profit, sum(CASE WHEN total_pips<0 THEN 1 ELSE 0 END) loss, count(*) total
			FROM trade_history
			where concat(MONTH(FROM_UNIXTIME(closedate)), "-", YEAR(FROM_UNIXTIME(closedate))) ="'.$month.'"';
		$sql =  $this->db->query($stmt);

		return $sql;		
	}


}

?>