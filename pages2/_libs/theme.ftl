<!--<link rel="stylesheet" type="text/css" href="${doc.bpath}css/nutz-bootstrap_light.css" id="theme-css"-->
<!--path="${doc.bpath}css/">-->
<!--<link rel="stylesheet" type="text/css" href="" id="theme-css" path="${doc.bpath}css/">-->
<script>
    function getThemeCSSName() {
        return Cookies.get('nutzam-theme') || "light";
    }

    function modifyThemeCSS(theme) {
        var href = cpath + "nutz-bootstrap_" + theme + ".css";
        if ($tcss.attr('href') != href) {
            $tcss.attr('href', href);
        }
        Cookies.set('nutzam-theme', theme);
    }

    function addThemeCSS(theme) {
        var link = document.createElement('link');
        link.type = 'text/css';
        link.id = "theme-css";
        link.rel = 'stylesheet';
        link.path = '${doc.bpath}css/';
        link.href = '${doc.bpath}css/nutz-bootstrap_' + theme + ".css";
        document.getElementsByTagName("head")[0].appendChild(link);
    }


    var ctheme = getThemeCSSName();
    addThemeCSS(ctheme);

    var $tcss = $('#theme-css');
    var cpath = $tcss.attr("path");

    // modifyThemeCSS(ctheme);
</script>