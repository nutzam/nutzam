<link rel="stylesheet" type="text/css" href="${doc.bpath}css/nutz-bootstrap_light.css" id="theme-css" path="${doc.bpath}css/">
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

        var ctheme = getThemeCSSName();
        var $tcss = $('#theme-css');
        var cpath = $tcss.attr("path");

        modifyThemeCSS(ctheme);
</script>