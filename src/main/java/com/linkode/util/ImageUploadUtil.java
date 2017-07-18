package com.linkode.util;

import org.springframework.http.HttpRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Iterator;

/**
 * Created by gaoshiqi on 2017/7/17.
 */
public class ImageUploadUtil {

    private static List<String> fileTypes = new ArrayList<String>();

    static {
        fileTypes.add(".jpg");
        fileTypes.add(".jpeg");
        fileTypes.add(".bmp");
        fileTypes.add(".gif");
        fileTypes.add(".png");
    }

    public static String upload(HttpServletRequest request, String DirectoryName) throws IllegalStateException, IOException {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());

        String fileName = null;

        if(multipartResolver.isMultipart(request)) {
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            Iterator<String> iter = multiRequest.getFileNames();
            while(iter.hasNext()) {
                MultipartFile file = multiRequest.getFile(iter.next());
                if (file != null) {
                    String myFileName = file.getOriginalFilename();
                    if(myFileName.trim() != "") {
                        String originFilename = file.getOriginalFilename();
                        String suffix = originFilename.substring(originFilename.lastIndexOf(".")).toLowerCase();
                        if(!fileTypes.contains(suffix)) {
                            continue;
                        }
                        String realPath = request.getSession().getServletContext().getRealPath(DirectoryName);
                        System.out.println(realPath);
                        File realPathDirectory = new File(realPath);
                        if (realPathDirectory == null || !realPathDirectory.exists()) {
                            realPathDirectory.mkdirs();
                        }
                        Calendar cal = Calendar.getInstance();
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
                        fileName = sdf.format(cal.getTime()) + suffix;
                        File uploadFile = new File(realPathDirectory + "/" + fileName);
                        System.out.println(uploadFile);
                        file.transferTo(uploadFile);
                    }
                }
            }
        }
        return fileName;
    }

    public static void ckeditor(HttpServletRequest request, HttpServletResponse response, String DirectoryName) throws IOException {
        String fileName = upload(request, DirectoryName);
        String imageContextPath = request.getContextPath() + "/" + DirectoryName + "/" + fileName;
        response.setContentType("text/html;charset=UTF-8");
        String callback = request.getParameter("CKEditorFuncNum");
        PrintWriter out = response.getWriter();
        out.println("<script type=\"text/javascript\">");
        out.println("window.parent.CKEDITOR.tools.callFunction(" + callback + ",'" + imageContextPath + "',''" + ")");
        out.println("</script>");
        out.flush();
        out.close();
    }
}
