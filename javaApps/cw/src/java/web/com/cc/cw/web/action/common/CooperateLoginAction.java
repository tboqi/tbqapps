package com.cc.cw.web.action.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
import java.util.Map.Entry;

import com.cc.cw.domain.Member;
import com.cc.cw.util.DateTimeUtil;
import com.cc.cw.util.FileUtil;
import com.cc.cw.web.CwConfiguration;

public class CooperateLoginAction extends SessionActionSupport {

	private static final long serialVersionUID = -8106150385142791285L;

	protected static final String USERFILE = CwConfiguration.create().get("admin.file.dir");

	protected static final String REFERDIR = CwConfiguration.create().get("refer.dir");

	private static final String FILESEPARATOR = System.getProperty("file.separator");

	private static final String LINESEPARATOR = System.getProperty("line.separator");

	private static final int TODAY = 0;

	private static final int WEEK = 1;

	private static final int MONTH = 2;

	private static final int YESTODAY = 3;

	private String name;

	private String password;

	private String msg;

	/** 保存所有合作网站名称 */
	private String[] sites;

	private int todayIP;

	private int yestodayIP;

	private int weekIP;

	private int monthIP;

	@SuppressWarnings("unchecked")
	public String execute() {
		if (session.get("admin") == null) {
			String[] users = loadAdminFile(USERFILE);
			if (name == null || name.trim().equals("") || password == null || password.trim().equals("")) {
				msg = "用户名密码错误!";
				return INPUT;
			}
			if (users != null && users.length > 0) {
				for (String user : users) {
					if (user == null || user.trim().equals(""))
						continue;
					String[] infos = user.split(" ");
					if (name.trim().equals(infos[0]) && password.trim().equals(infos[1])) {
						Member member = new Member();
						member.setUserName(name);
						member.setPassword(password);
						session.put("admin", member);
					} else {
						msg = "用户名密码错误!";

						return INPUT;
					}
				}
			} else {
				msg = "用户名密码错误!";

				return INPUT;
			}
		}
		loadAllSite();
		loadAllIPCount();
		ipMap = null;

		return SUCCESS;
	}

	/**
	 * 加载所有合作网站
	 * 
	 */
	private void loadAllSite() {// TODO:加载所有合作网站
		String[] paths = FileUtil.listAllSubFile(REFERDIR);
		sites = new String[paths.length];
		if (paths != null) {
			for (int i = 0; i < paths.length; i++) {
				String site = paths[i].substring(paths[i].lastIndexOf(FILESEPARATOR) + 1, paths[i].length());
				sites[i] = site;
			}
		}
	}

	/**
	 * 加载所有IP信息
	 * 
	 */
	private void loadAllIPCount() {
		todayIP = loadIPByTime(TODAY, "all");
		yestodayIP = loadIPByTime(YESTODAY, "all");
		weekIP = loadIPByTime(WEEK, "all") + todayIP;
		monthIP = loadIPByTime(MONTH, "all") + todayIP;
	}

	private int loadIPByTime(int period, String site) {// TODO:加载所有合作网站的IP信息

		// 初始化当月时间，只遍历本月的日志信息
		String curMonth = DateTimeUtil.parseDateToString(new Date(), "yyyy-MM");

		String[] paths = FileUtil.listAllSubFile(REFERDIR);// 设置为所有网站目录
		int count = 0;
		if (paths != null) {
			ipMap = new TreeMap<String, String>();
			for (int i = 0; i < paths.length; i++) {
				if (paths[i] == null || paths[i].trim().equals(""))
					continue;

				if (period == TODAY) {
					count += countTodayIP(paths[i] + FILESEPARATOR + curMonth);
				} else if (period == WEEK) {
					count += countWeekIP(paths[i] + FILESEPARATOR + curMonth);
				} else if (period == YESTODAY) {
					count += countYestodayIP(paths[i] + FILESEPARATOR + curMonth);
				} else if (period == MONTH) {
					count += countMonthIP(paths[i] + FILESEPARATOR + curMonth);
				}
			}
		}
		return count;
	}

