<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${page.title} - ${siteTitle}</title>
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
