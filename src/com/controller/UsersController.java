package com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bean.Msg;
import com.bean.Users;
import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.image.ImageCaptchaService;
import com.services.MsgServices;
import com.services.UserServices;
import com.util.WebUtil;

@Controller
@RequestMapping(value="/user")
@SessionAttributes("msgs")
public class UsersController extends BaseController {
	@Autowired
	private UserServices userServices;
	@Autowired  
    private ImageCaptchaService imageCaptchaService;
	@Autowired
	private MsgServices msgServices; 
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String login(Users user, String captcha, Model model, HttpServletRequest request) {
        Boolean isResponseCorrect = Boolean.FALSE;
		try {
			isResponseCorrect = imageCaptchaService.validateResponseForID(request.getSession().getId(), captcha);
		} catch (CaptchaServiceException e1) {
			model.addAttribute("captchaError", "验证码错误，请刷新验证码");
			return "login";
		}  
        try {
			if (isResponseCorrect) {  
				Users users = userServices.login(user);
				if(null != users) {
					model.addAttribute("user", users);
					request.getSession().setAttribute("user", users);
					List<Msg> msgs = msgServices.findAll();
					model.addAttribute("msgs", msgs);
					if(hasAdminRole(users)) {
						return "redirect:admin";
					}
					if(hasTeacherRole(users)) {
						return "redirect:teacher";
					}
					if(hasStudentRole(users)) {
						return "redirect:student";
					} 			
				} else {
					model.addAttribute("loginError", "用户名或密码错误");
					return "login";
				}
			} else {
				model.addAttribute("captchaError", "验证码输入错误");
				return "login";
			}
		} catch (Exception e) {
			model.addAttribute("loginError", "数据库连接失败");
			return "login";
		}
        return "fail";	
	}
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String toAdmin() {
		return "admin";
	}
	
	@RequestMapping(value="/teacher", method = RequestMethod.GET)
	public String toTeacher() {
		return "teacher";
	}
	
	@RequestMapping(value="/student", method = RequestMethod.GET)
	public String toStudent() {
		return "student";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String tologin() {
		return "login";
	}

	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String loginOut() {
		WebUtil.getSession().removeAttribute("user");
		return "redirect:/user/login";
	}
}
