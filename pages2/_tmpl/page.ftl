<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${doc.title} - ${siteTitle}</title>
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/balloon.min.css">
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/nutz-bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/prism.css">
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/nutzam.css">
    <script src="${doc.bpath}js/jquery.min.js"></script>
    <script src="${doc.bpath}js/jquery.toTop.min.js"></script>
</head>
<body tree-depth="${page.treeDepth}"
      tree-name="${page.treeName}"
      page-depth="${page.depth}">
<#include "lib:sky.ftl">
<!--<div class="doc-sidetree">-->
    <!--<div class="doc-sidetree-inner"></div>-->
<!--</div>-->
<div class="container doc-container">
    <div class="doc-sidetree">
        <div class="doc-sidetree-inner"></div>
    </div>
    <div class="row doc-menu">
        <div class="doc-btn toggle-sidetree"><i class="fa fa-list-ul fa-lg"></i></div>
    </div>
    <div class="doc-title">${doc.title}</div>
    <#include "lib:docinfo.ftl">
    <div class="doc-content">${doc.content}</div>
</div>
<#include "lib:footer.ftl">
<script src="${doc.bpath}js/tether.min.js"></script>
<script src="${doc.bpath}js/bootstrap.min.js"></script>
<script src="${doc.bpath}js/prism.js"></script>
<script src="${doc.bpath}js/nutzam-doc.js"></script>
</body>
</html>