package ghh.citelum.utils;

import java.io.Serializable;
import java.util.ArrayList;

public class ChaptersJsonArray implements Serializable{

	private static final long serialVersionUID = 1L;
/*
	private ArrayList<ChaptersJson> array = new ArrayList<ChaptersJson>();

	public ArrayList<ChaptersJson> getChaptersJsonsArray() {
		return array;
	}

	public void setChaptersJsonsArray(ArrayList<ChaptersJson> chaptersJsonsArray) {
		this.array = chaptersJsonsArray;
	}
*/
	
	private ArrayList<ChaptersJson> chaptersArray = new ArrayList<ChaptersJson>();
	private ArrayList<FoldersJson> foldersArray = new ArrayList<FoldersJson>();

	
	public ArrayList<ChaptersJson> getChaptersArray() {
		return chaptersArray;
	}

	public void setChaptersArray(ArrayList<ChaptersJson> chaptersArray) {
		this.chaptersArray = chaptersArray;
	}

	
	
	public ArrayList<FoldersJson> getFoldersArray() {
		return foldersArray;
	}

	public void setFoldersArray(ArrayList<FoldersJson> foldersArray) {
		this.foldersArray = foldersArray;
	}

	



	//public void setCoiso(ArrayList<ChaptersJson> coiso) {
		//this.coiso = coiso;
	//}
	
	
	
	
}