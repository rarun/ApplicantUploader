// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package gov.dhs.uscis.efile.web;

import gov.dhs.uscis.efile.domain.Evidence;
import gov.dhs.uscis.efile.web.EvidenceController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect EvidenceController_Roo_Controller {
    
    @RequestMapping(params = "form", produces = "text/html")
    public String EvidenceController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Evidence());
        return "evidences/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String EvidenceController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("evidence", Evidence.findEvidence(id));
        uiModel.addAttribute("itemId", id);
        return "evidences/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String EvidenceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("evidences", Evidence.findEvidenceEntries(firstResult, sizeNo));
            float nrOfPages = (float) Evidence.countEvidences() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("evidences", Evidence.findAllEvidences());
        }
        return "evidences/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String EvidenceController.update(@Valid Evidence evidence, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, evidence);
            return "evidences/update";
        }
        uiModel.asMap().clear();
        evidence.merge();
        return "redirect:/evidences/" + encodeUrlPathSegment(evidence.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String EvidenceController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Evidence.findEvidence(id));
        return "evidences/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String EvidenceController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Evidence evidence = Evidence.findEvidence(id);
        evidence.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/evidences";
    }
    
    void EvidenceController.populateEditForm(Model uiModel, Evidence evidence) {
        uiModel.addAttribute("evidence", evidence);
    }
    
    String EvidenceController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
