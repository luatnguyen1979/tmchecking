/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package cooking.model.concrete;

import java.util.ArrayList;
import java.util.List;

import cooking.model.concrete.interfaces.*;

/**
 * @author Van Gia Luat Nguyen
 *
 */
public final class FoodComponent implements IUnit {

	private String recipeID;
	private String unitID;
	private String name;
	private double quantity;
	private List <String> nutritionFactIDsList;
	
	/**
	 * 
	 * @param recipeID
	 * @param unitID
	 * @param name
	 * @param quantity
	 */
	public FoodComponent(String recipeID, String unitID, String name, double quantity) {
		this.recipeID = recipeID;
		this.unitID = unitID;
		this.name = name;
		this.quantity = quantity;
		
	}

	/**
	 * @return the recipeID
	 */
	public String getRecipeID() {
		return recipeID;
	}

	/**
	 * @param recipeID the recipeID to set
	 */
	public void setRecipeID(String recipeID) {
		this.recipeID = recipeID;
	}

	/**
	 * @return the unitID
	 */
	public String getUnitID() {
		return unitID;
	}

	/**
	 * @param unitID the unitID to set
	 */
	public void setUnitID(String unitID) {
		this.unitID = unitID;
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
	 * @return the quantity
	 */
	public double getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	
	public NutritionFact getNutritionFact() {
		return null;
	}

	/**
	 * @return the nutritionFactIDsList
	 */
	public List<String> getNutritionFactIDsList() {
		return nutritionFactIDsList;
	}

	/**
	 * @param nutritionFactIDsList the nutritionFactIDsList to set
	 */
	public void setNutritionFactIDsList(List<String> nutritionFactIDsList) {
		this.nutritionFactIDsList = nutritionFactIDsList;
	}

	/* (non-Javadoc)
	 * @see cookingsystem.concrete.interfaces.IUnit#getUnitsList()
	 */
	@Override
	public List<Unit> getUnitsList() {
		
		return new ArrayList<Unit>();
	}
}
