package net.mickanel.launcher;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

import net.mickanel.business.Airport;
import net.mickanel.dao.AirportCsvDao;
import net.mickanel.dao.AirportDao;

public class DaoLauncher {

	public static void main(String[] args) throws IOException {
		BufferedReader  inputStreamReader =new BufferedReader( new InputStreamReader(System.in));
		System.out.println("Please enter a country code or a country name you are looking for. ");
		System.out.println("You can let the criteria empty also if you want.");
		
		System.out.println("Wich country code are you looking for ? ");
		String countryCode = inputStreamReader.readLine();
		
		System.out.println("Wich country name are you looking for ? ");
		String countryName = inputStreamReader.readLine();

		inputStreamReader.close();
	
		final AirportDao aPDao = new AirportCsvDao();
		final List<Airport> aPs = aPDao.findAirport();

		System.out.println("Liste des aéroports > ");
		for (Airport aP : aPs) {
			if (countryCode.equals("") && countryName.equals("")){
				System.out.println(aP);
			} else {
				// only for test if i already print the current airport
				boolean printed = false;
				if (!countryCode.equals("")){
					// I take only the country code researched
					if ( aP.getIsoCountry().equalsIgnoreCase(countryCode) ){
						System.out.println(aP);
						printed = true;
					}
				}
				
				if (!countryName.equals("") && !printed){
					// I take only the country code researched
					if ( aP.getName().toUpperCase()
							.contains(countryName.toUpperCase()) ){
						System.out.println(aP);
					}
				}
			}
		}

	}

}
