package com.kh.myapp.market.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.myapp.market.model.vo.MarketReviewVO;


@Repository
public class MarketReviewDAO {

   @Inject
   private SqlSession sqlSession;

   public String reviewInsert(int regPage) throws Exception {
      String rvselect = sqlSession.selectOne("marketMapper.reviewInsert");
      return rvselect;
   }
   
   public List<MarketReviewVO> reviewList() {
      List<MarketReviewVO> list = sqlSession.selectList("marketMapper.reviewList");
      return sqlSession.selectList("marketMapper.reviewList");
   }


   public MarketReviewVO reviewDetail(int reviewNo) throws Exception {
      return sqlSession.selectOne("marketMapper.reviewDetail", reviewNo);
   }

   
   public void reviewInsert(MarketReviewVO marketReviewVO) throws Exception {
      sqlSession.insert("marketMapper.reviewInsert", marketReviewVO);
   }


   public void reviewUpdate(MarketReviewVO marketReviewVO) {
      sqlSession.update("marketMapper.reviewUpdate", marketReviewVO);

   }

   public void reviewDelete(int qnaReviewno) throws Exception {
      sqlSession.delete("marketMapper.reviewDelete", qnaReviewno);
   }

}