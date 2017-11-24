package com.baidu.util;

import javax.servlet.*;
import java.io.IOException;


/**
 * Created by null on 2017/11/9.
 */
public class FirstFilter implements Filter {

    protected String encoding = null;          // 接收字符编码
    public void destroy() {
        this.encoding = null;
    }
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        if (this.encoding != null)
        {
            request.setCharacterEncoding(this.encoding);
            response.setCharacterEncoding(this.encoding);
            System.out.println(this.encoding);
        }
        chain.doFilter(request, response);

    }
    public void init(FilterConfig filterConfig) throws ServletException {
        this.encoding = filterConfig.getInitParameter("encoding");

    }

}