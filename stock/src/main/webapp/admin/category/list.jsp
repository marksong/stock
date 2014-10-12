<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="functions"
	uri="http://com.maxfittings.stock/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/admin/template"%>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/admin/common"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="ctxStatic" value="${ctx}/static/admin" />

<template:master>
	<jsp:body>
		<div id="page-heading">
		    <ol class="breadcrumb">
		        <li><a href="index.html">Dashboad</a></li>
		        <li>Advanced Tables</li>
		        <li class="active">Data Tables</li>
		    </ol>
		
		    <h1>分类管理</h1>
		    <div class="options">
		        <div class="btn-toolbar">
		            <div class="btn-group hidden-xs">
		                <a href='#' class="btn btn-muted dropdown-toggle"
							data-toggle='dropdown'><i class="icon-cloud-download"></i><span
							class="hidden-sm"> Export as  </span><span class="caret"></span></a>
		                <ul class="dropdown-menu">
		                    <li><a href="#">Text File (*.txt)</a></li>
		                    <li><a href="#">Excel File (*.xlsx)</a></li>
		                    <li><a href="#">PDF File (*.pdf)</a></li>
		                </ul>
		            </div>
		            <a href="#" class="btn btn-muted"><i class="icon-cog"></i></a>
		        </div>
		    </div>
		</div>
		
		<div class="container">
		    <div class="row">
		      <div class="col-md-12">
		            <div class="panel panel-sky">
		                <div class="panel-heading">
		                    <h4>分类</h4>
		                    <div class="options">   
		                        <a href="javascript:;"><i class="icon-cog"></i></a>
		                        <a href="javascript:;"><i class="icon-wrench"></i></a>
		                        <a href="javascript:;" class="panel-collapse"><i class="icon-chevron-down"></i></a>
		                    </div>
		                </div>
		                <div class="panel-body collapse in">
		                    <table cellpadding="0" cellspacing="0" border="0"
								class="table table-striped table-bordered"
								id="example">
		                        <thead>
		                            <tr>
		                                <th>ID</th>
		                                <th>名称（中文）</th>
		                                <th>名称（英文）</th>
		                                <th>排序</th>
		                                <th>所属层级</th>
		                                <th></th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                        		<c:forEach items="${page.list}" var="item">
	                        			<tr class="odd gradeX">
		                               <td>${item.id}</td>
		                               <td>${item.name_zh}</td>
		                               <td>${item.name_en}</td>
	                                   <td>${item.sort_order}</td>
	                                   <td>${item.hierarchy_num}</td>
	                                   <td>
	                                   	<a href="${ctx}/admin/category/edit/${category.id}" class="btn btn-primary">编辑</a>
	                                   	<a href="${ctx}/admin/category/delete/${category.id}" class="btn btn-danger">删除</a>
	                                   </td>
	                               	</tr>
		                        		</c:forEach>
		                        </tbody>
		                    </table>
		                    <common:pagination pageUrl="${pageUrl}" page="${page}" queryString="${queryString}" />
		                </div>
		            </div>
		        </div>
		    </div>
		</div> <!-- container -->
	</jsp:body>
</template:master>

