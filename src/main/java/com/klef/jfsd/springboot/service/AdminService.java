package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Donor;
import com.klef.jfsd.springboot.model.Recipient;

public interface AdminService 
{
	public Admin checkadminlogin(String uname, String pwd);
	
	public String DonorRegistration(Donor d);
	public List<Donor> ViewAllDonors();
	public String updatedonorstatus(String status, int did);
	public String deletedonor(int did);
	
	public String RecipientRegistration(Recipient r);
	public List<Recipient> viewAllRecipients();
	public String updaterecipientstatus(String status, int rid);
	public String deleterecipient(int rid);

	public long donorcount();

	public long recipientcount();
	
	public String updatedonationstatus(String status, int did);
	
	public String updatetracktatus(String trackingDetails, int did);
	
}
