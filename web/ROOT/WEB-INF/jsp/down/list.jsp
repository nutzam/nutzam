<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<%@ taglib prefix="fn" uri="/WEB-INF/tld/fn.tld"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/tld/fmt.tld"%>
<%@ taglib prefix="z" uri="/WEB-INF/tld/z.tld"%>
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
<div id="arena" class="dlist">
	<h3>${msg['page.title.down']}</h3>
	
	<table cellspacing="1" cellpadding="0" border="0" width="100%">
	<thead>
		<tr>
			<th colspan="5" class="dlist-sz">
				<z:msg key="di.sum">{n:${fn:length(obj)}}</z:msg>
			</th>
		</tr>
		<tr class="dlist-col-titles">
			<th width="2%">&nbsp;</th>
			<th width="68%">${msg['di.nm']}</th>
			<th width="10%">${msg['di.ct']}</th>
			<th width="10%">${msg['di.sz']}</th>
			<th width="10%">${msg['di.c']}</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="di" items="${obj}">
		<tr>
			<td class="di-down">
				<a href="${base}/down/read/${di.finger}"
				   title="${msg['di.down.tip']}">&nbsp;</a>
			</td>
			<td class="di-nm">
				<a href="${base}/down/get/${di.finger}">${di.name}</a>
				<em>${di.comment}</em>
			</td>
			<td class="di-ct">${di.createTimeForRead}</td>
			<td class="di-sz">${di.sizeForRead}</td>
			<td class="di-c">${di.count}</td>
		</tr>
	</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<th colspan="5" class="dlist-sz">
				<z:msg key="di.sum">{n:${fn:length(obj)}}</z:msg>
			</th>
		</tr>
	</tfoot>
	</table>
	
</div>
<%@include file="/WEB-INF/jsp/_footer.jsp" %>
</body>
</html>