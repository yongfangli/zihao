package com.thinkgem.jeesite.modules.mybusiness.front;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.mybusiness.activity.service.ActivityService;

@Controller
public class ZihaoIndexController extends BaseController {
	@Autowired
	private ActivityService activityService;

	/**
	 * 首页
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/index")
	public String index(Model model) {
		model.addAttribute("activityList", activityService.findRecentlyActivity(8));
		return "zihao/index";

	}

	/**
	 * 活动详情
	 * 
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/activity/detail/{id}")
	public String activityDetail(Model model, @PathVariable String id) {
		model.addAttribute("activity", activityService.get(id));
		return "zihao/activityDetail";

	}

	/**
	 * 活动列表
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/activity/list")
	public String activityList(Model model) {
		return "zihao/activityList";

	}

	@RequestMapping(value = "/product")
	public String product(Model model) {
		return "zihao/product";

	}
}
