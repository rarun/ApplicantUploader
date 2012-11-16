// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package gov.dhs.uscis.efile.domain;

import gov.dhs.uscis.efile.domain.Applicant;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Applicant_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Applicant.entityManager;
    
    public static final EntityManager Applicant.entityManager() {
        EntityManager em = new Applicant().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Applicant.countApplicants() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Applicant o", Long.class).getSingleResult();
    }
    
    public static List<Applicant> Applicant.findAllApplicants() {
        return entityManager().createQuery("SELECT o FROM Applicant o", Applicant.class).getResultList();
    }
    
    public static Applicant Applicant.findApplicant(Long id) {
        if (id == null) return null;
        return entityManager().find(Applicant.class, id);
    }
    
    public static List<Applicant> Applicant.findApplicantEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Applicant o", Applicant.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Applicant.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Applicant.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Applicant attached = Applicant.findApplicant(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Applicant.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Applicant.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Applicant Applicant.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Applicant merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}