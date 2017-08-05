package com.linkode.controller;

import com.linkode.util.FileUploadUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by gaoshiqi on 2017/7/17.
 */
@Controller
@RequestMapping("/upload")
public class FileController {
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
