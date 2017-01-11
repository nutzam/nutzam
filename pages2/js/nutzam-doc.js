$(document).ready(function () {
    var $sidetreeW = $('.doc-sidetree');
    var $sidetree = $('.doc-sidetree-inner');
    var $body = $(document.body);


    // 加载左边侧边栏

    var treeDepth = $body.attr('tree-depth') * 1;
    var pageDepth = $body.attr('page-depth') * 1;
    var treeName = $body.attr('tree-name');
    var rpath = '';
    for (var i = 0; i < (pageDepth - treeDepth - 1); i++) {
        rpath += '../';
    }

    $sidetree.load(rpath + treeName, function () {
        $('.zdoc-index-node').addClass("hidesub");
        // 修改 tree.html 的链接并高亮 tree.html 的项目
        var pageHref = window.location.href;
        $('a', this).each(function () {
            if (rpath)
                $(this).attr('href', rpath + $(this).attr('href'));
            if (this.href == pageHref) {
                $(this).addClass("current");
                $(this).parents(".zdoc-index-node").removeClass("hidesub");
            }
        });
    }).delegate('.zdoc-index-node b', 'click', function () {
        $(this).parent().toggleClass('hidesub');
    });


    // 加载右边侧边栏
    var docnav = [];
    var docIndex = 1;
    $('.doc-content h1').each(function () {
        var $h = $(this);
        var nm = $h.find('a').attr('name');
        nm = nm.replace("_", " ");
        var nobj = {
            index: 'ndoc-' + docIndex++,
            name: nm
        };
        docnav.push(nobj);
        $h.attr('id', nobj.index);
    });

    var docnavHtml = '';
    docnavHtml += '<nav class="nav flex-column" role="tablist">';
    for (var i = 0; i < docnav.length; i++) {
        var obj = docnav[i];
        docnavHtml += '<a class="nav-link" href="#' + obj.index + '">' + obj.name + '</a>';
    }
    docnavHtml += '</nav>';
    $('.doc-doctree-inner').html(docnavHtml).delegate('a', 'click', function (e) {
        e.stopPropagation();
        $body.removeClass('show-doctree');
        // 手动下移
        setTimeout(function () {
            var cst = $('body').scrollTop();
            $('body').scrollTop(cst - 58);
        }, 1);
    });

    $('body').scrollspy({target: '#pagedoc-nav'});

    // 两边侧栏
    $('.doc-btn.toggle-sidetree').on('click', function (e) {
        e.stopPropagation();
        $body.toggleClass('show-sidetree');
    });

    $('.doc-btn.toggle-doctree').on('click', function (e) {
        e.stopPropagation();
        $body.toggleClass('show-doctree');
    });

    $body.delegate(".doc-page", 'click', function (e) {
        e.stopPropagation();
        if ($body.hasClass('show-sidetree')) {
            $body.toggleClass('show-sidetree');
        }
        if ($body.hasClass('show-doctree')) {
            $body.toggleClass('show-doctree');
        }
    });

    // function viewHeight() {
    //     var height = window.innerHeight
    //         || document.documentElement.clientHeight
    //         || document.body.clientHeight;
    //     console.log(height);
    //     return height;
    // }
    //
    // function modifySidetreeHeight() {
    //     var vh = viewHeight();
    //     $sidetreeW.css('height', vh - 58);
    // }

    // modifySidetreeHeight();

    // 动态修正sidebar宽高
    // window.onresize = function () {
    //     modifySidetreeHeight();
    // };
});