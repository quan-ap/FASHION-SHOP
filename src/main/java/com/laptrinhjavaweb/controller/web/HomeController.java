package com.laptrinhjavaweb.controller.web;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.ClothesDTO;
import com.laptrinhjavaweb.service.IClothesService;


@Controller(value = "homeControllerOfWeb")
public class HomeController {
	
	@Autowired
	private IClothesService clothesService;
	

	
	@RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
	public ModelAndView homePage(@RequestParam("page") int page, @RequestParam("limit") int limit, HttpServletRequest request) {
		ClothesDTO model = new ClothesDTO();
		model.setPage(page);
		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("web/home");
		Sort sort = new Sort(new Sort.Order(Direction.ASC, "createdDate"));
		Pageable pageable = new PageRequest(page - 1, limit, sort);
		model.setListResult(clothesService.findAll(pageable));
		model.setTotalItem(clothesService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	
	@RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
	public ModelAndView accessDenied() {
		return new ModelAndView("redirect:/dang-nhap?accessDenied");
	}
	
	@RequestMapping(value = "/thoat", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/trang-chu");
	}
	
	@RequestMapping(value = "/trang-chu/search", method = RequestMethod.GET)
	public ModelAndView findClothesByName(@RequestParam(value = "name", required = false) String name, HttpServletRequest request) {
		ClothesDTO model = new ClothesDTO();
		model.setTitle(name);
		ModelAndView mav = new ModelAndView("web/clothes/search");
		model.setListResult(clothesService.findAllByName(model));
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/trang-chu/detail", method = RequestMethod.GET)
	public ModelAndView detailProduct(@RequestParam(value = "id", required = false) String id, HttpServletRequest request) {
		ClothesDTO model = new ClothesDTO();
		ModelAndView mav = new ModelAndView("web/clothes/detail");
		model = clothesService.findById(id);
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/dang-ki", method = RequestMethod.GET)
	public ModelAndView register() {
		ModelAndView mav = new ModelAndView("register");
		return mav;
	}
	
	@RequestMapping(value = "/trang-chu/cart", method = RequestMethod.GET)
	public ModelAndView cart() {
		ModelAndView mav = new ModelAndView("web/clothes/cart");
		return mav;
	}
}