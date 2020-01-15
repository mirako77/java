Project trainCompany POC

This project goal is to show a quick solution example on how to manage train company business.
It was writen for java 8 langage and above with jackson framework for reading JSon data.
So you will need at least a Java runtime to run it.

You can get the projet on github at this url: https://github.com/mirako77/java/tree/master/DemoClientGHN/trainCompany

You can clone the project with git clone and run it inside an IDE like eclipse or IntelliJ.
I develloped this with eclipse but it will not be more complicate to run it within IntelliJ or other IDE.
After clonning the project to your local environement, you can import it inside Eclipse IDE as a maven project.

How to Run the program:

You can run it directly inside Eclipse IDE after importing it.
Select the class net.mickanel.controleur.AppTrain and inside eclipse: Run -> Run as -> Java project

This program take one argument to run correctly.
You have to specify the JSon file location as unique argument.
	inside eclipse you can go to Run configuration and add the file location inside Program argument.

You can also run it as a stand alone programme after getting the jar file.
	java -jar trainCompany-0.0.1-SNAPSHOT.jar "JSonFileLocation.txt"
to runt it in stand alone mode keep in mind that you have to specify the jackson library inside the classpath.
it is specified in the Manifest of the jar after building it like this: 
Class-Path: lib/log4j-1.2.17.jar lib/jackson-databind-2.9.10.1.jar lib/jackson-annotations-2.9.10.jar lib/jackson-core-2.9.10.jar

it's possbile to build the package with maven from the source code by this command line: 
	- mvn clean package --> you will get the jar package in the target folder

You can run unit test directly inside eclipse by selecting the file AppTest.java > Run As > Junit test
For your information, maven run also the unit test when you build the project.

developped by RAKOTOMALALA Al Mickael

