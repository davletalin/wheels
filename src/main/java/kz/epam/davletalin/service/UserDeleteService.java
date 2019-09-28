package kz.epam.davletalin.service;

import kz.epam.davletalin.database.dao.UserDao;
import kz.epam.davletalin.entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserDeleteService implements Service {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        ServletContext servletContext = req.getServletContext();
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/jsp/protected/user-delete.jsp");
        dispatcher.forward(req, res);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        final String login = req.getParameter("login");
        System.out.println("login = " + login);
        UserDao userDao = new UserDao();
        User user = userDao.getByLogin(login);
        System.out.println("delete user: " + user);
        if (user.getLogin() != null) {
            userDao.delete(user);
            res.sendRedirect(req.getContextPath());
        } else {
            System.out.println("User not found");
            ServletContext servletContext = req.getServletContext();
            RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/jsp/protected/user-delete.jsp");
            dispatcher.forward(req, res);
        }


    }
}
