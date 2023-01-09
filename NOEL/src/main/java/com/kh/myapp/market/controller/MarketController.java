package com.kh.myapp.market.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.kh.myapp.commom.FileRename;
import com.kh.myapp.market.model.service.MarketQnaService;
import com.kh.myapp.market.model.service.MarketReviewService;
import com.kh.myapp.market.model.service.ProductService;
import com.kh.myapp.market.model.vo.MarketQnaVO;
import com.kh.myapp.market.model.vo.MarketReviewVO;
import com.kh.myapp.market.model.vo.ProductImgVO;
import com.kh.myapp.market.model.vo.ProductVO;

@Controller
@RequestMapping("/market/*")
public class MarketController {

	private static final Logger logger = LoggerFactory.getLogger(MarketController.class);

	@Autowired
	private ProductService productService;

	@Autowired
	private FileRename fileRename;
	@Autowired
	private MarketReviewService reviewService;

	@Autowired
	private MarketQnaService qnaService;

	// 판매자 관리화면 출력, 판매자 상품등록 리스트 출력
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void getMarketer(Model model) throws Exception {
		List<ProductVO> list = productService.list();
		model.addAttribute("prdlist", list);
	}

	// 판매자 상품 등록폼
	@RequestMapping(value = "/prd_add", method = RequestMethod.GET)
	public void getPrdadd() throws Exception {
		logger.info("판매자 상품등록화면으로 이동");
	}

	// 판매자 상품 등록하기(다중 이미지)
	@RequestMapping(value = "/prd_add", method = RequestMethod.POST)
	public String addPrd(ProductVO vo, MultipartFile[] file, HttpServletRequest request, String zipCode)
			throws Exception {
		logger.info("판매자 상품등록 하기");

		// 첨부이미지 목록 저장할 리스트 생성
		ArrayList<ProductImgVO> prdImgList = new ArrayList<ProductImgVO>();
		if (!file[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("resources/upload/prd_add/");

			for (MultipartFile file2 : file) {
				String filename = file2.getOriginalFilename();
				String imgpath = fileRename.fileRename(savePath, filename);
				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + imgpath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file2.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				ProductImgVO prdImg = new ProductImgVO();
				prdImg.setPrdImgpath(imgpath);
				prdImgList.add(prdImg);
			}
		}
		vo.setPrdImgList(prdImgList);
		int result = productService.add(vo);
		return "redirect:/market/main";

	}

	// 판매자 상품 수정폼
	@RequestMapping(value = "/prd_update", method = RequestMethod.GET)
	public String readPrd(Model model, @SessionAttribute ProductVO vo) throws Exception {
		ProductVO read = productService.read(vo.getPrdNo());
		ArrayList<ProductImgVO> prdImgList = productService.selectPrdImg(vo.getPrdNo());
		model.addAttribute("prdlist", read);
		model.addAttribute("prdImgList", prdImgList);
		return "/market/prd_update";
	}

	// 판매자 상품 수정하기
	@RequestMapping(value = "/prd_update", method = RequestMethod.POST)
	public String updatePrd(ProductVO vo, int[] imgNoList, String[] imgpathList, MultipartFile[] file,
			HttpServletRequest request, String zipCode) throws Exception {
		productService.update(vo);
		return "redirect:/market/main";
	}

	// 판매자 상품 삭제하기
	@RequestMapping(value = "/prd_delete", method = RequestMethod.GET)
	public String deletePrd(int prdNo) throws Exception {
		productService.delete(prdNo);
		return "redirect:/market/main";
	}

	// 마켓 상품 상세페이지 (리뷰 & qna)
	@RequestMapping(value = "/marketDetailView", method = RequestMethod.GET)
	public void marketDetailView(int regPage, Model model) throws Exception {
		String test = qnaService.prdQnaWrite(regPage);
		model.addAttribute("qna", test);
		List<MarketReviewVO> reviewlist = reviewService.reviewList();
		model.addAttribute("reviewlist", reviewlist);
		List<MarketQnaVO> qnalist = qnaService.qnaList();
		model.addAttribute("qnalist", qnalist);
	}

	// 리뷰 상세
	@RequestMapping(value = "/reviewDetail", method = RequestMethod.GET)
	public String reivewDetail(MarketReviewVO marketReviewVO, Model model, int prdReviewno) throws Exception {
		logger.info("리뷰 상세조회");
		reviewService.reviewDetail(marketReviewVO.getPrdReviewno());
		model.addAttribute("reivewdetail", reviewService.reviewDetail(marketReviewVO.getPrdReviewno()));
		return "/market/reviewDetail";
	}

	// 리뷰 작성
	@RequestMapping(value = "/reviewInsert", method = RequestMethod.POST)
	public String reviewInsert(MarketReviewVO marketreviewVO) throws Exception {
		logger.info("리뷰 작성");
		reviewService.reviewInsert(marketreviewVO);
		return "redirect:marketDetailView?regPage=1";
	}

	// 리뷰 수정

	@RequestMapping(value = "/reviewUpdate", method = RequestMethod.POST)
	public String reviewUpdate(MarketReviewVO marketReviewVO) throws Exception {
		logger.info("리뷰 수정");
		reviewService.reviewUpdate(marketReviewVO);
		return "redirect:marketDetailView?regPage=1";
	}

	// 리뷰 삭제

	@RequestMapping(value = "/reviewDelete")
	public String reviewDelete(MarketReviewVO marketReviewVO) throws Exception {
		logger.info("리뷰 삭제");
		reviewService.reviewDelete(marketReviewVO.getPrdReviewno());
		return "redirect:marketDetailView?regPage=1";
	}

	// QnA 상세

	@RequestMapping(value = "/qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(MarketQnaVO marketQnaVO, Model model, int prdQnano) throws Exception {
		logger.info("리뷰 상세조회");
		qnaService.qnaDetail(marketQnaVO.getPrdQnano());
		model.addAttribute("qnadetail", qnaService.qnaDetail(marketQnaVO.getPrdQnano()));
		return "/market/qnaDetail";
	}

	// QnA 작성

	@RequestMapping(value = "/qnaInsert", method = RequestMethod.POST)
	public String qnaInsert(MarketQnaVO marketqnaVO) throws Exception {
		logger.info("QnA 작성");
		qnaService.qnaInsert(marketqnaVO);
		return "redirect:marketDetailView?regPage=1";
	}

	// QnA 수정

	@RequestMapping(value = "/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(MarketQnaVO marketqnaVO) throws Exception {
		logger.info("QnA 수정");
		qnaService.qnaUpdate(marketqnaVO);
		return "redirect:marketDetailView?regPage=1";
	}

	// QnA 삭제

	@RequestMapping(value = "/qnaDelete")
	public String qnaDelete(MarketQnaVO marketqnaVO) throws Exception {
		logger.info("QnA 삭제");
		qnaService.qnaDelete(marketqnaVO.getPrdQnano());
		return "redirect:marketDetailView?regPage=1";
	}

}
