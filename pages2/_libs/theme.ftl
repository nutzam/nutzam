<link rel="stylesheet" type="text/css" href="${doc.bpath}css/nutzbs_light.css" id="theme-css-light"
      path="${doc.bpath}css/">
<script>
    function getThemeCSSName() {
        return Cookies.get('nutzam-theme') || "light";
    }

    function addDarkTheme() {
        var link = document.createElement('link');
        link.type = 'text/css';
        link.id = "theme-css-dark";
        link.rel = 'stylesheet';
        link.path = '${doc.bpath}css/';
        link.href = '${doc.bpath}css/nutzbs_dark.css';
        document.getElementsByTagName("head")[0].appendChild(link);
    }

    function removeDarkTheme() {
        $('#theme-css-dark').remove();
    }

    function useDarkTheme(ud) {
        var tnm = ud ? "dark" : "light";
        console.log('switch-theme:' + tnm);
        Cookies.set('nutzam-theme', tnm);
        if (ud) {
            addDarkTheme();
        } else {
            removeDarkTheme();
        }
    }

    var ctheme = getThemeCSSName();
    console.log("init-theme:" + ctheme);
    useDarkTheme(ctheme == 'dark');
</script>