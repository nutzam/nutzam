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
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/nutz-bootstrap_dark.css">
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/prism.css">
    <script src="${doc.bpath}js/jquery.min.js"></script>
    <script src="${doc.bpath}js/jquery.toTop.min.js"></script>
</head>
<body tree-depth="${page.treeDepth}"
      tree-name="${page.treeName}"
      page-depth="${page.depth}" data-spy="scroll" data-target="#pagedoc-nav">
<div class="body-header"></div>
<div class="body-inner">
    <#include "lib:sky.ftl">
        <div class="container doc-container">
            <div class="doc-sidetree">
                <div class="doc-sidetree-inner"></div>
            </div>
            <div class="doc-doctree">
                <div class="doc-doctree-inner" id="pagedoc-nav"></div>
            </div>
            <div class="doc-page">
                <div class="doc-menu">
                    <div class="doc-btn toggle-sidetree"><i class="fa fa-align-left fa-lg"></i></div>
                    <div class="doc-btn right toggle-doctree"><i class="fa fa-align-right fa-lg"></i></div>
                </div>
                <div class="doc-title">${doc.title}</div>
                <#include "lib:docinfo.ftl">
                    <div class="doc-content">${doc.content}</div>
            </div>
        </div>
        <#include "lib:footer.ftl">
            <script src="${doc.bpath}js/tether.min.js"></script>
            <script src="${doc.bpath}js/bootstrap.min.js"></script>
            <script src="${doc.bpath}js/prism.js"></script>
            <script src="${doc.bpath}js/nutzam-doc.js"></script>
</div>
</body>
</html>