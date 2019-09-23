package kz.epam.davletalin.service;

import kz.epam.davletalin.database.dao.VechicleDao;
import kz.epam.davletalin.entity.Vechicle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class VechicleService implements Service {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
        HttpSession session = req.getSession();
        List<Vechicle> vechiclesList = new VechicleDao().getAll();
        for (Vechicle vechicle : vechiclesList) {
            System.out.println(vechicle);
        }
        session.setAttribute("vlist", vechiclesList);
        req.setAttribute("vechiclesList", vechiclesList);
        long id=0;
        if (req.getParameter("id") != null) {
            id = Long.parseLong(req.getParameter("id"));

        }
        Vechicle vechicle = new VechicleDao().getById(id);
        req.setAttribute("vechicle", vechicle);
        ServletContext servletContext = req.getServletContext();
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/jsp/vechicles.jsp");
        dispatcher.forward(req, res);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {

    }
}
