package com.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bean.Users;
import com.octo.captcha.service.CaptchaServiceException;
import com.octo.captcha.service.image.ImageCaptchaService;
import com.services.UserRoleServices;

@Controller
public class BaseController {
	@Autowired
	private UserRoleServices userRoleServices;
	@Autowired  
    private ImageCaptchaService imageCaptchaService;  
	
	/**
	 * 含有管理员权限
	 * @param users
	 * @return
	 */
	public boolean hasAdminRole(Users users) {
		return userRoleServices.hasAdminRole(users);
	}
	
	/**
	 * 含有学生权限
	 * @param users
	 * @return
	 */
	public boolean hasStudentRole(Users users) {
		return userRoleServices.hasStudentRole(users);
	}
	
	/**
	 * 含有教师权限
	 * @param users
	 * @return
	 */
	public boolean hasTeacherRole(Users users) {
		return userRoleServices.hasTeacherRole(users);
	}
	
	/**
	 * 验证码
	 * @return
	 */
	@RequestMapping(value="/captcha", method = RequestMethod.GET)
	public void capthcha(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 byte[] captchaChallengeAsJpeg = null;
		  // the output stream to render the captcha image as jpeg into
		  ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream(); 
		  try {
		   // get the session id that will identify the generated captcha.
		   // the same id must be used to validate the response, the session id is a good candidate!
		 
		   String captchaId = request.getSession().getId();
		   BufferedImage challenge = imageCaptchaService.getImageChallengeForID(captchaId, request.getLocale()); 
		 
		   ImageIO.write(challenge, "jpeg", jpegOutputStream);
		  } catch (IllegalArgumentException e) {
		   response.sendError(HttpServletResponse.SC_NOT_FOUND); 
		   return;
		  } catch (CaptchaServiceException e) {
		   response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); 
		   return;
		  }
		 
		  captchaChallengeAsJpeg = jpegOutputStream.toByteArray(); 
		 
		  // flush it in the response 
		  response.setHeader("Cache-Control", "no-store"); 
		  response.setHeader("Pragma", "no-cache"); 
		  response.setDateHeader("Expires", 0); 
		  response.setContentType("image/jpeg"); 
		 
		  ServletOutputStream responseOutputStream = response.getOutputStream(); 
		  responseOutputStream.write(captchaChallengeAsJpeg); 
		  responseOutputStream.flush(); 
		  responseOutputStream.close(); 
	}
}
