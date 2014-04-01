<html>
<head>
    <meta charset="UTF-8">
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8">
    <title>${page.title} - ${siteTitle}</title>
    <link rel="stylesheet" type="text/css" href="../css/tags.css">
    <script language="javascript" src="../js/jquery.js"></script>
    <script language="javascript" src="../js/tags.js"></script>
</head>
<body>
<#include "lib:sky.ftl">
<div id="arena">
    <#list tag.items as doc>
    <div class="tag-content">
        <div class="doc-title">
            《<a href="${page.bpath}${doc.rTargetPath}">${doc.title}</a>》
        </div>
        <#include "lib:docinfo.ftl">
        <div class="doc-content">${doc.briefHtml}</div>
        <a class="tag-action" href="${page.bpath}${doc.rTargetPath}">阅读全文&gt;&gt;</a>
    </div>
    </#list>
</div>
<#include "lib:footer.ftl">
</body>
</html>
