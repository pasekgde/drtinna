SELECT  YEAR(FROM_UNIXTIME(closedate)) year, (SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1))  as last,
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 1
			            THEN total_pips
			            ELSE NULL 
			        END
			    ) + IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) as jan,
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 2 
			            THEN (total_pips)
			            ELSE NULL 
			        END
			    ) + IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0))  AS 'feb',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 3 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    )+ IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'mar',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 4 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    )+ IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'apr',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 5 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    )+ IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'may',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 6 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    )+ IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'jun',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 7 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    )+ IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'jul',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 8 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    )+ IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'aug',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 9 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    )+ IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'sep',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 10 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    )+ IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'oct',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 11 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    )+ IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'nov',
			    (sum(
			        CASE 
			            WHEN MONTH(FROM_UNIXTIME(closedate)) <= 12 
			            THEN total_pips 
			            ELSE NULL 
			        END
			    )+ IFNULL((SELECT SUM(total_pips) FROM trade_history WHERE YEAR(FROM_UNIXTIME(closedate)) <=(YEAR(FROM_UNIXTIME(t.closedate))-1)),0)) AS 'des'
			FROM
 trade_history t
			GROUP BY YEAR(FROM_UNIXTIME(closedate))