	private int countTodayIP(String path) {
		int count = 0;
		Map<String, String> todayIpMap = null;
		// 初始化当天日期，用于与日志文件比较，来获得今天的日志信息
		Date date = new Date();
		String today = DateTimeUtil.parseDateToString(date, "yyyyMMdd")+ ".log";
		File file = new File(path + FILESEPARATOR + today);
		if (file.exists()) {
			todayIpMap = new TreeMap<String, String>();
			String content = FileUtil.readFile(file.getAbsolutePath());
			count += countIP(todayIpMap, content);
		}
		
		file = new File(path);
		File[] allFiles = file.listFiles();
		if(allFiles != null && allFiles.length > 0){
			for(File f : allFiles){
				String fileName = f.getAbsolutePath();
				if(fileName.endsWith(".done")) continue;//如果是.done文件，则跳过
				if(f.getName().equalsIgnoreCase(today)) continue;//如果是当天的日志，则跳过
				String doneFileName = fileName+".done";
				File doneFile = new File(doneFileName);
				if(!doneFile.exists()){//如果不存在同名的.done文件，则数ip，并创建.done文件
					String content = FileUtil.readFile(f.getAbsolutePath());
					todayIpMap = new TreeMap<String, String>();
					int value = new CooperateLoginAction().countIP(todayIpMap, content);
					FileUtil.saveStringToFile("" + value, doneFileName);
				}
			}
		}
		return count;
	}

	
	private void listTodayIP(String path) {
		Date date = new Date();
		String today = DateTimeUtil.parseDateToString(date, "yyyyMMdd")+ ".log";
		File file = new File(path + FILESEPARATOR + today);
		if (file.exists()) {
			String content = FileUtil.readFile(file.getAbsolutePath());
			setToMap(ipMap, content);
		}
	}

	private int countYestodayIP(String path) {
		int count = 0;
		Map<String, String> yestodayIpMap = null;
		Calendar c = Calendar.getInstance();
		GregorianCalendar g = new GregorianCalendar(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DATE) - 1);
		String yestoday = DateTimeUtil.parseDateToString(g.getTime(),"yyyyMMdd")+ ".log";

