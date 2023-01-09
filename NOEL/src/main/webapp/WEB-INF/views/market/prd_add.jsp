<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 상품등록 페이지</title>
<link rel="stylesheet" href="/resources/css/index/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/index/owl.carousel.min.css">
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<link rel="stylesheet" href="/resources/css/product/prd_add.css">
<script src="/resources/js/index/jquery.min.js"></script>
<script src="/resources/js/index/owl.carousel.min.js"></script>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/market/market.js"></script>
</head>
<body data-bs-spy="scroll" data-bs-target=".navbar" data-bs-offset="70">
	<jsp:include page="/WEB-INF/views/layouts/header.jsp" />

	<div class="col-12 grid-margin stretch-card"
		style="margin-bottom: 200px;">
		<div class="card">
			<div class="card-body">
				<br>
				<h1 class="card-title">상품 등록</h1>
				<br> <Br>
				<div class="form-group">
					<h4>상품 정보입력</h4><br>
				</div>
				<form method="post" action="/market/prd_add" name="addForm"
					id="addForm" enctype="multipart/form-data">
					<div class="form-group">
						<label>대표 이미지를 선택해 주세요</label> 
						<input type="file" name="file"	class="file-upload-default" id="file" multiple>
						<div class="input-group col-xs-12">
							<input type="text" class="form-control file-upload-info" disabled
								placeholder="대표 이미지를 선택해 주세요." >
							 <span class="input-group-append">
								<button class="file-upload-browse btn btn-primary" type="button"
									id="prdImg">이미지 선택</button>
							</span>
						</div>
					</div>
					<br>
					<div class="form-group">
						<label for="category">카테고리를 선택해주세요</label> <br>
						<div class="form-group">
							<select id="category" name="cateGory"
								class="category form-control chk" title="카테고리를 선택해주세요"
								style="border: 0; border-bottom: 1px solid gainsboro;" required
								oninvalid="this.setCustomValidity('카테고리를 선택해주세요')"
								oninput="this.setCustomValidity('')">
								<option value="" hidden="" disabled="disabled"
									selected="selected">상품 종류를 선택해주세요</option>
								<option value="빵">빵</option>
								<option value="케이크">케이크</option>
								<option value="잼 & 청">잼 & 청</option>
								<option value="비누">비누</option>
								<option value="캔들">캔들</option>
							</select>
						</div>
					</div><br>
					<div class="form-group">
						<label for="prdname">상품명을 입력해주세요</label>
						<input type="text" class="form-control chk" id="prdname"
							title="상품명을 입력해주세요"
							name="prdName" placeholder="상품명을 입력해주세요." required
							oninvalid="this.setCustomValidity('상품명 입력해주세요')"
							oninput="this.setCustomValidity('')">
					</div><br>
					<div class="form-group">
						<label for="prdprice">상품가격을 입력해주세요</label>
						<input type="text" class="form-control chk" id="prdprice"
							title="상품가격을 입력해주세요"
							name="prdPrice" placeholder="상품가격을 입력해주세요." required
							oninvalid="this.setCustomValidity('상품가격을 입력해주세요')"
							oninput="this.setCustomValidity('')">
					</div><br>
					<div class="form-group">
						<label for="prdstock">재고를 입력해주세요</label>
						<input type="number" class="form-control chk" id="prdstock"
							title="재고를 입력해주세요"
							name="prdStock" placeholder="숫자로 입력해주세요." required
							oninvalid="this.setCustomValidity('재고를 입력해주세요')"
							oninput="this.setCustomValidity('')">
					</div><br>
					<div class="form-group">
						<label for="prdnote">알러지 정보를 입력해주세요</label>
						<input type="text" class="form-control chk" id="prdnote"
							title="알러지 정보를 입력해주세요"
							name="prdNote" placeholder="예) 계란 및 땅콩이 함유되어있습니다." required
							oninvalid="this.setCustomValidity('알러지정보를 입력해주세요')"
							oninput="this.setCustomValidity('')">
					</div><br>
					<div class="form-group">
						<label for="prdcontent">상품 상세내용을 설명해주세요</label>
						<textarea class="form-control chk" id="prdcontent"
							title="상품 상세내용을 입력해주세요"
							name="prdContent" rows="5" style="height:20em; resize:none;"
							oninvalid="this.setCustomValidity('상세설명을 입력하세요')"
							oninput="this.setCustomValidity('')"></textarea>
					</div> <br><br>
					<div class="form-group">
						<h4>판매자 정보입력</h4><br>
					</div>
					<div class="form-group">
						<label for="prdtel">전화번호를 입력해주세요</label>
						<input type="text" class="form-control chk" id="prdtel"
							
							name="prdTel" placeholder="예) 000-0000-0000" required
							oninvalid="this.setCustomValidity('전화번호를 입력하세요')"
							oninput="this.setCustomValidity('')"> <span
							class="comment" style="font-size: 12px; padding-left: 10px;"></span>
						</div>
						<div class="form-group">
							<label >주소를 입력해주세요<br></label><br>
							<button type="button" onclick="javascript:sample6_execDaumPostcode();" 
								class="btn btn-brand" >우편번호 찾기</button>
							<input type="hidden" id="marketer_addr1" readonly="readonly" >
							<input type="hidden" id="marketer_addr4" readonly="readonly" >
							<input type="text" class="form-control chk" id="marketer_addr2"
								title="주소를 입력해주세요"
								name="prdAddr1" placeholder="(도로명)" readonly="readonly">
							<input type="text" class="form-control chk" id="marketer_addr3"
								title="상세주소를 입력해주세요"
								name="prdAddr2" placeholder="상세주소를 입력해주세요." required
								oninvalid="this.setCustomValidity('주소를 입력하세요')"
								oninput="this.setCustomValidity('')"> <br>
					</div> <br>
					<div class="submitBtn1">
						<button type="submit" class="prd_Btn btn btn-brand" id="font" >저장</button>
						<button type="button" onclick="javascript:history.go(-1);" class="btn btn-brand">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/layouts/footer.jsp" />
</html>