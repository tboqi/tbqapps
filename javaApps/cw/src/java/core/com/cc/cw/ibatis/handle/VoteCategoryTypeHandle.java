package com.cc.cw.ibatis.handle;

import com.cc.cw.domain.Vote.VoteCategory;

public class VoteCategoryTypeHandle extends EnumTypeHandler<VoteCategory>{
	
	public VoteCategoryTypeHandle(){
		super(VoteCategory.class);
	}

}
