package com.kh.myapp.market.model.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.myapp.market.model.dao.MarketQnaDAO;
import com.kh.myapp.market.model.vo.MarketQnaVO;

@Service
public class MarketQnaService {

   @Inject
   private MarketQnaDAO dao;

   public String prdQnaWrite(int regPage) throws Exception {
      return dao.prdQnaWrite(regPage);

   }

   public List<MarketQnaVO> qnaList() {
      return dao.qnaList();
   }

   public void qnaInsert(MarketQnaVO marketQnaVO) throws Exception {
      dao.qnaInsert(marketQnaVO);
   }

   public MarketQnaVO qnaDetail(int prdQnano) throws Exception{
      dao.qnaDetail(prdQnano);
      return dao.qnaDetail(prdQnano);
   }

   public void qnaUpdate(MarketQnaVO marketqnaVO) {
      dao.qnaUpdate(marketqnaVO);
   }

   public void qnaDelete(int prdQnano) throws Exception{
      dao.qnaDelete(prdQnano);
   }
   
}