package com.cc.cw.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.awt.image.MemoryImageSource;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.swing.ImageIcon;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class ImagesUtil {

	public static void JpgPress(String srcFile, String desFile, int race) throws Exception { 
	     File _file = new File(srcFile);                                // 读入文件 
	     Image src = javax.imageio.ImageIO.read(_file);          // 构造Image对象 
	     int wideth=src.getWidth(null);                                     // 得到源图宽 
	     int height=src.getHeight(null);                                    // 得到源图长 
	     BufferedImage tag = new BufferedImage(wideth/race,height/race,BufferedImage.TYPE_INT_RGB); 
	     tag.getGraphics().drawImage(src,0,0,wideth/race,height/race,null);  // 缩小后的图 
	     FileOutputStream out=new FileOutputStream(desFile);   // 输出到文件流 
	     JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);       
	     encoder.encode(tag);                                               // 近JPEG编码 
	     //System.out.print(width+"*"+height);                              
	     out.close(); 
	} 

	public static void JpgPressWidth(String srcFile, String desFile, int w) throws Exception { 
	     File _file = new File(srcFile);                                // 读入文件 
	     Image src = javax.imageio.ImageIO.read(_file);          // 构造Image对象 
	     int wideth=src.getWidth(null);                                     // 得到源图宽 
	     int height=src.getHeight(null);   
	     double race = wideth/(double)w;
	     int h = (int)(height/race);
	     // 得到源图长 
	     BufferedImage tag = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB); 
	     tag.getGraphics().drawImage(src,0,0,w,h,null);  // 缩小后的图 
	     FileOutputStream out=new FileOutputStream(desFile);   // 输出到文件流 
	     JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);       
	     encoder.encode(tag);                                               // 近JPEG编码 
	     //System.out.print(width+"*"+height);                              
	     out.close(); 
	} 

	public static void JpgPressHeigh(String srcFile, String desFile, int h) throws Exception { 
	     File _file = new File(srcFile);                                // 读入文件 
	     Image src = javax.imageio.ImageIO.read(_file);          // 构造Image对象 
	     int wideth=src.getWidth(null);                                     // 得到源图宽 
	     int height=src.getHeight(null);   
	     double race = height/(double)h;
	     int w = (int)(wideth/race);
	     // 得到源图长 
	     BufferedImage tag = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB); 
	     tag.getGraphics().drawImage(src,0,0,w,h,null);  // 缩小后的图 
	     FileOutputStream out=new FileOutputStream(desFile);   // 输出到文件流 
	     JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);       
	     encoder.encode(tag);                                               // 近JPEG编码 
	     //System.out.print(width+"*"+height);                              
	     out.close(); 
	} 

	public static void JpgPress(String srcFile, String desFile, int w, int h) throws Exception { 
	     File _file = new File(srcFile);                                // 读入文件 
	     Image src = javax.imageio.ImageIO.read(_file);          // 构造Image对象 
	     //int wideth=src.getWidth(null);                                     // 得到源图宽 
	     //int height=src.getHeight(null);                                    // 得到源图长 
	     BufferedImage tag = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB); 
	     tag.getGraphics().drawImage(src,0,0,w,h,null);  // 缩小后的图 
	     FileOutputStream out=new FileOutputStream(desFile);   // 输出到文件流 
	     JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);       
	     encoder.encode(tag);                                               // 近JPEG编码 
	     //System.out.print(width+"*"+height);                              
	     out.close(); 
	} 

	public static String bmpPress(String srcFile, String desFile, int race){  
	    Image image;                            // 构造一个目标图 
	    String result = "";                     // 返回结果 
	    try{ 
	    	FileInputStream fs = new FileInputStream(srcFile); 
	    	int bfLen = 14;                            
	    	byte bf[] = new byte[bfLen];             
	    	fs.read(bf,0,bfLen);                  // 读取14字节BMP文件头 
	    	int biLen=40;                  
	    	byte bi[]=new byte[biLen]; 
	      	fs.read(bi,0,biLen);                  // 读取40字节BMP信息头 

	      	// 源图宽度 
	      	int nWidth = (((int)bi[7] & 0xff) << 24) | (((int)bi[6] & 0xff) << 16) 
	                   | (((int)bi[5] & 0xff) <<8) | (int)bi[4] & 0xff; 
	      
	      	// 源图高度 
	      	int nHeight = (((int)bi[11] & 0xff) << 24) | (((int)bi[10] & 0xff) << 16) 
	                   | (((int)bi[9] & 0xff) << 8) | (int)bi[8] & 0xff; 

	      	// 位数 
	      	int nBitCount = (((int)bi[15] & 0xff) << 8) | (int)bi[14] & 0xff; 

	      	// 源图大小 
	      	int nSizeImage = (((int)bi[23] & 0xff) << 24) | (((int)bi[22] & 0xff) << 16) 
	                   | (((int)bi[21] & 0xff) << 8) | (int)bi[20] & 0xff; 

	      	//对24位BMP进行解析 
	      	if (nBitCount == 24) { 
	      		int nPad = (nSizeImage/nHeight) - nWidth*3; 
	      		int nData[] = new int[nHeight*nWidth]; 
		        byte bRGB[] = new byte[(nWidth + nPad)*3*nHeight]; 
		        fs.read (bRGB,0,(nWidth + nPad)*3*nHeight); 
		        int nIndex=0; 
		        for(int j=0; j<nHeight; j++){ 
			        for(int i=0; i<nWidth; i++){ 
			            nData[nWidth*(nHeight-j-1)+i] = (255 & 0xff) << 24 
			              | (((int)bRGB[nIndex + 2] & 0xff) << 16) 
			              | (((int)bRGB[nIndex + 1] & 0xff) << 8) 
			              | (int)bRGB[nIndex] & 0xff; 
			            nIndex += 3; 
			        } 
			        nIndex += nPad; 
		        } 
		        Toolkit kit = Toolkit.getDefaultToolkit(); 
		        image = kit.createImage(new MemoryImageSource(nWidth,nHeight,nData,0,nWidth)); 
		        result = "从BMP得到图像image"; 
	      	}else{ 
		        result = "不是24位BMP，失败！"; 
		        image = (Image)null; 
	      	} 
	      	fs.close();  //关闭输入流 
	            
	      	//开始进行图像压缩（对image对象进行操作） 
	      	int width = image.getWidth(null);                             // 得到源图宽 
	      	int height = image.getHeight(null);                           // 得到源图长 
	      	BufferedImage tag = new BufferedImage(width/race,height/race,BufferedImage.TYPE_INT_RGB); 
	      	tag.getGraphics().drawImage(image,0,0,width/race,height/race,null); // 缩小后的图 
	      	FileOutputStream out = new FileOutputStream(desFile); 
	      	JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);      
	      	encoder.encode(tag);                                          // 进行JPEG编码 
	      	out.close();       //关闭输出流                      
	    }catch (Exception e){ 
	    } 
	    	return result; 
	} 

	public static String bmpPressWidth(String srcFile, String desFile, int w){  
	    Image image;                            // 构造一个目标图 
	    String result = "";                     // 返回结果 
	    try{ 
	    	FileInputStream fs = new FileInputStream(srcFile); 
	    	int bfLen = 14;                            
	    	byte bf[] = new byte[bfLen];             
	    	fs.read(bf,0,bfLen);                  // 读取14字节BMP文件头 
	    	int biLen=40;                  
	    	byte bi[]=new byte[biLen]; 
	      	fs.read(bi,0,biLen);                  // 读取40字节BMP信息头 

	      	// 源图宽度 
	      	int nWidth = (((int)bi[7] & 0xff) << 24) | (((int)bi[6] & 0xff) << 16) 
	                   | (((int)bi[5] & 0xff) <<8) | (int)bi[4] & 0xff; 
	      
	      	// 源图高度 
	      	int nHeight = (((int)bi[11] & 0xff) << 24) | (((int)bi[10] & 0xff) << 16) 
	                   | (((int)bi[9] & 0xff) << 8) | (int)bi[8] & 0xff; 

	      	// 位数 
	      	int nBitCount = (((int)bi[15] & 0xff) << 8) | (int)bi[14] & 0xff; 

	      	// 源图大小 
	      	int nSizeImage = (((int)bi[23] & 0xff) << 24) | (((int)bi[22] & 0xff) << 16) 
	                   | (((int)bi[21] & 0xff) << 8) | (int)bi[20] & 0xff; 

	      	//对24位BMP进行解析 
	      	if (nBitCount == 24) { 
	      		int nPad = (nSizeImage/nHeight) - nWidth*3; 
	      		int nData[] = new int[nHeight*nWidth]; 
		        byte bRGB[] = new byte[(nWidth + nPad)*3*nHeight]; 
		        fs.read (bRGB,0,(nWidth + nPad)*3*nHeight); 
		        int nIndex=0; 
		        for(int j=0; j<nHeight; j++){ 
			        for(int i=0; i<nWidth; i++){ 
			            nData[nWidth*(nHeight-j-1)+i] = (255 & 0xff) << 24 
			              | (((int)bRGB[nIndex + 2] & 0xff) << 16) 
			              | (((int)bRGB[nIndex + 1] & 0xff) << 8) 
			              | (int)bRGB[nIndex] & 0xff; 
			            nIndex += 3; 
			        } 
			        nIndex += nPad; 
		        } 
		        Toolkit kit = Toolkit.getDefaultToolkit(); 
		        image = kit.createImage(new MemoryImageSource(nWidth,nHeight,nData,0,nWidth)); 
		        result = "从BMP得到图像image"; 
	      	}else{ 
		        result = "不是24位BMP，失败！"; 
		        image = (Image)null; 
	      	} 
	      	fs.close();  //关闭输入流 
	            
	      	//开始进行图像压缩（对image对象进行操作） 
	      	int width = image.getWidth(null);                             // 得到源图宽 
	      	int height = image.getHeight(null);   
	      	double race = width/(double)w;
		    int h = (int)(height/race);                          // 得到源图长 
	      	BufferedImage tag = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB); 
	      	tag.getGraphics().drawImage(image,0,0,w,h,null); // 缩小后的图 
	      	FileOutputStream out = new FileOutputStream(desFile); 
	      	JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);      
	      	encoder.encode(tag);                                          // 进行JPEG编码 
	      	out.close();       //关闭输出流                      
	    }catch (Exception e){ 
	    } 
	    	return result; 
	} 

	public static String bmpPressHigth(String srcFile, String desFile, int h){  
	    Image image;                            // 构造一个目标图 
	    String result = "";                     // 返回结果 
	    try{ 
	    	FileInputStream fs = new FileInputStream(srcFile); 
	    	int bfLen = 14;                            
	    	byte bf[] = new byte[bfLen];             
	    	fs.read(bf,0,bfLen);                  // 读取14字节BMP文件头 
	    	int biLen=40;                  
	    	byte bi[]=new byte[biLen]; 
	      	fs.read(bi,0,biLen);                  // 读取40字节BMP信息头 

	      	// 源图宽度 
	      	int nWidth = (((int)bi[7] & 0xff) << 24) | (((int)bi[6] & 0xff) << 16) 
	                   | (((int)bi[5] & 0xff) <<8) | (int)bi[4] & 0xff;
	      
	      	// 源图高度 
	      	int nHeight = (((int)bi[11] & 0xff) << 24) | (((int)bi[10] & 0xff) << 16) 
	                   | (((int)bi[9] & 0xff) << 8) | (int)bi[8] & 0xff; 

	      	// 位数 
	      	int nBitCount = (((int)bi[15] & 0xff) << 8) | (int)bi[14] & 0xff; 

	      	// 源图大小 
	      	int nSizeImage = (((int)bi[23] & 0xff) << 24) | (((int)bi[22] & 0xff) << 16) 
	                   | (((int)bi[21] & 0xff) << 8) | (int)bi[20] & 0xff; 

	      	//对24位BMP进行解析 
	      	if (nBitCount == 24) { 
	      		int nPad = (nSizeImage/nHeight) - nWidth*3; 
	      		int nData[] = new int[nHeight*nWidth]; 
		        byte bRGB[] = new byte[(nWidth + nPad)*3*nHeight]; 
		        fs.read (bRGB,0,(nWidth + nPad)*3*nHeight); 
		        int nIndex=0; 
		        for(int j=0; j<nHeight; j++){ 
			        for(int i=0; i<nWidth; i++){ 
			            nData[nWidth*(nHeight-j-1)+i] = (255 & 0xff) << 24 
			              | (((int)bRGB[nIndex + 2] & 0xff) << 16) 
			              | (((int)bRGB[nIndex + 1] & 0xff) << 8) 
			              | (int)bRGB[nIndex] & 0xff; 
			            nIndex += 3; 
			        } 
			        nIndex += nPad; 
		        } 
		        Toolkit kit = Toolkit.getDefaultToolkit(); 
		        image = kit.createImage(new MemoryImageSource(nWidth,nHeight,nData,0,nWidth)); 
		        result = "从BMP得到图像image"; 
	      	}else{ 
		        result = "不是24位BMP，失败！"; 
		        image = (Image)null; 
	      	} 
	      	fs.close();  //关闭输入流 
	            
	      	//开始进行图像压缩（对image对象进行操作） 
	      	int width = image.getWidth(null);                             // 得到源图宽 
	      	int height = image.getHeight(null);   
	      	double race = height/(double)h;
		    int w = (int)(width/race);                          // 得到源图长 
	      	BufferedImage tag = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB); 
	      	tag.getGraphics().drawImage(image,0,0,w,h,null); // 缩小后的图 
	      	FileOutputStream out = new FileOutputStream(desFile); 
	      	JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);      
	      	encoder.encode(tag);                                          // 进行JPEG编码 
	      	out.close();       //关闭输出流                      
	    }catch (Exception e){
	    } 
	    	return result; 
	} 
	
	public static String bmpPress(String srcFile, String desFile, int w, int h){  
	    Image image;                            // 构造一个目标图 
	    String result = "";                     // 返回结果 
	    try{ 
	    	FileInputStream fs = new FileInputStream(srcFile); 
	    	int bfLen = 14;                            
	    	byte bf[] = new byte[bfLen];             
	    	fs.read(bf,0,bfLen);                  // 读取14字节BMP文件头 
	    	int biLen=40;                  
	    	byte bi[]=new byte[biLen]; 
	      	fs.read(bi,0,biLen);                  // 读取40字节BMP信息头 

	      	// 源图宽度 
	      	int nWidth = (((int)bi[7] & 0xff) << 24) | (((int)bi[6] & 0xff) << 16) 
	                   | (((int)bi[5] & 0xff) <<8) | (int)bi[4] & 0xff; 
	      
	      	// 源图高度 
	      	int nHeight = (((int)bi[11] & 0xff) << 24) | (((int)bi[10] & 0xff) << 16) 
	                   | (((int)bi[9] & 0xff) << 8) | (int)bi[8] & 0xff; 

	      	// 位数 
	      	int nBitCount = (((int)bi[15] & 0xff) << 8) | (int)bi[14] & 0xff; 

	      	// 源图大小 
	      	int nSizeImage = (((int)bi[23] & 0xff) << 24) | (((int)bi[22] & 0xff) << 16) 
	                   | (((int)bi[21] & 0xff) << 8) | (int)bi[20] & 0xff; 

	      	//对24位BMP进行解析 
	      	if (nBitCount == 24) { 
	      		int nPad = (nSizeImage/nHeight) - nWidth*3; 
	      		int nData[] = new int[nHeight*nWidth]; 
		        byte bRGB[] = new byte[(nWidth + nPad)*3*nHeight]; 
		        fs.read (bRGB,0,(nWidth + nPad)*3*nHeight); 
		        int nIndex=0; 
		        for(int j=0; j<nHeight; j++){ 
			        for(int i=0; i<nWidth; i++){ 
			            nData[nWidth*(nHeight-j-1)+i] = (255 & 0xff) << 24 
			              | (((int)bRGB[nIndex + 2] & 0xff) << 16) 
			              | (((int)bRGB[nIndex + 1] & 0xff) << 8) 
			              | (int)bRGB[nIndex] & 0xff; 
			            nIndex += 3; 
			        } 
			        nIndex += nPad; 
		        } 
		        Toolkit kit = Toolkit.getDefaultToolkit(); 
		        image = kit.createImage(new MemoryImageSource(nWidth,nHeight,nData,0,nWidth)); 
		        result = "从BMP得到图像image"; 
	      	}else{ 
		        result = "不是24位BMP，失败！"; 
		        image = (Image)null; 
	      	} 
	      	fs.close();  //关闭输入流 
	            
	      	//开始进行图像压缩（对image对象进行操作） 
	      	//int width = image.getWidth(null);                             // 得到源图宽 
	      	//int height = image.getHeight(null);                           // 得到源图长 
	      	BufferedImage tag = new BufferedImage(w,h,BufferedImage.TYPE_INT_RGB); 
	      	tag.getGraphics().drawImage(image,0,0,w,h,null); // 缩小后的图 
	      	FileOutputStream out = new FileOutputStream(desFile); 
	      	JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);      
	      	encoder.encode(tag);                                          // 进行JPEG编码 
	      	out.close();       //关闭输出流                      
	    }catch (Exception e){
	    } 
	    	return result; 
	} 
	
	public static boolean cmpExt(String fname,String ext){
		  String extname = FileUtil.getExtension(fname);
		  if(extname.length()>1)extname = extname.substring(1);
		  if(!extname.equalsIgnoreCase(ext))return false;
		  return true;
	}
	

    public static void ThumbNail(String src, String thumb, int maxWidth,int maxHeight, boolean flag) {
		double ptX=0;
		double ptY=0;
		double pt2X=0;
		double pt2Y=0; 
		double orgWidth=0;
		double orgHeigth=0;
		if(thumb==null || thumb.trim().equals(""))
			thumb=src.substring(0,src.lastIndexOf("."))+"_thumb.jpg";
    	try {
    		Image inImage = new ImageIcon(src).getImage();
    	    orgWidth=(double)inImage.getWidth(null);
    	    orgHeigth=(double)inImage.getHeight(null);

    	    ptX=orgWidth/2;
    	    ptY=orgHeigth/2;

    	    pt2X=maxWidth/2;
    	    pt2Y=maxHeight/2;
    	    
    	    BufferedImage outImage = new BufferedImage(maxWidth, maxHeight, BufferedImage.TYPE_INT_RGB);

    	    AffineTransform tx = new AffineTransform();
    	    if(!flag||(orgWidth>=maxWidth&&orgHeigth>=maxHeight)){
    	        tx.translate(-ptX, -ptY);
        	    tx.translate(pt2X, pt2Y);
        	    // Paint image.
	            Graphics2D g2d = outImage.createGraphics();
	            g2d.setColor(Color.WHITE);
	            g2d.fillRect(0, 0, maxWidth, maxHeight);
	            g2d.drawImage(inImage, tx, null);
	            g2d.dispose();            
            }else{            	        	            
            	double scaleW = (double)maxWidth/(double)inImage.getWidth(null);
            	double scaleH = (double)maxHeight/(double)inImage.getHeight(null);
            	tx.scale(scaleW, scaleH);            	
            	
            	Graphics2D g2d = outImage.createGraphics();
   	            g2d.drawImage(inImage, tx, null);
   	            g2d.dispose();   	      
            }
           
            OutputStream os = new FileOutputStream(thumb);
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);
            encoder.encode(outImage);
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
    }

	
	public static void main(String[] argv) throws Exception {
		String imgLink = "", realImg = "";
		//int w = 300, h = 200;
		int i = 0;
		
		String path = "C:\\jpgs\\";
		//String fname = "tianxiao0419.gif";
		//JpgPress(path+fname,path+"s_"+fname,160,600);
		//bmpTest(path + fname);
		//imgLink = path + fname;
		//realImg = path + "scale\\" + fname;
		//FileUtil.createPathByFileName(realImg);
		//bmpPress(imgLink, realImg, 3);
		File sourceDir = new File(path);		
		File[] files = sourceDir.listFiles();
		for (i = 0; i < files.length; i++) {
			if (files[i].isFile()) {
				String fname = files[i].getName();
				String extname = FileUtil.getExtension(fname);
				if(extname.length()>1)extname = extname.substring(1);
				//if(!extname.equalsIgnoreCase("jpg"))continue;
				imgLink = path + fname;
				realImg = path + "scale\\" + fname;
				FileUtil.createPathByFileName(realImg);
				JpgPress(imgLink, realImg,160,600);
			}
		}
	}

}
