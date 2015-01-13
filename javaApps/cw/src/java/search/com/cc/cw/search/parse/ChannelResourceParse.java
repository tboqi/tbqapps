package com.cc.cw.search.parse;

import java.util.List;

import com.cc.cw.service.ChannelService;

public class ChannelResourceParse extends ResourceParseImpl {

	private ChannelService service = null;

	public String getPath(){
		return FILEPATH+"channelIndexedRecord.txt";
	}

	public boolean haveNewResource(String id) {
		if(id != null && !(id.equals(""))){
			return service.havaNewChannel(Integer.parseInt(id));
		}
		return false;
	}

	public List parseResource(String from) {
		try{
			if(from != null && !(from.equals(""))){
				return service.getNewChannels(Integer.parseInt(from));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public void setService(ChannelService service) {
		this.service = service;
	}


}
