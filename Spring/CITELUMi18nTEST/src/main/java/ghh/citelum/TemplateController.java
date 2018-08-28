package ghh.citelum;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.io.Files;

import ghh.citelum.ControllerUtils.ProjectsControllerMethods;
import ghh.citelum.model.Folders;
import ghh.citelum.model.Projects;
import ghh.citelum.model.ProjectsFolders;
import ghh.citelum.model.Template;
import ghh.citelum.service.FoldersService;
import ghh.citelum.service.ProjectsFoldersService;
import ghh.citelum.service.ProjectsService;
import ghh.citelum.service.StaffService;
import ghh.citelum.service.TemplateService;
import ghh.citelum.utils.ChaptersJsonArray;
import ghh.citelum.utils.FoldersJson;
import ghh.citelum.utils.FrontEndFilePaths;
import ghh.citelum.utils.LoginCredentials;
import ghh.citelum.utils.PermissionTypes;
import ghh.citelum.utils.WorkPath;

@Controller
public class TemplateController extends ProjectsControllerMethods {
	
	private ProjectsService projectsService;
	private FoldersService foldersService;
	private ProjectsFoldersService projectsFoldersService;
	private StaffService staffService;
	private TemplateService templateService;
	private Logger logger = Logger.getLogger(ProjectsController.class);
	
	private String currentTemplatePath = "";
	private String currentTemplate = "";
	private String currentFolderFather = "";
	private boolean folderFilesWillBeCopied = false;
	private boolean copyAllChilds = false;
	
	//======================== Front End Paths ========================
	FrontEndFilePaths frontEndFilePaths = new FrontEndFilePaths();
	
	private String projectFiles = frontEndFilePaths.getProjectFiles();
	private String templateFiles = frontEndFilePaths.getTemplateFiles();

	WorkPath workPath = new WorkPath();	
	private String path = WorkPath.getWorkPath();
	
	//======================== Setters Start ========================
	
	@Autowired(required=true)
	@Qualifier(value="projectsFoldersService")
	public void setProjectsFoldersService(ProjectsFoldersService pfs) {
		this.projectsFoldersService = pfs;
	}	

	@Autowired(required=true)
	@Qualifier(value="projectsService")
	public void setProjectsService(ProjectsService ps) {
		this.projectsService = ps;
	}

	@Autowired(required=true)
	@Qualifier(value="foldersService")
	public void setFoldersService(FoldersService fs) {
		this.foldersService = fs;
	}

	@Autowired(required=true)
	@Qualifier(value="staffService")
	public void setStaffService(StaffService ss) {
		this.staffService = ss;
	}
	
	@Autowired(required=true)
	@Qualifier(value="templateService")
	public void setTemplateService(TemplateService ts) {
		this.templateService = ts;
	}	

	//======================== Setters End ========================
	
	@RequestMapping(value = "/template_list", method = RequestMethod.GET)
	public String projectTemplateList(Model model) {
		
		model.addAttribute("template", 						new Template());
		model.addAttribute("listTemplate", 					this.templateService.listTemplate());
			
		
		
		Path p = Paths.get("template");
		
		System.out.println("********************************************************");
		System.out.println(p + " PATH-----------------");
		System.out.println("********************************************************");
		
		return templateFiles + "template_list";

	}
	
	@RequestMapping(value = "/template_create")
	public String templateCreate(Model model) {
		//Projects Attributes
		model.addAttribute("template", 							new Template());

		return templateFiles + "template_create";
	}
	
	@RequestMapping(value = "/add_template", method = RequestMethod.POST)
	public String addProject(@ModelAttribute("template") Template t, HttpServletRequest request) {
		
		if(t.getId() == 0) {
			//this.projectsService.addProject(t);
		} else {
			//this.projectsService.updateProject(t);
		}

		int id = t.getId();
		logger.info(id);

		return "redirect:../template_list";
	}
	
