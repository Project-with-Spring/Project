package com.Travel.dao;

import java.util.List;

import com.Travel.domain.StockBean;

public interface StockDAO {

	public List<StockBean> getStcList();

	public void add(StockBean stc);

	public StockBean getStc(Long stc_id);

	public void update(StockBean stc);

	public void delete(Long stc_id);

}
