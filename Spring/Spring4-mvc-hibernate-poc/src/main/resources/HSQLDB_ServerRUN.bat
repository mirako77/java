:: this is a bat script for running HSQL Database on server mode
:: ###################################################
@ECHO OFF
echo = = run the server on localhost = =
echo = = you can connect the DB with hsql://localhost/xdb
echo = = please visit : http://hsqldb.org/doc/guide/running-chapt.html 
set databaseDir=D:\MyProjects\DemoWorkspace\HSQLDataBase\DataFile.db
set hsqlJarDir=D:\MyProjects\repository\org\hsqldb\hsqldb\2.5.1\hsqldb-2.5.1.jar
java -cp %hsqlJarDir% org.hsqldb.server.Server --database.0 file:%databaseDir% --dbname.0 xdb
echo = = operation complete = =