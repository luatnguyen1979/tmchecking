/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package cooking.model.concrete;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author Van Gia Luat Nguyen
 *
 */
final public class ObjectUtilities {
	private static final String PATH = "src/data/";
	private static final String JSON_ADDRESS = "address.json";
	private static final String JSON_CATEGORY = "category.json";
	private static final String JSON_RECIPE = "recipe.json";
	private static final String JSON_UNIT = "unit.json";
	private static final String JSON_FOOD_COMPONENT = "foodcomponent.json";
	private static final String JSON_NUTRITION_FACT = "nutritionfact.json";
	private static final String JSON_PROFILE = "profile.json";
	private static final String JSON_USER = "user.json";

	/**
	 * 
	 */
	private ObjectUtilities() {
		// TODO Auto-generated constructor stub
	}

	public static List<Address> loadAddressData() {
		return loadObjectData(JSON_ADDRESS);

	}

	public static List<Category> loadCategoryData() {
		return loadObjectData(JSON_CATEGORY);

	}

	public static List<FoodComponent> loadFoodComponentData() {
		return loadObjectData(JSON_FOOD_COMPONENT);

	}

	public static List<NutritionFact> loadNutritionFactData() {
		return loadObjectData(JSON_NUTRITION_FACT);

	}

	public static List<Profile> loadProfileData() {
		return loadObjectData(JSON_PROFILE);

	}

	public static List<Recipe> loadRecipeData() {
		return loadObjectData(JSON_RECIPE);

	}

	public static List<Unit> loadUnitData() {
		return loadObjectData(JSON_UNIT);

	}

	public static List<Unit> loadUnitDataBy(String foodType) {
		List<Unit> units = loadObjectData(JSON_UNIT);
		List<Unit> newList = new ArrayList<Unit>();
		for (Unit unit : units) {
			if (foodType.equals(unit.getType())) {
				newList.add(unit);
			}
		}
		return newList;

	}

	public static List<User> loadUserData() {
		return loadObjectData(JSON_USER);

	}

	/*
	 * public static List<Address> loadAddressData() { ObjectMapper mapper = new
	 * ObjectMapper(); try { List<Address> list = mapper.readValue(new File(PATH +
	 * JSON_ADDRESS), new TypeReference<List<Address>>() { }); return list; } catch
	 * (JsonGenerationException e) { e.printStackTrace(); } catch
	 * (JsonMappingException e) { e.printStackTrace(); } catch (IOException e) {
	 * e.printStackTrace(); } return null; }
	 * 
	 * public static List<FoodComponent> loadFoodComponentData() { ObjectMapper
	 * mapper = new ObjectMapper(); try { List<FoodComponent> list =
	 * mapper.readValue(new File(PATH + JSON_FOOD_COMPONENT), new
	 * TypeReference<List<FoodComponent>>() { }); return list; } catch
	 * (JsonGenerationException e) { e.printStackTrace(); } catch
	 * (JsonMappingException e) { e.printStackTrace(); } catch (IOException e) {
	 * e.printStackTrace(); } return null; }
	 * 
	 * public static List<Category> loadCategoryData() { ObjectMapper mapper = new
	 * ObjectMapper(); try { List<Category> list = mapper.readValue(new File(PATH +
	 * JSON_CATEGORY), new TypeReference<List<Category>>() { }); return list; }
	 * catch (JsonGenerationException e) { e.printStackTrace(); } catch
	 * (JsonMappingException e) { e.printStackTrace(); } catch (IOException e) {
	 * e.printStackTrace(); } return null; }
	 * 
	 * 
	 * public static List<Profile> loadProfileData() { ObjectMapper mapper = new
	 * ObjectMapper(); try { List<Profile> list = mapper.readValue(new File(PATH +
	 * JSON_PROFILE), new TypeReference<List<Profile>>() { }); return list; } catch
	 * (JsonGenerationException e) { e.printStackTrace(); } catch
	 * (JsonMappingException e) { e.printStackTrace(); } catch (IOException e) {
	 * e.printStackTrace(); } return null;
	 * 
	 * }
	 */

