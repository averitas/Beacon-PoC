package com.web.beacon;

import java.text.DateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.web.beacon.model.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BeaconController {
	
	@Autowired
	private PatientDAO pdao;
	@Autowired
	private UserDAO udao;
	
	private static final Logger logger = LoggerFactory.getLogger(BeaconController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String homePage(HttpServletRequest request, HttpServletResponse response){
	
		return "redirect:/jump";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String home() {
		return "admin";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginPage(){
		return "login";
	}
	
	@RequestMapping(value={"/logout"}, method=RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if(auth!=null){
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/login?logout";
	}
	
	@RequestMapping(value="/editsave", method=RequestMethod.POST)
	public ModelAndView editsave(@ModelAttribute("emp")Patient emp){
		pdao.updatePatient(emp);
		return new ModelAndView("userpage","command",emp);
	}
	
	@RequestMapping(value="/jump", method=RequestMethod.GET)
	public ModelAndView jumpPage(HttpServletRequest request, HttpServletResponse response){
		Collection<? extends GrantedAuthority> auth = SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		String uname = SecurityContextHolder.getContext().getAuthentication().getName();
		if(auth.toString().equals("[ROLE_ADMIN]")){
			return new ModelAndView("redirect:/admin");
		}else{
			Patient emp = pdao.getPat(uname);
			return new ModelAndView("userpage","command",emp);
		}
		
	}
	
	@RequestMapping(value="/addUser", method=RequestMethod.GET)
	public String addUser(){
		return "addU";
	}
	
	@RequestMapping(value="/addPatient", method=RequestMethod.GET)
	public String addPatient(){
		return "addP";
	}
	
	@RequestMapping(value="/delPatient", method=RequestMethod.GET)
	public String deletePatient(){
		return "delP";
	}
	
	@RequestMapping(value="/access_Denied", method=RequestMethod.GET)
	public String accessDeniedPage(ModelMap model){
		model.addAttribute("user", getPrincipal());
		return "accessDenied";
	}
	
	@RequestMapping(value = "/patients", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<Patient>> listAllPatients() {
		List<Patient> users = pdao.getAllPats();
	    if(users.isEmpty()){
	    	return new ResponseEntity<List<Patient>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
	    }
	    return new ResponseEntity<List<Patient>>(users, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/users", method = RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<List<User>> listAllUsers() {
		List<User> users = udao.getAllUsers();
	    if(users.isEmpty()){
	    	return new ResponseEntity<List<User>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
	    }
	    return new ResponseEntity<List<User>>(users, HttpStatus.OK);
	}
	
	@RequestMapping(value="/patient/{id}", method=RequestMethod.GET, produces={"application/json"})
	@ResponseBody
	public ResponseEntity<Patient> getPatient(@PathVariable("id") String id){
		Patient p = pdao.getPat(id);
		if(p==null){
			return new ResponseEntity<Patient>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<Patient>(p, HttpStatus.OK);
	}
	
	@RequestMapping(value="/user/{id}", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<User> getUser(@PathVariable("id") String id){
		User p = udao.getUserById(id);
		if(p==null){
			return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<User>(p, HttpStatus.OK);
	}
	
	@RequestMapping(value="/add/user", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<User> createUser(@RequestBody User user){
		User u = udao.getUser(user);
		if(u!=null){
			return new ResponseEntity<User>(HttpStatus.NOT_ACCEPTABLE);
		}else{
			udao.saveUser(user);
		}
		return new ResponseEntity<User>(user,HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/add/patient", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Patient> createPatient(@RequestBody Patient patient){
		Patient p = pdao.getPat(patient.getUname());
		if(p!=null){
			return new ResponseEntity<Patient>(HttpStatus.NOT_ACCEPTABLE);
		}
		try{
			CustomMailSender.sendMail(patient.getEmail(), "Your patient "+patient.getFname()+" "+patient.getLname()+" has been created!");
			pdao.savePatient(patient);
		}catch(Exception e){
			e.printStackTrace();
			return new ResponseEntity<Patient>(HttpStatus.NOT_ACCEPTABLE);
		}
        
		return new ResponseEntity<Patient>(patient,HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/edit/user", method=RequestMethod.PUT)
	@ResponseBody
	public ResponseEntity<User> editUser(@RequestBody User user){
		User u = udao.getUser(user);
		if(u==null){
			return new ResponseEntity<User>(HttpStatus.NOT_ACCEPTABLE);
		}else{
			udao.updateUser(user);
		}
		return new ResponseEntity<User>(user, HttpStatus.ACCEPTED);
	}
	
	@RequestMapping(value="/delete/user/{id}", method=RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<User> delUser(@PathVariable("id") String id){
		User u = udao.getUserById(id);
		if(u==null){
			return new ResponseEntity<User>(HttpStatus.NOT_ACCEPTABLE);
		}else{
			udao.deleteUser(u);
		}
		return new ResponseEntity<User>(u, HttpStatus.ACCEPTED);
	}
	
	@RequestMapping(value="/edit/patient", method=RequestMethod.PUT)
	@ResponseBody
	public ResponseEntity<Patient> editPatient(@RequestBody Patient patient){
		Patient p = pdao.getPat(patient.getUname());
		if(p==null){
			return new ResponseEntity<Patient>(HttpStatus.NOT_ACCEPTABLE);
		}else{
			pdao.updatePatient(patient);
		}
		return new ResponseEntity<Patient>(patient, HttpStatus.ACCEPTED);
	}
	
	@RequestMapping(value="/delete/patient/{id}", method=RequestMethod.DELETE)
	@ResponseBody
	public ResponseEntity<Patient> delPatient(@PathVariable("id") String id){
		Patient p = pdao.getPat(id);
		if(p==null){
			return new ResponseEntity<Patient>(HttpStatus.NOT_ACCEPTABLE);
		}else{
			pdao.deletePatient(p);
		}
		return new ResponseEntity<Patient>(p, HttpStatus.ACCEPTED);
	}
	
	private String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		if(principal instanceof UserDetails){
			userName = ((UserDetails)principal).getUsername();
		}else{
			userName= principal.toString();
		}
		return userName;
	}
	
	
}
