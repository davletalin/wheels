package kz.epam.davletalin.service;

import kz.epam.davletalin.database.dao.UserDao;
import kz.epam.davletalin.entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class UserUpdateService implements Service {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
        ServletContext servletContext = req.getServletContext();
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/jsp/profile.jsp");
        dispatcher.forward(req, res);
    }

    @Override//TODO finish method
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
        HttpSession session = req.getSession();
        UserDao userDao = new UserDao();
        User updatingUser = (User) session.getAttribute("user");
        String password = req.getParameter("password");
        String firstName = req.getParameter("firstname");
        String lastName = req.getParameter("lastname");
        String email = req.getParameter("email");
        Long phone = Long.valueOf(req.getParameter("phone"));
        System.out.println("password=" + password);//TODO delete this log
        System.out.println("firstname=" + firstName);
        System.out.println("lastname=" + lastName);
        System.out.println("email=" + email);
        System.out.println("phone=" + phone);

        if (password != null) {
            updatingUser.setPassword(password);
        }
        if (firstName != null) {
            updatingUser.setFirstName(firstName);
        }
        if (lastName != null) {
            updatingUser.setLastName(lastName);
        }
        if (email != null) {
            updatingUser.setEmail(email);
        }
        if (phone != null) {
            updatingUser.setPhone(phone);
        }
        userDao.update(updatingUser);
        session.setAttribute("user",updatingUser);
        res.sendRedirect("/jsp/main.jsp");
    }
}