	/*
	 * public static List<NutritionFact> loadNutritionFactData() { ObjectMapper
	 * mapper = new ObjectMapper(); try { List<NutritionFact> list =
	 * mapper.readValue(new File(PATH + JSON_NUTRITION_FACT), new
	 * TypeReference<List<NutritionFact>>() { }); return list; } catch
	 * (JsonGenerationException e) { e.printStackTrace(); } catch
	 * (JsonMappingException e) { e.printStackTrace(); } catch (IOException e) {
	 * e.printStackTrace(); } return null;
	 * 
	 * }
	 */

	public static Address getAddressByID(String ID) {
		List<Address> list = loadAddressData();
		for (Address item : list) {
			if (ID.equals(item.getAddressID())) {
				return item;
			}
		}
		return null;
	}

	public static Category getCategoryByID(String ID) {
		List<Category> list = loadCategoryData();
		for (Category item : list) {
			if (ID.equals(item.getCategoryID())) {
				return item;
			}
		}
		return null;
	}

	public static List<FoodComponent> getFoodComponentsByRecipeID(String ID) {
		List<FoodComponent> list = loadFoodComponentData();
		List<FoodComponent> newList = new ArrayList<FoodComponent>();
		for (FoodComponent item : list) {
			if (ID.equals(item.getRecipeID())) {
				newList.add(item);
			}
		}
		return newList;
	}

	public static List<NutritionFact> getNutritionFactsByFoodComponentID(String ID) {
		List<NutritionFact> list = loadNutritionFactData();
		List<NutritionFact> newList = new ArrayList<NutritionFact>();
		for (NutritionFact item : list) {
			if (ID.equals(item.getFoodComponentID())) {
				newList.add(item);
			}
		}
		return newList;
	}

	public static Profile getProfileID(String ID) {
		List<Profile> list = loadProfileData();
		for (Profile item : list) {
			if (ID.equals(item.getProfileID())) {
				return item;
			}
		}
		return null;
	}

	public static Recipe getRecipeID(String ID) {
		List<Recipe> list = loadRecipeData();
		for (Recipe item : list) {
			if (ID.equals(item.getRecipeID())) {
				return item;
			}
		}
		return null;
	}

	public static Unit getUnitID(String ID) {
		List<Unit> list = loadUnitData();
		for (Unit item : list) {
			if (ID.equals(item.getUnitID())) {
				return item;
			}
		}
		return null;
	}

	public static User getUserID(String ID) {
		List<User> list = loadUserData();
		for (User item : list) {
			if (ID.equals(item.getUserID())) {
				return item;
			}
		}
		return null;
	}

	// Update data

	public static void updateAddress(Address obj) {
		List<Address> list = loadAddressData();
		for (int i = 0; i < list.size(); i++) {
			if (obj.getAddressID().equals(list.get(i).getAddressID())) {
				list.set(i, obj);

			}
		}
		saveAddressData(list);

	}

	public static void updateCategory(Category obj) {
		List<Category> list = loadCategoryData();
		for (int i = 0; i < list.size(); i++) {
			if (obj.getCategoryID().equals(list.get(i).getCategoryID())) {
				list.set(i, obj);

			}
		}
		saveCategoryData(list);
	}

	public static void updateFoodComponent(FoodComponent obj) {
		List<FoodComponent> list = loadFoodComponentData();
		for (int i = 0; i < list.size(); i++) {
			if (obj.getRecipeID().equals(list.get(i).getRecipeID())
					&& obj.getUnitID().equals(list.get(i).getUnitID())) {
				list.set(i, obj);

			}
		}
		saveFoodComponentData(list);
	}

	public static void updateNutritionFact(NutritionFact obj) {
		List<NutritionFact> list = loadNutritionFactData();
		for (int i = 0; i < list.size(); i++) {
			if (obj.getFoodComponentID().equals(list.get(i).getFoodComponentID())
					&& obj.getUnitID().equals(list.get(i).getUnitID())) {
				list.set(i, obj);

			}
		}
		saveNutritionFactData(list);
	}

	public static void updateProfile(Profile obj) {
		List<Profile> list = loadProfileData();
		for (int i = 0; i < list.size(); i++) {
			if (obj.getProfileID().equals(list.get(i).getProfileID())) {
				list.set(i, obj);

			}
		}
		saveProfileData(list);
	}

