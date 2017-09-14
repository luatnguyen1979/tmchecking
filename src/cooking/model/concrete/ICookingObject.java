/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package cooking.model.concrete;

import java.io.File;
import java.io.IOException;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @author Van Gia Luat Nguyen
 *
 */
public interface ICookingObject {
	public void updateData(Object object);
	public Object loadData();
	
	public void writeJSON() throws JsonGenerationException, JsonMappingException, IOException;

	   public void readJSON() throws JsonParseException, JsonMappingException, IOException;
}
