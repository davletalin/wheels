package kz.epam.davletalin.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EncodingFilter implements Filter {
    private static String encoding;
//    private final String[] extensions = {".ico", ".gif", ".css", ".js", ".ttf", ".woff", ".woff2", ".svg", ".eot",".jpg", ".png"};


    @Override
    public void init(FilterConfig config) throws ServletException {
        encoding = config.getInitParameter("requestEncoding");
        if (encoding == null) encoding = "UTF-8";
    }

     public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
//        if (isExtensions(req)) {
//            chain.doFilter(req, res);
//        }
        if (null == req.getCharacterEncoding()) {
            req.setCharacterEncoding(encoding);
        }
        res.setContentType("text/html; charset=UTF-8");
        res.setCharacterEncoding("UTF-8");
        chain.doFilter(req,res);
    }
//    private boolean isExtensions(ServletRequest request) {
//        String context = request.get();
//        String path = request.getRequestURI().substring(context.length());
//        for (String item : extensions) {
//            if (path.endsWith(item)) {
//                return true;
//            }
//        }
//        return false;
//    }
}
