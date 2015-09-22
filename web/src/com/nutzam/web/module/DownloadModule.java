package com.nutzam.web.module;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.nutz.dao.Cnd;
import org.nutz.dao.Dao;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.json.Json;
import org.nutz.json.JsonFormat;
import org.nutz.lang.Files;
import org.nutz.lang.Lang;
import org.nutz.lang.Strings;
import org.nutz.lang.Times;
import org.nutz.lang.util.Disks;
import org.nutz.lang.util.FileVisitor;
import org.nutz.log.Log;
import org.nutz.log.Logs;
import org.nutz.mvc.annotation.*;
import org.nutz.mvc.view.HttpStatusView;

import com.nutzam.web.pojo.DownInfo;

@IocBean(create = "on_create")
public class DownloadModule {

    private static final Log log = Logs.get();

    @Inject("java:$conf.get('down-home')")
    private String home;

    @Inject("refer:dao")
    private Dao dao;

    /**
     * 递归下载目录内所有的文件，所有 dinfo 结尾的文件是下载特殊说明文件，<br>
     * 这个文件不是必须的。 其他的文件，如果没有 dinfo 文件，则为其生成
     * 
     * @return 生成后的下载列表
     */
    @At("/genlist")
    @Ok(">>:/")
    public List<DownInfo> genList(@Param("f") final boolean force) {
        log.infof("!GEN-LIST %b", force);
        final HashMap<String, DownInfo> map = new HashMap<String, DownInfo>();
        // 遍历下载文件夹
        Disks.visitFile(home, null, true, new FileVisitor() {
            public void visit(File f) {
                // 如果是 dinfo 忽略
                if ("dinfo".equalsIgnoreCase(Files.getSuffixName(f)))
                    return;

                if (log.isInfoEnabled()) {
                    String rph = Disks.getRelativePath(home,
                                                       f.getAbsolutePath());
                    log.infof("scan file file : %s", rph);

                }

                // 寻找一个 dinfo 文件
                File fi = Files.createFileIfNoExists2(f.getAbsolutePath()
                                                      + ".dinfo");
                String json = Strings.trim(Files.read(fi));
                DownInfo di;
                if (Strings.isEmpty(json)) {
                    di = new DownInfo();
                    di.setFinger(Lang.md5(f));
                    di.setName(Files.getName(f));
                    di.setType(Files.getSuffixName(f));
                    di.setPath(Disks.getRelativePath(home, f.getAbsolutePath()));
                    di.setCreateTime(new Date(f.lastModified()));
                    di.setSize(f.length());
                    di.setLastModified(Times.now());
                    Json.toJsonFile(fi, di, JsonFormat.forLook());
                } else {
                    di = Json.fromJson(DownInfo.class, json);
                    if (force) {
                        di.setFinger(Lang.md5(f));
                        di.setName(Files.getName(f));
                        di.setType(Files.getSuffixName(f));
                        di.setPath(Disks.getRelativePath(home,
                                                         f.getAbsolutePath()));
                        di.setCreateTime(new Date(f.lastModified()));
                        di.setSize(f.length());
                        Json.toJsonFile(fi, di, JsonFormat.forLook());
                    }
                }
                if (map.containsKey(di.getFinger())) {
                    if (log.isWarnEnabled())
                        log.warnf("already exists: %s <-> %s",
                                  map.get(di.getFinger()),
                                  di);
                } else {
                    map.put(di.getFinger(), di);
                }

            }
        });
        // 将列表插入索引
        dao.clear(DownInfo.class);
        dao.fastInsert(map.values());

        // 返回
        return dao.query(DownInfo.class,
                         Cnd.orderBy().desc("level").desc("lastModified"));
    }

    @At("/")
    @Ok("jsp:jsp.down.list")
    public List<DownInfo> getList() {
        return dao.query(DownInfo.class,
                         Cnd.orderBy().desc("level").desc("name"));
    }

    @At("/get/?")
    @Ok("jsp:jsp.down.info")
    public DownInfo get(String fg) {
        return dao.fetch(DownInfo.class, fg);
    }

    @At("/fetch")
    @Ok("jsp:jsp.down.info")
    public DownInfo getByName(@Param("nm") String name) {
        return dao.fetch(DownInfo.class, Cnd.where("name", "=", name));
    }

    @At("/read/?")
    @Ok("raw:stream")
    @Fail("http")
    public File read(String fg) {
        DownInfo di = dao.fetch(DownInfo.class, fg);
        if (null == di)
            throw new HttpStatusView.HttpStatusException(404,
                                                         "File finger'%s' not found!",
                                                         fg);
        File f = Files.findFile(home + "/" + di.getPath());
        if (null == f)
            throw new HttpStatusView.HttpStatusException(404,
                                                         "File '%s/%s' noexists",
                                                         home,
                                                         di.getPath());
        // 增加计数
        di.setCount(di.getCount() + 1);
        di.setLastModified(Times.now());
        File fi = Files.createFileIfNoExists2(f.getAbsolutePath() + ".dinfo");
        Json.toJsonFile(fi, di, JsonFormat.forLook());
        dao.update(di);
        // 返回文件
        return f;
    }

    public void on_create() {
        // 检查主目录
        File d = Files.findFile(home);
        if (null == d) {
            log.fatalf("!!! fail to found download-home : %s", home);
            System.exit(-1);
        }
        if (!d.isDirectory()) {
            log.fatalf("!!! download-home : '%s' must be a directory", home);
            System.exit(-1);
        }
        if (log.isInfoEnabled())
            log.infof("found download-home : '%s'", home);
        home = d.getAbsolutePath();

        // 检查数据表
        dao.create(DownInfo.class, false);
    }

}
