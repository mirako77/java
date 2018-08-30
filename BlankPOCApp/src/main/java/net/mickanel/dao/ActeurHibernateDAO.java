package net.mickanel.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import net.mickanel.business.ActeurImpl;

@SuppressWarnings("deprecation")
public class ActeurHibernateDAO extends HibernateDaoSupport implements ActeurDAOInterface {

	@SuppressWarnings({ "unchecked", "deprecation" })
	public Collection<ActeurImpl> findAllActors() throws DataAccessException {
		return (Collection<ActeurImpl>) getHibernateTemplate().find( "select NOM, PRENOM from ACTEUR", new ActeurMapper());
	}
	
	class ActeurMapper implements RowMapper<ActeurImpl> {
		public ActeurImpl mapRow(ResultSet rs, int rowNum) throws SQLException {
		ActeurImpl p = new ActeurImpl();
		p.setNom(rs.getString("NOM"));
		p.setPrenom(rs.getString("PRENOM"));
		return p;
		}
	}

	public void deleteActeur(String idActeur) {
		getHibernateTemplate().delete(idActeur);
	}

	@Override
	public void saveActeur(ActeurImpl _act) {
		getHibernateTemplate().save(_act);
	}

}
