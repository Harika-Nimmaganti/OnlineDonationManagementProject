package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.springboot.model.Donation;
import com.klef.jfsd.springboot.model.Request;

import jakarta.transaction.Transactional;

public interface DonationRepository extends JpaRepository<Donation, Integer>
{

	public List<Donation> findByDonorId(int donorId);
	
	@Query("update Donation dn set dn.status=?1 where dn.id=?2")
	@Modifying  // DML
	@Transactional  // to enable auto commit
	public int updatedonationstatus(String status, int did);
	
	@Query("update Donation dn set dn.trackingDetails=?1 where dn.id=?2")
	@Modifying  // DML
	@Transactional  // to enable auto commit
	public int updatetracktatus(String trackingDetails, int did);

}
