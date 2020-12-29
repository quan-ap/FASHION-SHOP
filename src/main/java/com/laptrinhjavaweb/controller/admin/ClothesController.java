package com.laptrinhjavaweb.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.dto.ClothesDTO;
import com.laptrinhjavaweb.service.ICategoryService;
import com.laptrinhjavaweb.service.IClothesService;
import com.laptrinhjavaweb.util.MessageUtil;

@Controller(value = "clothesControllerOfAdmin")
public class ClothesController {
	
	@Autowired
	private IClothesService clothesService;
	
	@Autowired
	private MessageUtil messageUtil;
	
	@Autowired
	private ICategoryService categoryService;

	@RequestMapping(value = "/quan-tri/clothes/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList(@RequestParam("page") int page, @RequestParam("limit") int limit, HttpServletRequest request) {
		ClothesDTO model = new ClothesDTO();
		model.setPage(page);
		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("admin/clothes/list");
		Sort sort = new Sort(new Sort.Order(Direction.ASC, "createdDate"));
		Pageable pageable = new PageRequest(page - 1, limit, sort);
		model.setListResult(clothesService.findAll(pageable));
		model.setTotalItem(clothesService.getTotalItem());
		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("messsage", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("model", model);
		return mav;
	}


	@RequestMapping(value = "/quan-tri/clothes/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editNew(@RequestParam(value = "id", required = false) String id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/clothes/edit");
		ClothesDTO model = new ClothesDTO();
		if (id != null) {
			model = clothesService.findById(id);
		}
		if (request.getParameter("message") != null) {
			if (request.getParameter("message").equals("insert_success")) {
				mav.addObject("message", "Insert Success");
				mav.addObject("alert", "success");
			} else if(request.getParameter("message").equals("update_success")) {
				mav.addObject("message", "Update Success");
				mav.addObject("alert", "success");
			} else if(request.getParameter("message").equals("error_system")) {
				mav.addObject("message", "Error");
				mav.addObject("alert", "danger");
			}
		}
		mav.addObject("categories", categoryService.findAll());
		mav.addObject("model", model);
		return mav;
	}
	
	@RequestMapping(value = "/quan-tri/clothes/search", method = RequestMethod.GET)
	public ModelAndView findClothesByNameOrId(@RequestParam(value = "nameOrId", required = false) String nameOrId, HttpServletRequest request) {
		ClothesDTO model = new ClothesDTO();
		ModelAndView mav = new ModelAndView("admin/clothes/search");
                    String str = String.valueOf(nameOrId);
		if (str.contains(" ")) {
			model.setTitle(nameOrId);
			model.setListResult(clothesService.findAllByName(model));
		}else {
			model = clothesService.findById(nameOrId);
		}
		mav.addObject("model", model);
		return mav;
	}
	
}
