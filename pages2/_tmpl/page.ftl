<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${doc.title} - ${siteTitle}</title>
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