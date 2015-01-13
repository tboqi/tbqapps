package com.cc.cw.pic;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.math.NumberUtils;

public class ImageServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1264640367925251935L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (NumberUtils.toInt(request.getParameter("mark")) == 1) {
			String picId = request.getParameter("id");
			String hcPicUrl = "http://www.huace.net/picture/?id=" + picId
					+ "&type=ALBUM&width=74&height=79";
			getPic(hcPicUrl, response);
		}
		if (NumberUtils.toInt(request.getParameter("mark")) == 2) {
			String picId = request.getParameter("id");
			String hcPicUrl = "http://www.huace.net/picture/?id=" + picId
					+ "&type=PHOTO&w=74&h=79";
			getPic(hcPicUrl, response);
		}
		if (NumberUtils.toInt(request.getParameter("mark")) == 3) {
			String picId = request.getParameter("id");
			String hcPicUrl = "http://www.huace.net/picture/?id=" + picId
					+ "&type=PHOTO&w=459&h=600&wm=0";
			getPic(hcPicUrl, response);
		}
		if (NumberUtils.toInt(request.getParameter("mark")) == 4) {
			String picId = request.getParameter("id");
			String hcPicUrl = "http://www.huace.net/picture/?id=" + picId
					+ "&type=PHOTO&w=1600&h=1850&wm=0";
			getPic(hcPicUrl, response);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	private void getPic(String url1, HttpServletResponse response)
			throws ServletException, IOException {
		URL url = new URL(url1);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestProperty("User-Agent",
				"Baiduspider ( http://www.baidu.com/search/spider.htm)");
		conn.setRequestProperty("referer", "http://www.huace.com");
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
