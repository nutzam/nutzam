package com.nutzam.web;

import org.nutz.mvc.annotation.*;
import org.nutz.mvc.ioc.provider.ComboIocProvider;

@SetupBy(NutzamSetup.class)
@IocBy(type = ComboIocProvider.class,
        args = {"*org.nutz.ioc.loader.json.JsonLoader",
                "ioc",
                "*org.nutz.ioc.loader.annotation.AnnotationIocLoader",
                "com.nutzam.web"})
@Modules(scanPackage = true, packages = "com.nutzam.web.module")
@Localization("msg")
public class NutzamMainModule {

    @At("/version")
    @Ok("jsp:jsp.show_text")
    public String version() {
        return "1.0";
    }

}
