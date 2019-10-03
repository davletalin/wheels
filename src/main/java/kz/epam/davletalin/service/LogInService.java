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

public class LogInService implements Service {


    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        final HttpSession session = req.getSession();
        final String login = req.getParameter("login");
        final String password = req.getParameter("password");
        System.out.println("login = " + login);
        System.out.println("password = " + password);
        if (checkUserByLoginAndPassword(login, password)) {
            System.out.println("login password matches");
            User user = new UserDao().getByLogin(login);
            session.setAttribute("user", user);
            res.sendRedirect(req.getContextPath());
        } else {
            final String referer = req.getHeader("referer");
            System.out.println("login password incorrect");
            res.sendRedirect(referer);
        }

    }

    private boolean checkUserByLoginAndPassword(String login, String password) {
        User user = new UserDao().getByLogin(login);
        System.out.println("check by user password. User ="+user);
        if (user.getId()==0 ) {
            //user by login not found
        } else {
            if (user.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }
}
