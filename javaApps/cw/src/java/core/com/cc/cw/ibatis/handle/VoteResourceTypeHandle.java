package com.cc.cw.ibatis.handle;

import com.cc.cw.domain.Vote.ResourceType;

public class VoteResourceTypeHandle extends EnumTypeHandler<ResourceType>{
	
	public VoteResourceTypeHandle(){
		super(ResourceType.class);
	}

}
