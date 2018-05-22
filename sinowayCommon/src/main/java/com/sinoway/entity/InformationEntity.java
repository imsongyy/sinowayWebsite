//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.sinoway.entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "information")
public class InformationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    @Lob
    private String content;
    private Timestamp createTime;
    private String creatorName;
    private Long creatorId;
    private String type;
    private String contentFrom;
    private String bgPath;

    public InformationEntity() {
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getCreateTime() {
        return this.createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public String getCreatorName() {
        return this.creatorName;
    }

    public void setCreatorName(String creatorName) {
        this.creatorName = creatorName;
    }

    public Long getCreatorId() {
        return this.creatorId;
    }

    public void setCreatorId(Long creatorId) {
        this.creatorId = creatorId;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getContentFrom() {
        return this.contentFrom;
    }

    public void setContentFrom(String contentFrom) {
        this.contentFrom = contentFrom;
    }

    public String getBgPath() {
        return this.bgPath;
    }

    public void setBgPath(String bgPath) {
        this.bgPath = bgPath;
    }
}
