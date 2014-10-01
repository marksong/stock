<%@ tag body-content="empty" trimDirectiveWhitespaces="true" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="page" required="true" type="java.util.HashMap" %>
<%@ attribute name="pageUrl" required="true" %>


<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="ctxStatic" value="${ctx}/static/admin" />
<c:set var="pageUrl" value="${ctx}${pageUrl}" />

<div class="row">
	<div class="col-xs-6">
		<div class="dataTables_info" id="example_info">
			第${(page.pageNumber - 1) * page.pageSize + 1}条到第${page.pageNumber eq page.totalPage ? page.totalRow : page.pageNumber * page.pageSize}条 共${page.totalRow}条
		</div>
	</div>
	<div class="col-xs-6">
		<div class="dataTables_paginate paging_bootstrap">
			<ol class="pagination">
				<c:set var="hasPrevious" value="${not (page.pageNumber eq 1)}" />
				<c:choose>
					<c:when test="${hasPrevious}">
						<c:set var="firstPageHref" value="1" />
						<c:set var="previousPageHref" value="${page.pageNumber - 1}" />
					</c:when>
					<c:otherwise>
						<c:set var="firstPageHref" value="javascript:void(0);" />
						<c:set var="previousPageHref" value="javascript:void(0);" />
					</c:otherwise>
				</c:choose>
				<c:set var="hasNext" value="${not (page.pageNumber eq page.totalPage)}" />
				<c:choose>
					<c:when test="${hasNext}">
						<c:set var="nextPageHref" value="${page.pageNumber + 1}" />
						<c:set var="lastPageHref" value="${page.totalPage}" />
					</c:when>
					<c:otherwise>
						<c:set var="nextPageHref" value="javascript:void(0);" />
						<c:set var="lastPageHref" value="javascript:void(0);" />
					</c:otherwise>
				</c:choose>
				<li class="prev ${hasPrevious ? '' : 'disabled'}">
					<a href="${firstPageHref}"><i class="icon-double-angle-left"></i></a>
				</li>
				<li class="prev ${hasPrevious ? '' : 'disabled'}">
					<a href="${previousPageHref}"><i class="icon-angle-left"></i></a>
				</li>
				<c:set var="startPage" value="${page.pageNumber - 2}" />
				<c:set var="endPage" value="${page.pageNumber + 2}" />
				<c:if test="${startPage < 1}">
					<c:set var="startPage" value="1" />
					<c:set var="endPage" value="${page.totalPage}" />
					<c:if test="${endPage - startPage > 4}">
						<c:set var="endPage" value="${startPage + 4}" />
					</c:if>
				</c:if>
				<c:if test="${endPage > page.totalPage}">
					<c:set var="endPage" value="${page.totalPage}" />
					<c:set var="startPage" value="1" />
					<c:if test="${endPage - startPage > 4}">
						<c:set var="startPage" value="${endPage - 4}" />
					</c:if>
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" var="p">
					<li ${p eq page.pageNumber ? 'class="active"' : ''}>
						<a href="${pageUrl}/${p}">${p}</a>
					</li>
				</c:forEach>
				<li class="next ${hasNext ? '' : 'disabled'}">
					<a href="${nextPageHref}"><i class="icon-angle-right"></i></a>
				</li>
				<li class="next ${hasNext ? '' : 'disabled'}">
  					<a href="${lastPageHref}"><i class="icon-double-angle-right"></i></a>
				</li>
 			</ol>
		</div>
	</div>
</div>