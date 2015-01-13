package com.cc.cw.linechart;
import java.awt.Color;
import java.awt.Font;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.category.DefaultCategoryDataset;

import com.cc.cw.domain.Vote;
import com.cc.cw.util.DateTimeUtil;

public class LineChartShow
{
	/**
	 * 按小时包装dataset
	 * @param voteList
	 * @return
	 */
	public static DefaultCategoryDataset constructDayDateset(List<Vote> voteList){
		//储存支持票
    	Map<Integer, Integer> supTicketMap = new HashMap<Integer, Integer>();
    	//储存反对票
    	Map<Integer, Integer> unsupTicketMap = new HashMap<Integer, Integer>();
    	for(Vote v : voteList){
    		String category = v.getVoteCategory();
			
			//增加相应的票数
			if(category.equals("Support")){
				incDayTicketMap(supTicketMap, v);
			}else{
				incDayTicketMap(unsupTicketMap, v);
			}
		}
    	
    	Set<Integer> supportSet = new TreeSet<Integer>();
    	for(int i : (Integer[]) supTicketMap.keySet().toArray(new Integer[] {})){
    		supportSet.add(i);
    	}
    	for(int i : (Integer[]) unsupTicketMap.keySet().toArray(new Integer[] {})){
    		supportSet.add(i);
    	}
    	
    	
    	DefaultCategoryDataset data = new DefaultCategoryDataset();
    	Iterator it = supportSet.iterator();
    	while(it.hasNext()){
    		int i = ((Integer)it.next()).intValue();
    		data.addValue(supTicketMap.get(i), "支持", i+":00");
    	}
    	Set<Integer> unsupportSet = new HashSet<Integer>();
    	for(int i : (Integer[]) unsupTicketMap.keySet().toArray(new Integer[] {})){
    		unsupportSet.add(i);
    	}
    	it = unsupportSet.iterator();
    	while(it.hasNext()){
    		int i = ((Integer)it.next()).intValue();
    		data.addValue(unsupTicketMap.get(i), "反对", i+":00");
    	}
    	
    	return data;
	}
	

    /**
     * 计算当日票数
     * @param ticketMap
     * @param vote
     * @return
     */
    private static Map incDayTicketMap(Map<Integer, Integer> ticketMap, Vote vote){
    	int hour = DateTimeUtil.getHourFromDay(vote.getVoteDate());
    	
    	if(ticketMap.containsKey(hour)){
    		//票数
    		int ticket = ticketMap.get(hour);
    		ticketMap.put(hour, ++ticket);
    	}else{
    		ticketMap.put(hour, 1);
    	}
    	
    	return ticketMap;
    }
    
	/**
	 * 按星期包装dataset
	 * @param voteList
	 * @return
	 */
    public static DefaultCategoryDataset constructWeekDateset(List<Vote> voteList){
    	//储存支持票
    	Map<Integer, Integer> supTicketMap = new HashMap<Integer, Integer>();
    	//储存反对票
    	Map<Integer, Integer> unsupTicketMap = new HashMap<Integer, Integer>();
    	for(Vote v : voteList){
    		String category = v.getVoteCategory();
			//增加相应的票数
			if(category.equals("Support")){
				incWeekTicketMap(supTicketMap, v);
			}else{
				incWeekTicketMap(unsupTicketMap, v);
			}
		}
    	
    	DefaultCategoryDataset data = new DefaultCategoryDataset();
    	Set<Integer> supportSet = new TreeSet<Integer>();
    	for(int i : (Integer[]) supTicketMap.keySet().toArray(new Integer[] {})){
    		supportSet.add(i);
    	}
    	Iterator it = supportSet.iterator();
    	while(it.hasNext()){
    		int i = ((Integer)it.next()).intValue();
    		data.addValue(supTicketMap.get(i), "支持", "星期 "+getChiDate(i));
    	}
    	Set<Integer> unsupportSet = new HashSet<Integer>();
    	for(int i : (Integer[]) unsupTicketMap.keySet().toArray(new Integer[] {})){
    		unsupportSet.add(i);
    	}
    	it = unsupportSet.iterator();
    	while(it.hasNext()){
    		int i = ((Integer)it.next()).intValue();
    		data.addValue(unsupTicketMap.get(i), "反对", "星期 "+getChiDate(i));
    	}

    	return data;
    }
    
