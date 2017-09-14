/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package cooking.model.concrete;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Van Gia Luat Nguyen
 *
 */
public final class Category {
	private String categoryID;
	private String name;
	private String description;
	private List<Recipe> recipesList;

	/**
	 * 
	 */
	public Category() {
		
	}
	/**
	 * 
	 * @param categoryID
	 * @param name
	 * @param description
	 */
	public Category(String categoryID, String name, String description) {
		this.categoryID = categoryID;
		this.name = name;
		this.description = description;
		this.recipesList = new ArrayList<Recipe>();
	}

	/**
	 * @return the categoryID
	 */
	public String getCategoryID() {
		return categoryID;
	}

	/**
	 * @param categoryID the categoryID to set
	 */
	public void setCategoryID(String categoryID) {
		this.categoryID = categoryID;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the recipesList
	 */
	public List<Recipe> getRecipesList() {
		return recipesList;
	}

	/**
	 * @param recipesList the recipesList to set
	 */
	public void setRecipesList(List<Recipe> recipesList) {
		this.recipesList = recipesList;
	}
	
	

}
