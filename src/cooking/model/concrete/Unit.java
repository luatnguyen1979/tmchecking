/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package cooking.model.concrete;

/**
 * @author Van Gia Luat Nguyen
 *
 */
public final class Unit {
	private String unitID;
	private String name;
	
	/**
	 * The type should be "Nutrition" or "Food"
	 */
	private String type;


	/**
	 * 
	 * @param unitID
	 * @param name
	 * @param type
	 */
	public Unit(String unitID, String name, String type) {
		this.unitID = unitID;
		this.name = name;
		this.type = type;
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
	 * @return the type
	 */
	public String getType() {
		return type;
	}


	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	
}
