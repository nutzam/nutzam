$(document).ready(function () {
    var $sidetree = $('.doc-sidetree');
    var $sidetreeInner = $('.doc-sidetree-inner');
    var $sidetreeC = $('.doc-sidetree-content');
    var $sidetreeS = $('.doc-sidetree-searchbar');
    var $sidetreeSInput = $('.doc-sidetree-searchbar input');
    var $body = $(document.body);


    // 搜索过滤功能
    $sidetreeSInput.on('keyup', function () {
        var sk = $sidetreeSInput.val();
        console.log("skey: [" + sk + "]");
        var skt = sk.trim().toLowerCase();

        // 如果不为空，添加清楚按钮
        $sidetreeInner.addClass('no-match');
        if (sk != '') {
            $sidetreeInner.addClass('with-search');
        } else {
            $sidetreeInner.removeClass('with-search');
            $sidetreeC.find('.zdoc-index-node').removeClass('nm-skey');
            $sidetreeC.find('.doc-index-item').removeClass('nm-skey');
        }

        var findMatch = false;

        // 过滤信息
        $sidetreeC.find('.zdoc-index-node').addClass('nm-skey');
        $sidetreeC.find('.doc-index-item').addClass('nm-skey');

        // 依次判断
        $sidetreeC.find('.zdoc-index-node').each(function (i, ele) {
            var $znode = $(ele);
            if ($znode.attr('skey').indexOf(skt) != -1) {
                $znode.removeClass('nm-skey');
                findMatch = true;
            } else {
                $znode.addClass('nm-skey');
            }
        });
        $sidetreeC.find('.doc-index-item').each(function (i, ele) {
            var $znode = $(ele);
            if ($znode.attr('skey').indexOf(skt) != -1) {
                $znode.removeClass('nm-skey');
                findMatch = true;
                // 查找父亲节点
                var $pnode = $znode.parent();
                while (!$pnode.hasClass('zdoc-index-container')) {
                    $pnode.removeClass('nm-skey');
                    $pnode = $pnode.parent();
                }
            } else {
                $znode.addClass('nm-skey');
            }
        });

        if (findMatch) {
            $sidetreeInner.removeClass('no-match');
        }
    });

    $sidetreeS.find('i').on('click', function () {
        $sidetreeInner.removeClass('with-search');
        $sidetreeInner.removeClass('no-match ');
        $sidetreeC.find('.zdoc-index-node').removeClass('nm-skey');
        $sidetreeC.find('.doc-index-item').removeClass('nm-skey');
        $sidetreeSInput.val('');
    });

    // 左侧滚动栏限制页面整体滚动
    $sidetree.scrollUnique();

    // 页内跳转数据
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

    // 页内跳转事件
    $sidetreeInner.delegate('a.doc-at', 'click', function (e) {
        e.stopPropagation();
        $body.removeClass('show-sidetree');
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

    $sidetreeC.load(rpath + treeName, function () {
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
                    setTimeout(function () {
                        $sidetreeInner.find('.doc-at[at=' + docAt + ']').click();
                    }, 10);
                }
            }
        });

        // 处理节点，添加过滤用信息
        $sidetreeInner.find('.zdoc-index-node').each(function (i, ele) {
            var $znode = $(ele);
            var znm = $znode.children('b').text();
            console.log('znm:' + znm);
            $znode.attr("skey", znm.toLowerCase());
        });

        $sidetreeInner.find('.doc-index-item').each(function (i, ele) {
            var $znode = $(ele);
            var znm = $znode.children('a').text();
            console.log('dnm:' + znm);
            $znode.attr("skey", znm.toLowerCase());
        });

        // 加载底部导航
        var $nleft = $('.doc-nav-left');
        var $nright = $('.doc-nav-right');
        var $ca = $sidetreeInner.find('a.current');
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

    $('body').scrollspy({target: '#pagedoc-nav'});

    $('.doc-btn.toggle-sidetree').on('click', function (e) {
        e.stopPropagation();
        $body.toggleClass('show-sidetree');
    });

    $body.delegate(".doc-page", 'click', function (e) {
        e.stopPropagation();
        if ($body.hasClass('show-sidetree')) {
            $body.toggleClass('show-sidetree');
        }
    });
});