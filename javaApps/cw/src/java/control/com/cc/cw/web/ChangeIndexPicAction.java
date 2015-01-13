package com.cc.cw.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import com.cc.cw.domain.IndexPic;
import com.cc.cw.service.ChangePicService;

public class ChangeIndexPicAction extends CMyAction {

	private static final long serialVersionUID = 2296248998086851027L;

	private String flag;

	private String link;

	File file;

	String fileContentType;

	String fileFileName;

	String newFileName;

	private ChangePicService cPicService;

	@Override
	public String doExecute() {
		if (flag != null && flag.equalsIgnoreCase("upload")) {
			if (file == null) {
				setMessage("文件错误！");
				return INPUT;
			}
			// if (link == null || link.trim().length() < 1) {
			// setMessage("图片链接不能为空");
			// return INPUT;
			//			}
			String indexpicpath = CwConfiguration.create()
					.get("index.pic.path");
			FileOutputStream outputStream;
			String fileType = getFileType(fileFileName);
			if (fileType == null
					|| fileType.length() < 1
					|| (!fileType.equalsIgnoreCase("jpg")
							&& !fileType.equalsIgnoreCase("jpeg") && !fileType
							.equalsIgnoreCase("gif"))) {
				setMessage("图片格式只能为jpg或gif");
				return INPUT;
			}
			newFileName = (new Date()).getTime() + "." + fileType;
			try {
				outputStream = new FileOutputStream(indexpicpath + newFileName);
				FileInputStream fileIn = new FileInputStream(file);

				byte[] buffer = new byte[1024];

				int len;
				while ((len = fileIn.read(buffer)) > 0) {
					outputStream.write(buffer, 0, len);
				}

				fileIn.close();
				outputStream.close();
				IndexPic indexpic = new IndexPic();
				indexpic.setAddTime(new Date());
				indexpic.setLink(link.trim());
				indexpic.setNewName(newFileName);
				indexpic.setOldName(fileFileName);
				cPicService.save(indexpic);
				return SUCCESS;
			} catch (FileNotFoundException e) {
				setMessage("找不到文件");
				return INPUT;
			} catch (IOException e) {
				setMessage("输出错误");
				return INPUT;
			}
		}
		return INPUT;
	}

	private String getFileType(String fileFileName2) {
		String type = fileFileName2;
		while (type.contains(".")) {
			type = type.substring(type.indexOf(".") + 1);
		}
		return type;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getNewFileName() {
		return newFileName;
	}

	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public ChangePicService getCPicService() {
		return cPicService;
	}

	public void setCPicService(ChangePicService picService) {
		cPicService = picService;
	}

}
