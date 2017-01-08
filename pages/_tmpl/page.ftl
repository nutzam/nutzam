<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${doc.title} - ${siteTitle}</title>
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/page.css">
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/prism.css">
</head>
<body 
tree-depth="${page.treeDepth}" 
tree-name="${page.treeName}" 
page-depth="${page.depth}">
    <#include "lib:sky.ftl">
    <div id="chute"></div>
    <div id="arena">
        <div class="doc-title">${doc.title}</div>
        <#include "lib:docinfo.ftl">
        <div class="doc-content">${doc.content}</div>
    </div>
    <#include "lib:footer.ftl">
</body>
<script language="Javascript" src="${doc.bpath}js/jquery.js"></script>
<script language="Javascript" src="${doc.bpath}js/page.js"></script>
<script language="Javascript" src="${doc.bpath}js/prism.js"></script>
</html>