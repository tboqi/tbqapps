package com.xiaoshuo.stock.util;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.StringUtils;

import com.xiaoshuo.stock.domain.Company;
import com.xiaoshuo.stock.impl.CompanyManagerImpl;
import com.xiaoshuo.stock.impl.StockManagerImpl;

import au.id.jericho.lib.html.Element;
import au.id.jericho.lib.html.Source;
import au.id.jericho.lib.html.StartTag;

public class HtmlCompany {
	public static Company parseCompany(String stockNum) {
		String sourceUrlString = "http://stockdata.stock.hexun.com/urwh/company/default/"
				+ stockNum + ".shtml";
		try {
			Company c = new Company();
			Source source = new Source(new URL(sourceUrlString));
			List list = source.findAllStartTags("class", "black_bold", true);
			StartTag tag = (StartTag) list.get(0);
			Element e = tag.getElement();
			c.setFullName(e.getTextExtractor().toString().trim());

			list = source.findAllStartTags("td");
//			for(int i =0;i<list.size();i++) {
//				tag = (StartTag)list.get(i);
//				e = tag.getElement();
//				System.out.println(i+":" + e.toString());
//			}
			if(list==null)return null;
			tag = (StartTag) list.get(32);
			e = tag.getElement();
			if(!(e==null || e.getChildElements()==null || e.getChildElements().size()<=0))
			c.setStockName(((Element) e.getChildElements().get(0))
					.getTextExtractor().toString().trim());

			tag = (StartTag) list.get(34);
			e = tag.getElement();
			c.setStockNum(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			tag = (StartTag) list.get(36);
			e = tag.getElement();
			c.setTocalStock(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			tag = (StartTag) list.get(38);
			e = tag.getElement();
			c.setCurrentStock(StringUtils.replace(e.getTextExtractor()
					.toString().trim(), "　", ""));

			tag = (StartTag) list.get(40);
			e = tag.getElement();
			c.setPublishDate(StringUtils.replace(e.getTextExtractor()
					.toString().trim(), "　", ""));

			tag = (StartTag) list.get(42);
			e = tag.getElement();
			c.setMarketDate(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			tag = (StartTag) list.get(44);
			e = tag.getElement();
			c.setIndustry(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			tag = (StartTag) list.get(46);
			e = tag.getElement();
			c.setArea(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			tag = (StartTag) list.get(48);
			e = tag.getElement();
			c.setTaxRate(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			tag = (StartTag) list.get(50);
			e = tag.getElement();
			c.setCorporateRepresentative(StringUtils.replace(e
					.getTextExtractor().toString().trim(), "　", ""));

			tag = (StartTag) list.get(52);
			e = tag.getElement();
			c.setLinkman(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			tag = (StartTag) list.get(54);
			e = tag.getElement();
			c.setMainUnderwriter(StringUtils.replace(e.getTextExtractor()
					.toString().trim(), "　", ""));

			tag = (StartTag) list.get(56);
			e = tag.getElement();
			c.setAddress(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			tag = (StartTag) list.get(58);
			e = tag.getElement();
			c.setPostalcode(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			tag = (StartTag) list.get(60);
			e = tag.getElement();
			c.setTele(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			tag = (StartTag) list.get(62);
			e = tag.getElement();
			c.setFax(StringUtils.replace(
					e.getTextExtractor().toString().trim(), "　", ""));

			tag = (StartTag) list.get(64);
			e = tag.getElement();
			c.setEmail(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			tag = (StartTag) list.get(66);
			e = tag.getElement();
			c.setComUrl(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			tag = (StartTag) list.get(68);
			e = tag.getElement();
			c.setScopeOfBusiness(StringUtils.replace(e.getTextExtractor()
					.toString().trim(), "　", ""));

			tag = (StartTag) list.get(70);
			e = tag.getElement();
			c.setProduct(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			tag = (StartTag) list.get(72);
			e = tag.getElement();
			c.setDescription(StringUtils.replace(e.getTextExtractor().toString()
					.trim(), "　", ""));

			return c;
		} catch (MalformedURLException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static void main(String[] args) {
//		Company c = null;
//		c = parseCompany("000061");
//		CompanyManagerImpl.add(c);
		List<String> list = StockManagerImpl.getAllStockNum();
		Company c = null;
		for (Iterator iter = list.iterator(); iter.hasNext();) {
			String stockNum = (String) iter.next();
			System.out.println(stockNum);
			c = parseCompany(stockNum);
			CompanyManagerImpl.add(c);
		}
	}
}
