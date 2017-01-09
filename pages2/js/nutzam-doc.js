$(document).ready(function () {
    var $sidetreeW = $('.doc-sidetree');
    var $sidetree = $('.doc-sidetree-inner');
    var $body = $(document.body);

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

    $('.doc-btn.toggle-sidetree').on('click', function () {
        console.log('toogle sidetree');
        $body.toggleClass('show-sidetree');
    });

    $body.delegate(".doc-content", 'click', function () {
        if ($body.hasClass('show-sidetree')) {
            $body.toggleClass('show-sidetree');
        }
    });
    $body.delegate(".doc-info", 'click', function () {
        if ($body.hasClass('show-sidetree')) {
            $body.toggleClass('show-sidetree');
        }
    });
    $body.delegate(".doc-title", 'click', function () {
        if ($body.hasClass('show-sidetree')) {
            $body.toggleClass('show-sidetree');
        }
    });

    function viewHeight() {
        var height = window.innerHeight
            || document.documentElement.clientHeight
            || document.body.clientHeight;
        console.log(height);
        return height;
    }

    function modifySidetreeHeight() {
        var vh = viewHeight();
        $sidetreeW.css('height', vh - 58);
    }

    // modifySidetreeHeight();

    // 动态修正sidebar宽高
    // window.onresize = function () {
    //     modifySidetreeHeight();
    // };
});