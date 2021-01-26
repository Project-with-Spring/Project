package com.Travel.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.Travel.dao.SalesHistoryDAO;

@Service
public class SalesHistoryServiceImpl implements SalesHistoryService {
	
	@Inject
	private SalesHistoryDAO salesHistoryDAO;

}
