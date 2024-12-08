package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.mail.javamail.JavaMailSender;

import com.klef.jfsd.springboot.model.Donation;
import com.klef.jfsd.springboot.model.Donor;
import com.klef.jfsd.springboot.model.Orders;
import com.klef.jfsd.springboot.service.DonationService;
import com.klef.jfsd.springboot.service.DonorService;
import com.klef.jfsd.springboot.service.OrderService;
import com.razorpay.Order;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class DonorController 
{
	@Autowired
	private DonorService donorService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
    public DonationService donationService;
	
	
	
	@GetMapping("regdonor")
	public ModelAndView donorreg()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("regdonor");
		return mv;
	}
	@GetMapping("donorlogin")
	public ModelAndView donorlogin()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("donorlogin");
		return mv;
	}
	@PostMapping("insertdonor")
	public ModelAndView insertdonor(HttpServletRequest request) {
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
	    
	    String msg = donorService.DonorRegistration(d);
	    ModelAndView mv = new ModelAndView("regsuccess");
	    mv.addObject("message", msg);
	    
	    return mv;
	}
	 @PostMapping("checkdonorlogin")
     @ResponseBody
     public ModelAndView checkemplogin(HttpServletRequest request)
     {
		 ModelAndView mv=new ModelAndView();
    	 String d_email=request.getParameter("d_email");
    	 String d_password=request.getParameter("d_password");
    	 Donor d= donorService.checkdonorlogin(d_email, d_password);
    	 if(d!=null)
    	 {
    		 HttpSession session = request.getSession();
    		 session.setAttribute("donor",d);
    		 
    		 session.setMaxInactiveInterval(50);
    		 
    		 mv.setViewName("donorhome");
    	 }
    	 else
    	 {
    		 mv.setViewName("donorlogin");
    		 mv.addObject("message", "Login Failed");
    	 } 
    	 return mv;
     }
	 @GetMapping("donorhome")
		public ModelAndView donorhome()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("donorhome");
			return mv;
		}
	 @GetMapping("donorprofile")
		public ModelAndView donorprofile()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("donorprofile");
			return mv;
		}
	 @GetMapping("updatedonor")
		public ModelAndView updatedonor()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("updatedonor");
			return mv;
		}
		@PostMapping("updatedonorprofile")
		public ModelAndView updatedonorprofile(HttpServletRequest request)
		{
			 ModelAndView mv = new ModelAndView();
			 try
			 {
				 int id = Integer.parseInt(request.getParameter("did"));
				 String name = request.getParameter("name");
				 String gender = request.getParameter("gender");
				 String email = request.getParameter("email");
				 String dateofbirth = request.getParameter("dob"); 
				 String contact = request.getParameter("contact");
				 String address = request.getParameter("address");
				 String password = request.getParameter("pwd");
				
				 
				 Donor donor=new Donor();
				 donor.setId(id);
				 donor.setName(name);
				 donor.setGender(gender);
				 donor.setEmail(email);
				 donor.setDateofbirth(dateofbirth);
				 donor.setContact(contact);
				 donor.setAddress(address);
				 donor.setPassword(password);
				
				 String msg=donorService.UpdateDonorProfile(donor);
				 Donor d=donorService.displayDonorByID(id);
				 HttpSession session = request.getSession();
		          session.setAttribute("donor",d);
				 mv.setViewName("updatesuccess");
				 mv.addObject("message", msg);
			 }
			 catch(Exception e)
			 {
				 mv.setViewName("updateerror");
				 mv.addObject("message", e);
			 }
			 return mv;
		}
		@GetMapping("donorcontactus")
		public ModelAndView donorcontactus()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("donorcontactus");
			return mv;
		}
		
	    @GetMapping("logout")
		public ModelAndView donorlogout(HttpServletRequest request)
		{
            HttpSession session=request.getSession();
	    	session.removeAttribute("donor");
	    	
	    	ModelAndView mv=new ModelAndView();
			mv.setViewName("donorlogin");
			return mv;
		}
	    
	    
	    
	    @GetMapping("donorsessionexpiry")
		  public ModelAndView donorsessionexpiry()
		  {
		    ModelAndView mv=new ModelAndView();
		    mv.setViewName("donorsessionexpiry");
		    return mv;
		  }
	    
	    
	    
	    
	    
	    
	    @PostMapping("sendemail")
	      public ModelAndView sendEmail(HttpServletRequest request) throws Exception
	      {
	      String name = request.getParameter("name");
	      String toemail = request.getParameter("email");
	      String subject = request.getParameter("subject");
	      String msg = request.getParameter("message");
	      Object mailSender = null;
		  MimeMessage mimeMessage = ((JavaMailSender) mailSender).createMimeMessage();
	      MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
	      int otp = (int)(Math.random() * 99999); // random number generation
	      helper.setTo(toemail);
	      helper.setSubject(subject);
	      helper.setFrom("nimmagantiharika@gmail.com");
	      String htmlContent =
	      "<h3>Contact Form Details</h3>" +
	      "<p><strong>Name:</strong> " + name + "</p>" +
	      "<p><strong>Email:</strong> " + toemail + "</p>" +
	      "<p><strong>Subject:</strong> " + subject + "</p>" +
	      "<p><strong>Message:</strong> " + msg + "</p>" +
	      "<p><strong>OTP:</strong> " + otp + "</p>";
	      helper.setText(htmlContent, true);
	      ((JavaMailSender) mailSender).send(mimeMessage);
	      ModelAndView mv = new ModelAndView("mailsuccess");
	      mv.addObject("message", "Email Sent Successfully");
	      return mv;
	      }
	    
	    
	    
	    
	    
	    @PostMapping("/trackDonation")
	    public ModelAndView trackDonation(@RequestParam("donorId") int donorId) {
	        ModelAndView mv = new ModelAndView("trackDonationResult");
	        List<Donation> donations = donationService.getDonationsByDonor(donorId);
	        mv.addObject("donations", donations);
	        return mv;
	    }
	    
	    @GetMapping("trackDonation")
		public ModelAndView trackDonation()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("trackDonation");
			return mv;
		}
	    
	    @GetMapping("trustedorg")
		public ModelAndView trustedorg()
		{
			ModelAndView mv=new ModelAndView();
			mv.setViewName("trustedorg");
			return mv;
		}
	    
	    
}
