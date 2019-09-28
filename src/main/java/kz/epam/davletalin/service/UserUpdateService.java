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
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/jsp/user-update.jsp");
        dispatcher.forward(req, res);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
        HttpSession session=req.getSession();
        UserDao userDao=new UserDao();
        User updatingUser = (User) session.getAttribute("user");
        String password=req.getParameter("password");
        String email=req.getParameter("password");
        String firstName=req.getParameter("password");
        String lastName=req.getParameter("password");
        if (password!=null){
            updatingUser.setPassword(password);
        }


    }
}
