<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="functions" uri="http://com.maxfittings.stock/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/common"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<title>桑不起</title>


<link rel="stylesheet" type="text/css" href="../static/front/css/slim-081711.css" />
<link rel="stylesheet" type="text/css" href="../static/front/css/jquery-ui-1.10.0.custom.css" />
<link rel="stylesheet" type="text/css" href="../static/front/css/jquery.fancybox-1.3.4.css"/>
<link rel="stylesheet" type="text/css" href="../static/front/css/960_24_col.css"/>
<link rel="stylesheet" type="text/css" href="../static/front/css/stylesheet.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../static/front/css/default.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../static/front/css/nivo-slider.css"/>
<link rel="stylesheet" type="text/css" href="../static/front/css/hint.css"/>



<script type="text/javascript" src="../static/front/js/jquery-1.10.1.min.js"></script>
<link href="../static/front/tree3/themes/default/style.min.css" rel="stylesheet" />
<script src="../static/front/tree3/jstree.js"></script>
<script type="text/javascript" src="../static/front/js/front.js"></script>

<link rel="shortcut icon" href="http://www.stockservices.co.uk/images/favicon.ico/" />
<link rel="icon" href="http://www.stockservices.co.uk/images/favicon.ico/" type="image/x-icon"/>

<meta name="msapplication-tooltip" content="Stock Services: First choice for Stainless Steel fittings &amp; flanges"/>
<meta name="msapplication-navbutton-color" content="#1986C1"/>
<meta name="msapplication-TileImage" content="images/ss_logo_144px.png"/>
<meta name="msapplication-TileColor" content="#FFF"/>
<meta name="msapplication-starturl" content="/"/>
<meta name="msapplication-task" content="name=LinkedIn;action-uri=http://www.linkedin.com/pub/peter-comerford/37/842/885;icon-uri=http://www.linkedin.com/favicon.ico"/>
<meta name="msapplication-task" content="name=Contact Us;action-uri=http://www.stockservices.co.uk/contact_us.php;icon-uri=http://www.stockservices.co.uk/images/email.ico"/>

<link rel="apple-touch-icon" href="http://www.stockservices.co.uk/touch-icon-iphone.png"/>
<link rel="apple-touch-icon" sizes="72x72" href="http://www.stockservices.co.uk/touch-icon-ipad.png"/>
<link rel="apple-touch-icon" sizes="114x114" href="http://www.stockservices.co.uk/touch-icon-iphone-retina.png"/>
<link rel="apple-touch-icon" sizes="144x144" href="http://www.stockservices.co.uk/touch-icon-ipad-retina.png"/>
<style type="text/css">
.clearfix:before, .clearfix:after {
	display: table;
	content: " ";
	clear: both;
}

