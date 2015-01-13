package com.xiaoshuo.stock.web;

import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.time.Minute;
import org.jfree.data.time.TimeSeries;
import org.jfree.data.time.TimeSeriesCollection;
import org.jfree.data.xy.XYDataset;

import com.xiaoshuo.stock.domain.Stock;
import com.xiaoshuo.stock.impl.StockManagerImpl;

public class StockTimeSeries {
	private static Log log = LogFactory.getLog(StockTimeSeries.class);

	// 曲线图标题
	private String title = "股票走势分析";

	// 曲线图X轴提示
	private String domain = "今日("
			+ DateFormatUtils.format(new Date(), "yyyy-MM-dd") + ")走势";

	// 曲线图Y轴提示
	private String range = "交易价格";

	private TimeSeries stock = new TimeSeries("股票走势", Minute.class);

	public String drawPic(String stockId) {
		Stock s = StockManagerImpl.get(stockId);
		if(s == null) return null;
		String fileName = null;
		JFreeChart chart = ChartFactory.createTimeSeriesChart(title, domain,
				range, getDataset(stockId), true, true, false);
		chart.setTitle(new TextTitle(title + "-" + s.getName(), new Font("隶书", Font.ITALIC, 15)));
		chart.setBorderPaint(new GradientPaint(0, 0, Color.white, 0, 1000,
				Color.blue));
		try {
			ChartRenderingInfo info = new ChartRenderingInfo(
					new StandardEntityCollection());
			log.debug("准备创建图片……");
			fileName = ServletUtilities.saveChartAsJPEG(chart, 400, 300, info,
					null);
			log.debug("图片创建成功！");
		} catch (IOException e) {
			log.error("IO异常：", e);
		}
		return fileName;
	}

	private XYDataset getDataset(String stockId) {
		TimeSeriesCollection dataset = new TimeSeriesCollection();
		this.stock.clear();
		int count = StockManagerImpl.getCountByNum(stockId);
		List<Stock> list = StockManagerImpl.getStockListByNum(stockId, 0,
				count, 3);
		for (Iterator iter = list.iterator(); iter.hasNext();) {
			Stock s = (Stock) iter.next();
			stock.addOrUpdate(new Minute(s.getUpdateTime()), new Double(s
					.getPrice()));
		}
		dataset.removeAllSeries();
		dataset.addSeries(stock);
		return dataset;
	}

	public static void main(String[] args) {
//		StockTimeSeries sts = new StockTimeSeries();
		// sts.drawPic();
	}
}
