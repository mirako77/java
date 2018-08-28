package ghh.citelum.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import ghh.citelum.model.Folders;
import ghh.citelum.model.Template;


@Repository
public class TemplateDAOImpl implements TemplateDAO {

	private static final Logger logger = LoggerFactory.getLogger(TemplateDAOImpl.class);
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}
	
	@Override
	public void addTemplate(Template t) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(t);
		
		logger.info("Template saved successfully, template Details=" + t);
		
	}
	
	@Override
	public void updateTemplate(Template t) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(t);
		
		logger.info("Template updates successfully, template Details="+t);
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Template> listTemplate() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Template> templateList = session.createQuery("from Template order by ID").list();
		
		for (Template t : templateList) {
			logger.info("Template List::"+t);
		}
		
		return templateList;
	}
	
	@Override
	public Template getTemplateById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Template t = (Template) session.load(Template.class, new Integer(id));
		
		logger.info("Template loaded successfully, template details="+t);
		
		return t;
	}
	
	@Override
	public void removeTemplate(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		
		Template t = (Template) session.load(Template.class, new Integer(id));
		
		if(null !=t) {
			session.delete(t);
		}
		
		logger.info("Template deleted successfully, template details="+t);
		
		
	}

	@Override
	public int maxId() {
		Session session = this.sessionFactory.getCurrentSession();
		
		int maxId = (int) session.createCriteria(Template.class).setProjection(Projections.max("id")).uniqueResult();
		
		return maxId;
	}
	
	
}


