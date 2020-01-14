package net.mickanel.services;

import java.util.List;

import net.mickanel.model.CustomerSummariesDetail;
import net.mickanel.model.Voyage;

public class Utils {

	/**
	 * Calculate the price of each voyage
	 * 
	 * @return price
	 */
	public static String calculatePriceOfVoyageInCents(String zoneFrom, String zoneTo){
		if (zoneFrom.equals("1") && zoneTo.equals("2")) return "240";
		if (zoneFrom.equals("1") && zoneTo.equals("3")) return "280";
		if (zoneFrom.equals("2") && zoneTo.equals("1")) return "240";
		if (zoneFrom.equals("2") && zoneTo.equals("3")) return "280";
		if (zoneFrom.equals("1") && zoneTo.equals("4")) return "300";
		if (zoneFrom.equals("2") && zoneTo.equals("4")) return "300";
		if (zoneFrom.equals("3") && zoneTo.equals("4")) return "200";
		if (zoneFrom.equals("3") && zoneTo.equals("1")) return "280";
		if (zoneFrom.equals("3") && zoneTo.equals("2")) return "280";
		if (zoneFrom.equals("4") && zoneTo.equals("1")) return "300";
		if (zoneFrom.equals("4") && zoneTo.equals("2")) return "300";
		if (zoneFrom.equals("4") && zoneTo.equals("3")) return "200";
		if (zoneFrom.equals(zoneTo)) return "100"; //Same Zone ???
		return "NotDetermined";
	}
	
	
	/**
	 * Calculate the global price for one Customer
	 * 
	 * @return price
	 */
	public static void calculateGlobalPriceOfVoyagePerCustomer(CustomerSummariesDetail custSumD){
		List<Voyage> vList = custSumD.getVoyages();
		int globalCost = 0;
		int currentCost;
		for (Voyage v :  vList){
			currentCost = Integer.valueOf(v.getCostInCents());
			globalCost += currentCost;
		}
		custSumD.setTotalCostInCents(Integer.toString(globalCost));
	}
	
	
	/**
	 * Mis a jour du coup total dans  CustomerSummariesDetail
	 * 
	 * @param custSummDetail
	 * @param costInCents
	 */
	public static void updateTotalCostInCent(CustomerSummariesDetail custSummDetail, String costInCents) {
		int totalCostInCent = 0;
		if (!custSummDetail.getTotalCostInCents().equals("0")){
			totalCostInCent = Integer.valueOf(custSummDetail.getTotalCostInCents());	
		} 
		totalCostInCent += Integer.valueOf(costInCents);
		custSummDetail.setTotalCostInCents(String.valueOf(totalCostInCent));
	}
}
