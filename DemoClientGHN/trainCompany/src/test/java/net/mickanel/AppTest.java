package net.mickanel;

import java.util.ArrayList;
import java.util.List;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;
import net.mickanel.model.CustomerSummariesDetail;
import net.mickanel.model.Voyage;
import net.mickanel.services.Utils;

/**
 * Unit test for simple App.
 */
public class AppTest 
    extends TestCase
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppTest( String testName )
    {
        super( testName );
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( AppTest.class );
    }

    /**
     * Vérification du cout d'un voyage de zone 1 a 2 etc ...
     */
    public void testAppZone1To2()
    {
    	Voyage v01 = new Voyage(
    				"A", "E", "1572244200", "", "1", "2");
    	String cost = Utils.calculatePriceOfVoyageInCents(v01.getZoneFrom(), v01.getZoneTo());
        assertTrue( cost.equalsIgnoreCase("240") );
    }
    
    /**
     * Vérification du cout d'un voyage de méme zone
     */
    public void testAppZone2To2()
    {
    	Voyage v01 = new Voyage(
    				"A", "E", "1572244200", "", "2", "2");
    	String cost = Utils.calculatePriceOfVoyageInCents(v01.getZoneFrom(), v01.getZoneTo());
        assertTrue( cost.equalsIgnoreCase("100") );
    }
    
    /**
     * Vérification du cout d'un voyage de méme zone
     */
    public void testCalculateGlobalPriceOfVoyagePerCustomer()
    {
    	CustomerSummariesDetail custSumD = new CustomerSummariesDetail(1,"",null);
    	Voyage v01 = new Voyage("A", "D", "1572244200", "240", "1", "2");
    	Voyage v02 = new Voyage("D", "A", "1572644200", "240", "2", "1");
    	List<Voyage> vList = new ArrayList<Voyage>();
    	vList.add(v01);
    	vList.add(v02);
    	custSumD.setVoyages(vList);
    	//Voyage v03 = new Voyage("A", "D", "1573244200", "240", "2", "4");
    	Utils.calculateGlobalPriceOfVoyagePerCustomer(custSumD);
        assertTrue( custSumD.getTotalCostInCents().equalsIgnoreCase("480") );
    }
    
    /**
     * Vérification du cout d'un voyage de méme zone
     */
    public void testUpdateTotalCostInCent()
    {
    	CustomerSummariesDetail custSumD = new CustomerSummariesDetail(1,"240",null);
    	Voyage v01 = new Voyage("A", "D", "1572244200", "240", "1", "2");
    	List<Voyage> vList = new ArrayList<Voyage>();
    	vList.add(v01);
    	custSumD.setVoyages(vList);
    	
    	Utils.updateTotalCostInCent(custSumD, "240");
    	
    	assertEquals(custSumD.getTotalCostInCents(), "480");
    }
    
    /**
     * Vérification du cout d'un voyage de méme zone
     */
    public void testZoneEndForStation()
    {
    	Voyage v01 = new Voyage("D", "G", "1572244200", "240", "1", "");
    	Utils.getZoneEndForStation(v01);
    	
    	assertEquals(v01.getZoneTo() , "4");
    }
    
}
