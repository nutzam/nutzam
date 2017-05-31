<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${doc.title} - ${siteTitle}</title>
    <script src="${doc.bpath}js/jquery.min.js"></script>
    <script src="${doc.bpath}js/js.cookie.min.js"></script>
    <#include "lib:theme.ftl">
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/balloon.min.css">
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/bootstrap-switch.min.css">
    <link rel="stylesheet" type="text/css" href="${doc.bpath}css/prism.css">
    <script src="${doc.bpath}js/jquery.toTop.min.js"></script>
    <script src="${doc.bpath}js/jquery.scrollUnique.js"></script>
</head>
<body tree-depth="${page.treeDepth}"
      tree-name="${page.treeName}"
      page-depth="${page.depth}" data-spy="scroll" data-target="#pagedoc-nav">
<div class="body-header"></div>
<div class="body-inner">
    <#include "lib:sky.ftl">
    <div class="doc-sidetree">
        <div class="doc-sidetree-inner">
            <div class="doc-sidetree-searchbar">
                <input type="text" class="form-control" placeholder="输入关键字进行检索">
                <i class="fa fa-fw fa-remove"></i>
            </div>
            <div class="doc-nomatch">无匹配结果，请重新输入</div>
            <div class="doc-sidetree-content"></div>
        </div>
    </div>
    <div class="doc-container">
        <div class="doc-page">
            <div class="doc-menu">
                <div class="doc-btn toggle-sidetree"><i class="fa fa-align-left fa-lg"></i></div>
            </div>
            <div class="doc-title">${doc.title}</div>
            <#include "lib:docinfo.ftl">
            <div class="doc-content">${doc.content}</div>
                <div class="doc-wiki">
                    <p>本页面的文字允许在<a class="external text" href="http://zh.wikipedia.org/wiki/Wikipedia:CC-BY-SA-3.0协议文本">知识共享 署名-相同方式共享 3.0协议</a>和<a class="external text" href="http://zh.wikipedia.org/wiki/Wikipedia:GNU自由文档许可证文本">GNU自由文档许可证</a>下修改和再使用。</p>
                </div>
        </div>
        <div class="doc-nav">
            <div class="doc-nav-btn doc-nav-left "><i class="fa fa-arrow-left"></i><span></span></div>
            <div class="doc-nav-btn doc-nav-right"><span></span><i class="fa fa-arrow-right"></i></div>
        </div>
    </div>
</div>
<script src="${doc.bpath}js/tether.min.js"></script>
<script src="${doc.bpath}js/bootstrap.min.js"></script>
<script src="${doc.bpath}js/bootstrap-switch.min.js"></script>
<script src="${doc.bpath}js/prism.js"></script>
<script src="${doc.bpath}js/nutzam-doc.js"></script>
</body>
</html>