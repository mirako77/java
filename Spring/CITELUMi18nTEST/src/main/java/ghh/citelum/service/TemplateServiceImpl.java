package ghh.citelum.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ghh.citelum.dao.TemplateDAO;
import ghh.citelum.model.Template;

@Service
public class TemplateServiceImpl implements TemplateService {
	
	private TemplateDAO templateDAO;

	public void setTemplateDAO(TemplateDAO templateDAO) {
		this.templateDAO = templateDAO;
	}

	@Override
	@Transactional
	public void addTemplate(Template t) {
		this.templateDAO.addTemplate(t);
	}

	@Override
	@Transactional
	public void updateTemplate(Template t) {
		this.templateDAO.updateTemplate(t);
	}

	@Override
	@Transactional
	public List<Template> listTemplate() {
		return this.templateDAO.listTemplate();
	}


	@Override
	@Transactional
	public Template getTemplateById(int id) {
		return this.templateDAO.getTemplateById(id);
	}
	

	@Override
	@Transactional
	public void removeTemplate(int id) {
		this.templateDAO.removeTemplate(id);
	}


	@Override
	@Transactional
	public int maxId() {
		return this.templateDAO.maxId();
	}
	


}
