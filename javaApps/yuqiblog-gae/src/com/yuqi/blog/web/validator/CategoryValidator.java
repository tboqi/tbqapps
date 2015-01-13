package com.yuqi.blog.web.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.yuqi.blog.domain.Category;

public class CategoryValidator implements Validator {

	@SuppressWarnings("unchecked")
	@Override
	public boolean supports(Class command) {
		return Category.class.equals(command);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		Category category = (Category) obj;
		if (category == null) {
			errors
					.rejectValue("title", "error.category.title", null,
							"标题不能为空.");
		} else {
			if (category.getName() == null || category.getName().length() < 1) {
				errors.rejectValue("title", "error.category.title", null,
						"标题不能为空.");
			}
		}
	}

}
