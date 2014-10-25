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
	<jsp:attribute name="pageScripts">
		<script type="text/javascript">
			$(function() {
				if ('${param.success}' == 'true') {
					alert('导入成功！');
				} else if ('${param.success}' == 'false') {
					alert('导入失败！');
				}
			});
		</script>
	</jsp:attribute>
	<jsp:body>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h4>库存导入</h4>
						</div>
						<div class="panel-body">
							<form id="dataForm" class="form-horizontal" action="${ctx}/admin/stock/upload" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-3 control-label">库存表</label>
									<div class="col-sm-6">
										<input type="file" class="form-control" name="uploadFile" />
									</div>
								</div>
							</form>
	    					</div>
	    					<div class="panel-footer">
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3">
									<div class="btn-toolbar">
										<button class="btn-primary btn" onclick="$('#dataForm').submit();">导入</button>
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

