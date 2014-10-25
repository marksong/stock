<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="pageTitle" required="false" rtexprvalue="true" %>
<%@ attribute name="pageCss" required="false" fragment="true" %>
<%@ attribute name="pageScripts" required="false" fragment="true" %>


<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="ctxStatic" value="${ctx}/static/admin" />

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>
		${not empty pageTitle ? pageTitle : 'Stock'}
	</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="description" content="Avant" />
	<meta name="author" content="The Red Team" />

    <link href="${ctxStatic}/css/styles.min.css" rel="stylesheet" type='text/css' media="all" />
    
    <link href='${ctxStatic}/demo/variations/default.css' rel='stylesheet' type='text/css' media='all' id='styleswitcher' /> 
    
    <link href='${ctxStatic}/demo/variations/default.css' rel='stylesheet' type='text/css' media='all' id='headerswitcher' /> 
    
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries. Placeholdr.js enables the placeholder attribute -->
	<!--[if lt IE 9]>
		<script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
        <script type="text/javascript" src="${ctxStatic}/plugins/charts-flot/excanvas.min.js"></script>
        <link rel="stylesheet" href="${ctxStatic}/css/ie8.css">
	<![endif]-->

	<!-- The following CSS are included as plugins and can be removed if unused-->

<link rel='stylesheet' type='text/css' href='${ctxStatic}/plugins/datatables/dataTables.css' /> 
<link rel='stylesheet' type='text/css' href='${ctxStatic}/plugins/codeprettifier/prettify.css' /> 
<link rel='stylesheet' type='text/css' href='${ctxStatic}/plugins/form-toggle/toggles.css' /> 

	<style>
	    	</style>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body class="">

    <div id="headerbar">
        <div class="container">
            <div class="row">
                <div class="col-xs-6 col-sm-2">
                    <a href="#" class="shortcut-tiles tiles-brown">
                        <div class="tiles-body">
                            <div class="pull-left"><i class="icon-pencil"></i></div>
                        </div>
                        <div class="tiles-footer">
                            Create Post
                        </div>
                    </a>
                </div>
                <div class="col-xs-6 col-sm-2">
                    <a href="#" class="shortcut-tiles tiles-grape">
                        <div class="tiles-body">
                            <div class="pull-left"><i class="icon-group"></i></div>
                            <div class="pull-right"><span class="badge">2</span></div>
                        </div>
                        <div class="tiles-footer">
                            Contacts
                        </div>
                    </a>
                </div>
                <div class="col-xs-6 col-sm-2">
                    <a href="#" class="shortcut-tiles tiles-primary">
                        <div class="tiles-body">
                            <div class="pull-left"><i class="icon-envelope-alt"></i></div>
                            <div class="pull-right"><span class="badge">10</span></div>
                        </div>
                        <div class="tiles-footer">
                            Messeges
                        </div>
                    </a>
                </div>
                <div class="col-xs-6 col-sm-2">
                    <a href="#" class="shortcut-tiles tiles-inverse">
                        <div class="tiles-body">
                            <div class="pull-left"><i class="icon-camera"></i></div>
                            <div class="pull-right"><span class="badge">3</span></div>
                        </div>
                        <div class="tiles-footer">
                            Gallery
                        </div>
                    </a>
                </div>

                <div class="col-xs-6 col-sm-2">
                    <a href="#" class="shortcut-tiles tiles-green">
                        <div class="tiles-body">
                            <div class="pull-left"><i class="icon-cog"></i></div>
                        </div>
                        <div class="tiles-footer">
                            Settings
                        </div>
                    </a>
                </div>
                <!--div class="col-xs-6 col-sm-2">
                    <a href="#" class="shortcut-tiles tiles-success">
                        <div class="tiles-body">
                            <div class="pull-left"><i class="icon-cog"></i></div>
                        </div>
                        <div class="tiles-footer">
                            Admin Settings
                        </div>
                    </a>
                </div-->
                            
            </div>
        </div>
    </div>

    <header class="navbar navbar-inverse navbar-fixed-top" role="banner">
        <a id="leftmenu-trigger" class="pull-left" data-toggle="tooltip" data-placement="bottom" title="Toggle Left Sidebar"></a>
    </header>

    <div id="page-container">
        <!-- BEGIN SIDEBAR -->
        <nav id="page-leftbar" role="navigation">
                <!-- BEGIN SIDEBAR MENU -->
            <ul class="acc-menu" id="sidebar">
                <li class="divider"></li>
                <li><a href="${ctx}/admin/product"><span>产品管理</span></a></li>
                <li><a href="${ctx}/admin/stock"><span>库存管理</span></a></li>
                <li><a href="${ctx}/admin/category"><span>分类管理</span></a></li>
            </ul>
            <!-- END SIDEBAR MENU -->
        </nav>

        <!-- BEGIN RIGHTBAR -->
        <div id="page-rightbar">

            <div id="chatarea">
                <div class="chatuser">
                    <span class="pull-right">Jane Smith</span>
                    <a id="hidechatbtn" class="btn btn-default btn-sm"><i class="icon-arrow-left"></i> Back</a>
                </div>
                <div class="chathistory">
                    <div class="chatmsg">
                        <p>Hey! How's it going?</p>
                        <span class="timestamp">1:20:42 PM</span>
                    </div>
                    <div class="chatmsg sent">
                        <p>Not bad... i guess. What about you? Haven't gotten any updates from you in a long time.</p>
                        <span class="timestamp">1:20:46 PM</span>
                    </div>
                    <div class="chatmsg">
                        <p>Yeah! I've been a bit busy lately. I'll get back to you soon enough.</p>
                        <span class="timestamp">1:20:54 PM</span>
                    </div>
                    <div class="chatmsg sent">
                        <p>Alright, take care then.</p>
                        <span class="timestamp">1:21:01 PM</span>
                    </div>
                </div>
                <div class="chatinput">
                    <textarea name="" rows="2"></textarea>
                </div>
            </div>

            <div id="widgetarea">
                <div class="widget">
                    <div class="widget-heading">
                        <a href="javascript:;" data-toggle="collapse" data-target="#accsummary"><h4>Account Summary</h4></a>
                    </div>
                    <div class="widget-body collapse in" id="accsummary">
                        <div class="widget-block" style="background: #7ccc2e;">
                            <div class="pull-left">
                                <small>Current Balance</small>
                                <h5>$71,182</h5>
                            </div>
                            <div class="pull-right"><div id="currentbalance"></div></div>
                        </div>
                        <div class="widget-block" style="background: #595f69;">
                            <div class="pull-left">
                                <small>Account Type</small>
                                <h5>Business Plan A</h5>
                            </div>
                            <div class="pull-right">
                                <small class="text-right">Monthly</small>
                                <h5>$19<small>.99</small></h5>
                            </div>
                        </div>
                        <span class="more"><a href="#">Upgrade Account</a></span>
                    </div>
                </div>


                <div id="chatbar" class="widget">
                    <div class="widget-heading">
                        <a href="javascript:;" data-toggle="collapse" data-target="#chatbody"><h4>Online Contacts <small>(5)</small></h4></a>
                    </div>
                    <div class="widget-body collapse in" id="chatbody">
                        <ul class="">
                            <li data-stats="online"><a href="javascript:;"><img src="${ctxStatic}/demo/avatar/potter.png" alt="" /><span>Jeremy Potter</span></a></li>
                            <li data-stats="online"><a href="javascript:;"><img src="${ctxStatic}/demo/avatar/tennant.png" alt="" /><span>David Tennant</span></a></li>
                            <li data-stats="online"><a href="javascript:;"><img src="${ctxStatic}/demo/avatar/johansson.png" alt="" /><span>Anna Johansson</span></a></li>
                            <li data-stats="busy"><a href="javascript:;"><img src="${ctxStatic}/demo/avatar/jackson.png" alt="" /><span>Eric Jackson</span></a></li>
                            <li data-stats="away"><a href="javascript:;"><img src="${ctxStatic}/demo/avatar/jobs.png" alt="" /><span>Howard Jobs</span></a></li>
                            <!--li data-stats="offline"><a href="javascript:;"><img src="${ctxStatic}/demo/avatar/watson.png" alt=""><span>Annie Watson</span></a></li>
                            <li data-stats="offline"><a href="javascript:;"><img src="${ctxStatic}/demo/avatar/doyle.png" alt=""><span>Alan Doyle</span></a></li>
                            <li data-stats="offline"><a href="javascript:;"><img src="${ctxStatic}/demo/avatar/corbett.png" alt=""><span>Simon Corbett</span></a></li>
                            <li data-stats="offline"><a href="javascript:;"><img src="${ctxStatic}/demo/avatar/paton.png" alt=""><span>Polly Paton</span></a></li-->
                        </ul>
                        <span class="more"><a href="#">See all</a></span>
                    </div>
                </div>

                <div class="widget">
                    <div class="widget-heading">
                        <a href="javascript:;" data-toggle="collapse" data-target="#taskbody"><h4>Pending Tasks <small>(5)</small></h4></a>
                    </div>
                    <div class="widget-body collapse in" id="taskbody">
                        <div class="contextual-progress">
                            <div class="clearfix">
                                <div class="progress-title">Backend Development</div>
                                <div class="progress-percentage">25%</div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar progress-bar-info" style="width: 25%"></div>
                            </div>
                        </div>
                        <div class="contextual-progress">
                            <div class="clearfix">
                                <div class="progress-title">Bug Fix</div>
                                <div class="progress-percentage">17%</div>
                            </div>
                            <div class="progress">
                              <div class="progress-bar progress-bar-primary" style="width: 17%"></div>
                            </div>
                        </div>
                        <div class="contextual-progress">
                            <div class="clearfix">
                                <div class="progress-title">Javascript Code</div>
                                <div class="progress-percentage">70%</div>
                            </div>
                            <div class="progress">
                              <div class="progress-bar progress-bar-success" style="width: 70%"></div>
                            </div>
                        </div>
                        <div class="contextual-progress">
                            <div class="clearfix">
                                <div class="progress-title">Preparing Documentation</div>
                                <div class="progress-percentage">6%</div>
                            </div>
                            <div class="progress">
                              <div class="progress-bar progress-bar-danger" style="width: 6%"></div>
                            </div>
                        </div>
                        <div class="contextual-progress">
                            <div class="clearfix">
                                <div class="progress-title">App Development</div>
                                <div class="progress-percentage">20%</div>
                            </div>
                            <div class="progress">
                              <div class="progress-bar progress-bar-orange" style="width: 20%"></div>
                            </div>
                        </div>
                        
                        <span class="more"><a href="ui-progressbars.html">View all Pending</a></span>
                    </div>
                </div>

 

                <div class="widget">
                    <div class="widget-heading">
                        <a href="javascript:;" data-toggle="collapse" data-target="#storagespace"><h4>Storage Space</h4></a>
                    </div>
                    <div class="widget-body collapse in" id="storagespace">
                        <div class="contextual-progress">
                            <div class="clearfix">
                                <div class="progress-title">1.31 GB of 1.50 GB used</div>
                                <div class="progress-percentage">87.3%</div>
                            </div>
                            <div class="progress">
                                <div class="progress-bar progress-bar-success" style="width: 50%"></div>
                                <div class="progress-bar progress-bar-warning" style="width: 25%"></div>
                                <div class="progress-bar progress-bar-danger" style="width: 12.3%"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="widget">
                    <div class="widget-heading">
                        <a href="javascript:;" data-toggle="collapse" data-target="#serverstatus"><h4>Server Status</h4></a>
                    </div>
                    <div class="widget-body collapse in" id="serverstatus">
                        <div class="clearfix" style="padding: 10px 24px;">
                            <div class="pull-left">
                                <div class="easypiechart" id="serverload" data-percent="67">
                                        <span class="percent"></span>
                                </div>
                                <label for="serverload">Load</label>
                            </div>
                            <div class="pull-right">
                                <div class="easypiechart" id="ramusage" data-percent="20.6">
                                    <span class="percent"></span>
                                </div>
                                <label for="ramusage">RAM: 422MB</label>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- END RIGHTBAR -->
