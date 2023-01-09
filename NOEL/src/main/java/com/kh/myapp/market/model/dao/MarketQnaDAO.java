package com.kh.myapp.market.model.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.myapp.market.model.vo.MarketQnaVO;


@Repository
public class MarketQnaDAO {

   @Inject
   private SqlSession sqlSession;


   public String prdQnaWrite(int regPage) throws Exception {
      String select = sqlSession.selectOne("marketMapper.select");
      return select;
   }

   public List<MarketQnaVO> qnaList() {
      List<MarketQnaVO> qnaList = sqlSession.selectList("marketMapper.qnaList");
      return sqlSession.selectList("marketMapper.qnaList");
   }

   public void qnaInsert(MarketQnaVO marketqnaVO) throws Exception {
      sqlSession.insert("marketMapper.qnaInsert", marketqnaVO);
   }

   public MarketQnaVO qnaDetail(int prdQnano) throws Exception{
      return sqlSession.selectOne("marketMapper.qnaDetail", prdQnano);
   }

   public void qnaUpdate(MarketQnaVO marketqnaVO) {
      sqlSession.update("marketMapper.qnaUpdate", marketqnaVO);
   }

   public void qnaDelete(int prdQnano) throws Exception{
      sqlSession.delete("marketMapper.qnaDelete", prdQnano);
   }
   
}