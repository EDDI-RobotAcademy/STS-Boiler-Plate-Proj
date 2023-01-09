<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>marketDetailView</title>
<link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="/resources/css/product/prd_add.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
   div{
      font-family: 'Gowun Dodum';
   }
   #product_wrap{
      width:1320px;
      margin:0 auto;
      flex-direction:column;
   }
   .review-wrap{
      padding-top:20px;
      padding-left: 10px;
      padding-right: 10px;
      position:relative;
      width:1320px;   
      margin:0 auto;
   }
   .review-list{
      width:100%;
      padding : 10px;
      margin:0 auto;
      text-align: left;
      border-spacing:10px;
      border-top: 1px solid #444444;
      border-collapse: collapse;
   }
   #reviewForm {
      text-align: center;
      width: 480px;
      margin: 0 auto;
   }
   
   #reviewForm fieldset {
      display: inline-block;
      direction: rtl;
      border: 0;
      padding-top: 0;
   }
   #reviewForm fieldset legend {
      text-align: right;
   }
   #reviewForm fieldset label input {
      height: 48px;
   }
   #reviewForm input[type=radio] {
      display: none;
   }
   
   #reviewForm label {
      font-size: 3em;
      color: transparent;
      text-shadow: 0 0 0 #f0f0f0;
   }
   #reviewForm label:hover {
      cursor: pointer;
      text-shadow: 0 0 0 rgba(255, 83, 86, 0.99);
   }
   #reviewForm label:hover ~label {
      text-shadow: 0 0 0 rgba(255, 83, 86, 0.99);
   }
   #reviewForm  input[type=radio]:checked ~label {
      text-shadow: 0 0 0 rgba(255, 83, 86, 0.99);
   }
   .qna-wrap{
      padding-top:20px;
      padding-left: 10px;
      padding-right: 10px;
      position:relative;
      width:1320px;   
      margin:0 auto;
   }
   .qna-list{
      width:100%;
      padding : 10px;
      margin:0 auto;
      text-align: center;
      border-top: 1px solid #444444;
      border-collapse: collapse;
   }