.item{
	width:100px;
	display:block;
	float:left;
	margin:5px 10px;
	background-color: gray;
	cursor: pointer;
}
.active{
	color:red;
	background-color: green;
}
#productTable  td,th{
	border:1px solid gray;
}
#productTable{
	margin-top:10px;
	border:1px solid gray;
}
.breadcrumb_null{
	border:green 1px dashed;
}
</style>
</head>
<body>

	<div id="bodyWrapper" class="container_24">


		<div id="header" class="grid_24">
			<div id="storeLogo">
				<img src="../static/front/img/ss_header_950x230.png" alt="First Choice for Stainless Steel Fittings and Flanges" />
			</div>

			<div id="headerBackground">
				
			</div>

			<div id="headerShortcuts">
				<ul>
					<li>Sales Line: <a href="callto:+441213596899">+44 (0) 121
							359 6899</a></li>
					<li><a href="http://www.stockservices.co.uk/shopping_cart.php">Quote
							Cart</a></li>
					<li><a href="http://www.stockservices.co.uk/account.php">My
							Account</a></li>

					<li><a href="http://www.stockservices.co.uk/login.php">Log
							In</a></li>
					<li class="imglink"><a
						href="https://plus.google.com/102831278091066439226/about"
						target="_blank">
						<img src="../static/front/img/google.png" alt="Google+ Logo" title="Stock Services Google+ Profile"/></a></li>
					<li class="imglink">
						<a href="http://www.linkedin.com/company/stock-services" target="_blank">
							<img src="../static/front/img/linkedin.png" alt="LinkedIn Logo" title="Stock Services LinkedIn Profile"/>
						</a>
					</li>
				</ul>
			</div>

		</div>

		<div class="grid_24 ui-widget infoBoxContainer">
			<div class="ui-widget-header infoBoxHeading">
				<ul>
					<li><a href="http://www.stockservices.co.uk/contact_us.php">Contact
							Us</a></li>
					<li><a
						href="https://plus.google.com/115280250792196809484/about"
						target="_blank">Google+</a></li>
					<li><a href="http://www.linkedin.com/company/stock-services"
						target="_blank">LinkedIn</a></li>
					<li><a href="http://eepurl.com/s8zF1" target="_blank">Mailing
							List</a></li>
					<li class="bloglink"><a
						href="http://www.stockservices.co.uk/blog" target="_blank">Blog</a></li>
				</ul>
				<div style="float: left;"></div>
			</div>
		</div>


		<div id="bodyContent" class="grid_18 push_6">
			<div style="border: black 1px solid;">
				<div class="breadcrumb_null" id="level4">
				</div>
				<div class="breadcrumb_null" id="level5">
				</div>
				<div class="breadcrumb_null" id="level6">
				</div>			
			</div>
			<div class="contentContainer" id="container">
			</div>


		</div>
		<!-- bodyContent //-->


		<div id="columnLeft" class="grid_6 pull_18">
			<div id="leftTree" style="min-height:300px;border: black 1px solid;">
			</div>
		</div>
		<br/>
		<div id="footer" class="grid_24 footer">
			<div class="grid_24 ui-widget infoBoxContainer">
				<div class="ui-widget-header footernav">
					<ul>
						<li><a href="http://www.stockservices.co.uk/about.php"
							class="menu">About Stock Services</a></li>
						<li><a
							href="http://www.stockservices.co.uk/iso_certification.php"
							class="menu">ISO Certification</a></li>
						<li><a href="http://www.stockservices.co.uk/terms.php"
							class="menu">Terms &amp; Conditions</a></li>
						<li><a href="http://www.stockservices.co.uk/privacy.php"
							class="menu">Privacy Notice</a></li>
						<li><a href="http://www.stockservices.co.uk/conditions.php"
							class="menu">Conditions Of Use</a></li>
						<li><a href="http://www.stockservices.co.uk/contact_us.php"
							class="menu">Contact Us</a></li>
					</ul>
				</div>
			</div>

		</div>

		<div class="grid_24 footer">
			<p align="center" style="font-size: 0.7em">
				Copyright © 2008-2013 South East Asian Trading Services Limited <br/>
				Stock Services is a division of South East Asian Trading Services
				Ltd., registered in England no. 04478701. VAT no. 831 8046 39.<br/>
				<br/>Site design by <a href="http://kense.co.uk/"
					target="_blank">kense</a>, powered by <a
					href="http://www.oscommerce.com/" target="_blank">osCommerce</a>.
			</p>
		</div>

		<div class="clear"></div>

	</div>
	<!-- bodyWrapper //-->




	<div id="fancybox-tmp"></div>
	<div id="fancybox-loading">
		<div></div>
	</div>
	<div id="fancybox-overlay"></div>
	<div id="fancybox-wrap">
		<div id="fancybox-outer">
			<div class="fancybox-bg" id="fancybox-bg-n"></div>
			<div class="fancybox-bg" id="fancybox-bg-ne"></div>
			<div class="fancybox-bg" id="fancybox-bg-e"></div>
			<div class="fancybox-bg" id="fancybox-bg-se"></div>
			<div class="fancybox-bg" id="fancybox-bg-s"></div>
			<div class="fancybox-bg" id="fancybox-bg-sw"></div>
			<div class="fancybox-bg" id="fancybox-bg-w"></div>
			<div class="fancybox-bg" id="fancybox-bg-nw"></div>
			<div id="fancybox-content"></div>
			<a id="fancybox-close"></a>
			<div id="fancybox-title"></div>
			<a href="javascript:;" id="fancybox-left"><span class="fancy-ico"
				id="fancybox-left-ico"></span></a><a href="javascript:;"
				id="fancybox-right"><span class="fancy-ico"
				id="fancybox-right-ico"></span></a>
		</div>
	</div>
</body>
</html>