	@RequestMapping(value = "/delete_template={id}", method = RequestMethod.GET)
	public String deleteTemplate(@PathVariable("id") int id, @ModelAttribute("template") Template t) throws IOException {

		int templateId = id;
		
		this.templateService.removeTemplate(templateId);

		String directory = path + "template\\" + templateId;
		FileUtils.deleteDirectory(new File(directory));
		return "redirect:template_list";
	}
	
	@RequestMapping(value = "/project_template{id}_edit")
	public String editTemplate(@PathVariable("id") int id, Model model) {
		//Projects Attributes
		model.addAttribute("template", new Template());
		model.addAttribute("selectTemplateById", 				this.templateService.getTemplateById(id));
		model.addAttribute("listTemplate", 						this.templateService.listTemplate());
		model.addAttribute("getCurrentTemplateId", 				id);
		model.addAttribute("getCurrentTemplateName", 			this.templateService.getTemplateById(id).getTemplate_name());
		model.addAttribute("getCurrentTemplateCountry", 		this.templateService.getTemplateById(id).getCountry());

		//Folders Attributes
		model.addAttribute("folders", 							new Folders());
		model.addAttribute("listFolders", 						this.foldersService.listFolders());

		return templateFiles + "project_edit";
	}
	
	@RequestMapping(value = "/project_template", method = RequestMethod.GET)
	public String uploadFile(Model model, HttpServletRequest request) {
		
		try {
			//Get logged user
			LoginCredentials currentUser = (LoginCredentials) request.getSession().getAttribute("currentSessionCredentials");
			int currentUserPermission = currentUser.getPermissionLevel();
			int requiredPermission = PermissionTypes.getProjectManagerLevel();
			
			int userId= currentUser.getStaffId();
			
			model.addAttribute("getCurrentUserId", 			userId);
			System.out.println(currentUser.toString());
			System.out.println(currentUser.getName());
			System.out.println(currentUser.getPermissionLevel() + " permLevel");
			

			if ( !checkCurrentUserPermission(currentUserPermission, requiredPermission) ) {
				return "redirect:page_403";
			};
			
			
		} catch (NullPointerException e) {
			return "redirect:../";
		}
		
		
		ArrayList<Folders> listFolders = (ArrayList<Folders>) this.foldersService.listFolders();

		//Folders Attributes
		model.addAttribute("folders", 						new Folders());
		model.addAttribute("listFolders", 					listFolders);
		model.addAttribute("slashCharacter",				"\\");

		return templateFiles + "template";
	}

