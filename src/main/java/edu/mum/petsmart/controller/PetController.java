/**
 * This the java source code of Cooking System @ MPP class, 2017
 */
package edu.mum.petsmart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Van Gia Luat Nguyen
 *
 */

@Controller
public class PetController {

	@RequestMapping(value= {"", "/"}, method=RequestMethod.GET)
	public String welcome() {
		return "welcome";
	}

}
