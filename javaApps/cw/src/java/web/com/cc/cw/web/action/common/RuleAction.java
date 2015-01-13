package com.cc.cw.web.action.common;

import java.util.ArrayList;
import java.util.List;

import com.cc.cw.domain.LabelRules;
import com.cc.cw.service.AtomLabelService;
import com.cc.cw.service.LabelRulesService;

public class RuleAction extends SessionActionSupport {
	
	private static final long serialVersionUID = 1L;
	
	private String actionFlag;
	private LabelRules rule;
	private List<String> labelList;
	private Integer[] ruleId;
	private List<LabelRules> dmrules;
	private List<LabelRules> manualrules;
	
	private AtomLabelService atomLabelService;
	private LabelRulesService labelRulesService;
	
	@SuppressWarnings("unchecked")
	public String execute(){
		String result = null;
		if(actionFlag == null||actionFlag.equals("")){
			labelList = atomLabelService.getDistinctContent();
			if(labelList==null){
				labelList = new ArrayList<String>();
			}
			result = "forward_addrule";
		}
		if(actionFlag!=null&&actionFlag.equalsIgnoreCase("addrule")){
			String[] rules = new String[]{rule.getSourceTags()+"--"+rule.getTargetTags()};
			labelRulesService.insert(rules, "ww","manual");
			result = rulelist();
		}
		if(actionFlag!=null&&actionFlag.equalsIgnoreCase("rulelist")){
			result = rulelist();
		}
		if(actionFlag!=null&&actionFlag.equalsIgnoreCase("delete_manualrule")){
			StringBuffer value = new StringBuffer();
			if(ruleId!=null && ruleId.length>0){
				for (int i = 0; i < ruleId.length; i++) {
					value.append(ruleId[i]+",");
				}
				labelRulesService.delete(new String[]{value.substring(0, value.length()-1).toString()});
			}
			result = rulelist();
		}
		return result;
	}
	
	public String rulelist(){
		dmrules = labelRulesService.getRulesByType("dm");
		manualrules = labelRulesService.getRulesByType("manual");
		return "forward_rulelist";
	}
	/*
	 * get,set方法
	 */
	public String getActionFlag() {
		return actionFlag;
	}
	public void setActionFlag(String actionFlag) {
		this.actionFlag = actionFlag;
	}

	public LabelRules getRule() {
		return rule;
	}

	public void setRule(LabelRules rule) {
		this.rule = rule;
	}

	public List<String> getLabelList() {
		return labelList;
	}

	public void setLabelList(List<String> labelList) {
		this.labelList = labelList;
	}
	
	public AtomLabelService getAtomLabelService() {
		return atomLabelService;
	}

	public void setAtomLabelService(AtomLabelService atomLabelService) {
		this.atomLabelService = atomLabelService;
	}

	public Integer[] getRuleId() {
		return ruleId;
	}

	public void setRuleId(Integer[] ruleId) {
		this.ruleId = ruleId;
	}

	public List<LabelRules> getDmrules() {
		return dmrules;
	}

	public void setDmrules(List<LabelRules> dmrules) {
		this.dmrules = dmrules;
	}

	public List<LabelRules> getManualrules() {
		return manualrules;
	}

	public void setManualrules(List<LabelRules> manualrules) {
		this.manualrules = manualrules;
	}
	
	public LabelRulesService getLabelRulesService() {
		return labelRulesService;
	}

	public void setLabelRulesService(LabelRulesService labelRulesService) {
		this.labelRulesService = labelRulesService;
	}
}
