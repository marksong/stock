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
				<c:set var="pageAction" value="${ctx}/admin/user/createSubmit" />
			</c:when>
			<c:when test="${pageType eq 'edit'}">
				<c:set var="pageAction" value="${ctx}/admin/user/editSubmit" />
			</c:when>
		</c:choose>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4>用户编辑</h4>
						</div>
						<div class="panel-body">
							<form id="dataForm" class="form-horizontal" action="${pageAction}" method="post">
								<c:if test="${pageType eq 'edit'}">
									<div class="form-group">	
										<label for="disabledinput" class="col-sm-3 control-label">ID</label>
										<div class="col-sm-6">
											<input disabled="disabled" type="text" class="form-control" value="${user.id}" />
											<input type="hidden" name="user.id" value="${user.id}" />
										</div>
									</div>
								</c:if>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-3 control-label">公司</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" name="user.company" value="${user.company}" />
									</div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-3 control-label">姓名</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" name="user.name" value="${user.name}" />
									</div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-3 control-label">手机号</label>
									<div class="col-sm-6">
										<input type="text" class="form-control mask" name="user.phone" value="${user.phone}" />
									</div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-3 control-label">邮箱</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" name="user.email" value="${user.email}" />
									</div>
								</div>
								<div class="form-group">
									<label for="focusedinput" class="col-sm-3 control-label">地址</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" name="user.address" value="${user.address}" />
									</div>
								</div>
							</form>
	    					</div>
	    					<div class="panel-footer">
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3">
									<div class="btn-toolbar">
										<button class="btn-primary btn" onclick="$('#dataForm').submit();">提交</button>
										<button class="btn-default btn" onclick="location.href='${ctx}/admin/user'">取消</button>
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

