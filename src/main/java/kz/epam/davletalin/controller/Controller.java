package kz.epam.davletalin.controller;

import kz.epam.davletalin.entity.User;
import kz.epam.davletalin.service.Service;
import kz.epam.davletalin.service.ServiceFactory;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String requestURI = req.getRequestURI();
        requestURI = requestURI.replace(req.getContextPath(), "");
        System.out.println("GET: " + requestURI);
        ServiceFactory factory = ServiceFactory.getInstance();
        Service service = factory.getService(requestURI);
        try {
            service.doGet(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String requestURI = req.getRequestURI();
        requestURI = requestURI.replace(req.getContextPath(), "");
        System.out.println("POST: " + requestURI);
        ServiceFactory factory = ServiceFactory.getInstance();
        Service service = factory.getService(requestURI);
        try {
            service.doPost(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
