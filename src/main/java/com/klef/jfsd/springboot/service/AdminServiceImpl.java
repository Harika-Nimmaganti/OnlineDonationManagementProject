package com.klef.jfsd.springboot.service; 
 
import java.util.List; 

 
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Donor;
import com.klef.jfsd.springboot.model.Recipient;

import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.DonationRepository;
import com.klef.jfsd.springboot.repository.DonorRepository;
import com.klef.jfsd.springboot.repository.RecipientRepository;
 
 
@Service 
public class AdminServiceImpl implements AdminService 
{ 
	
 @Autowired 
private DonorRepository donorRepository;	
	
 @Autowired 
 private AdminRepository adminRepository; 
 
 @Autowired
 private RecipientRepository recipientRepository;


 @Autowired
 private DonationRepository donationRepository;

 
 @Override 
 public Admin checkadminlogin(String uname, String pwd) 
 { 
   
  return adminRepository.checkadminlogin(uname, pwd); 
 }


@Override
public String DonorRegistration(Donor d) 
{
	donorRepository.save(d);
	return "Donor Registered Successfully";
} 
 
@Override 
public List<Donor> ViewAllDonors()  
{ 
 return donorRepository.findAll(); 
} 
@Override
public String updatedonorstatus(String status, int did)
{
	donorRepository.updatedonorstatus(status, did);
	return "Donor Status Updated Successfully";
}

@Override
public String deletedonor(int did) 
{
	 donorRepository.deleteById(did); 
	 return "Donor Deleted Successfully";
	
}
 

@Override
public String RecipientRegistration(Recipient r)
{
	recipientRepository.save(r);
	return "Recipient Registered Successfully";
}

@Override
public List<Recipient> viewAllRecipients()
{
	return recipientRepository.findAll();
}

@Override
public String deleterecipient(int rid) 
{
	recipientRepository.deleteById(rid);
	return "Recipient Deleted Successfully";
}

@Override
public String updaterecipientstatus(String status, int rid)
{
	recipientRepository.updaterecipientstatus(status, rid);
	return "Recipient Status Updated Successfully";
}


@Override
public long donorcount() {
	return donorRepository.count();
}

@Override
public long recipientcount() {
	return recipientRepository.count();
}


@Override
public String updatedonationstatus(String status, int did)
{
	donationRepository.updatedonationstatus(status, did);
	return "Donnation Status Updated Successfully";
}

@Override
public String updatetracktatus(String trackingDetails, int did)
{
	donationRepository.updatedonationstatus(trackingDetails, did);
	return "Donnation trackingDetails Updated Successfully";
}

}
	
  