		File file = null;
		file = new File(path + FILESEPARATOR + yestoday + ".done");
		if (file.exists()) {
			String content = FileUtil.readFile(file.getAbsolutePath()).trim();
			count += Integer.parseInt(content);
		} else {
			file = new File(path + FILESEPARATOR + yestoday);
			if (file.exists()) {
				yestodayIpMap = new TreeMap<String, String>();
				String content = FileUtil.readFile(file.getAbsolutePath());
				count += countIP(yestodayIpMap, content);
				FileUtil.saveStringToFile("" + count, file.getAbsolutePath() + ".done");
			}
		}
		return count;
	}

	private void listYestodayIP(String path) {
		Calendar c = Calendar.getInstance();
		GregorianCalendar g = new GregorianCalendar(c.get(Calendar.YEAR), c.get(Calendar.MONTH), c.get(Calendar.DATE) - 1);
		String yestoday = DateTimeUtil.parseDateToString(g.getTime(),"yyyyMMdd")+ ".log";

		File file = new File(path + FILESEPARATOR + yestoday);
		if (file.exists()) {
			String content = FileUtil.readFile(file.getAbsolutePath());
			setToMap(ipMap, content);
		}
	}

	private int countWeekIP(String path) {
		int count = 0;
		GregorianCalendar sunday = new GregorianCalendar();
		sunday.set(GregorianCalendar.DAY_OF_WEEK, GregorianCalendar.SUNDAY);
		long begin = Long.parseLong(DateTimeUtil.parseDateToString(sunday.getTime(), "yyyyMMdd"));
		GregorianCalendar saturday = new GregorianCalendar();
		saturday.set(GregorianCalendar.DAY_OF_WEEK, GregorianCalendar.SATURDAY);
		long end = Long.parseLong(DateTimeUtil.parseDateToString(saturday.getTime(), "yyyyMMdd"));
		String[] doneFiles = getAllOverFile(path);
		for (String doneFilePath : doneFiles) {
			if (doneFilePath != null && !(doneFilePath.trim().equals(""))) {
				long fileDate = Long.parseLong(doneFilePath.substring(doneFilePath.lastIndexOf(FILESEPARATOR) + 1,doneFilePath.indexOf(".")));

				if (fileDate >= begin && fileDate <= end) {
					String content = FileUtil.readFile(doneFilePath).trim();
					count += Integer.parseInt(content);
				}
			}
		}
		return count;
	}

	private void listWeekIP(String path){
		GregorianCalendar sunday = new GregorianCalendar();
		sunday.set(GregorianCalendar.DAY_OF_WEEK, GregorianCalendar.SUNDAY);
		long begin = Long.parseLong(DateTimeUtil.parseDateToString(sunday.getTime(), "yyyyMMdd"));
		GregorianCalendar saturday = new GregorianCalendar();
		saturday.set(GregorianCalendar.DAY_OF_WEEK, GregorianCalendar.SATURDAY);
		long end = Long.parseLong(DateTimeUtil.parseDateToString(saturday.getTime(), "yyyyMMdd"));
		
		//获得某网站当月的所有日志目录
		String[] logFiles = FileUtil.listAllSubFile(path);
		if(logFiles != null){
			for(String str : logFiles){
				//截取日志文件名，用于比较日期范围
				long fileDate = Long.parseLong(str.substring(str.lastIndexOf(FILESEPARATOR)+1, str.indexOf(".")));
				if(fileDate >= begin && fileDate <= end){
					if(str.lastIndexOf(".done") > 0) continue;
					
					String content = FileUtil.readFile(str);
					setToMap(ipMap,content);
				}
			}
		}
	}

	private int countMonthIP(String path) {
		int count = 0;

		String[] doneFiles = getAllOverFile(path);
		for (String doneFilePath : doneFiles) {
			if (doneFilePath != null && !(doneFilePath.trim().equals(""))) {
				int content = Integer.parseInt(FileUtil.readFile(doneFilePath)
						.trim());
				count += content;
			}
		}
		return count;
	}
	
	private void listMonthIP(String path){
		String[] logFiles = FileUtil.listAllSubFile(path);
		if(logFiles != null){
			for(String str : logFiles){
				if(str.lastIndexOf(".done") > 0) continue;
				String content = FileUtil.readFile(str);
				setToMap(ipMap,content);
			}
		}
	}

	private Map<String, String> setToMap(Map<String, String> ipMap,String content) {
		if (content != null && (!content.trim().equals(""))) {
			String[] singleIP = content.split(LINESEPARATOR);
			for (String str : singleIP) {
				if (str == null || str.trim().equals(""))
					continue;
				String[] keyValue = str.split(" ");
				if (ipMap.containsValue(keyValue[2])) {
				} else {
					ipMap.put(keyValue[0] + " " + keyValue[1], keyValue[2]);
				}
			}
		}
		return ipMap;
	}

	private int countIP(Map<String, String> ipMap, String content) {
		int value = 0;
		if (content != null && (!content.trim().equals(""))) {
			String[] singleIP = content.split(LINESEPARATOR);
			for (String str : singleIP) {
				if (str == null || str.trim().equals(""))
					continue;
				String[] keyValue = str.split(" ");
				if (ipMap.containsValue(keyValue[2])) {
				} else {
					value++;
				}
			}
		}
		return value;
	}

	/**
	 * 获得所有以.done为结尾的文件全名
	 * 
	 * @param path
	 * @return
	 */
	private String[] getAllOverFile(String path) {
		File file = new File(path);
		if (!file.exists())
			return null;

		File[] overFiles = file.listFiles();
		String[] overFilePaths = null;
		if (overFiles != null && overFiles.length > 0) {
			overFilePaths = new String[overFiles.length];
			for (int i = 0; i < overFiles.length; i++) {
				if (overFiles[i].getAbsolutePath().endsWith(".done"))
					overFilePaths[i] = overFiles[i].getAbsolutePath();
			}
		}

		return overFilePaths;
	}

	private SortedMap<String, String> ipMap;

	private void showDetail(int period){
		//初始化当月时间，只遍历本月的日志信息
		String curMonth = DateTimeUtil.parseDateToString(new Date(),"yyyy-MM");
		
		String[] paths = null;
		
		//判断是否获得所有网站Ip信息
		if(site == null || site.equals("all")){
			paths = FileUtil.listAllSubFile(REFERDIR);//设置为所有网站目录
		}else{
			paths = new String[1];
			paths[0] = REFERDIR+site;//设置为某网站目录
		}
		if(paths != null){
			ipMap = new TreeMap<String,String>();
			for(int i = 0 ; i < paths.length ;i++){
				if(period == TODAY){
					listTodayIP(paths[i]+FILESEPARATOR+curMonth);
				}else if(period == WEEK){
					listWeekIP(paths[i]+FILESEPARATOR+curMonth);
				}else if(period == YESTODAY){
					listYestodayIP(paths[i]+FILESEPARATOR+curMonth);
				}else if(period == MONTH){
					listMonthIP(paths[i]+FILESEPARATOR+curMonth);
				}
			}
			total = ipMap.size();
			//分页
			int i = 0;
			SortedMap<String,String> ipMapTemp = new TreeMap<String, String>();
			Iterator<Entry<String,String>> it = ipMap.entrySet().iterator();
			while(it.hasNext()){
				String key = it.next().getKey();
				if((i >= (pageId -1 ) * countPerPage) && (i < pageId * countPerPage)){
					ipMapTemp.put(key, ipMap.get(key));
				}
				i++;
			}
			ipMap = ipMapTemp;
		}
	}
	
	private String site = "all";
	private int showType;
	private int pageId = 1;
	private int countPerPage = 10;
	private int total;
	private int totalPage;

	public String showDetailIP() {//TODO:showDetailIP()
		if (session.get("admin") == null) {
			return INPUT;
		}
		loadAllSite();
		loadAllIPCount();
		showDetail(showType);
		if((total % countPerPage) > 0)
			totalPage = total / countPerPage +1;
		
		return SUCCESS;
	}


	public String toLogin() {// TODO:进入管理平台登录页面
		return INPUT;
	}

	/**
	 * 读取管理员文件信息，文件格式要求：用户名 密码（中间以空格分开）
	 * 
	 * @param fileName
	 * @return
	 */
	private String[] loadAdminFile(String fileName) {// TODO:读取管理员文件信息
		String[] items = null;
		File file = new File(fileName);
		if (!file.exists()) {
			return null;
		}
		items = new String[14];
		try {
			BufferedReader br = new BufferedReader(new FileReader(fileName));
			String tempStr = "";
			int i = 0;
			while ((tempStr = br.readLine()) != null) {
				if (i > 13)
					break;
				if (tempStr == null) {
					items[i] = "0";
				} else {
					items[i] = tempStr;
				}
				i++;
			}
			br.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return items;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMsg() {
		return msg;
	}

	public String[] getSites() {
		return sites;
	}

	public int getMonthIP() {
		return monthIP;
	}

	public int getTodayIP() {
		return todayIP;
	}

	public int getWeekIP() {
		return weekIP;
	}

	public int getYestodayIP() {
		return yestodayIP;
	}

	public void setShowType(int showType) {
		this.showType = showType;
	}

	public Map<String, String> getIpMap() {
		return ipMap;
	}

	public void setSite(String site) {
		this.site = site;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public void setPageId(int pageId) {
		this.pageId = pageId;
	}

	public int getPageId() {
		return pageId;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public int getShowType() {
		return showType;
	}

	public String getSite() {
		return site;
	}
	
	public int getTotal() {
		return total;
	}

	public int getTotalPage() {
		return totalPage;
	}
}
