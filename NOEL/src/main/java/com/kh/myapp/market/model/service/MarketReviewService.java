package com.kh.myapp.market.model.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.myapp.market.model.dao.MarketReviewDAO;
import com.kh.myapp.market.model.vo.MarketReviewVO;


@Service
public class MarketReviewService {

   @Inject
   private MarketReviewDAO dao;

   public String reviewInsert(int regPage) throws Exception {
      return dao.reviewInsert(regPage);
   }

   public List<MarketReviewVO> reviewList() {
      return dao.reviewList();
   }

   public  MarketReviewVO reviewDetail(int reviewNo) throws Exception {
      dao.reviewDetail(reviewNo);
      return dao.reviewDetail(reviewNo);
   }
   
   public void reviewInsert(MarketReviewVO marketReviewVO) throws Exception {
      dao.reviewInsert(marketReviewVO);
   }


   public void reviewUpdate(MarketReviewVO marketReviewVO) {
      dao.reviewUpdate(marketReviewVO);
      
   }

   public void reviewDelete(int qnaReviewno) throws Exception {
      dao.reviewDelete(qnaReviewno);
            
   }
   

      
}