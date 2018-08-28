package ghh.citelum;

import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ghh.citelum.model.Folders;
import ghh.citelum.service.FoldersService;
import ghh.citelum.service.FoldersServiceImpl;

@Controller
public class FoldersController {

	private FoldersService foldersService;
	
	//======================== Setters Start ========================
	@Autowired(required=true)
	@Qualifier(value="foldersService")
	public void setFoldersService(FoldersService fs) {
		this.foldersService = fs;
	}
	
	//======================== Setters End ========================
	
	//For add and update person both
	@RequestMapping(value= "/folders/add", method = RequestMethod.POST)
	public String addFolders(@ModelAttribute("folders") Folders f) {
		if(f.getId() == 0) {
			//new person, add it
			this.foldersService.addFolders(f);
		} else {
			//existing person, call update
			this.foldersService.updateFolders(f);
		}
		return "redirect:/api/persons";
	}
	
	@RequestMapping("/removeFolders/{id}")
	public String removeFolders(@PathVariable("id") int id) {
		this.foldersService.removeFolders(id);
		
		return "redirect:/api/persons";
	}
	
	@RequestMapping("/editFolders/{id}")
	public String editFolders(@PathVariable("id") int id, Model model) {
		model.addAttribute("folders", 							this.foldersService.getFolders(id));
		model.addAttribute("listFolders", 						this.foldersService.listFolders());
		
		return "persons";
	}
	
}
