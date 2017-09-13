package com.linkode.controller;

import com.linkode.pojo.User;
import com.linkode.service.AdService;
import com.linkode.service.PortfolioService;
import com.linkode.service.ProjectCommitService;
import com.linkode.service.UserService;
import com.linkode.util.FileUploadUtil;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;

/**
 * Created by gaoshiqi on 2017/7/17.
 */
@Controller
public class FileController {
	@Autowired
	PortfolioService portfolioService;
	@Autowired
	UserService userService;
	@Autowired
	ProjectCommitService projectCommitService;
	@Autowired
	AdService adService;
	
    @PostMapping("/CKEditor")
    public void imageUpload(HttpServletRequest request, HttpServletResponse response) {
        String DirectoryName = "static/upload/img";
        try {
            FileUploadUtil.ckeditor(request, response, DirectoryName);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 返回用户头像
    @GetMapping("/file/user/{id}")
    public ResponseEntity<byte[]> avatarView(HttpServletRequest request, HttpServletResponse response, @PathVariable("id") Integer id) throws IOException {
    	String realPath = request.getSession().getServletContext().getRealPath("static/img/avatar");
    	File realPathDirectory = new File(realPath);
        if (!realPathDirectory.exists()) {
            realPathDirectory.mkdirs();
        }
    	String fileName = userService.getById(id).getUrl();
		File file = new File(realPath+"/"+fileName);
    	if (fileName==null || !file.exists()) {
    		file = new File(request.getSession().getServletContext().getRealPath("static/img")+"/default-avatar.gif");
    	}
		// 下载浏览器响应的那个文件名
		String dfileName = fileName;
		// 下面开始设置HttpHeaders,使得浏览器响应下载
		HttpHeaders headers = new HttpHeaders();
		// 设置响应方式
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		// 设置响应文件
		headers.setContentDispositionFormData("attachment", dfileName);
		// 把文件以二进制形式写回
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }
    
    // 返回项目提交文件
    @GetMapping("/file/commit/{id}")
    public ResponseEntity<byte[]> commitView(HttpServletRequest request, HttpServletResponse response, @PathVariable("id") Integer id) throws IOException {
    	String realPath = request.getSession().getServletContext().getRealPath("static/img/file");
    	File realPathDirectory = new File(realPath);
        if (!realPathDirectory.exists()) {
            realPathDirectory.mkdirs();
        }
    	String fileName = projectCommitService.getById(id).getFilename();
		File file = new File(realPath+"/"+fileName);
    	if (fileName==null || !file.exists()) {
    		return null;
    	}
		// 下载浏览器响应的那个文件名
		String dfileName = fileName;
		// 下面开始设置HttpHeaders,使得浏览器响应下载
		HttpHeaders headers = new HttpHeaders();
		// 设置响应方式
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		// 设置响应文件
		headers.setContentDispositionFormData("attachment", dfileName);
		// 把文件以二进制形式写回
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }
    
    // 返回广告图片
    @GetMapping("/file/ad/{id}")
    public ResponseEntity<byte[]> adView(HttpServletRequest request, HttpServletResponse response, @PathVariable("id") Integer id) throws IOException {
    	String realPath = request.getSession().getServletContext().getRealPath("static/img/ad");
    	File realPathDirectory = new File(realPath);
        if (!realPathDirectory.exists()) {
            realPathDirectory.mkdirs();
        }
    	String fileName = adService.getById(id).getFilename();
		File file = new File(realPath+"/"+fileName);
    	if (fileName==null || !file.exists()) {
    		file = new File(request.getSession().getServletContext().getRealPath("static/img")+"/default.gif");
    	}
    	
		// 下载浏览器响应的那个文件名
		String dfileName = fileName;
		// 下面开始设置HttpHeaders,使得浏览器响应下载
		HttpHeaders headers = new HttpHeaders();
		// 设置响应方式
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		// 设置响应文件
		headers.setContentDispositionFormData("attachment", dfileName);
		// 把文件以二进制形式写回
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }
    
    // 返回作品图片
    @GetMapping("/file/portfolio/{id}")
    public ResponseEntity<byte[]> fileView(HttpServletRequest request, HttpServletResponse response, @PathVariable("id") Integer id) throws IOException {
    	String realPath = request.getSession().getServletContext().getRealPath("static/img/pic");
    	File realPathDirectory = new File(realPath);
        if (!realPathDirectory.exists()) {
            realPathDirectory.mkdirs();
        }
    	String fileName = portfolioService.findByPrimaryKey(id).getUrl();
		File file = new File(realPath+"/"+fileName);
    	if (fileName==null || !file.exists()) {
    		file = new File(request.getSession().getServletContext().getRealPath("static/img")+"/default.gif");
    	}
    	
		// 下载浏览器响应的那个文件名
		String dfileName = fileName;
		// 下面开始设置HttpHeaders,使得浏览器响应下载
		HttpHeaders headers = new HttpHeaders();
		// 设置响应方式
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		// 设置响应文件
		headers.setContentDispositionFormData("attachment", dfileName);
		// 把文件以二进制形式写回
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }
    
    @RequestMapping("/File")
    public void fileUpload(HttpServletRequest request) {
        String DirectoryName = "static/upload/file";
        try{
            FileUploadUtil.upload(request, DirectoryName);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
