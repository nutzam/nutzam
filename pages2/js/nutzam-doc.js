$(document).ready(function () {
    var $sidetreeW = $('.doc-sidetree');
    var $sidetree = $('.doc-sidetree-inner');
    var $body = $(document.body);

    // 加载右边侧边栏
    var docnav = [];
    var docIndex = 1;
    $('.doc-content h1').each(function () {
        var $h = $(this);
        var nm = $h.find('a').attr('name');
        // nm = nm.replace("_", " ");
        nm = nm.replace(/_/g, " ");
        var nobj = {
            index: 'ndoc-' + docIndex++,
            name: nm
        };
        docnav.push(nobj);
        $h.attr('id', nobj.index);
    });


    $sidetree.delegate('a.doc-at', 'click', function (e) {
        e.stopPropagation();
        $body.removeClass('show-doctree');
        // 手动下移
        setTimeout(function () {
            var cst = $('body').scrollTop();
            $('body').scrollTop(cst - 58 - 16);
        }, 10);
        return true;
    });

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
        var docAt = '';

        // 去掉#与后面的内容
        if (pageHref.indexOf('#') != -1) {
            docAt = pageHref.substr(pageHref.indexOf('#') + 1, pageHref.length - 1);
            pageHref = pageHref.substr(0, pageHref.indexOf('#'));
        }

        console.log("pageHref: " + pageHref);
        console.log("pageDoc@: " + docAt);

        $('a', this).each(function () {
            if (rpath)
                $(this).attr('href', rpath + $(this).attr('href'));
            if (this.href == pageHref) {
                var cnode = $(this);
                var cnm = cnode.text();
                cnode.parents(".zdoc-index-node").removeClass("hidesub");
                var cp = cnode.parent();

                // 替换当前节点，展开字节点
                var docnavHtml = '';
                docnavHtml += '<li class="zdoc-index-node current">';
                docnavHtml += '<b>' + cnm + '</b>';
                docnavHtml += '<ol class="zdoc-index-wrapper">';
                for (var i = 0; i < docnav.length; i++) {
                    var obj = docnav[i];
                    docnavHtml += '<li class="doc-index-item doc-at-item">';
                    docnavHtml += ' <a class="doc-at" at="' + obj.index + '" href="#' + obj.index + '">' + obj.name + '</a>';
                    docnavHtml += '</li>';
                }
                docnavHtml += '</ol>';
                docnavHtml += '</li>';

                cp.replaceWith(docnavHtml);

                // 點擊觸發
                if (docAt != '') {
                    ssetTimeout(function () {
                        $sidetree.find('.doc-at[at=' + docAt + ']').click();
                    }, 10);
                }
            }
        });

        // 加载底部导航
        var $nleft = $('.doc-nav-left');
        var $nright = $('.doc-nav-right');
        var $ca = $sidetree.find('a.current');
        var $cli = $ca.parent();

        // nav-prev
        var $preva = null;
        var $prevli = $cli.prev();
        if ($prevli == null || $prevli.length == 0) {
            var $prevnode = $cli.parent().parent(); // li.zdoc-index-node
            if ($prevnode.hasClass('zdoc-index-node')) {
                var $prevnode = $prevnode.prev();
                if ($prevnode != null && $prevnode.length > 0) {
                    $prevli = $prevnode.find('ol li:last-child');
                }
            }
        }
        $preva = $prevli.find('a');
        if ($preva != null && $preva.length > 0) {
            $nleft.find('span').text($preva.text());
            $nleft.on('click', function () {
                $preva.append('<span></span>');
                $preva.find('span').click();
            });
        } else {
            $nleft.remove();
        }

        // nav-next
        var $nexta = null;
        var $nextli = $cli.next();
        if ($nextli == null || $nextli.length == 0) {
            var $nextnode = $cli.parent().parent(); // li.zdoc-index-node
            if ($nextnode.hasClass('zdoc-index-node')) {
                var $nextnode = $nextnode.next();
                if ($nextnode != null && $nextnode.length > 0) {
                    $nextli = $nextnode.find('ol li:first-child');
                }
            }
        }
        $nexta = $nextli.find('a');
        if ($nexta != null && $nexta.length > 0) {
            $nright.find('span').text($nexta.text());
            $nright.on('click', function () {
                $nexta.append('<span></span>');
                $nexta.find('span').click();
            });
        } else {
            $nright.remove();
        }

    }).delegate('.zdoc-index-node b', 'click', function () {
        $(this).parent().toggleClass('hidesub');
    });


    // $('body').scrollspy({target: '#pagedoc-nav'});

    // 两边侧栏
    $('.doc-btn.toggle-sidetree').on('click', function (e) {
        e.stopPropagation();
        $body.toggleClass('show-sidetree');
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

});