package kz.epam.davletalin.service;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class LogoutService implements Service {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
        HttpSession session = (HttpSession) req.getSession();
        session.removeAttribute("user");
        res.sendRedirect(req.getContextPath());
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {

    }
}
