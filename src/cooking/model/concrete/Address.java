/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package cooking.model.concrete;

/**
 * @author Van Gia Luat Nguyen
 *
 */
public class Address {
	private static final String DATA_FILE = "address.json";
	private String addressID;
	private String address1;
	private String address2;
	private String city;
	private String zipcode;
	private String state;
	private String country;
	
	public Address() {
		
	}
	/**
	 * 
	 * @param addressID
	 * @param address1
	 * @param address2
	 * @param city
	 * @param zipcode
	 * @param state
	 * @param country
	 */
	public Address(String addressID, String address1, String address2, String city, String zipcode, String state, String country) {
		this.addressID = addressID;
		this.address1 = address1;
		this.address2 = address2;
		this.city = city;
		this.zipcode = zipcode;
		this.state = state;
		this.country = country;
		
	}

	/**
	 * @return the addressID
	 */
	public String getAddressID() {
		return addressID;
	}

	/**
	 * @param addressID the addressID to set
	 */
	public void setAddressID(String addressID) {
		this.addressID = addressID;
	}

	/**
	 * @return the address1
	 */
	public String getAddress1() {
		return address1;
	}

	/**
	 * @param address1 the address1 to set
	 */
	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	/**
	 * @return the address2
	 */
	public String getAddress2() {
		return address2;
	}

	/**
	 * @param address2 the address2 to set
	 */
	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	/**
	 * @return the city
	 */
	public String getCity() {
		return city;
	}

	/**
	 * @param city the city to set
	 */
	public void setCity(String city) {
		this.city = city;
	}

	/**
	 * @return the zipcode
	 */
	public String getZipcode() {
		return zipcode;
	}

	/**
	 * @param zipcode the zipcode to set
	 */
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	/**
	 * @return the state
	 */
	public String getState() {
		return state;
	}

	/**
	 * @param state the state to set
	 */
	public void setState(String state) {
		this.state = state;
	}

	/**
	 * @return the country
	 */
	public String getCountry() {
		return country;
	}

	/**
	 * @param country the country to set
	 */
	public void setCountry(String country) {
		this.country = country;
	}

	/* (non-Javadoc)
	 * @see cookingsystem.concrete.ICookingObject#updateData(java.lang.Object)
	 */
	/*@Override
	public void updateData(Object object) {
		// TODO Auto-generated method stub
		
	}*/

	/* (non-Javadoc)
	 * @see cookingsystem.concrete.ICookingObject#loadData()
	 */
	/*@Override
	public Object loadData() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	private void writeJSON() throws JsonGenerationException, JsonMappingException, IOException{
		Student student
	      ObjectMapper mapper = new ObjectMapper();	
	      mapper.writeValue(new File("student.json"), student);
	   }

	   private void readJSON() throws JsonParseException, JsonMappingException, IOException{
	      ObjectMapper mapper = new ObjectMapper();
	      Address address = mapper.readValue(new File(DATA_FILE), Address.class);
	      return student;
	   }*/

}
