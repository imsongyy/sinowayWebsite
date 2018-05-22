package com.sinoway.entity;

import javax.persistence.*;

/**
 * Created by souyouyou on 2018/4/27.
 */
@Entity
@Table(name = "question")
public class QuestionEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String email;
    @Lob
    private String question;
    private String quzTime;
    private Boolean dealStatus;
    @Lob
    private String answer;
    private String mobile;
    private String type = "0";

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getQuzTime() {
        return quzTime;
    }

    public void setQuzTime(String quzTime) {
        this.quzTime = quzTime;
    }

    public Boolean getDealStatus() {
        return dealStatus;
    }

    public void setDealStatus(Boolean dealStatus) {
        this.dealStatus = dealStatus;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
