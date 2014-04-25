package com.nutzam.web.pojo;

import java.util.Date;

import org.nutz.dao.entity.annotation.*;

@Table("t_down")
public class DownInfo {

    /**
     * 文件的 MD5 为它的 ID
     */
    @Name
    @Column("fg")
    private String finger;

    @Column("nm")
    @ColDefine(type = ColType.VARCHAR, width = 256)
    private String name;

    /**
     * 在磁盘上的完整路径
     */
    @Column("ph")
    @ColDefine(type = ColType.VARCHAR, width = 1024)
    private String path;

    @Column("comm")
    private String comment;

    @Column("sz")
    private long size;

    /**
     * 下载计数
     */
    @Column("c")
    private int count;

    /**
     * 创建时间
     */
    @Column("ct")
    private Date createTime;

    /**
     * 最后一次被下载的时间
     */
    @Column("lm")
    private Date lastModified;

    public String getFinger() {
        return finger;
    }

    public void setFinger(String finger) {
        this.finger = finger;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastModified() {
        return lastModified;
    }

    public void setLastModified(Date lastModified) {
        this.lastModified = lastModified;
    }

    public int hashCode() {
        return finger.hashCode();
    }

    public String toString() {
        return String.format("%s : %s", finger, path);
    }

}
