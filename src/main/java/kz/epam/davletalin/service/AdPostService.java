package kz.epam.davletalin.service;

import kz.epam.davletalin.database.dao.AdDao;
import kz.epam.davletalin.entity.Ad;
import kz.epam.davletalin.entity.User;
import kz.epam.davletalin.entity.Vechicle;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class AdPostService implements Service {
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
        HttpSession session = req.getSession();
        if (session.getAttribute("user") != null) {
            ServletContext servletContext = req.getServletContext();
            RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/jsp/post.jsp");
            dispatcher.forward(req, res);
        } else {

        }
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException, SQLException {
        HttpSession session = req.getSession();
        User user = new User();
        if (user != null) {
            final String make = req.getParameter("make");
            System.out.println(make);//TODO delete log
            final String model = req.getParameter("model");
            System.out.println(model);//TODO delete log
            final String country = req.getParameter("country");
            final String body = req.getParameter("body");
            final String color = req.getParameter("color");
            final String engine = req.getParameter("engine");
            final String transmission = req.getParameter("transmission");
            final String mileage = req.getParameter("mileage");
            final String wheelDrive = req.getParameter("wheel_drive");
            final String price = req.getParameter("price");
            final String city = req.getParameter("city");
            final String description = req.getParameter("description");
            List<Part> fileParts = req.getParts().stream().filter(part -> "images".equals(part.getName())).collect(Collectors.toList()); // Retrieves <input type="file" name="images" multiple>
            List<File> images = new ArrayList<>();
            File imagesPath = new File("D:\\temp");//TODO fix path with constant
            if (!imagesPath.exists()) {
                imagesPath.mkdir();
            }
            for (Part part : fileParts) {
                InputStream is = part.getInputStream();
                System.out.println(part.getSubmittedFileName());
                File file = new File(is.hashCode() + ".jpg");
                System.out.println("name of file: "+is.hashCode());
                byte[] fileContent = is.readAllBytes();
                images.add(file);
                System.out.println("fileLentgth=" + fileContent.length);
                try (FileOutputStream fos = new FileOutputStream(imagesPath + "\\photo.jpg")) {
                    fos.write(fileContent);
                }
                images.add(imagesPath);
                is.close();
            }
            System.out.println("images: " + images);

            Vechicle vechicle = new Vechicle();
            vechicle.setMake(make);
            vechicle.setModel(model);
            vechicle.setCountry(country);
            vechicle.setBody(body);
            vechicle.setColor(color);
            vechicle.setEngine(engine);
            vechicle.setTransmission(transmission);
            vechicle.setMileage(Integer.parseInt(mileage));
            vechicle.setWheelDrive(wheelDrive);
            Ad ad = new Ad();
            ad.setUser(user);
            ad.setPublication_date(new Timestamp(new Date().getTime()));
            ad.setVechicle(vechicle);
            ad.setCity(city);
            ad.setPrice(Long.valueOf(price));
            ad.setDescription(description);
            ad.setPhotos(images);
            new AdDao().save(ad);
            ServletContext context = req.getServletContext();
            RequestDispatcher dispatcher = context.getRequestDispatcher("/jsp/main.jsp");
            dispatcher.forward(req, res);
//            }

        } else
            res.sendRedirect(req.getContextPath());
    }
}
