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

    @Column("tp")
    @ColDefine(type = ColType.VARCHAR, width = 12)
    private String type;

    /**
     * 推荐级别，默认 0 ，-1 不推荐下载，>=1 当前推荐下载，
     */
    @Column("lv")
    private int level;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int leval) {
        this.level = leval;
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

    private static final double SZU = 1024;

    public String getSizeForRead() {
        if (size < SZU) {
            return String.format("%d bytes", size);
        }
        double n = (double)size / SZU;
        if (n < SZU) {
            return String.format("%5.2f KB", n);
        }
        n = n / SZU;
        if (n < SZU) {
            return String.format("%5.2f MB", n);
        }
        n = n / SZU;
        return String.format("%5.2f GB", n);
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
