<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="icon" type="image/x-icon" href="favicon.ico">
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
<link rel="stylesheet" href="/resources/css/header/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/header/style.css">
<!-- BOTTOM NAV -->
<nav class="navbar navbar-expand-lg navbar-light bg-white sticky-top">
	<div class="container">
		<a class="navbar-brand" href="/">bonjour noël<span class="dot">!</span></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link" href="#">About us</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/market/marketDetailView?regPage=1">Market</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Class</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link" href="#">Review</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link" href="#">Contact us</a>
				</li>
			</ul>
			
			<ul class="navbar-nav ms-auto">
				<li class="nav-item">
					<a class="nav-link" href="#">login</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">Register</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/market/main">Mypage</a>
				</li>
			</ul>
		</div>
	</div>
</nav>