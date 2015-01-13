package com.yuqi.blog.web.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import com.yuqi.blog.domain.User;
import com.yuqi.blog.service.UserService;

public class LoginValidator implements Validator {

	private UserService userService;
	@SuppressWarnings("unchecked")
	@Override
	public boolean supports(Class command) {
		return User.class.equals(command);
	}

	@Override
	public void validate(Object command, Errors errors) {
		User user = (User)command;
		if (user == null) {
			errors.rejectValue("username", "error.regist.username", null, "Value required.");
		} else {
			if (user.getUsername() == null || 
					user.getUsername().length() < 1) {
				errors.rejectValue("username", "error.regist.username", 
						null, "Value required.");
			}
			if (user.getPassword() == null || 
					user.getPassword().length() < 1) {
				errors.rejectValue("password", "error.regist.password", 
						null, "Value required.");
			}
		}
		if(!errors.hasErrors()) {
			User user2 = userService.login(user.getUsername(), user.getPassword());
			if (user2 == null) {
				errors.rejectValue("username", "error.regist.loginerror", null, "用户名或密码错误");
			}
		}
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
