<html>
<head>
    <meta charset="UTF-8">
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
    <title>${doc.title} - ${siteTitle}</title>
    <script language="Javascript" src="${doc.bpath}js/jquery.js"></script>
    <script language="Javascript" src="${doc.bpath}js/page.js"></script>
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/page.css">
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
</html>