	public static void updateRecipe(Recipe obj) {
		List<Recipe> list = loadRecipeData();
		for (int i = 0; i < list.size(); i++) {
			if (obj.getRecipeID().equals(list.get(i).getRecipeID())) {
				list.set(i, obj);

			}
		}

		saveRecipeData(list);
	}

	public static void updateUnit(Unit obj) {
		List<Unit> list = loadUnitData();
		for (int i = 0; i < list.size(); i++) {
			if (obj.getUnitID().equals(list.get(i).getUnitID())) {
				list.set(i, obj);

			}
		}
		saveUnitData(list);
	}

	public static void updateUser(User obj) {
		List<User> list = loadUserData();
		for (int i = 0; i < list.size(); i++) {
			if (obj.getUserID().equals(list.get(i).getUserID())) {
				list.set(i, obj);

			}
		}
		saveUserData(list);
	}

	// Adding Data

	public static void insertAddress(Address obj) {
		List<Address> list = loadAddressData();
		list.add(obj);
		saveAddressData(list);

	}

	public static void insertCategory(Category obj) {
		List<Category> list = loadCategoryData();
		list.add(obj);
		saveCategoryData(list);
	}

	public static void insertFoodComponent(FoodComponent obj) {
		List<FoodComponent> list = loadFoodComponentData();
		list.add(obj);
		saveFoodComponentData(list);
	}

	public static void insertNutritionFact(NutritionFact obj) {
		List<NutritionFact> list = loadNutritionFactData();
		list.add(obj);
		saveNutritionFactData(list);
	}

	public static void insertProfile(Profile obj) {
		List<Profile> list = loadProfileData();
		list.add(obj);
		saveProfileData(list);
	}

	public static void insertRecipe(Recipe obj) {
		List<Recipe> list = loadRecipeData();
		list.add(obj);

		saveRecipeData(list);
	}

	public static void insertUnit(Unit obj) {
		List<Unit> list = loadUnitData();
		list.add(obj);
		saveUnitData(list);
	}

	public static void insertUser(User obj) {
		List<User> list = loadUserData();
		list.add(obj);
		saveUserData(list);
	}

	// Removing data
	public static void removeAddress(String ID) {
		List<Address> list = loadAddressData();
		for (int i = 0; i < list.size(); i++) {
			if (ID.equals(list.get(i).getAddressID())) {
				list.remove(i);

			}
		}
		saveAddressData(list);
	}

	public static void removeCategory(String ID) {
		List<Category> list = loadCategoryData();
		for (int i = 0; i < list.size(); i++) {
			if (ID.equals(list.get(i).getCategoryID())) {
				list.remove(i);

			}
		}
		saveCategoryData(list);
	}

	public static void removeFoodComponent(String ID) {
		List<FoodComponent> list = loadFoodComponentData();
		for (int i = 0; i < list.size(); i++) {
			if (ID.equals(list.get(i).getRecipeID()) && ID.equals(list.get(i).getUnitID())) {
				list.remove(i);

			}
		}
		saveFoodComponentData(list);
	}

	public static void removeNutritionFact(String ID) {
		List<NutritionFact> list = loadNutritionFactData();
		for (int i = 0; i < list.size(); i++) {
			if (ID.equals(list.get(i).getFoodComponentID()) && ID.equals(list.get(i).getUnitID())) {
				list.remove(i);

			}
		}
		saveNutritionFactData(list);
	}

	public static void removeProfile(String ID) {
		List<Profile> list = loadProfileData();
		for (int i = 0; i < list.size(); i++) {
			if (ID.equals(list.get(i).getProfileID())) {
				list.remove(i);

			}
		}
		saveProfileData(list);
	}

	public static void removeRecipe(String ID) {
		List<Recipe> list = loadRecipeData();
		for (int i = 0; i < list.size(); i++) {
			if (ID.equals(list.get(i).getRecipeID())) {
				list.remove(i);

			}
		}
		saveRecipeData(list);
	}

