<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="functions" uri="http://com.maxfittings.stock/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fnc" uri="http://com.maxfittings.stock/functions"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/template"%>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/common"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

<title>库存</title>


<link rel="stylesheet" type="text/css" href="../static/front/css/slim-081711.css" />
<link rel="stylesheet" type="text/css" href="../static/front/css/jquery-ui-1.10.0.custom.css" />
<link rel="stylesheet" type="text/css" href="../static/front/css/jquery.fancybox-1.3.4.css"/>
<link rel="stylesheet" type="text/css" href="../static/front/css/960_24_col.css"/>
<link rel="stylesheet" type="text/css" href="../static/front/css/stylesheet.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../static/front/css/default.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../static/front/css/nivo-slider.css"/>
<link rel="stylesheet" type="text/css" href="../static/front/css/hint.css"/>
<link rel="stylesheet" type="text/css" href="../static/front/css/front.css"/>



<script type="text/javascript" src="../static/front/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="../static/front/js/jquery.cookie.js"></script>
<link href="../static/front/tree3/themes/default/style.min.css" rel="stylesheet" />
<script type="text/javascript" src="../static/front/js/contactus.js"></script>

<link rel="shortcut icon" href="#" />
<link rel="icon" href="#"/>

<meta name="msapplication-tooltip" content="Stock Services: First choice for Stainless Steel fittings &amp; flanges"/>
<meta name="msapplication-navbutton-color" content="#1986C1"/>
<meta name="msapplication-TileImage" content="images/ss_logo_144px.png"/>
<meta name="msapplication-TileColor" content="#FFF"/>
<meta name="msapplication-starturl" content="/"/>
<meta name="msapplication-task" content="name=LinkedIn;action-uri=http://www.linkedin.com/pub/peter-comerford/37/842/885;icon-uri=http://www.linkedin.com/favicon.ico"/>
<meta name="msapplication-task" content="name=Contact Us;action-uri=http://www.stockservices.co.uk/contact_us.php;icon-uri=http://www.stockservices.co.uk/images/email.ico"/>

<link rel="apple-touch-icon" href="#"/>
<link rel="apple-touch-icon" sizes="72x72" href="#"/>
<link rel="apple-touch-icon" sizes="114x114" href="#"/>
<link rel="apple-touch-icon" sizes="144x144" href="#"/>
</head>
<body>
	<div id="bodyWrapper" class="container_24">


		<div id="header" class="grid_24">
			<div id="storeLogo">
				<img src="../static/front/img/ss_header_950x230.png" class="banner" alt="First Choice for Stainless Steel Fittings and Flanges" />
			</div>

			<div id="headerBackground">
				
			</div>

		</div>

		<div class="grid_24 ui-widget infoBoxContainer">
			<div class="ui-widget-header infoBoxHeading">
				<ul>
					<li><a href="#" >FaceBook</a></li>
					<li><a href="#" >Twitter</a></li>				
					<li><a href="https://www.linkedin.com/company/shanghai-max-fittings-co-ltd-?trk=nmp_rec_act_company_photo" >LinkedIn</a></li>
					<li><a href="contactus.jsp">Contact Us</a></li>					
					<li><a href="iso.jsp">Certification</a></li>					
					<li>
						<a href="#" class="lang" language="en">ENGLISH</a>
					</li>
					<li class="bloglink">
						<a href="#"  class="lang" language="zh">中文</a>
					</li>
				</ul>
				<div style="float: left;"></div>
			</div>
		</div>
		<div style="width: 100%;overflow: hidden;">
			<div style="height:45px;width:100%;margin:10px 0;border-bottom:1px solid black;">
				<button class="returnBackBtn" type="button"><fnc:message key="back"/></button>
				<span class="clearfix"></span>		
			</div>
			<h1><fnc:message key="contact_us"/></h1>
			<div class="grid-8">
				<span><fnc:message key="company_name"/></span>
				<br/>
				<br/>
				<span><fnc:message key="tel"/>:+86 2138618388</span>
				<br/>
				<span><fnc:message key="fax"/>:+86 2138618333</span>
				<br/>
				<span><fnc:message key="email"/>:sales@maxfittings.com</span>
				<br/>
				<span><fnc:message key="mail_address"/>:<fnc:message key="mail_addr"/></span>
				<br/>
				<span><fnc:message key="office_address"/>:<fnc:message key="office_addr"/></span>
				<br/>
				<span><fnc:message key="wechat"/>:maxfittings</span>
				<br/>
				<br/>
				<img src="../static/front/img/qrcode_for_max.jpg" alt="" />
			</div>
			
		</div>

		<div class="grid_24 footer">
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