package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="donation_table")
public class Donation
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;
	    private int donorId;
	    private String firstName;
	    private String lastName;
	    private String email;
	    private String phoneNumber;
	    private String streetAddress;
	    private String city;
	    private String state;
	    private String country;
	    private String donationType; 
	    private Double donationAmount; 
	    private String description; 
	    private String queries; 
	    
	    @Column(length = 20, nullable = false)
	    private String status = "PENDING"; // New field with default value
	    
	    private String trackingDetails;

	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	    	this.status = status;
	    }
	    
	    public int getDonorId() {
			return donorId;
		}

		public void setDonorId(int donorId) {
			this.donorId = donorId;
		}

		public Donation() {
	    }

	    public Donation(int id, String firstName, String lastName, String email, String phoneNumber, String streetAddress,
	                    String city, String state, String country, String donationType, Double donationAmount, String description, String queries) {
	        this.id = id;
	        this.firstName = firstName;
	        this.lastName = lastName;
	        this.email = email;
	        this.phoneNumber = phoneNumber;
	        this.streetAddress = streetAddress;
	        this.city = city;
	        this.state = state;
	        this.country = country;
	        this.donationType = donationType;
	        this.donationAmount = donationAmount;
	        this.description = description;
	        this.queries = queries;
	    }

	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getFirstName() {
	        return firstName;
	    }

	    public void setFirstName(String firstName) {
	        this.firstName = firstName;
	    }

	    public String getLastName() {
	        return lastName;
	    }

	    public void setLastName(String lastName) {
	        this.lastName = lastName;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }

	    public String getPhoneNumber() {
	        return phoneNumber;
	    }

	    public void setPhoneNumber(String phoneNumber) {
	        this.phoneNumber = phoneNumber;
	    }

	    public String getStreetAddress() {
	        return streetAddress;
	    }

	    public void setStreetAddress(String streetAddress) {
	        this.streetAddress = streetAddress;
	    }

	    public String getCity() {
	        return city;
	    }

	    public void setCity(String city) {
	        this.city = city;
	    }

	    public String getState() {
	        return state;
	    }

	    public void setState(String state) {
	        this.state = state;
	    }

	    public String getCountry() {
	        return country;
	    }

	    public void setCountry(String country) {
	        this.country = country;
	    }

	    public String getDonationType() {
	        return donationType;
	    }

	    public void setDonationType(String donationType) {
	        this.donationType = donationType;
	    }

	    public Double getDonationAmount() {
	        return donationAmount;
	    }

	    public void setDonationAmount(Double donationAmount) {
	        this.donationAmount = donationAmount;
	    }

	    public String getDescription() {
	        return description;
	    }

	    public void setDescription(String description) {
	        this.description = description;
	    }

	    public String getQueries() {
	        return queries;
	    }

	    public void setQueries(String queries) {
	        this.queries = queries;
	    }

	    @Override
	    public String toString() {
	        return "Donation{" +
	                "id=" + id +
	                ", firstName='" + firstName + '\'' +
	                ", lastName='" + lastName + '\'' +
	                ", email='" + email + '\'' +
	                ", phoneNumber='" + phoneNumber + '\'' +
	                ", streetAddress='" + streetAddress + '\'' +
	                ", city='" + city + '\'' +
	                ", state='" + state + '\'' +
	                ", country='" + country + '\'' +
	                ", donationType='" + donationType + '\'' +
	                ", donationAmount=" + donationAmount +
	                ", description='" + description + '\'' +
	                ", queries='" + queries + '\'' +
	                '}';
	    }

		public String getTrackingDetails() {
			return trackingDetails;
		}

		public void setTrackingDetails(String trackingDetails) {
			this.trackingDetails = trackingDetails;
		}
	}
