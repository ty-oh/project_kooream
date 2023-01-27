package com.kooream.service;

import java.util.List;


import com.kooream.domain.ProductVO;


public interface BidShopService {
	
	public List<ProductVO> getList();
	
	public ProductVO modiread(int p_no);
	
	public void modify(ProductVO vo);

	public ProductVO read(int p_no);

	public void remove(int p_no);

	public void insertProduct(ProductVO vo);
}