package kz.epam.davletalin.service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public interface Service {
    void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException;
    void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException;
}
