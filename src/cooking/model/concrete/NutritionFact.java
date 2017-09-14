/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package cooking.model.concrete;

import java.util.ArrayList;
import java.util.List;

import cooking.model.concrete.interfaces.IUnit;

/**
 * @author Van Gia Luat Nguyen
 *
 */
public class NutritionFact implements IUnit {
	
	private String foodComponentID;
	private String unitID;
	private String name;
	private double quantity;

	/**
	 * 
	 */
	public NutritionFact(String foodComponentID, String unitID, String name, double quantity) {
		this.foodComponentID = foodComponentID;
		this.unitID = unitID;
		this.name = name;
		this.quantity = quantity;
		
	}

	/**
	 * @return the nutritionFactID
	 */
	public String getFoodComponentID() {
		return foodComponentID;
	}

	/**
	 * @param nutritionFactID the nutritionFactID to set
	 */
	public void setNutritionFactID(String nutritionFactID) {
		this.foodComponentID = nutritionFactID;
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
	
	@Override
	public List<Unit> getUnitsList() {
		
		return new ArrayList<Unit>();
	}

}
