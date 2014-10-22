<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="functions"
	uri="http://com.maxfittings.stock/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="template" tagdir="/WEB-INF/tags/admin/template"%>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/admin/common"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="ctxStatic" value="${ctx}/static" />

<template:master>
	<jsp:body>
		<c:choose>
			<c:when test="${pageType eq 'create'}">
				<c:set var="pageAction" value="${ctx}/admin/category/createSubmit" />
			</c:when>
			<c:when test="${pageType eq 'edit'}">
				<c:set var="pageAction" value="${ctx}/admin/category/editSubmit" />
			</c:when>
		</c:choose>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4>分类编辑</h4>
						</div>
						<div class="panel-body">
							<form id="dataForm" class="form-horizontal" action="${pageAction}" method="post">
								<c:if test="${pageType eq 'edit'}">
									<div class="form-group">	
										<label for="disabledinput" class="col-sm-3 control-label">ID</label>
										<div class="col-sm-6">
											<input disabled="disabled" type="text" class="form-control" value="${item.id}" />
											<input type="hidden" name="item.id" value="${item.id}" />
										</div>
									</div>
								</c:if>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-3 control-label">名称（中文）</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" name="item.name_zh" value="${item.name_zh}" />
									</div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-3 control-label">名称（英文）</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" name="item.name_en" value="${item.name_en}" />
									</div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-3 control-label">排序</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" name="item.sort_order" value="${item.sort_order}" />
									</div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-3 control-label">所属层级</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" name="item.hierarchy_num" value="${item.hierarchy_num}" />
									</div>
								</div>
							</form>
	    					</div>
	    					<div class="panel-footer">
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3">
									<div class="btn-toolbar">
										<button class="btn-primary btn" onclick="$('#dataForm').submit();">提交</button>
										<button class="btn-default btn" onclick="history.back();">取消</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- container -->
	</jsp:body>
</template:master>

