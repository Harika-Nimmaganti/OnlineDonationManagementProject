package com.klef.jfsd.springboot.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Donation;
import com.klef.jfsd.springboot.model.Request;
import com.klef.jfsd.springboot.repository.DonationRepository;
import com.klef.jfsd.springboot.service.DonationService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class DonationController
{
    @Autowired
    public DonationService donationService;
    
    @Autowired
    private DonationRepository donationRepository;
    
    @GetMapping("makedonation")
   	public ModelAndView makedonation()
   	{
   		ModelAndView mv=new ModelAndView();
   		mv.setViewName("makedonation");
   		return mv;
   	}
    
    @GetMapping("adddonation")
	public ModelAndView adddonation()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("adddonation");
		return mv;
	}
    
    @PostMapping("insertdonation")
    public ModelAndView insertDonation(HttpServletRequest request) {
    	int donorId =Integer.parseInt( request.getParameter("donorid"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String streetAddress = request.getParameter("streetAddress");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String donationType = request.getParameter("donationType");
        String donationAmountParam = request.getParameter("donationAmount");
        String description = request.getParameter("description");
        String queries = request.getParameter("queries");

        Double donationAmount = null;
        if (donationAmountParam != null && !donationAmountParam.isEmpty()) {
            donationAmount = Double.valueOf(donationAmountParam);
        }

        Donation donation = new Donation();
        donation.setDonorId(donorId);
        donation.setFirstName(firstName);
        donation.setLastName(lastName);
        donation.setEmail(email);
        donation.setPhoneNumber(phoneNumber);
        donation.setStreetAddress(streetAddress);
        donation.setCity(city);
        donation.setState(state);
        donation.setCountry(country);
        donation.setDonationType(donationType);
        donation.setDonationAmount(donationAmount);
        donation.setDescription(description);
        donation.setQueries(queries);

        String msg = donationService.AddDonation(donation);

        ModelAndView mv = new ModelAndView("donationsuccess");
        mv.addObject("message", msg);
        return mv;
    }

    @GetMapping("viewalldonations")
    public ModelAndView viewAllDonations() {
        ModelAndView mv = new ModelAndView();
        List<Donation> donationlist = donationService.ViewAllDonations();
        mv.setViewName("viewalldonations");
        mv.addObject("donationlist", donationlist);
        long count= donationService.donationcount();
        mv.addObject("count", count);
        return mv;
    }

    @GetMapping("viewdonation")
    public String viewDonation(@RequestParam("id") int id, HttpServletRequest request) {
        Donation donation = donationService.getDonationById(id);
        request.setAttribute("donation", donation);
        return "viewdonation";
    }

    @GetMapping("deletedonation")
    public ModelAndView viewAllDonationsForDeletion() {
        ModelAndView mv = new ModelAndView();
        List<Donation> donationlist = donationService.ViewAllDonations();
        mv.setViewName("deletedonation");
        mv.addObject("donationlist", donationlist);
        return mv;
    }

   
    @PostMapping("deleteDonation")
    public String deleteDonation(@RequestParam("id") int id) {
        donationService.deleteDonationById(id);
        return "redirect:/deletedonation";
    }
    
     
    @GetMapping("/form")
    public ModelAndView showDonationForm() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("requestDonation"); // Corresponding JSP file (requestDonation.jsp)
        return modelAndView;
    }
    @PostMapping("/submit")
    public ModelAndView insertdonation(HttpServletRequest request1,@RequestParam("image") MultipartFile file) throws Exception{
    	String msg=null;
    	ModelAndView mv=new ModelAndView();
    	try {
    		String name=request1.getParameter("name");
    		String address=request1.getParameter("address");
    		String reason=request1.getParameter("reason");
    		byte[] bytes=file.getBytes();
    		Blob blob=new javax.sql.rowset.serial.SerialBlob(bytes);
    		Request r=new Request();
    		r.setImage(blob);
    		r.setAddress(address);
    		r.setName(name);
    		r.setReason(reason);
    		
    		msg=donationService.saveDonation(r);
    		System.out.println(msg);
    		mv.setViewName("msg");
    		mv.addObject("message",msg);
    		
    	
    }
    	catch(Exception e) {
    		msg = e.getMessage();
    	       System.out.println(msg.toString());
    	       mv.setViewName("formerror");
    	       mv.addObject("message",msg);
    	     }
    	     return mv;
    	}
    @GetMapping("viewallreqs")
    public ModelAndView viewallrequests() {
      List<Request> reqlist=donationService.ViewAllRequests();
      ModelAndView mv=new ModelAndView("viewrequestsbyrecipient");
      mv.addObject("reqlist", reqlist);
      return mv;
    }
    
    

    @GetMapping("/viewDonations")
    public String viewDonations(Model model) {
        // Fetch all donations
        model.addAttribute("donationlist", donationRepository.findAll());
        model.addAttribute("count", donationRepository.count());
        return "viewdonationsbyadmin"; // Return the JSP view name
    }

    
    
//    
//    @PostMapping("/approveDonation")
//    public String approveDonation(@RequestParam("donationId") int donationId) {
//        Donation donation = donationRepository.findById(donationId).orElse(null);
//        if (donation != null) {
//            donation.setStatus("APPROVED");
//            donationRepository.save(donation);
//        }
//        return "redirect:/viewDonations";
//    }
//
//    @PostMapping("/dispatchDonation")
//    public String dispatchDonation(@RequestParam("donationId") int donationId) {
//        Donation donation = donationRepository.findById(donationId).orElse(null);
//        if (donation != null) {
//            donation.setStatus("DISPATCHED");
//            donationRepository.save(donation);
//        }
//        return "redirect:/viewDonations";
//    }
//
//    @PostMapping("/deliverDonation")
//    public String deliverDonation(@RequestParam("donationId") int donationId) {
//        Donation donation = donationRepository.findById(donationId).orElse(null);
//        if (donation != null) {
//            donation.setStatus("DELIVERED");
//            donationRepository.save(donation);
//        }
//        return "redirect:/viewDonations";
//    }
//    
    
    
    @GetMapping("/tracking/{donationId}")
    public ResponseEntity<String> getDonationTracking(@PathVariable("donationId") Integer donationId) {
        Donation donation = donationService.getDonationById(donationId);
        if (donation == null) {
            return new ResponseEntity<>("Donation not found.", HttpStatus.NOT_FOUND);
        }

        // Track donation status
        String trackingDetails = donationService.getDonationTrackingDetails(donation);
        return new ResponseEntity<>(trackingDetails, HttpStatus.OK);
    }

}
