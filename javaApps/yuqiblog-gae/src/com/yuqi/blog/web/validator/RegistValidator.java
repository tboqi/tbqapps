package com.yuqi.blog.web.validator;

import org.apache.commons.lang.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.yuqi.blog.domain.User;

public class RegistValidator implements Validator {

	@SuppressWarnings("unchecked")
	@Override
	public boolean supports(Class arg0) {
		return User.class.equals(arg0);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		User user = (User)obj;
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
			if (!StringUtils.equals(user.getPassword(), user.getPassword2())) {
				errors.rejectValue("password2", "error.regist.password2", 
						null, "Value required.");
			}
			if (user.getEmail() == null || 
					user.getEmail().length() < 1) {
				errors.rejectValue("email", "error.regist.email", 
						null, "Value required.");
			}
		}
	}

}