    private static String getChiDate(int i){
    	String date = "";
    	switch(i){
    	case 1 :
    		date = "一";
    		break;
    	case 2 :
    		date = "二";
    		break;
    	case 3 :
    		date = "三";
    		break;
    	case 4 :
    		date = "四";
    		break;
    	case 5 :
    		date = "五";
    		break;
    	case 6 :
    		date = "六";
    		break;
    	default :
    			date = "日";
    		break;
    	}
    	return date;
    }
    
    /**
     * 计算某日期的票数
     * @param vote
     * @return
     */
    private static Map incWeekTicketMap(Map<Integer, Integer> ticketMap, Vote vote){
    	//投票日期
    	int voteDate = DateTimeUtil.getDayFromDate(vote.getVoteDate());
    	
    	if(ticketMap.containsKey(voteDate)){
    		//票数
    		int ticket = ticketMap.get(voteDate);
    		ticketMap.put(voteDate, ++ticket);
    	}else{
    		ticketMap.put(voteDate, 1);
    	}
    	
    	return ticketMap;
    }
    
    
    public static String generateBarChart(List<Vote> voteList, String checkType, HttpSession session, PrintWriter pw){
    	String filename = "";
    	try{
	    	//建立DataSet
	    	DefaultCategoryDataset categorydataset = null;
	    	String label = "";
	    	//如果类型(checkType)为1,则画周走势图,否则画日走势图
	    	if("1".equals(checkType)){
	    		label = "日期";
	    		categorydataset = constructWeekDateset(voteList);
	    	}else{
	    		label = "时间";
	    		categorydataset = constructDayDateset(voteList);
	    	}
	    	
	    	JFreeChart jfreechart = ChartFactory.createBarChart3D(
	    			"投票走势图", label, "票数", categorydataset, PlotOrientation.VERTICAL, true, true, false
	    	);
	        jfreechart.setBackgroundPaint(Color.white);
	        
	        CategoryPlot categoryplot = jfreechart.getCategoryPlot();
            categoryplot.setBackgroundPaint(Color.LIGHT_GRAY);
            categoryplot.setRangeGridlinePaint(Color.WHITE);
            
            NumberAxis numberaxis = (NumberAxis)categoryplot.getRangeAxis();
	        numberaxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
	        numberaxis.setUpperMargin(0.15);
	        categoryplot.setRangeAxis(numberaxis);
	        
	        BarRenderer3D renderer = new BarRenderer3D();
//	        BarRenderer renderer = (BarRenderer)categoryplot.getRenderer();
	        renderer.setDrawBarOutline(false);
	        renderer.setMaximumBarWidth(0.10000000000000001D);
	        renderer.setWallPaint(Color.gray);
	        renderer.setBaseOutlinePaint(Color.BLACK);
	        
	        //显示柱子的边框颜色
			renderer.setDrawBarOutline(true);
			renderer.setSeriesOutlinePaint(0, Color.WHITE);

	        //设置柱子的颜色
	        renderer.setSeriesPaint(0, Color.GREEN);
	        renderer.setSeriesPaint(1, Color.RED);
	        
			//显示每个柱的数值，并修改该数值的字体属性
			renderer.setItemLabelGenerator(new StandardCategoryItemLabelGenerator());
			renderer.setItemLabelsVisible(true);
			renderer.setItemLabelFont(new Font("黑体",Font.PLAIN,12));
	        
			//设置每个地区所包含的平行柱的之间距离
			renderer.setItemMargin(0.3);
	        
	        categoryplot.setRenderer(renderer);
	        
	        //设置横坐标标签为倾斜
	    	CategoryAxis domainAxis = categoryplot.getDomainAxis();
	    	domainAxis.setCategoryLabelPositions(
	    		CategoryLabelPositions.createUpRotationLabelPositions(Math.PI / 6.0)
	    	);
	    	
	        ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
	        filename = ServletUtilities.saveChartAsPNG(jfreechart, 500, 500, info, session);
	        
	        ChartUtilities.writeImageMap(pw, filename, info,true);
        }
        catch (Exception ex) {

        }
        return filename;
    }
    
}
