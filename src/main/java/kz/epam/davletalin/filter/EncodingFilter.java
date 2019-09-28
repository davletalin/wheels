package kz.epam.davletalin.filter;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EncodingFilter extends HttpFilter {
    private static String encoding;

    @Override
    public void init(FilterConfig config) throws ServletException {
        encoding = config.getInitParameter("requestEncoding");
        if (encoding == null) encoding = "UTF-8";
    }

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        if (null == req.getCharacterEncoding()) {
            req.setCharacterEncoding(encoding);
        }
        res.setContentType("text/html; charset=UTF-8");
        res.setCharacterEncoding("UTF-8");
        chain.doFilter(req,res);
    }
}
