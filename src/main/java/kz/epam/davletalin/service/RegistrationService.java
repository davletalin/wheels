package kz.epam.davletalin.service;

import kz.epam.davletalin.database.dao.UserDao;
import kz.epam.davletalin.entity.Role;
import kz.epam.davletalin.entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

public class RegistrationService implements Service {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
//        ServletContext servletContext = req.getServletContext();
//        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/jsp/registration.jsp");
//        dispatcher.forward(req, res);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
        String newLogin = req.getParameter("login");
        System.out.println("newLogin= " + newLogin);
        UserDao userDao=new UserDao();
        if (userDao.getByLogin(newLogin).getLogin() == null) {
            System.out.println("user login == null");
            User user = new User();
            user.setLogin(newLogin);
            user.setPassword(req.getParameter("password"));
            user.setFirstName(req.getParameter("first_name"));
            user.setLastName(req.getParameter("last_name"));
            user.setEmail(req.getParameter("email"));
            user.setRole(Role.USER);
            user.setRegDate(new Timestamp(new Date().getTime()));
            user.setPhone(Long.parseLong(req.getParameter("phone")));
            userDao.save(user);
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            req.removeAttribute("error");
            req.getRequestDispatcher("/jsp/main.jsp").forward(req, res);

        } else {
            req.setAttribute("error", 601);
            doGet(req, res);
        }
    }
}