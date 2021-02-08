package com.Travel.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.Travel.domain.CategoryBean;
import com.Travel.domain.OrderBean;
import com.Travel.domain.OrderDetailBean;
import com.Travel.domain.PointBean;
import com.Travel.domain.ProductBean;

@Repository
public class SaleDAOImpl implements SaleDAO {
	//mybatis 생성자 통해서 객체생성 
		@Inject
		private SqlSession sqlSession;
		private static final String namespace="com.Travel.mapper.SaleMapper";
		@Override
		public List<CategoryBean> getCategoryList(String ctg_type) {
			return sqlSession.selectList(namespace+".getCategoryList",ctg_type);
		}
		@Override
		public List<ProductBean> getProductList() {
			return sqlSession.selectList(namespace+".getProductList");
		}
		@Override
		public void insertOrder(OrderBean orderBean) {
			if(orderBean.getOrd_cancel()=="1") {
				sqlSession.insert(namespace+".insertSaveOrder",orderBean);
			}else {
				sqlSession.insert(namespace+".insertOrder",orderBean);
			}
		}
		@Override
		public String getOrderId(OrderBean orderBean) {
			return sqlSession.selectOne(namespace+".getOrderId",orderBean);
		}
		@Override
		public void insertDetail(OrderDetailBean odtBean) {
			sqlSession.insert(namespace+".insertOrderDetail",odtBean);
		}
		@Override
		public String getPoint(PointBean potBean) {
			return sqlSession.selectOne(namespace+".getPoint",potBean);
		}
		@Override
		public void insertPointId(PointBean potBean) {
			sqlSession.insert(namespace+".insertPointId",potBean);
			
		}
		@Override
		public void updatePoint(PointBean potBean) {
			sqlSession.update(namespace+".updatePoint",potBean);
		}
		@Override
		public void updateOrdPoint(PointBean potBean) {
			sqlSession.update(namespace+".updateOrdPoint", potBean);
		}
		@Override
		public List<OrderBean> getSaveOrderList() {
			return sqlSession.selectList(namespace+".getSaveOrderList");
		}
		@Override
		public void deleteOrder(String ord_id) {
			sqlSession.delete(namespace+".deleteOrder", ord_id);
			
		}
		@Override
		public OrderBean getSaveOrder(String ord_id) {
			return sqlSession.selectOne(namespace+".getSaveOrder",ord_id);
		}
		@Override
		public List<OrderDetailBean> getSaveOrderDetail(String ord_id) {
			return sqlSession.selectList(namespace+".getSaveOrderDetail",ord_id);
		}

}
