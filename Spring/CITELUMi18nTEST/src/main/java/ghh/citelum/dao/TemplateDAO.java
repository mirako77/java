package ghh.citelum.dao;

import java.util.List;

import ghh.citelum.model.Template;

public interface TemplateDAO {

	public void addTemplate(Template t);
	public void updateTemplate(Template t);
	public List<Template> listTemplate();
	public Template getTemplateById(int id);
	public void removeTemplate(int id);
	public int maxId();
	
	
}
