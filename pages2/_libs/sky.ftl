<div class="fixed-top navbar-container">
    <nav class="container navbar navbar-toggleable-md navbar-light">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="#">
            <div class="brand-logo">
                <div class="logo-tail"></div>
                <img src="${doc.bpath}imgs/nutz_logo28.png" class="brand-img" alt="">
            </div>
            <span class="brand-text">Nutz</span>
        </a>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${page.bpath}index.html">首页</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="http://example.com" id="nutz-project"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        项目
                    </a>
                    <div class="dropdown-menu" aria-labelledby="nutz-project">
                        <a class="dropdown-item" href="https://github.com/nutzam/nutz">Nutz(核心包)</a>
                        <a class="dropdown-item" href="https://github.com/nutzam/nutzboot">NutzBoot(微服务)</a>
                        <a class="dropdown-item" href="https://github.com/nutzam/nutzmore">NutzMore(插件与扩展)</a>
                        <a class="dropdown-item" href="https://github.com/nutzam/nutzwx">NutzWX(微信公众号操作封装库)</a>
                        <a class="dropdown-item" href="https://github.com/pangwu86/nutz-logo">NutzLogo(跳蛋版实现)</a>
                        <a class="dropdown-item" href="https://nutz.cn/yvr/t/tdb5l3e7pajv1ptl1f0nveg1bk">Demo(社区提供)</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="http://example.com" id="nutz-doc"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        文档
                    </a>
                    <div class="dropdown-menu" aria-labelledby="nutz-doc">
                        <a class="dropdown-item" href="${page.bpath}core/nutz_preface.html">Nutz使用手册(核心包)</a>
                        <a class="dropdown-item" href="${page.bpath}javadoc/">NutzAPI文档(核心包)</a>
                        <a class="dropdown-item" href="http://nutzbook.wendal.net/">进阶手册(Wendal出品，偏实战)</a>
                        <a class="dropdown-item" href="${page.bpath}zdoc/syntax.html">zDoc使用手册</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://nutz.cn/nutzdw/">下载</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://nutz.cn">社区</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="https://plugins.jetbrains.com/plugin/10311-nutzcodeinsight ">IDEA插件</a>
                </li>
            </ul>
            <div class="form-inline my-2 my-lg-0">
                <div class="switch switch-small my-2 my-sm-0">
                    <input type="checkbox" name="nutz-theme-switch" checked/>
                </div>
            </div>
        </div>
    </nav>
</div>
<div class="to-top">Top &uarr;</div>
<script>
    $(document).ready(function () {
        // 切换主题
        var $switch = $("[name='nutz-theme-switch']");
        $switch.attr('checked', getThemeCSSName() == "light" ? 'checked' : null);
        $switch.bootstrapSwitch({
            onText: "Light",
            offText: "Dark",
            onSwitchChange: function (event, state) {
                useDarkTheme(!state);
            }
        });

        // 返回顶部
        $('.to-top').toTop({
            autohide: true,
            offset: 420,
            speed: 500,
            position: true,
            right: 15,
            bottom: 25
        });
    });
</script>