</style>
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
   <jsp:include page="/WEB-INF/views/layouts/header.jsp" />
   
   <div class="container text-left" id="product_wrap">
      <div class="directoryDiv">home > market > detail</div>
      <div class="row">
         <div class="col">
            <img alt="페어잼" src="https://cdn.imweb.me/thumbnail/20190403/5ca4689140972.jpg" width="610px" height="610px">
         </div>
         <div class="col">
            <header><h5 style="font-family: Gowun Dodum;">페어잼(배잼)</h5></header>
         </div>
      </div>
   </div>

   <!-- 리뷰 목록 -->
   <div class="review-wrap">
      <div class="review-title">
         <div><b>구매평</b></div><br>
            <button type="button" class="btn btn-brand" data-bs-toggle="modal" data-bs-target="#modal-review">구매평 작성</button>
      </div>
      <section>
         <table class="review-list">
            <tbody>
               <c:forEach items="${reviewlist}" var="reviewlist">
                  <tr height="80px">
                     <td width="80%">
                        <div style="color: rgb(255, 83, 86); float:center;">
                           <c:forEach begin="1" step="1" end="${reviewlist.rating}" varStatus="i">♥</c:forEach>
                        </div>                     
                        <a href="/market/reviewDetail?prdReviewno=${reviewlist.prdReviewno}">
                           <c:out value="${reviewlist.prdReviewcontent}" />
                        </a>
                     </td>
                     <td width="20%">
                        <c:out value="${reviewlist.userId}"/><br>
                        <fmt:formatDate value="${reviewlist.prdReviewregdate}" pattern="yyyy-MM-dd"/>
                     </td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </section>
   </div>

   
   <!-- 리뷰 모달 시작 -->
   <form name="reviewForm" id="reviewForm" method="post" action="/market/reviewInsert" >
      <div class="modal fade" id="modal-review" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel" style="font-family: Gowun Dodum;">구매평 작성</h5>
                  <button type="button" class="btn-close btn btn-brand" data-bs-dismiss="modal"aria-label="Close"></button>
               </div>
               <div class="modal-body mb-3">
                  <h4>상품은 어떠셨나요?</h4>
                  <fieldset>
                     <%-- <input type="hidden" id="prevRating" value="${re.rating}"> --%>
                     <input type="radio" name="rating" value="5" id="rate1" checked>
                        <label for="rate1">♥</label>
                     <input type="radio" name="rating" value="4" id="rate2">
                        <label for="rate2">♥</label>
                     <input type="radio" name="rating" value="3" id="rate3">
                        <label for="rate3">♥</label>
                     <input type="radio" name="rating" value="2" id="rate4">
                        <label for="rate4">♥</label>
                     <input type="radio" name="rating" value="1" id="rate5">
                        <label for="rate5">♥</label>
                  </fieldset>
                     <textarea name="prdReviewcontent" class="chk1 form-control" id="message-text" title="어떤점이 좋으셨나요?" 
                           style="height:20em; resize:none;" ></textarea>
               </div>
               <div class="modal-footer">
                  <button type="submit" class="reviewsave btn btn-brand">저장</button>
                  <button type="button" class="reviewcancel btn btn-brand" data-bs-dismiss="modal">취소</button>
               </div>
            </div>
         </div>
      </div>
   </form>
   <!-- 리뷰 모달 끝 -->

   

   <!-- QNA 시작 -->
   <%-- <c:if test="${user != null}"></c:if> //유저일때 모달창 오픈--%>
   <div class="qna-wrap">
      <div class="qna-title">
         <div><b>QnA</b></div>
         구매하시려는 상품에 대한 궁금점이 있으면 문의주세요.<br><br>
            <button type="button" class="btn btn-brand" data-bs-toggle="modal" data-bs-target="#modal-qna">
         상품문의</button>
      </div>
      <section>
         <table class="qna-list">
            <tbody>
               <tr height="50">
                  <th width="10%">상태</th><th width="60%">제목</th><th width="15%">작성자</th><th width="15%">등록일</th>
               </tr>
               <c:forEach items="${qnalist}" var="qnalist">
                  <tr  height="50">
                     <td>
                        <c:choose>
                           <c:when test="${qnalist.prdQnastatus == '1'}">
                              답변대기
                           </c:when>
                           <c:otherwise>
                              답변완료
                           </c:otherwise>
                        </c:choose>                              
                     </td>
                     <td>
                     <a href="/market/qnaDetail?prdQnano=${qnalist.prdQnano}">
                           <c:out value="${qnalist.prdQnacontent}" />
                        </a>
                     
                     </td>
                     <td><c:out value="${qnalist.userId}"/></td>
                     <td><fmt:formatDate value="${qnalist.prdQnaregdate}" pattern="yyyy-MM-dd"/></td>
                  </tr>
                   
               </c:forEach>
            </tbody>
         </table>
      </section>
   </div>
   <script type="text/javascript">
   </script>
   <!-- QnA 끝 -->
   
   <!-- QnA 모달 시작 -->
   <form name="prdqnaForm" method="post" action="/market/pqnawrite" >
      <div class="modal fade" id="modal-qna" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
               <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel" style="font-family: Gowun Dodum;">Q&A</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"
                     aria-label="Close"></button>
               </div>
               <div class="modal-body mb-3">
                  <label for="message-text" class="col-form-label">문의할 내용을 작성해주세요.</label>
                     <textarea name="prdQnacontent" class="chk2 form-control" id="message-text" title="내용을 입력하세요" 
                           style="height:20em; resize:none;" ></textarea>
               </div>
               <div class="modal-footer">
                  <button type="submit" class="qnasave btn btn-brand">저장</button>
                  <button type="button" class="qnacancel btn btn-brand" data-bs-dismiss="modal">취소</button>
               </div>
            </div>
         </div>
      </div>
   </form>
   <!-- QNA 모달 끝 -->
   
   
   <jsp:include page="/WEB-INF/views/layouts/footer.jsp" />

   <script src="/resources/js/index/jquery.min.js"></script>
   <script src="/resources/js/index/owl.carousel.min.js"></script>
   <script src="/resources/js/index/app.js"></script>
   
   <script type="text/javascript">   
   //리뷰 & qna 내용 미입력시 alert
   $(document).ready(function(){
      var formObj1 = $("form[name='prdreviewForm']");
      var formObj2 = $("form[name='prdqnaForm']");

      $(".reviewsave").on("click", function() {
         if (fn_valiChk1()) {
            return false;
         }
         formObj1.attr("action", "/market/reviewInsert");
         formObj1.attr("method", "post");
         formObj1.submit();
      });
      
      $(".qnasave").on("click", function() {
         if (fn_valiChk2()) {
            return false;
         }
         formObj2.attr("action", "/market/qnaInsert");
         formObj2.attr("method", "post");
         formObj2.submit();
      });
   })
   function fn_valiChk1() {
      var regForm = $("form[name='prdreviewForm'] .chk1").length;
      
      if ($(".chk1").val() == "" || $(".chk1").val() == null){
         alert($(".chk1").attr("title"));
         return true;
      }
   }
   function fn_valiChk2() {
      var regForm = $("form[name='prdqnaForm'] .chk2").length;
      
      if ($(".chk2").val() == "" || $(".chk2").val() == null){
         alert($(".chk2").attr("title"));
         return true;
      }
   }
   </script>
</body>
</html>