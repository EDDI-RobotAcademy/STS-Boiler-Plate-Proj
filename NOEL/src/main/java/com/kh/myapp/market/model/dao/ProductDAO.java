package com.kh.myapp.market.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.myapp.market.model.vo.ProductImgVO;
import com.kh.myapp.market.model.vo.ProductVO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession sql;
	
	//상품 등록
	public int add(ProductVO vo ){
		return sql.insert("productMapper.insert", vo);  
	}
	//상품 이미지 등록
	public int prdimgadd(ProductImgVO vo ){
		int result = sql.insert("productMapper.prdimginsert", vo);
		return  result;
	}
	
	//상품no 제일 큰거 조회
	public int selectPrdNo() {
		 int result = sql.selectOne("productMapper.selectPrdNo");
		 return result;
	}
	
	//상품 등록 목록 조회
	public List<ProductVO> list() throws Exception {
		 List result = sql.selectList("productMapper.selectlist");
		 return result;
	}
	
	//상품 등록된것 조회
	public ProductVO read(int prdNo) {
		ProductVO result = sql.selectOne("productMapper.read", prdNo);
		return result;
	}

	//상품 수정
	public int update(ProductVO vo) {
		 int result = sql.update("productMapper.update", vo);
		 return result;
	}
	
	//상품 삭제
	public int delete(int prdNo) {
		int result = sql.delete("productMapper.delete", prdNo);
		return result;
	}
	
	//상품 이미지 수정
	public ArrayList<ProductImgVO> selectImg(int prdNo) {
		List list = sql.selectList("productMapper.selectImg",prdNo);
		return (ArrayList<ProductImgVO>) list;
	}
	
}
