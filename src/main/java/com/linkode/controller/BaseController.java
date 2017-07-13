package com.linkode.controller;

/**
 * Created by gaoshiqi on 2017/6/29.
 */

import com.linkode.exception.CustomException;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.UUID;

public class BaseController {

    protected void validateAntiForgeryToken(HttpSession session,String token) throws CustomException {
        Object realToken = session.getAttribute("token");
        session.setAttribute("token", UUID.randomUUID().toString());
        if(realToken == null || !realToken.toString().equals(token)) throw new CustomException("操作异常！");
    }

    protected String View(String view) {
        return view;
    }

    protected String View(String view, Model model, Object object) {
        model.addAttribute("model",object);
        return view;
    }

    protected String RedirectTo(String url) {
        return "redirect:" + url;
    }

    protected Session session() {
    	Subject subject = SecurityUtils.getSubject();
    	return subject.getSession();
    }
}
