package net.mickanel.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import net.mickanel.business.ActeurImpl;

public class ActeurJDBCDAO extends JdbcDaoSupport implements ActeurDAOInterface {

	public Collection<ActeurImpl> findAllActors() throws DataAccessException {
		return getJdbcTemplate().query( "select NOM, PRENOM from ACTEUR", new ActeurMapper());
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void saveActeur(ActeurImpl _act) {
		// TODO Auto-generated method stub
		
	}

}
