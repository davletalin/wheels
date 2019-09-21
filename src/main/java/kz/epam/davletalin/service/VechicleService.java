package kz.epam.davletalin.service;

import kz.epam.davletalin.database.dao.VechicleDao;
import kz.epam.davletalin.entity.Vechicle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class VechicleService implements Service {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
        List<Vechicle> vechiclesList=new VechicleDao().getAll();
        for (Vechicle vechicle :vechiclesList) {
            System.out.println(vechicle);
        }
        req.setAttribute("vechiclesList", vechiclesList);
        long id= (long) req.getAttribute("id");
        Vechicle vechicle=new VechicleDao().getById(id);
        System.out.println("id= "+id);
        ServletContext servletContext = req.getServletContext();
        RequestDispatcher dispatcher=servletContext.getRequestDispatcher("/jsp/vechicles.jsp");
        dispatcher.forward(req,res);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
        List<Vechicle> vechiclesList=new VechicleDao().getAll();
        for (Vechicle vechicle :vechiclesList) {
            System.out.println(vechicle);
        }
        req.setAttribute("vechiclesList", vechiclesList);
        long id= (long) req.getAttribute("id");
        Vechicle vechicle=new VechicleDao().getById(id);
        System.out.println("id= "+id);
        ServletContext servletContext = req.getServletContext();
        RequestDispatcher dispatcher=servletContext.getRequestDispatcher("/jsp/vechicles.jsp");
        dispatcher.forward(req,res);
    }
}
