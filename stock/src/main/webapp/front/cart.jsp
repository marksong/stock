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


<link rel="stylesheet" type="text/css" href="static/front/css/slim-081711.css" />
<link rel="stylesheet" type="text/css" href="static/front/css/jquery-ui-1.10.0.custom.css" />
<link rel="stylesheet" type="text/css" href="static/front/css/jquery.fancybox-1.3.4.css"/>
<link rel="stylesheet" type="text/css" href="static/front/css/960_24_col.css"/>
<link rel="stylesheet" type="text/css" href="static/front/css/stylesheet.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="static/front/css/default.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="static/front/css/nivo-slider.css"/>
<link rel="stylesheet" type="text/css" href="static/front/css/hint.css"/>
<link rel="stylesheet" type="text/css" href="static/front/css/front.css"/>



<script type="text/javascript" src="static/front/js/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="static/front/js/jquery.cookie.js"></script>
<link href="static/front/tree3/themes/default/style.min.css" rel="stylesheet" />
<script src="static/front/tree3/jstree.js"></script>
<script src="static/front/layer/layer.min.js"></script>
<script type="text/javascript" src="static/front/js/cart.js"></script>

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
				<img src="static/front/img/ss_header_950x230.png" class="banner" alt="First Choice for Stainless Steel Fittings and Flanges" />
			</div>

			<div id="headerBackground">
				
			</div>


		</div>

		<div class="grid_24 ui-widget infoBoxContainer">
			<div class="ui-widget-header infoBoxHeading">
				<ul>
					<li><a href="#" >FaceBook</a></li>
					<li><a href="#" >Twitter</a></li>				
					<li><a href="https://www.linkedin.com/company/shanghai-max-fittings-co-ltd-?trk=nmp_rec_act_company_photo">LinkedIn</a></li>
					<li><a href="contactus.jsp">Contact Us</a></li>					
					<li><a href="iso.jsp">Certification</a></li>					
					<li><a href="#" class="lang" language="en">ENGLISH</a></li>
					<li class="bloglink">
						<a href="#"  class="lang" language="zh">中文</a>
					</li>
				</ul>
				<div style="float: left;"></div>
			</div>
		</div>
		<div style="width: 100%;">
			<!-- 购物车内容 -->
			<div style="width:100%;display: block;overflow: hidden;" id="cartContent">
				<div style="height:45px;width:100%;margin:10px 0;border-bottom:1px solid black;">
					<div class="title"><fnc:message key="current_cart"/>:</div>
					<button class="returnBackBtn" type="button"><fnc:message key="back"/></button>
					<span class="clearfix"></span>		
				</div>
				<table id="cartTable" style="width:100%" class="cartTable">
					<thead>
						<th width="5%">
							<fnc:message key="select"/>
						</th>
						<th width="40%">
							<fnc:message key="name"/>
						</th>
						<th width=5%>
							<fnc:message key="standard"/>
						</th>						
						<th width=15%>
							<fnc:message key="material"/>
						</th>
						<th width=10%>
							<fnc:message key="outer_diameter"/>
						</th>
						<th width=15%>
							<fnc:message key="wall_thickness"/>
						</th>						
						<th width="5%">
							<fnc:message key="stock"/>
						</th>
						<th width="5%">
							<fnc:message key="total"/>
						</th>
						<th width="5%">
							<fnc:message key="delete"/>
						</th>
					</thead>
				</table>
				<div style="height:45px;width:100%;margin:10px 0; border-top:1px solid black">
					<button class="sendMailBtn" id="prepareSend" type="button"><fnc:message key="send"/></button>
				</div>			
			</div>
			<span class="clearfix"></span>		
		</div>

		<div class="grid_24 footer">
		</div>

		<div class="clear"></div>

	</div>
	<!-- bodyWrapper //-->
	<div class="layerBox" style="width: 500px;min-height: 200px;display: none ;background-color: #80ffff;">
		<table width="100%">
			<thead>
				<th align="right"></th>
				<th align="left"></th>
			</thead>
			<tbody>
				<tr>
					<td align="right">
						<fnc:message key="corpName"/>:
					</td>
					<td>
						<input class="corpInfo" name="corpName" type="text" />
					</td>
				</tr>
				<tr>
					<td align="right">
						<fnc:message key="corpAddr"/>:
					</td>
					<td>
						<input class="corpInfo" name="corpAddr" type="text" />
					</td>
				</tr>		
				<tr>
					<td align="right">
						<fnc:message key="telephone"/>:
					</td>
					<td>
						<input class="corpInfo" name="telephone" type="text" />
					</td>
				</tr>	
				<tr>
					<td align="right">
						<fnc:message key="mail"/>:
					</td>
					<td>
						<input class="corpInfo" name="mail" type="text" />
					</td>
				</tr>
				<tr>
					<td align="right">
						<fnc:message key="contactName"/>:
					</td>
					<td>
						<input class="corpInfo" name="contactName" type="text" />
					</td>
				</tr>														
			</tbody>
		</table>
		<button class="sendMailBtn" id="btn_send" type="button"><fnc:message key="send"/></button>
	</div>



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