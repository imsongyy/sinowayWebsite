package com.sinoway.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by souyouyou on 2018/5/17.
 */

@Entity
public class PlatformQryEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String timeframe;
    private String checkRate;
    private String qryNum;
    private String createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTimeframe() {
        return timeframe;
    }

    public void setTimeframe(String timeframe) {
        this.timeframe = timeframe;
    }

    public String getCheckRate() {
        return checkRate;
    }

    public void setCheckRate(String checkRate) {
        this.checkRate = checkRate;
    }

    public String getQryNum() {
        return qryNum;
    }

    public void setQryNum(String qryNum) {
        this.qryNum = qryNum;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
