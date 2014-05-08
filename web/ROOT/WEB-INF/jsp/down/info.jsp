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
<div id="arena" class="dinfo">
	<h3>
		<a href="../list">${msg['page.title.down']}</a>
		&gt; <b>${obj.name}</b>
	</h3>
	<c:if test="${di.comment}">
	<div class="di-comm">${di.comment}</div>
	</c:if>
	<table cellspacing="0" cellpadding="0" border="0">
		<tr><td class="fldnm">${msg['di.fg']}:</td><td class="fldval">${obj.finger}</td></tr>
		<tr><td class="fldnm">${msg['di.sz']}:</td><td class="fldval">${obj.sizeForRead}</td></tr>
		<tr><td class="fldnm">${msg['di.ct']}:</td><td class="fldval"><fmt:formatDate value="${obj.createTime}" pattern="yyyy-MM-dd HH:mm"/></td></tr>
		<tr><td class="fldnm">${msg['di.c']}:</td><td class="fldval">${obj.count}</td></tr>
	</table>
	<a class="down-btn" href="${base}/down/read/${obj.finger}">${msg['di.do.download']}</a>
</div>
<%@include file="/WEB-INF/jsp/_footer.jsp" %>
</body>
</html>