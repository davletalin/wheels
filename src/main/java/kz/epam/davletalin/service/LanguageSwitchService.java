package kz.epam.davletalin.service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class LanguageSwitchService implements Service {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
        final HttpSession session = req.getSession();
        final String referer = req.getHeader("referer");
        final String sessionLocale = (String) session.getAttribute("sessionLocale");
        System.out.println(sessionLocale);
        final String switchTo = req.getParameter("language");
        System.out.println(switchTo);
        if (sessionLocale==null||!sessionLocale.equals(switchTo)) {
            session.setAttribute("sessionLocale", switchTo);
            res.sendRedirect(referer);
        } else {
            res.sendRedirect(referer);
        }
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {

    }
}