	public static void removeUnit(String ID) {
		List<Unit> list = loadUnitData();
		for (int i = 0; i < list.size(); i++) {
			if (ID.equals(list.get(i).getUnitID())) {
				list.remove(i);

			}
		}
		saveUnitData(list);
	}

	public static void removeUser(String ID) {
		List<User> list = loadUserData();
		for (int i = 0; i < list.size(); i++) {
			if (ID.equals(list.get(i).getUserID())) {
				list.remove(i);

			}
		}
		saveUserData(list);
	}

	private static <T> ArrayList<T> loadObjectData(String fileName) {
		ObjectMapper mapper = new ObjectMapper();
		try {
			ArrayList<T> list = mapper.readValue(new File(PATH + fileName), new TypeReference<ArrayList<T>>() {
			});
			return list;
		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new ArrayList<T>();
	}

	public static void saveCategoryData(List<Category> list) {

		ObjectMapper mapper = new ObjectMapper();

		try {
			mapper.writeValue(new File(PATH + JSON_CATEGORY), list);

			System.out.println(list);

		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void saveRecipeData(List<Recipe> list) {

		ObjectMapper mapper = new ObjectMapper();

		try {
			mapper.writeValue(new File(PATH + JSON_RECIPE), list);

			System.out.println(list);

		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void saveAddressData(List<Address> list) {

		ObjectMapper mapper = new ObjectMapper();

		try {
			mapper.writeValue(new File(PATH + JSON_ADDRESS), list);

			System.out.println(list);

		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void saveFoodComponentData(List<FoodComponent> list) {

		ObjectMapper mapper = new ObjectMapper();

		try {
			mapper.writeValue(new File(PATH + JSON_FOOD_COMPONENT), list);

			System.out.println(list);

		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void saveNutritionFactData(List<NutritionFact> list) {

		ObjectMapper mapper = new ObjectMapper();

		try {
			mapper.writeValue(new File(PATH + JSON_NUTRITION_FACT), list);

			System.out.println(list);

		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void saveProfileData(List<Profile> list) {

		ObjectMapper mapper = new ObjectMapper();

		try {
			mapper.writeValue(new File(PATH + JSON_PROFILE), list);

			System.out.println(list);

		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void saveUnitData(List<Unit> list) {

		ObjectMapper mapper = new ObjectMapper();

		try {
			mapper.writeValue(new File(PATH + JSON_UNIT), list);

			System.out.println(list);

		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void saveUserData(List<User> list) {

		ObjectMapper mapper = new ObjectMapper();

		try {
			mapper.writeValue(new File(PATH + JSON_USER), list);

			System.out.println(list);

		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/*
	 * public static void saveCategoryData(List<T> list,Class cls) {
	 * 
	 * public void castDynamic(List<Object> objects, Class cls) { Class cls =
	 * Class.forName(className); cls.cast(object); }
	 * 
	 * List newList = new ArrayList();
	 * 
	 * for (Object object: list) { //newList.add(cls.cast(object));
	 * newList.add(T.class.cast(object)) }
	 * 
	 * ObjectMapper mapper = new ObjectMapper();
	 * 
	 * try {
	 * 
	 * 
	 * mapper.writeValue(new File(PATH + JSON_CATEGORY), list);
	 * System.out.println(newList);
	 * 
	 * } catch (JsonGenerationException e) { e.printStackTrace(); } catch
	 * (JsonMappingException e) { e.printStackTrace(); } catch (IOException e) {
	 * e.printStackTrace(); } }
	 */

	public static void saveData() {

		List<Category> list = loadCategoryData();
		for (Category category : list) {
			category.setDescription(category.getDescription() + "====Test");
		}

		/*
		 * Address address1[] = (Array[])list.toArray();
		 * address1.setAddress2("This is test Address 21"); Address address2 =
		 * (Address)list.get(0); address2.setAddress2("This is test Address 22");
		 */

		ObjectMapper mapper = new ObjectMapper();

		try {

			// }
			// Convert object to JSON string and save into a file directly
			mapper.writeValue(new File(PATH + JSON_CATEGORY), list);

			// Convert object to JSON string

			System.out.println(list);

		} catch (JsonGenerationException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
