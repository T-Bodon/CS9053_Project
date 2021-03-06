package com.changyu.foryou.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.alibaba.fastjson.JSON;
import com.changyu.foryou.service.KeyService;
import com.changyu.foryou.tools.Constants;
import com.changyu.foryou.tools.Sign;

/**
 * 实行对接口进行签名
 *
 */
@Component
public class SignFilter implements Filter {
    @Autowired
    private KeyService keyService;

    @Override
    public void destroy() {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        chain.doFilter(request,response);
//        HashMap<String, String[]> map = (HashMap<String, String[]>) request
//                .getParameterMap();
//
//        Map<String, Object> resultMap = new HashMap<>();
//
//        if (map.get("server") != null
//                && map.get("server")[0]
//                .equals("56846a8a2fee49d14901d39cc48b8b2a")) {
//            chain.doFilter(request, response);
//            return;
//        }
//
//        if (map.get("timestamp") == null || map.get("secret") == null
//                || map.get("sign") == null) { // 签名参数不能为空
//            response.reset();
//            response.setContentType("text/html;charset=UTF-8");
//            response.setCharacterEncoding("utf-8");
//            PrintWriter out = response.getWriter();
//            resultMap.put(Constants.STATUS, Constants.FAILURE);
//            resultMap.put(Constants.MESSAGE, "签名必要参数不能为空");
//            out.print(JSON.toJSONString(resultMap));
//            return;
//        }
//
//        String sign = Sign.getSignature(map);
//        String secret = map.get("secret")[0];
//
//        if ((new Date().getTime() - Long.parseLong(map.get("timestamp")[0])) > 10 * 1000 * 6) {
//            response.reset();
//            response.setContentType("text/html;charset=UTF-8");
//            response.setCharacterEncoding("utf-8");
//            PrintWriter out = response.getWriter();
//            resultMap.put(Constants.STATUS, Constants.FAILURE);
//            resultMap.put(Constants.MESSAGE, "会话已超时");
//            out.print(JSON.toJSONString(resultMap));
//            return;
//        } else if (!map.get("sign")[0].equals(sign)) {
//            response.reset();
//            response.setContentType("text/html;charset=UTF-8");
//            response.setCharacterEncoding("utf-8");
//            PrintWriter out = response.getWriter();
//            resultMap.put(Constants.STATUS, Constants.FAILURE);
//            resultMap.put(Constants.MESSAGE, "接口签名错误");
//            out.print(JSON.toJSONString(resultMap));
//            return;
//        } else {
//            Map<String, Object> paramMap = new HashMap<>();
//            paramMap.put("secrect", secret);
//
//            String flag = keyService.SelectKey(paramMap);
//            if (flag == null) {
//                response.reset();
//                response.setContentType("text/html;charset=UTF-8");
//                response.setCharacterEncoding("utf-8");
//                PrintWriter out = response.getWriter();
//
//                resultMap.put(Constants.STATUS, Constants.FAILURE);
//                resultMap.put(Constants.MESSAGE, "密钥不存在");
//                out.print(JSON.toJSONString(resultMap));
//                return;
//            }
//            chain.doFilter(request, response);
//        }

    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
    }

}
