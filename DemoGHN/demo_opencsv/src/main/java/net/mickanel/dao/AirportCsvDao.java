package net.mickanel.dao;

import static net.mickanel.dao.CsvFileHelper.readCsvFile;

import java.util.ArrayList;
import java.util.List;

import net.mickanel.business.Airport;

public class AirportCsvDao implements AirportDao {

	private final static char SEPARATOR = ',';
	private final static String RESOURCES_PATH = "src/main/resources/";
	private final static String FILE_NAME = "airports.csv";

	@Override
	public List<Airport> findAirport() {

		final List<String[]> data = readCsvFile(RESOURCES_PATH + FILE_NAME, SEPARATOR);

		final List<Airport> airport = dataToAirport(data);

		return airport;
	}

	private List<Airport> dataToAirport(List<String[]> data) {
		final List<Airport> airport = new ArrayList<Airport>();

			for (String[] oneData : data) {
				final Integer id = Integer.parseInt(oneData[0]);
				final String ident = oneData[1];
				final String type = oneData[2];
				final String name = oneData[3];
				final String isoCountry = oneData[8];
				final String isoRegion = oneData[9];
				final String municipality = oneData[10];

				final Airport ap = new Airport(id,ident,type,name,isoCountry,isoRegion,municipality);
				airport.add(ap);
			}

		return airport;
	}

}
