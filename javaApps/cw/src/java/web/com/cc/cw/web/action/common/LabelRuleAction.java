package com.cc.cw.web.action.common;

import java.io.IOException;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cc.cw.dm.dataAnalyze.GetRuleFromTxt;
import com.cc.cw.service.LabelRulesService;

public class LabelRuleAction extends SessionActionSupport {

	private static final long serialVersionUID = 1L;
	
	private List<String[]> ruleList;
	private String flag;
	private String[] id;
	private String[] did;
	private LabelRulesService labelRulesService;
	private List rlist;
	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String[] getId() {
		return id;
	}

	public void setId(String[] id) {
		this.id = id;
	}

	public LabelRulesService getLabelRulesService() {
		return labelRulesService;
	}

	public void setLabelRulesService(LabelRulesService labelRulesService) {
		this.labelRulesService = labelRulesService;
	}

	public String execute() throws IOException{
		
		if(flag != null && flag.equalsIgnoreCase("input")) {
			insertRules();
		}
		if(flag != null && flag.equalsIgnoreCase("delete")) {
			deleteRules();
		}
		GetRuleFromTxt grft = new GetRuleFromTxt();
		ruleList = grft.getRules();		
		rlist = labelRulesService.getAll();
		return "list";
	}
	
	private String deleteRules() {
		labelRulesService.delete(did);
		return "sussess";
	}

	private String insertRules() {
		String name = "未知";
		labelRulesService.insert(id, name, "dm");
		
		return "success";
	}

	public static void main(String[] args) throws IOException {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				new String[] { "applicationContext.xml",
						"dataAccessContext-local.xml" });
		LabelRuleAction lra = new LabelRuleAction();
		lra.setLabelRulesService((LabelRulesService)ctx.getBean("labelRulesService"));
		lra.setDid(new String[]{"5","6"});
		lra.setFlag("delete");
		lra.setId(new String[]{"a2--b2","a3--b3"});
		lra.execute();
	}

	public List<String[]> getRuleList() {
		return ruleList;
	}

	public void setRuleList(List<String[]> ruleList) {
		this.ruleList = ruleList;
	}

	public String[] getDid() {
		return did;
	}

	public void setDid(String[] did) {
		this.did = did;
	}

	public List getRlist() {
		return rlist;
	}

	public void setRlist(List rlist) {
		this.rlist = rlist;
	}
	
	
}
