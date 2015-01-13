package com.cc.cw.web;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cc.cw.domain.Vote;
import com.cc.cw.linechart.LineChartShow;
import com.cc.cw.service.VoteService;
import com.cc.cw.util.DateTimeUtil;

public class LineChartServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2269358064892292106L;
	/**按周查看，以星期为单位**/
	private static final String WEEKCHECK = "1";
	/**按日查看，以小时为单位**/
	private static final String DAYCHECK = "2";

	@SuppressWarnings("static-access")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//查看类型：按周查看还是按日查看
		String checkStyle = request.getParameter("checkStyle");
		//查看周期
		String dateTime = request.getParameter("dateTime");
		int resourceId = Integer.parseInt(request.getParameter("resourceId"));
		//查看资源类型
		String resourceType = request.getParameter("resourceType");
		
		//构造资源类型枚举
//		Vote.ResourceType type;
//		if(resourceType.equals("article")){
//			type = Vote.ResourceType.Article; 
//		}else if(resourceType.equals("channel")){
//			type = Vote.ResourceType.Channel;
//		}else{
//			return ;
//		}
			
		//按周查看
		if(checkStyle.equals(WEEKCHECK)){
			Date dateParam = DateTimeUtil.parseStringToDate(dateTime);
			//获得当周第一天
			String beginDate = DateTimeUtil.getBeginDate(dateParam);
			//获得当周最后一天
			String endDate = DateTimeUtil.getLastDate(dateParam);
			
			
			VoteService voteService = null;
			WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
			voteService = (VoteService)ctx.getBean("voteService");
			List<Vote> voteList = voteService.getVoteListByDate(resourceId, resourceType, beginDate, endDate);
			
			HttpSession session = request.getSession();
			String filename = LineChartShow.generateBarChart(voteList, WEEKCHECK, session, response.getWriter());
			session.setAttribute("filename", filename);
			response.sendRedirect(request.getContextPath()+"/jsp/viewchart.jsp?dateTime="+dateTime+"&resourceType="+resourceType+"&resourceId="+resourceId+"&checkStyle="+checkStyle);
		}else if(checkStyle.equals(DAYCHECK)){
			Date dateParam = DateTimeUtil.parseStringToDate(dateTime);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(dateParam);
			calendar.add(calendar.DAY_OF_MONTH, 1);
			dateParam = calendar.getTime();
			String nextDay = DateTimeUtil.parseDateToString(dateParam);
			VoteService voteService = null;
			WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
			voteService = (VoteService)ctx.getBean("voteService");
			List<Vote> voteList = voteService.getVoteListByDate(resourceId, resourceType, dateTime, nextDay);
			
			HttpSession session = request.getSession();
			String filename = LineChartShow.generateBarChart(voteList, DAYCHECK, session, response.getWriter());
			session.setAttribute("filename", filename);
			response.sendRedirect(request.getContextPath()+"/jsp/viewchart.jsp?dateTime="+dateTime+"&resourceType="+resourceType+"&resourceId="+resourceId+"&checkStyle="+checkStyle); 
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}
