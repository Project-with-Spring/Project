package com.Travel.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.Travel.dao.StaffDAO;

@Service
public class StaffServiceImpl implements StaffService{

	@Inject
	private StaffDAO staffDAO;
	
}
