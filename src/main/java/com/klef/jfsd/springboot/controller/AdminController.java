package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Donation;
import com.klef.jfsd.springboot.model.Donor;
import com.klef.jfsd.springboot.model.Recipient;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.DonationService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController
{
	 @Autowired 
	 private AdminService adminService; 
	   
	 @Autowired
	 public DonationService donationService;
	 
	 
	 
	 @GetMapping("adminhome")
     public ModelAndView adminhome()
        {
          ModelAndView mv = new ModelAndView();
          mv.setViewName("adminhome");
          return mv;
        }
	 
	 @GetMapping("adminlogin") 
	 public ModelAndView adminlogin() 
	 { 
	   ModelAndView mv = new ModelAndView(); 
	   mv.setViewName("adminlogin"); 
	   return mv; 
	 } 
	 
	 
	 @PostMapping("checkadminlogin") 
     //@ResponseBody 
     public ModelAndView checkadminlogin(HttpServletRequest request) 
     { 
      ModelAndView mv = new ModelAndView(); 
       
     String auname = request.getParameter("auname"); 
     String apwd = request.getParameter("apwd"); 
       
     Admin admin = adminService.checkadminlogin(auname, apwd); 
      
     if(admin!=null) 
     { 
    	// Session Management
     	
     	HttpSession session = request.getSession();
     	session.setAttribute("admin",admin);//employee is session variable
     	
     	session.setMaxInactiveInterval(50);//removing session after 5 seconds
      //return "Admin Login Success"; 
      mv.setViewName("adminhome"); 
      
     } 
     else 
     { 
      //return "Admin Login Fail"; 
      mv.setViewName("adminloginfail"); 
      mv.addObject("message","Login Failed"); 
     }     
     return mv;       
     } 
	 
	 @GetMapping("adminlogout") 
     public ModelAndView adminlogout(HttpServletRequest request) 
     { 
		 
	HttpSession session = request.getSession();
			
	session.removeAttribute("admin"); 
			 
		 
       ModelAndView mv = new ModelAndView(); 
       mv.setViewName("adminlogin"); 
       return mv; 
     } 
	 
	 @GetMapping("adminsessionexpiry")
	  public ModelAndView adminsessionexpiry()
	  {
	    ModelAndView mv=new ModelAndView();
	    mv.setViewName("adminsessionexpiry");
	    return mv;
	  }
	 
	 
	 @GetMapping("donorreg")
		public ModelAndView donorreg()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("donorreg");
			return mv;
		}
	  
	  @PostMapping("adddonor")
		public ModelAndView adddonor(HttpServletRequest request) {
		    String name = request.getParameter("name");
		    String gender = request.getParameter("gender");
		    String dateofbirth = request.getParameter("dob");
		    String address = request.getParameter("address");
		    String email = request.getParameter("email");
		    String pwd=request.getParameter("pwd");
		    String contact = request.getParameter("contact");
		    String status = "Registered";
		 
		    Donor d = new Donor();
		    d.setName(name);
		    d.setGender(gender);
		    d.setDateofbirth(dateofbirth);
		    d.setAddress(address);
		    d.setEmail(email);
		    d.setPassword(pwd);
		    d.setContact(contact);
		    d.setStatus(status);
		    
		    String msg = adminService.DonorRegistration(d);
		    ModelAndView mv = new ModelAndView("regsuccessofdonor");
		    mv.addObject("message", msg);
		    
		    return mv;
		}
	 
	  
	  @GetMapping("viewalldonors")
	     public ModelAndView viewAllDonors()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Donor> donorlist = adminService.ViewAllDonors();
	       mv.setViewName("viewalldonors");
	       
	       mv.addObject("donorlist",donorlist);
       long count= adminService.donorcount();
       mv.addObject("count", count);
       
	       return mv;
	     }
	  
	  
	  @GetMapping("updatedonorstatus")
	     public ModelAndView updatedonorstatus()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Donor> donorlist = adminService.ViewAllDonors();
	       mv.setViewName("updatedonorstatus");
	       mv.addObject("donorlist",donorlist);
	       return mv;
	     }
	     
	     @GetMapping("updatestatusofdonor")
	     public String updatestatusofdonor(@RequestParam("id") int did,@RequestParam("status") String status)
	     {
	      adminService.updatedonorstatus(status, did);
	      return "redirect:/updatedonorstatus";
	       
	     }
	  
	  
	  @GetMapping("deletedonor")
	     public ModelAndView deletedonor()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Donor> donorlist = adminService.ViewAllDonors();
	       mv.setViewName("deletedonor");
	       mv.addObject("donorlist",donorlist);
	      

	       return mv;
	     }
	     
	    @GetMapping("donordelete")
	    public String deleteoperationofdonor(@RequestParam("id") int did)
	    {
	    	adminService.deletedonor(did);
	    	return "redirect:/deletedonor"; // redirected to specific path
	    }
	     
	    
	    
	    
	    
	    
	    
	    @GetMapping("recipientreg")
	 	public ModelAndView recipientreg()
	 	{
	 		ModelAndView mv = new ModelAndView();
	 		mv.setViewName("recipientreg");
	 		return mv;
	 	}	 	
	 	
	 	@PostMapping("addrecipient")
	 	public ModelAndView addrecipient(HttpServletRequest request)
	 	   {
	 	    String name = request.getParameter("rname");
	 	    String gender = request.getParameter("rgender");
	 	    String dob = request.getParameter("rdob");
	 	    String location = request.getParameter("rlocation");
	 	    String email = request.getParameter("remail");
	 	    String password = request.getParameter("rpwd");
	 	    String contact = request.getParameter("rcontact");
	 	    String status = "Registered";
	 	    
	 	    Recipient recipient = new Recipient();
	 	    recipient.setName(name);
	 	    recipient.setGender(gender);
	 	    recipient.setDateofbirth(dob);
	 	    recipient.setLocation(location);
	 	    recipient.setEmail(email);
	 	    recipient.setPassword(password);
	 	    recipient.setContact(contact);
	 	    recipient.setStatus(status);
	 	      
	 	      String msg = adminService.RecipientRegistration(recipient);
	 	      
	 	      ModelAndView mv = new ModelAndView("regsuccessofrecipient");
	 	      mv.addObject("message", msg);
	 	    
	 	      return mv;

	 	   }  
 	
	 	
	 	@GetMapping("viewallrecipients")
	     public ModelAndView viewallrecipients()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Recipient> recipientlist = adminService.viewAllRecipients();
	       mv.setViewName("viewallrecipients");
	       mv.addObject("recipientlist",recipientlist);
	       long count= adminService.recipientcount();
	       mv.addObject("count", count);
	       
	       return mv;
	     }
	 	
	 	
	 	@GetMapping("updaterecipientstatus")
	     public ModelAndView updaterecipientstatus()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Recipient> recipientlist = adminService.viewAllRecipients();
	       mv.setViewName("updaterecipientstatus");
	       mv.addObject("recipientlist",recipientlist);
	       return mv;
	     }
	     
	     @GetMapping("updatestatus")
	     public String updatestatus(@RequestParam("id") int rid,@RequestParam("status") String status)
	     {
	      adminService.updaterecipientstatus(status, rid);
	      return "redirect:/updaterecipientstatus";
	       
	     }
	     
	 	
	 	@GetMapping("deleterecipient")
	     public ModelAndView deleterecipient()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Recipient> recipientlist = adminService.viewAllRecipients();
	       mv.setViewName("deleterecipient");
	       mv.addObject("recipientlist",recipientlist);
	       return mv;
	     }
	     
	 	@GetMapping("recipientdelete")
	     public String deleteoperationofrecipient(@RequestParam("id") int rid) {
	    	 adminService.deleterecipient(rid);
	    	 return "redirect:/deleterecipient";         
	     }
	     
	  
	 	
	 	@GetMapping("viewalldonationsbyadmin")
	    public ModelAndView viewalldonationsbyadmin() {
	        ModelAndView mv = new ModelAndView();
	        List<Donation> donationlist = donationService.ViewAllDonations();
	        mv.setViewName("viewalldonationsbyadmin");
	        mv.addObject("donationlist", donationlist);
	        long count= donationService.donationcount();
	        mv.addObject("count", count);
	        

	        return mv;
	    }
	 	
	 	
	 	
	 	
	 	
	 	@GetMapping("updatedonationstatus")
	     public ModelAndView updatedonationstatus()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Donation> donationlist = donationService.ViewAllDonations();
	       mv.setViewName("updatedonationstatus");
	       mv.addObject("donationlist",donationlist);
	       return mv;
	     }
	     
	 	@GetMapping("processdonationstatus")
	 	public String processDonationStatusUpdate(@RequestParam("id") int did, @RequestParam("status") String status) {
	 	    adminService.updatedonationstatus(status, did);
	 	    return "redirect:/updatedonationstatus";
	 	}
	     
	 	
	 	@GetMapping("updatedonationtrackingDetails")
	     public ModelAndView updatedonationtrackingDetails()
	     {
	       ModelAndView mv = new ModelAndView();
	       List<Donation> donationlist = donationService.ViewAllDonations();
	       mv.setViewName("updatedonationtrackingDetails");
	       mv.addObject("donationlist",donationlist);
	       return mv;
	     }
	     
	 	@GetMapping("processdonationtrackingDetails")
	 	public String processdonationtrackingDetails(@RequestParam("id") int did, @RequestParam("trackingDetails") String trackingDetails) {
	 	    adminService.updatetracktatus(trackingDetails, did);
	 	    return "redirect:/updatedonationstatus";
	 	}
	     
	 	
	 	
	 	@GetMapping("/")
		  public ModelAndView home()
		  {
		    ModelAndView mv= new ModelAndView();
		    mv.setViewName("home");
		    return mv;
		  }
	 	
	 	 @GetMapping("home")
			public ModelAndView home1()
			{
				ModelAndView mv=new ModelAndView();
				mv.setViewName("home");
				return mv;
			}
	 
	 	@GetMapping("ongoing")
		public ModelAndView ongoing()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("ongoing");
			return mv;
		}
 
	 	
	 	@GetMapping("impact")
		public ModelAndView impact()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("impact");
			return mv;
		}
 
	 	
	 	@GetMapping("about")
		public ModelAndView about()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("about");
			return mv;
		}
	 	
	 	@GetMapping("login1")
		public ModelAndView login1()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("login1");
			return mv;
		}
	 	
	
		
		
}
