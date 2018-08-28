package ghh.citelum.service;

import java.util.List;

import ghh.citelum.model.Template;

public interface TemplateService {

	public void addTemplate(Template t);
	public void updateTemplate(Template t);
	public List<Template> listTemplate();
	public Template getTemplateById(int id);
	public void removeTemplate(int id);
	public int maxId();

}