<div id="page-content">
	<div id="wrap">
		<jsp:doBody />
	</div> <!--wrap -->
</div> <!-- page-content -->

    <footer role="contentinfo">
        <div class="clearfix">
            <ul class="list-unstyled list-inline">
                <li>AVANT &copy; 2013</li>
                <!--li class="pull-right"><a href="javascript:;" id="back-to-top">Top <i class="icon-arrow-up"></i></a></li-->
                <button class="pull-right btn btn-inverse btn-xs" id="back-to-top" style="margin-top: -1px; text-transform: uppercase;"><i class="icon-arrow-up"></i></button>
            </ul>
        </div>
    </footer>

</div> <!-- page-container -->

<script type='text/javascript' src='${ctxStatic}/js/jquery-1.10.2.min.js'></script> 
<script type='text/javascript' src='${ctxStatic}/js/jqueryui-1.10.3.min.js'></script> 
<script type='text/javascript' src='${ctxStatic}/js/bootstrap.min.js'></script> 
<script type='text/javascript' src='${ctxStatic}/js/enquire.js'></script> 
<script type='text/javascript' src='${ctxStatic}/js/jquery.cookie.js'></script> 
<script type='text/javascript' src='${ctxStatic}/js/jquery.touchSwipe.min.js'></script> 
<script type='text/javascript' src='${ctxStatic}/js/jquery.nicescroll.min.js'></script> 
<script type='text/javascript' src='${ctxStatic}/plugins/codeprettifier/prettify.js'></script> 
<script type='text/javascript' src='${ctxStatic}/plugins/easypiechart/jquery.easypiechart.min.js'></script> 
<script type='text/javascript' src='${ctxStatic}/plugins/sparklines/jquery.sparklines.min.js'></script> 
<script type='text/javascript' src='${ctxStatic}/plugins/form-toggle/toggle.min.js'></script> 
<script type='text/javascript' src='${ctxStatic}/plugins/datatables/jquery.dataTables.js'></script> 
<script type='text/javascript' src='${ctxStatic}/plugins/datatables/dataTables.bootstrap.js'></script> 
<script type='text/javascript' src='${ctxStatic}/demo/demo-datatables.js'></script> 
<script type='text/javascript' src='${ctxStatic}/js/placeholdr.js'></script> 
<script type='text/javascript' src='${ctxStatic}/js/application.js'></script> 
<script type='text/javascript' src='${ctxStatic}/demo/demo.js'></script> 

<jsp:invoke fragment="pageScripts" />

</body>
</html>
