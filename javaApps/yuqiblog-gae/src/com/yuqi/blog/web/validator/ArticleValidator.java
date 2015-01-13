package com.yuqi.blog.web.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.yuqi.blog.web.command.ArticleCommand;

public class ArticleValidator implements Validator {

	@SuppressWarnings("unchecked")
	@Override
	public boolean supports(Class command) {
		return ArticleCommand.class.equals(command);
	}

	@Override
	public void validate(Object command, Errors errors) {
		ArticleCommand article = (ArticleCommand) command;
		if (article == null) {
			errors.rejectValue("title", "error.article.title", null, "标题不能为空.");
		} else {
			if (article.getTitle() == null || article.getTitle().length() < 1) {
				errors.rejectValue("title", "error.article.title", null,
						"标题不能为空.");
			}
		}
	}

}
