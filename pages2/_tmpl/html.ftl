<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${doc.title} - ${siteTitle}</title>
	<meta name="Keywords" content="Nutz,Nutz是什么,Nutz下载,Nutz社区, Java框架,JavaWeb,Aop,ORM,Dubbo,JDK8, JavaEE,tomcat,jetty"/>
  
    <meta name="Description" content="它是开源的，商用也是完全免费的。详尽的文档，众多线上项目 不吹嘘概念,代码严谨可靠，近千个testcase,坚如磐石。"/>
    <script src="${doc.bpath}js/jquery.min.js"></script>
    <script src="${doc.bpath}js/js.cookie.min.js"></script>
    <#include "lib:theme.ftl">
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/balloon.min.css">
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/bootstrap-switch.min.css">
    <script src="${doc.bpath}js/jquery.toTop.min.js"></script>
</head>
<body tree-depth="${page.treeDepth}"
      tree-name="${page.treeName}"
      page-depth="${page.depth}">
<div class="body-header"></div>
<div class="body-inner">
    <#include "lib:sky.ftl">
    ${doc.content}
    <#include "lib:footer.ftl">
    <script src="${doc.bpath}js/tether.min.js"></script>
    <script src="${doc.bpath}js/bootstrap.min.js"></script>
    <script src="${doc.bpath}js/bootstrap-switch.min.js"></script>
</div>
</body>
</html>