package com.sinoway.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by souyouyou on 2018/4/22.
 */
@Entity
@Table(name = "custom_user")
public class CustomerEntity implements Serializable{
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;
    private Boolean deleted;
    private Boolean activated;
    private String orgFullname;
    private String orgShortname;
    private String socialCreditCode;
    private String officePhone;
    private String faxNumber;
    private String registCapital;
    private String registAddr;
    private String legalName;
    private String generalManagerName;
    private String officeAddr;
    private String postalCode;
    private String siteAddr;
    private String creditChargePerson;
    private String contacts;
    private String contactsNumber;
    private String email;
    private String ipAddr;
    private String agencyLeader;
    private String primaryBusiness;
    private String username;
    private String password;
    private Long newId;
    private Integer auditStatus;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Boolean getDeleted() {
        return deleted;
    }

    public void setDeleted(Boolean deleted) {
        this.deleted = deleted;
    }

    public Boolean getActivated() {
        return activated;
    }

    public void setActivated(Boolean activated) {
        this.activated = activated;
    }

    public String getOrgFullname() {
        return orgFullname;
    }

    public void setOrgFullname(String orgFullname) {
        this.orgFullname = orgFullname;
    }

    public String getOrgShortname() {
        return orgShortname;
    }

    public void setOrgShortname(String orgShortname) {
        this.orgShortname = orgShortname;
    }

    public String getSocialCreditCode() {
        return socialCreditCode;
    }

    public void setSocialCreditCode(String socialCreditCode) {
        this.socialCreditCode = socialCreditCode;
    }

    public String getOfficePhone() {
        return officePhone;
    }

    public void setOfficePhone(String officePhone) {
        this.officePhone = officePhone;
    }

    public String getFaxNumber() {
        return faxNumber;
    }

    public void setFaxNumber(String faxNumber) {
        this.faxNumber = faxNumber;
    }

    public String getRegistCapital() {
        return registCapital;
    }

    public void setRegistCapital(String registCapital) {
        this.registCapital = registCapital;
    }

    public String getRegistAddr() {
        return registAddr;
    }

    public void setRegistAddr(String registAddr) {
        this.registAddr = registAddr;
    }

    public String getLegalName() {
        return legalName;
    }

    public void setLegalName(String legalName) {
        this.legalName = legalName;
    }

    public String getGeneralManagerName() {
        return generalManagerName;
    }

    public void setGeneralManagerName(String generalManagerName) {
        this.generalManagerName = generalManagerName;
    }

    public String getOfficeAddr() {
        return officeAddr;
    }

    public void setOfficeAddr(String officeAddr) {
        this.officeAddr = officeAddr;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getSiteAddr() {
        return siteAddr;
    }

    public void setSiteAddr(String siteAddr) {
        this.siteAddr = siteAddr;
    }

    public String getCreditChargePerson() {
        return creditChargePerson;
    }

    public void setCreditChargePerson(String creditChargePerson) {
        this.creditChargePerson = creditChargePerson;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getContactsNumber() {
        return contactsNumber;
    }

    public void setContactsNumber(String contactsNumber) {
        this.contactsNumber = contactsNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIpAddr() {
        return ipAddr;
    }

    public void setIpAddr(String ipAddr) {
        this.ipAddr = ipAddr;
    }

    public String getAgencyLeader() {
        return agencyLeader;
    }

    public void setAgencyLeader(String agencyLeader) {
        this.agencyLeader = agencyLeader;
    }

    public String getPrimaryBusiness() {
        return primaryBusiness;
    }

    public void setPrimaryBusiness(String primaryBusiness) {
        this.primaryBusiness = primaryBusiness;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Long getNewId() {
        return newId;
    }

    public void setNewId(Long newId) {
        this.newId = newId;
    }

    public Integer getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(Integer auditStatus) {
        this.auditStatus = auditStatus;
    }
}
