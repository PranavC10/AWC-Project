/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.model;

/**
 *
 * @author technowings
 */
public class AWCModel {
   String awcid, awsname, address, village, city, pincode, awstype, cdate;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAwcid() {
        return awcid;
    }

    public void setAwcid(String awcid) {
        this.awcid = awcid;
    }

    public String getAwsname() {
        return awsname;
    }

    public void setAwsname(String awsname) {
        this.awsname = awsname;
    }

    public String getAwstype() {
        return awstype;
    }

    public void setAwstype(String awstype) {
        this.awstype = awstype;
    }

    public String getCdate() {
        return cdate;
    }

    public void setCdate(String cdate) {
        this.cdate = cdate;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

   

    public String getPincode() {
        return pincode;
    }

    public void setPincode(String pincode) {
        this.pincode = pincode;
    }

   

    public String getVillage() {
        return village;
    }

    public void setVillage(String village) {
        this.village = village;
    }
}
