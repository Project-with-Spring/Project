package com.Travel.dao;

import java.util.List;

import com.Travel.domain.StockBean;
import com.Travel.utill.Pagination;
import com.Travel.utill.Search;

public interface StockDAO {


	public void add(StockBean stc);

	public StockBean getStc(Long stc_id);

	public void update(StockBean stc);

	public void delete(Long stc_id);

	public int countStock(Search search);

	public List<StockBean> selectStcListPage(Search search);

}
