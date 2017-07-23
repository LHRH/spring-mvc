package com.lh.po.vo;

import java.io.Serializable;
import java.util.List;

/**
 * Created by linghu on 17/04/09.
 */
public class SelectTree implements Serializable {

    private String id;

    private String pid;

    private String label;

    private List<SelectTree> children;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public List<SelectTree> getChildren() {
        return children;
    }

    public void setChildren(List<SelectTree> children) {
        this.children = children;
    }
}