	@RequestMapping(value = "/updateBaseDocumentaire", method=RequestMethod.POST)
	@Consumes(MediaType.APPLICATION_JSON)
	public @ResponseBody String updateBaseDocumentaire(@RequestBody final ChaptersJsonArray foldersJsonArray, Model model) {
		
		ArrayList<String> parentsArray = new ArrayList<String>();
		int ordenationCount = 0;
		
		//String currentTemplate = path;
		
		List<Folders> listChaptersBeforeJson = this.foldersService.listFolders();
		
		for (Folders chapters : listChaptersBeforeJson ) {
			chapters.setInUse(false);
			this.foldersService.updateFolders(chapters);
			//this.foldersService.removeFolders(chapters.getId());
		}

		//-------------------------------------------

		for ( FoldersJson templateItems : foldersJsonArray.getFoldersArray() ) {
			
			ordenationCount++;
			
			//String TextWithNoWhiteSpaces = templateItems.getText().replaceAll("\\s+","");
			//templateItems.setText(TextWithNoWhiteSpaces);

			Folders f = new Folders();
			
			f.setOrdenation(ordenationCount);
			
			
			/*
			if ( templateItems.getType().equals("default") ) {
				if ( templateItems.getParent().equals("#") ) {
					
					System.out.println(templateItems.getText() + "   -*-**-*-*-*-*-*-*-*-*-*");
					File createFolder = new File(path + "template\\" + templateItems.getText());
					
					//createFolder.getPath();
					createFolder.mkdirs();
					f.setDir("#");
					
					
				} else {
					
					templateItems.getParent();
					
					f.setDir(templateItems.getLi_attr().getDir());
					
				}
			} else {
				
				f.setDir(templateItems.getLi_attr().getDir());
				
			}
			
			
			*/
			
			//Finds root folder to add current template path
			if ( templateItems.getParent().equals("#") && templateItems.getType().equals("default") ) {
				currentTemplatePath = path + "template\\";
				
				if ( folderFilesWillBeCopied ) {
					folderFilesWillBeCopied = false;
				}
				
				
				System.out.println("a");
				
				//creates folder in filesystem
				File checkIfFileExists = new File(currentTemplatePath + templateItems.getLi_attr().getPath());
				if ( !checkIfFileExists.exists() ) {
					checkIfFileExists.mkdirs();
					
					currentTemplatePath = path + "template\\" + templateItems.getLi_attr().getPath() + "\\";
					currentTemplate = templateItems.getText();
					
				}

				//sets current template variables
				if ( templateItems.getText().equals(templateItems.getLi_attr().getPath()) ) {
					currentTemplatePath = path + "template\\" + templateItems.getLi_attr().getPath() + "\\";
					currentTemplate = templateItems.getText();
					
					//check if root template folder is renamed
				} else if ( !templateItems.getText().equals(templateItems.getLi_attr().getPath()) ) {
					
					System.out.println("b");
					File fileNamePath = new File(path + "template\\" + templateItems.getLi_attr().getPath());
					File fileNameText = new File(path + "template\\" + templateItems.getText());
					
					System.out.println(fileNameText.getPath());
					System.out.println(fileNamePath.getPath());
					fileNamePath.renameTo(fileNameText);
					
					currentTemplatePath = path + "template\\" + templateItems.getLi_attr().getPath() + "\\";
					currentTemplate = templateItems.getLi_attr().getPath();
					
					templateItems.getLi_attr().setPath(templateItems.getText());
					
				} 
				
				System.out.println("c");
				
				
				f.setDir("root");
				
				//currentTemplatePath = path + "template\\" + templateItems.getText() + "\\";
				//currentTemplate = templateItems.getText();

			//Check if file is in root system
			} else if( templateItems.getParent().equals("#") && templateItems.getType().equals("file") ) {
				currentTemplatePath = path + "template\\";
				
				if ( folderFilesWillBeCopied ) {
					folderFilesWillBeCopied = false;
				}
				
				//currentTemplate = "root";
				//templateItems.getLi_attr().setDir("root");
				
				
				f.setDir("root");
			} else {
				f.setDir(templateItems.getLi_attr().getDir());
			}
			
			
			
			
			//Check if is new file, and gets the blank document template
			if ( templateItems.getLi_attr().isNewFile() && templateItems.getType().equals("file") ) {
				
				String documentName = templateItems.getText();
				//path;
								
				String filePath = path + "\\template\\";
				String blankDocumentPath = path + "\\utils\\blankDocument.docx";
				String tag = ".docx";
				
				try {
					
					File file 			= new File( filePath + documentName + tag);
					File blankDocument 	= new File( blankDocumentPath );
				
					if( !file.exists() ) {
		       	    	//System.out.println(file.getName() + "  file name");
		       	    	FileUtils.copyFile(blankDocument, file);
		       	    }
					
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				templateItems.setText(documentName);
				templateItems.getLi_attr().setPath(documentName);
				
			}
			
			
			//check if folder will be copied
			if ( !templateItems.getParent().equals("#") && templateItems.getType().equals("default") && templateItems.getLi_attr().isCopied() && !folderFilesWillBeCopied ) {
				
				currentFolderFather = templateItems.getText();
				folderFilesWillBeCopied = true;
				copyAllChilds = true;
				
			}
			
			
			//if is folder, the copy is not selected but foldersFilesWillBeCopied = true
			if ( !templateItems.getLi_attr().isCopied() && folderFilesWillBeCopied ) {
				
				//check if parent has already been seen,  then files will no longer be a child of a folder to be copied
				if ( !templateItems.getParent().equals(currentFolderFather) && parentsArray.contains(templateItems.getParent()) ) {
					folderFilesWillBeCopied = false;
					
				}
				
			}
			
			if ( !templateItems.getType().equals("default") && folderFilesWillBeCopied ) {
				templateItems.getLi_attr().setCopied(true);
			}
			
			
			
			
			
			
			
			System.out.println("--------------------------------------------------------------------");
			System.out.println(templateItems.getText() + " FILE NAME *********************************");
			System.out.println(currentTemplatePath + " Current template PATH *********************************");
			System.out.println(currentTemplate + " Current template *********************************");
			System.out.println(templateItems.getType() + " templateItems.getType() *********************************");
			System.out.println(templateItems.getLi_attr().getDir() + " Current dir *********************************");
			System.out.println(templateItems.getLi_attr().isCopied() + " Copied ******************************");
			System.out.println(templateItems.getParent() + " templateItems.getParent() ******************************");
			System.out.println(folderFilesWillBeCopied + " folderFilesWillBeCopied ******************************");
			
			System.out.println("--------------------------------------------------------------------");
			
			//moves files from one template folder to another if file is not copied nor in the root
			if ( 	!templateItems.getLi_attr().getDir().equals(currentTemplate) && 
					templateItems.getType().equals("file") && 
					!templateItems.getLi_attr().getDir().equals("root")	&& 
					!templateItems.getLi_attr().isCopied() && 
					!folderFilesWillBeCopied ) {
				
				System.out.println(1);
				
				File fileDir = new File(path + "template\\" + templateItems.getLi_attr().getDir() + "\\" + templateItems.getLi_attr().getPath() + ".docx");
				File fileCurrentTemplatePath = new File(currentTemplatePath + templateItems.getText() + ".docx");
				
				try {
					Files.move(fileDir, fileCurrentTemplatePath);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			//moves files from root folder to template folder
			} else if ( templateItems.getLi_attr().getDir().equals("root") && 
					templateItems.getType().equals("file") && 
					!templateItems.getLi_attr().isCopied() &&
					!templateItems.getParent().equals("#") && 
					!folderFilesWillBeCopied ) {
				
				System.out.println(2);

				File fileDir = new File(path + "template\\" + templateItems.getLi_attr().getPath() + ".docx");
				File destinationFile = new File(currentTemplatePath + templateItems.getText() + ".docx");
				
				
				
				
				
				//check if files have the same name
				if ( destinationFile.exists() ) {
					int copyNumber = 0;
					boolean checkIfFileExists = false;
				
					//fileDir = new File(path + "template\\" + templateItems.getLi_attr().getDir() + "\\" + templateItems.getLi_attr().getPath() + ".docx");
					//destinationFile = new File(path + "template\\" + templateItems.getLi_attr().getDir() + "\\" + templateItems.getLi_attr().getPath() + ".docx");
					
						
					
					do {
						checkIfFileExists = false;
						copyNumber++;
						destinationFile = new File(currentTemplatePath + templateItems.getLi_attr().getPath() + " copy (" + copyNumber + ")" + ".docx");
						//File copiedFile 	= new File(currentTemplatePath + templateItems.getLi_attr().getPath() + " copy (" + copyNumber + ")" + ".docx");
						
						if ( destinationFile.exists() ) {
							checkIfFileExists = true;
						}
						
					} while (checkIfFileExists);
						
					destinationFile = new File(currentTemplatePath + templateItems.getLi_attr().getPath() + " copy (" + copyNumber + ")" + ".docx");
					
					String newName = templateItems.getLi_attr().getPath() + " copy (" + copyNumber + ")";
					

					templateItems.getLi_attr().setPath(newName);
					templateItems.setText(newName);
					
					}
					
				
				
				
				
				f.setDir(currentTemplate);
				try {
					Files.move(fileDir, destinationFile);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				
				
				
				
				
				
				
				
			//moves files from template folder to root folder
			} else if ( templateItems.getParent().equals("#") && 
					templateItems.getType().equals("file") && 
					!templateItems.getLi_attr().isCopied() && 
					!folderFilesWillBeCopied ) {

				System.out.println(3);
				
				File fileCurrentTemplatePath = new File(path + "template\\" + templateItems.getLi_attr().getDir() + "\\" + templateItems.getLi_attr().getPath() + ".docx");
				File fileDir = new File(path + "template\\" + templateItems.getLi_attr().getPath() + ".docx");
				
				try {
					Files.move(fileCurrentTemplatePath, fileDir);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				if ( !templateItems.getText().equals(templateItems.getLi_attr().getPath()) ) {
					
					
					File fileNamePath = new File(path + "template\\" + templateItems.getLi_attr().getPath() + ".docx");
					File fileNameText = new File(path + "template\\" + templateItems.getText() + ".docx");
					
					/*
					System.out.println("RENAMING ================================================");
					System.out.println(fileNamePath.getPath() + "path one -------------------");
					System.out.println(fileNameText.getPath() + "path two -------------------");
					*/
					fileNamePath.renameTo(fileNameText);
					
					f.setPath(templateItems.getText());
					/*
					System.out.println("RENAMING ================================================");
					*/
				}
				
			}
			
			
			//Check if a file is copied in the same template folder, or from one to another
			if ( templateItems.getType().equals("file") && templateItems.getLi_attr().isCopied()) {
				
				//Same template folder
				if ( templateItems.getLi_attr().getCopiedDir().equals(currentTemplate) ) {
					
					//check if files have the same name
					if ( templateItems.getText().equals(templateItems.getLi_attr().getPath()) ) {
						File defaultFile = new File(path + "template\\" + templateItems.getLi_attr().getDir() + "\\" + templateItems.getLi_attr().getPath() + ".docx");
						int copyNumber = 0;
						boolean checkIfFileExists = false;
						
						do {
							checkIfFileExists = false;
							copyNumber++;
							File copiedFile 	= new File(currentTemplatePath + templateItems.getLi_attr().getPath() + " copy (" + copyNumber + ")" + ".docx");
							
							if ( copiedFile.exists() ) {
								checkIfFileExists = true;
							}
							
						} while (checkIfFileExists);
							
						File copiedFile 	= new File(currentTemplatePath + templateItems.getLi_attr().getPath() + " copy (" + copyNumber + ")" + ".docx");
						
						String newName = templateItems.getLi_attr().getPath() + " copy (" + copyNumber + ")";
						
						templateItems.getLi_attr().setPath(newName);
						templateItems.setText(newName);
						
						try {
							Files.copy(defaultFile, copiedFile);
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						
					}
					
					//File defaultFile	= new File(currentTemplatePath + templateItems.getLi_attr().getPath() + ".docx");
					
					
				} else {
					
					File defaultFile;
					
					if ( templateItems.getLi_attr().getCopiedDir().equals("rootFile") ) {
						
						defaultFile	= new File(path + "template\\" + templateItems.getLi_attr().getPath() + ".docx");
					} else {
						
						defaultFile	= new File(path + "template\\" + templateItems.getLi_attr().getCopiedDir() + "\\" + templateItems.getLi_attr().getPath() + ".docx");
						
					}
					
					int copyNumber = 0;
					boolean checkIfFileExists = false;
					
					File copiedFile 	= new File(currentTemplatePath + templateItems.getText() + ".docx");
					String newName = templateItems.getText();
					
					if ( copiedFile.exists() ) {
						
					
					do {
						checkIfFileExists = false;
						copyNumber++;
						copiedFile 	= new File(currentTemplatePath + templateItems.getText() + " copy (" + copyNumber + ")" + ".docx");
						
						if ( copiedFile.exists() ) {
							checkIfFileExists = true;
						}
						
					} while (checkIfFileExists);
					
					copiedFile 	= new File(currentTemplatePath + templateItems.getText() + " copy (" + copyNumber + ")" + ".docx");
					

					newName = templateItems.getText() + " copy (" + copyNumber + ")";
					
					}
					
					templateItems.getLi_attr().setPath(newName);
					templateItems.setText(newName);
					
					try {
						Files.copy(defaultFile, copiedFile);
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					
					
					
				}
				
				//check is in same template
				
				//if yes, change name
			
				/*
				File fileDir = new File(path + "template\\" + templateItems.getLi_attr().getDir() + "\\" + templateItems.getLi_attr().getPath() + ".docx");
				File fileCurrentTemplatePath = new File(currentTemplatePath + templateItems.getText() + ".docx");
				
				try {
					Files.move(fileDir, fileCurrentTemplatePath);
				} catch (IOException e) {
					e.printStackTrace();
				}
				*/
				
				
			}
			
			System.out.println(templateItems.getText().equals(templateItems.getLi_attr().getPath()) + "|||||||||||||||||_________________________________________________________||||||||||||||||||||||||||||||||||");
			
			//Rename files on /template folder if description != path
			if ( !templateItems.getText().equals(templateItems.getLi_attr().getPath()) && templateItems.getType().equals("file") ) {
				
				
				File fileNamePath = new File(currentTemplatePath + templateItems.getLi_attr().getPath() + ".docx");
				File fileNameText = new File(currentTemplatePath + templateItems.getText() + ".docx");
				
				System.out.println("RENAMING ================================================");
				System.out.println(fileNamePath.getPath() + "path one -------------------");
				System.out.println(fileNameText.getPath() + "path two -------------------");
				
				fileNamePath.renameTo(fileNameText);
				
				f.setPath(templateItems.getText());
				
				System.out.println("RENAMING ================================================");
				
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			/*
			File checkIfFileExists = new File(currentTemplatePath + templateItems.getLi_attr().getPath() +".docx");
			
			if ( !checkIfFileExists.exists() && templateItems.getType().equals("file") ) {
				
				
				//String documentName = templateItems.getLi_attr().getPath();
				String documentName = templateItems.getText();
				String path = WorkPath.getWorkPath();
				
				
				String filePath = currentTemplatePath;
				String blankDocumentPath = path + "folders\\utils\\blankDocument.docx";
				String tag = ".docx";

				try {
					
						File file 			= new File( filePath + documentName + tag);
						File blankDocument 	= new File( blankDocumentPath );
					
						if( !file.exists() ) {
			       	    	//System.out.println(file.getName() + "  file name");
			       	    	FileUtils.copyFile(blankDocument, file);
			       	    }
						
					} catch (IOException e) {
						e.printStackTrace();
				}  
				
				//templateItems.getLi_attr().setPath(documentName);
				templateItems.setText(documentName);
				templateItems.getLi_attr().setPath(documentName);
	
			}
			*/
			
			
			
			
			
			
			
			/*
			//Rename files on /template if description != path
			if ( !templateItems.getText().equals(templateItems.getLi_attr().getPath()) && templateItems.getType().equals("file") ) {
				File file = new File(path + "folders\\template\\" + templateItems.getLi_attr().getPath() +".docx");
				File file2 = new File(path + "folders\\template\\" + templateItems.getText() +".docx");


				file.renameTo(file2);
				
			}
			*/
			
			f.setInUse(true);
			f.setNode_id(templateItems.getId());
			f.setParent(templateItems.getParent());
			f.setDescription(templateItems.getText());
			f.setPath(templateItems.getText());
			f.setDescription(templateItems.getText());
			
			
			
			//-------------
			
			parentsArray.add( templateItems.getParent() );
			
			//-------------
				
			if ( templateItems.getType().equals("default") ) {
				f.setIs_file(0);
			} else if ( templateItems.getType().equals("file") ) {
				f.setIs_file(1);
			}	
			//this.foldersService.addFolders(f);

			
			if ( templateItems.getLi_attr().getIdentity() != 0 ) {
				f.setId(templateItems.getLi_attr().getIdentity());
				
				this.foldersService.updateFolders(f);
			} else {
				this.foldersService.addFolders(f);
			}
			
			//this.foldersService.addFolders(f);
			
		}  // for each end
		
		List<Folders> listChaptersAfterJson = this.foldersService.listFolders();
		
		for (Folders templateItemsAfterUpdate : listChaptersAfterJson) {	
			
			if ( !templateItemsAfterUpdate.isInUse() && templateItemsAfterUpdate.getIs_file() == 1 ) {
				
				String fileName = templateItemsAfterUpdate.getPath();
				String filePath = "";
				
				if ( templateItemsAfterUpdate.getDir().equals("root") ) {
					System.out.println("********");
					filePath = path + "template\\";
				} else {
					System.out.println("ELSE ********");
					System.out.println(templateItemsAfterUpdate.getDir() + "  DIR");
					filePath = path + "template\\" + templateItemsAfterUpdate.getDir() + "\\";
				}
				
				//try {
					File file = new File(filePath + fileName + ".docx");
							
					System.out.println("??????????????????????????????????????????????????????????????????????????????????===============");
					System.out.println(file.getPath());
					System.out.println("??????????????????????????????????????????????????????????????????????????????????===============");
				//} catch (/*NoSuchFileException x*/ IOException e) {
				   // System.err.format("%s: no such" + " file or directory%n", path);
				//}
					file.delete();
				
				this.foldersService.removeFolders(templateItemsAfterUpdate.getId());
			}
			
			
		}

		for (Folders templateItemsAfterUpdate : listChaptersAfterJson) {
			
			if ( !templateItemsAfterUpdate.isInUse() && 
					templateItemsAfterUpdate.getIs_file() == 0 && 
					templateItemsAfterUpdate.getDir().equals("root") ) {
				
				String fileName = templateItemsAfterUpdate.getPath().trim();
				
				String filePath = path + "template\\";
				
				//try {
					File file = new File(filePath + fileName);
							
					System.out.println("??????????????????????????????????????????????????????????????????????????????????");
					System.out.println(file.getPath());
					System.out.println("??????????????????????????????????????????????????????????????????????????????????");
					
				    file.delete();
				//} catch (/*NoSuchFileException x*/ IOException e) {
				   // System.err.format("%s: no such" + " file or directory%n", path);
				//}
				
				this.foldersService.removeFolders(templateItemsAfterUpdate.getId());

			}
		
		if ( !templateItemsAfterUpdate.isInUse() && templateItemsAfterUpdate.getIs_file() == 0 && !templateItemsAfterUpdate.getDir().equals("root") ) {
			
			this.foldersService.removeFolders(templateItemsAfterUpdate.getId());
		}
		
		}
		
		return "redirect:upload";
	}
	
	@RequestMapping(value = "/uploadme", method = RequestMethod.POST)
	public String addProject(@ModelAttribute("folders") Folders f) {

		return templateFiles + "UploadFile";
	}
	
	@RequestMapping(value = "/uploaded", method = RequestMethod.POST)
	public String projected(@ModelAttribute("folders") Folders f) {
		
		f.setDir("root");
		
		if(f.getId() == 0) {
			this.foldersService.addFolders(f);
		} else {
			this.foldersService.updateFolders(f);
		}

		return "redirect:project_template";
	}
	
	@RequestMapping(value = "/addBlankDocumentFile", method = RequestMethod.POST)
	//@Consumes(MediaType.APPLICATION_JSON)
	public @ResponseBody String addBlankDocumentFile(@RequestBody String documentName, Model model) {
		
		//System.out.println(documentName + "  DOCUMENT NAMEEEEEEEE ----------------------------------------------------");
		
		String path = WorkPath.getWorkPath();
		String filePath = path + "folders\\template\\";
		String blankDocumentPath = path + "folders\\utils\\blankDocument.docx";
		String tag = ".docx";

		try {
			
				File file 			= new File( filePath + documentName + tag);
				File blankDocument 	= new File( blankDocumentPath );
			
				if( !file.exists() ) {
	       	    	//System.out.println(file.getName() + "  file name");
	       	    	FileUtils.copyFile(blankDocument, file);
	       	    }
				
			} catch (IOException e) {
				e.printStackTrace();
		}  
		
		return "---- no need for this return ----";

	}
	
	
	
	
	
	
	
	
	

}
