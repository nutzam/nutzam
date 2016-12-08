(function($){
$(document).ready(function(){
    var treeDepth = $(document.body).attr('tree-depth')*1;
    var pageDepth = $(document.body).attr('page-depth')*1;
    var treeName  = $(document.body).attr('tree-name');
    var rpath = '';
    for(var i=0;i<(pageDepth-treeDepth-1);i++){
        rpath += '../';
    }
    $('#chute').load(rpath + treeName, function(){
        // 调整显示区域高度
        var h0 = $(this).height();
        var h1 = $('#arena').height();
        if(h0>h1)
            $('#arena').height(h0);
        else
            $(this).height(h1);

        // 修改 page title
        $('#sky .title').text($('#siteIndex', this).attr('tree-title'));
        
        // 修改 tree.html 的链接并高亮 tree.html 的项目
        var pageHref = window.location.href;
        $('a', this).each(function(){
            if(rpath)
                $(this).attr('href', rpath + $(this).attr('href'));
            if(this.href == pageHref){
                $(this).addClass("current");
            }
        });
    }).delegate('.zdoc-index-node b','click',function(){
        $(this).parent().toggleClass('hidesub');
    });
	//============================================
	  var $backtotop = $('#backtotop');
	  var top = 200;

	  function moveBacktotop() {
	    $backtotop.css({ top: top, right: 0});
	  }

	  $backtotop.click(function () {
	    $('html,body').animate({ scrollTop: 0 });
	    return false;
	  });
	  $(window).scroll(function () {
	    var windowHeight = $(window).scrollTop();
	    if (windowHeight > 200) {
	      $backtotop.fadeIn();
	    } else {
	      $backtotop.fadeOut();
	    }
	  });

	  moveBacktotop();
	  $(window).resize(moveBacktotop);
	//============================================
});
})(window.jQuery);