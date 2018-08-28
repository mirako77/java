package org.plutext.htmleditor;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;
import javax.ws.rs.core.Response.Status;
import javax.ws.rs.core.StreamingOutput;
import org.docx4j.Docx4J;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.docx4j.openpackaging.io.SaveToZipFile;
import org.docx4j.openpackaging.packages.WordprocessingMLPackage;
import org.docx4j.openpackaging.parts.WordprocessingML.AltChunkType;
import org.docx4j.openpackaging.parts.WordprocessingML.MainDocumentPart;

import com.plutext.merge.BlockRange;
import com.plutext.merge.DocumentBuilderIncremental;
import com.plutext.merge.BlockRange.HfBehaviour;
import com.plutext.merge.BlockRange.NumberingHandler;
import com.plutext.merge.BlockRange.SectionBreakBefore;
import com.plutext.merge.BlockRange.StyleHandler;

import ghh.citelum.utils.LoginCredentials;
import ghh.citelum.utils.WorkPath;
import java.util.List;


@Path("/merge")  
public class Merge {

	WorkPath workPath = new WorkPath();	
	String path = WorkPath.getWorkPath();
	

@POST
public Response mergeDocx(
		@Context  HttpServletRequest request)  {
	
	LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
	String projIdString = currentUser.getCurrentProjectId();
	
	
	String mergePath = path + "folders\\" + projIdString + "\\merge\\taskMerge.docx";
	String header = path + "utils\\header.docx";
	String fileList = path + "folders\\" + projIdString + "\\merge\\headerlessSummary.docx";
	String summary = path + "folders\\" + projIdString + "\\merge\\summary.docx";
	String finalMerge = path + "folders\\" + projIdString + "\\merge\\finalMerge.docx";
	
	//System.out.println(mergePath);

	try {	

		List<String> listOfFiles = currentUser.getFileNameListToMerge();
		
		// CREATE FILE WITH THE LIST OF TASK NAMES IN ORDER
		// CREATE FILE WITH THE LIST OF TASK NAMES IN ORDER
		// CREATE FILE WITH THE LIST OF TASK NAMES IN ORDER	
		WordprocessingMLPackage wordMLPackage = WordprocessingMLPackage.createPackage();
		String html = "<html><head></head><body>"; 
		for (int i=0 ; i< listOfFiles.size(); i++) { 
			
			html= html +"<h2>" + (i+1) + " - " + listOfFiles.get(i) + "</h2><br>";
			
		}
		html = html	+ "<p style='page-break-before: always;'>&nbsp;</p>"
				+ "</body></html>";
		wordMLPackage.getMainDocumentPart().addAltChunk(AltChunkType.Html, html.getBytes()); 
		File file0 = new File(fileList);
		file0.getParentFile().mkdirs();
		wordMLPackage.save(new java.io.File(fileList));		
		
		// ADD HEADER TO THE FILE NAME LIST
		// ADD HEADER TO THE FILE NAME LIST
		// ADD HEADER TO THE FILE NAME LIST
//		boolean ADD_TO_HEADER = false;
		boolean save = true;
		// Open a document from the file system
		WordprocessingMLPackage wordMLPackage2 = WordprocessingMLPackage.load(new java.io.File(header));
				
		//if (ADD_TO_HEADER) {
			//HeaderPart hp = wordMLPackage2.getDocumentModel().getSections().get(0).getHeaderFooterPolicy().getDefaultHeader();
			//hp.addAltChunk(AltChunkType.WordprocessingML, new FileInputStream(chunkPath) );
		//} else {
			MainDocumentPart main = wordMLPackage2.getMainDocumentPart();
			main.addAltChunk(AltChunkType.WordprocessingML, new FileInputStream(fileList) );
		//}
		
		if (save) {		
			SaveToZipFile saver = new SaveToZipFile(wordMLPackage2);
			saver.save(summary);
			//System.out.println("Saved " + outputfilepath);
		}

		//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
		//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
		//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
		
		//CREATE TITLE ONLY FILES
		/*for (int i=0 ; i< ( listOfFiles.size() ); i++) { 
			String fileList00 = path + "folders\\" + projIdString + "\\merge\\dump\\name" + i + ".docx";
			WordprocessingMLPackage wordMLPackage00 = WordprocessingMLPackage.createPackage();
			String html00 = "<html><head></head><body>"
					+"<h1><center>" + listOfFiles.get(i) + "</center></h1>"
					+ "<br><br></body></html>";
			wordMLPackage00.getMainDocumentPart().addAltChunk(AltChunkType.Html, html00.getBytes()); 
			File file00 = new File(fileList00);
			file00.getParentFile().mkdirs();
			wordMLPackage00.save(new java.io.File(fileList00));	
				
		}
*/
		//JOIN TITLE WITH CONTENT
		/*for (int i=0 ; i< ( listOfFiles.size() ); i++) { 
			String fileList00 = path + "folders\\" + projIdString + "\\merge\\dump\\name" + i + ".docx";
			String filePath00 = path + "folders\\" + projIdString + "\\" + listOfFiles.get(i) + ".docx";
			
			String save00 = path + "folders\\" + projIdString + "\\merge\\dump\\merged" + i + ".docx";
			
			
			WordprocessingMLPackage wordMLPackage00 = WordprocessingMLPackage.load(new java.io.File(fileList00));
			
				MainDocumentPart main00 = wordMLPackage00.getMainDocumentPart();
				main00.addAltChunk(AltChunkType.WordprocessingML, new FileInputStream(filePath00) );
			//}
			
			if (save) {		
				SaveToZipFile saver = new SaveToZipFile(wordMLPackage00);
				saver.save(save00);
				//System.out.println("Saved " + outputfilepath);
			}
				
		}
		*/
		
		//MERGE THESE FILES
		/*
		for (int i=0 ; i< ( listOfFiles.size()-1 ); i++) { 
			if (i == ( listOfFiles.size()-2 )){
				String fileList00 = path + "folders\\" + projIdString + "\\merge\\dump\\merged" + 0 + ".docx";
				String filePath00 = path + "folders\\" + projIdString + "\\merge\\dump\\merged" + (i+1) + ".docx";

				
				WordprocessingMLPackage wordMLPackage00 = WordprocessingMLPackage.load(new java.io.File(fileList00));
				
					MainDocumentPart main00 = wordMLPackage00.getMainDocumentPart();
					main00.addAltChunk(AltChunkType.WordprocessingML, new FileInputStream(filePath00) );
				//}
				
				if (save) {		
					SaveToZipFile saver = new SaveToZipFile(wordMLPackage00);
					saver.save(mergePath);
					//System.out.println("Saved " + outputfilepath);
				}	
			}
			else {
			String fileList00 = path + "folders\\" + projIdString + "\\merge\\dump\\merged" + 0 + ".docx";
			String filePath00 = path + "folders\\" + projIdString + "\\merge\\dump\\merged" + (i+1) + ".docx";

			
			WordprocessingMLPackage wordMLPackage00 = WordprocessingMLPackage.load(new java.io.File(fileList00));
			
				MainDocumentPart main00 = wordMLPackage00.getMainDocumentPart();
				main00.addAltChunk(AltChunkType.WordprocessingML, new FileInputStream(filePath00) );
			//}
			
			if (save) {		
				SaveToZipFile saver = new SaveToZipFile(wordMLPackage00);
				saver.save(fileList00);
				//System.out.println("Saved " + outputfilepath);
			}
			}
				
		}
*/
		//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
		//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
		//*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
		
		
		// CREATE MERGE FILE
		// CREATE MERGE FILE
		// CREATE MERGE FILE
		
		DocumentBuilderIncremental dbi = new DocumentBuilderIncremental();
		for (int i=0 ; i< ( listOfFiles.size() ); i++) { 

			String filePath = path + "folders\\" + projIdString + "\\" + listOfFiles.get(i) + ".docx";
			//String filePath = path + "folders\\" + projIdString + "\\merge\\dump\\merged" + i + ".docx";
			
			
			File getFile = new File(filePath);
				BlockRange block = new BlockRange( Docx4J.load( getFile ));

			dbi.addBlockRange( block, i==(listOfFiles.size()-1) );  
			block.setStyleHandler(StyleHandler.RENAME_RETAIN);
			block.setNumberingHandler(NumberingHandler.USE_EARLIER);
			block.setRestartPageNumbering(false);
			block.setSectionBreakBefore(SectionBreakBefore.CONTINUOUS);
			block.setHeaderBehaviour(HfBehaviour.INHERIT);
			block.setFooterBehaviour(HfBehaviour.INHERIT);	        
				} 	
		// Perform the actual merge 
		//DocumentBuilder documentBuilder = new DocumentBuilder(); 
		WordprocessingMLPackage output = dbi.finish();		
		// TESTING TESTING TESTING TESTING TESTING TESTING TESTING TESTING TESTING  //
		
		SaveToZipFile saver = new SaveToZipFile(output); 
		
		File file = new File(mergePath);
		file.getParentFile().mkdirs();
		saver.save(mergePath);
		
		
		// CREATE THE FINAL MERGE FILE BY ADDING THE HEADER+FILE NAME LIST WITH TASK MERGE
		// CREATE THE FINAL MERGE FILE BY ADDING THE HEADER+FILE NAME LIST WITH TASK MERGE
		// CREATE THE FINAL MERGE FILE BY ADDING THE HEADER+FILE NAME LIST WITH TASK MERGE
		// Open a document from the file system
		WordprocessingMLPackage wordMLPackage3 = WordprocessingMLPackage.load(new java.io.File(summary));

			MainDocumentPart main1 = wordMLPackage3.getMainDocumentPart();
			main1.addAltChunk(AltChunkType.WordprocessingML, new FileInputStream(mergePath) );
	
		if (save) {		
			SaveToZipFile saver1 = new SaveToZipFile(wordMLPackage3);
			saver1.save(finalMerge);
		}
		//System.out.println("outside response");
    	
		ResponseBuilder builder = Response.ok(
			new StreamingOutput() {				
				public void write(OutputStream finalMerge) throws IOException, WebApplicationException {					
			         try {
			        	// final SaveToZipFile saver2 = new SaveToZipFile(wordMLPackage);	
			        	// saver.save(DIR_OUT+"merge.docx");
			        	// saver2.save(savePath);
			        	// WordprocessingMLPackage output = dbi.finish();
			        	 SaveToZipFile saver1 = new SaveToZipFile(wordMLPackage3);
			 			saver1.save(finalMerge);
			        	//System.out.println(mergePath);
			        	
			        	 
					} catch (Docx4JException e) {
						throw new WebApplicationException(e);
					}	
				}
			});

		builder.header("Content-Disposition", "attachment; filename=merge.docx");
		builder.type("application/vnd.openxmlformats-officedocument.wordprocessingml.document");
		
		return builder.build();
	
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println(e.getMessage());
		throw new WebApplicationException(
				new Docx4JException(e.getMessage(), e), 
				Status.INTERNAL_SERVER_ERROR);
	}
	
}

}