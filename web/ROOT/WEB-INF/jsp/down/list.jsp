<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<%@ taglib prefix="fn" uri="/WEB-INF/tld/fn.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/tld/fmt.tld"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
    <title>${msg['site.title']} - ${msg['page.title.down']}</title>
    <script language="Javascript" src="${rs}/js/jquery.js"></script>
    <script language="Javascript" src="${rs}/js/down.js"></script>
    <link rel="stylesheet" type="text/css" href="${rs}/css/down.css">
</head>
<body>
<%@include file="/WEB-INF/jsp/_sky.jsp" %>
<div id="arena">
	<h2>${msg['page.title.down']}</h2>
	<c:forEach var="di" items="${obj}">
		<div class="di">
			<div class="di-nm">
				<a href="${base}/down/get/${di.finger}">${di.name}</a>
				<span class="di-sz">${di.sizeForRead}</span>
				<span class="di-ct">
				<fmt:formatDate value="${di.createTime}" pattern="yyyy-MM-dd HH:mm"/>
				</span>
			</div>
			<div class="di-c">
				<b>${msg['di.c']}:</b>
				<em>${di.count}</em>
			</div>
			<div class="di-comm">
				${di.comment}
			</div>
			<div class="di-fg">
				<b>${msg['di.fg']}:</b>
				<em>${di.finger}</em>
			</div>
			<div class="di-do">
				<a href="${base}/down/get/${di.finger}">${msg['di.do.download']}</a>
			</div>
		</div>
	</c:forEach>
	
</div>
<%@include file="/WEB-INF/jsp/_footer.jsp" %>
</body>
</html>