<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${doc.title} - ${siteTitle}</title>
    <script language="Javascript" src="${doc.bpath}js/jquery.js"></script>
    <script language="Javascript" src="${doc.bpath}js/home.js"></script>
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/home.css">
</head>
<body 
tree-depth="${page.treeDepth}" 
tree-name="${page.treeName}" 
page-depth="${page.depth}">
<#include "lib:sky.ftl">
${doc.content}
<#include "lib:footer.ftl">
</body>
</html>