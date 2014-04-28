package com.nutzam.web;

import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.NutConfig;
import org.nutz.mvc.Setup;
import org.nutz.web.WebConfig;
import org.nutz.web.Webs;

public class NutzamSetup implements Setup {
    
    private static final Log log = Logs.get();

    @Override
    public void init(NutConfig nc) {
        if (log.isInfoEnabled())
            log.info("init Nutzam ...");

        WebConfig conf = new WebConfig("web.properties");
        nc.setAttribute(Webs.RS, conf.getAppRs());

        if (log.isDebugEnabled())
            log.debugf("set $rs='%s'", conf.getAppRs());

        if (log.isInfoEnabled())
            log.info("... done for init Nutzam");
    }

    @Override
    public void destroy(NutConfig nc) {}

}
