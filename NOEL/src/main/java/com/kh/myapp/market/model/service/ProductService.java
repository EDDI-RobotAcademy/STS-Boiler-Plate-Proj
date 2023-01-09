package com.kh.myapp.market.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.myapp.market.model.dao.ProductDAO;
import com.kh.myapp.market.model.vo.ProductImgVO;
import com.kh.myapp.market.model.vo.ProductVO;

@Service
public class ProductService {

	@Autowired
	private ProductDAO dao;
	
	//상품 등록
	public int add(ProductVO v){
		int result = dao.add(v);
		if(result >0) {
			int prdNo = dao.selectPrdNo();
			for(ProductImgVO vo : v.getPrdImgList()) {
				vo.setPrdNo(prdNo);
				result += dao.prdimgadd(vo);
			}
		}
		System.out.println(result);
		return result;
	}
	
	//상품 등록리스트
	public List<ProductVO> list() throws Exception{
		 List result = dao.list();
		 return result;
	}
	
	//상품no에 맞는 img 조회
	public ArrayList<ProductImgVO> selectPrdImg(int prdNo){
		return dao.selectImg(prdNo);
	}
	
	
	
	//상품 등록된것 조회
	public ProductVO read(int prdNo) throws Exception{
		ProductVO result = dao.read(prdNo);
		return result;
	}
	
	//상품 수정
	public int update(ProductVO vo) {
		 int result =dao.update(vo); 
		 return result; 
	}
	
	//상품 삭제
	public int delete(int prdNo) {
		int result = dao.delete(prdNo);
		return result;
	}
	
}
