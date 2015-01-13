package com.xiaoshuo.stock.web;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class StockServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String stockId = request.getParameter("stockId");
		String stockKline = "http://www.google.cn/pfetch/dchart?t=intl&s=E:"
				+ stockId + "&e=SHE&h=0&tf=1";
		googleStockKline(stockKline, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void googleStockKline(String url1, HttpServletResponse response)
			throws ServletException, IOException {
		URL url = new URL(url1);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("User-Agent", "Mozilla/4.0");
		conn.setRequestProperty("referer", "http://www.google.cn");
		conn.connect();
		response.setContentType("image/gif");
		ServletOutputStream out = response.getOutputStream();
		InputStream fis = conn.getInputStream();
		byte[] buf = new byte[1024];
		int size = 0;
		while ((size = fis.read(buf)) != -1) {
			out.write(buf, 0, size);
		}
		fis.close();
		out.close();
	}
}
