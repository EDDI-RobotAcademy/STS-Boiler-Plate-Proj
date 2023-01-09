<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/resources/css/index/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="/resources/css/product/prd_add.css">
<script src="/resources/js/market/market.js"></script>
<script src="/resources/js/index/jquery.min.js"></script>
<script src="/resources/js/index/owl.carousel.min.js"></script>
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />
	<h1>판매자 마이페이지 테스트</h1>
	<a href="/market/prd_add" class="btn btn-brand" id="font">상품등록</a>
	<div class="list-tb">
		<table>
			<thead>
				<tr height="50">
					<th width="5%">번호</th>
					<th width="10%">카테고리</th>
					<th width="25%">상품이름</th>
					<th width="10%">상품재고</th>
					<th width="15%">상품가격</th>
					<th width="10%">등록일</th>
				</tr>
			</thead>
			<c:forEach items="${prdlist}" var="prdlist">
				<tr>
					<td>${prdlist.prdNo}</td>
					<td>${prdlist.cateGory}</td>
					<td>${prdlist.prdName}</td>
					<td>${prdlist.prdStock}</td>
					<td>${prdlist.prdPrice}</td>
					<td><fmt:formatDate value="${prdlist.regDate }"
							pattern="yyyy-MM-dd" />&nbsp;&nbsp;</td>
					<td><a href="/market/prd_update?prdNo=${prdlist.prdNo}"
						class="btn btn-brand" id="font">수정</a>
						<a href="/market/prd_delete?prdNo=${prdlist.prdNo}"
						class="btn btn-brand" id="font" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</body>
</html>