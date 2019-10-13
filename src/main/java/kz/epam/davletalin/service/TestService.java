package kz.epam.davletalin.service;

import kz.epam.davletalin.database.dao.CatalogDataDao;
import kz.epam.davletalin.entity.CatalogRetriever;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class TestService implements Service {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
        List<CatalogRetriever> makes = new CatalogDataDao().getAll("make");
        req.setAttribute("makes", makes);
        System.out.println(makes);
        ServletContext servletContext = req.getServletContext();
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/jsp/test.jsp");
        dispatcher.forward(req, res);

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {

    }
}
