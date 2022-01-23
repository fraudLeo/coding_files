package com.sybinal.shop.model;

import java.util.Date;

public class CommentaryPraise {
    private Integer id;

    private Integer interactionDetailId;

    private Integer makeEmp;

    private Date makeDate;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getInteractionDetailId() {
        return interactionDetailId;
    }

    public void setInteractionDetailId(Integer interactionDetailId) {
        this.interactionDetailId = interactionDetailId;
    }

    public Integer getMakeEmp() {
        return makeEmp;
    }

    public void setMakeEmp(Integer makeEmp) {
        this.makeEmp = makeEmp;
    }

    public Date getMakeDate() {
        return makeDate;
    }

    public void setMakeDate(Date makeDate) {
        this.makeDate = makeDate;
    }
}