// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package gov.dhs.uscis.efile.domain;

import gov.dhs.uscis.efile.domain.Applicant;
import java.util.Date;

privileged aspect Applicant_Roo_JavaBean {
    
    public String Applicant.getFname() {
        return this.fname;
    }
    
    public void Applicant.setFname(String fname) {
        this.fname = fname;
    }
    
    public String Applicant.getLname() {
        return this.lname;
    }
    
    public void Applicant.setLname(String lname) {
        this.lname = lname;
    }
    
    public Date Applicant.getDob() {
        return this.dob;
    }
    
    public void Applicant.setDob(Date dob) {
        this.dob = dob;
    }
    
    public Integer Applicant.getSsn() {
        return this.ssn;
    }
    
    public void Applicant.setSsn(Integer ssn) {
        this.ssn = ssn;
    }
    
    public String Applicant.getEmail() {
        return this.email;
    }
    
    public void Applicant.setEmail(String email) {
        this.email = email;
    }
    
}
