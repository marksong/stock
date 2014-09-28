<%@ tag body-content="empty" trimDirectiveWhitespaces="true" isELIgnored="false" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="page" required="true" type="java.util.HashMap" %>
<%@ attribute name="pageUrl" required="true" %>


<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="ctxStatic" value="${ctx}/static" />

<div class="row">
	<div class="col-xs-6">
		<div class="dataTables_info" id="example_info">
			第${(page.pageNumber - 1) * page.pageSize + 1}条到第${page.pageNumber eq page.totalPage ? page.totalRow : page.pageNumber * page.pageSize}条 共${page.totalRow}条
		</div>
	</div>
	<div class="col-xs-6">
		<div class="dataTables_paginate paging_bootstrap">
			<ol class="pagination">
				<li class="prev ${page.pageNumber eq 1 ? 'disabled' : ''}">
					<a href="${pageUrl}/1"><i class="icon-double-angle-left"></i></a>
				</li>
				<li class="prev ${page.pageNumber eq 1 ? 'disabled' : ''}">
					<a href="${pageUrl}/${page.pageNumber - 1}"><i class="icon-angle-left"></i></a>
				</li>
				<c:set var="startPage" value="1" />
				<c:set var="endPage" value="${page.totalPage}" />
				<c:if test="${page.pageNumber > 3}">
					<c:set var="startPage" value="${page.pageNumber - 2}" />
				</c:if>
				<c:if test="${page.pageNumber < page.totalPage - 2 and page.totalPage > page.pageNumber + 1}">
					<c:set var="endPage" value="${page.pageNumber + 2}" />
				</c:if>
				<c:if test="${page.pageNumber <= 3 and page.totalPage > 4}">
					<c:set var="endPage" value="5" />
				</c:if>
				<c:if test="${page.pageNumber >= page.totalPage - 2 and page.totalPage > 3}">
					<c:set var="startPage" value="${page.totalPage - 4}" />
				</c:if>
				<c:forEach begin="${startPage}" end="${endPage}" var="p">
					<li ${p eq page.pageNumber ? 'class="active"' : ''}>
						<a href="${pageUrl}/${p}">${p}</a>
					</li>
				</c:forEach>
				<li class="next ${page.pageNumber eq page.totalPage ? 'disabled' : ''}">
					<a href="${pageUrl}/${page.pageNumber + 1}"><i class="icon-angle-right"></i></a>
				</li>
				<li class="next ${page.pageNumber eq page.totalPage ? 'disabled' : ''}">
  					<a href="${pageUrl}/${page.totalPage}"><i class="icon-double-angle-right"></i></a>
				</li>
 			</ol>
		</div>
	</div>
</div>