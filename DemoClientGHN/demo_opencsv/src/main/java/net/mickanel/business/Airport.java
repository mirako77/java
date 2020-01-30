package net.mickanel.business;


public class Airport {

	private int id;
	private String ident;
	private String type;
	private String name;
	private String isoCountry;
	private String isoRegion;
	private String municipality;
	

	public Airport(int id, String ident, String type, String name,
			String isoCountry, String isoRegion, String municipality) {
		this.id=id;
		this.ident=ident;
		this.type=type;
		this.name=name;
		this.isoCountry=isoCountry;
		this.isoRegion=isoRegion;
		this.municipality=municipality;
	}

	@Override
	public String toString() {
		return "Airport [id=" + id + ", ident=" + ident + ", type=" + type + ", name=" + name +
				", name=" + name + ", isoCountry=" + isoCountry + ", isoRegion=" + isoRegion + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		
		Airport other = (Airport) obj;
		if (ident == null) {
			if (other.ident != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!type.equals(other.type))
			return false;

		return true;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIdent() {
		return ident;
	}

	public void setIdent(String ident) {
		this.ident = ident;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIsoCountry() {
		return isoCountry;
	}

	public void setIsoCountry(String isoCountry) {
		this.isoCountry = isoCountry;
	}

	public String getIsoRegion() {
		return isoRegion;
	}

	public void setIsoRegion(String isoRegion) {
		this.isoRegion = isoRegion;
	}

	public String getMunicipality() {
		return municipality;
	}

	public void setMunicipality(String municipality) {
		this.municipality = municipality;
	}
	
}
