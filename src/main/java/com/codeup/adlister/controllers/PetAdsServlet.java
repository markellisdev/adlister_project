package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Pet;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.PetAdsServlet", urlPatterns = "/petads")
public class PetAdsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/petads.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(request.getParameter("name"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String breed = request.getParameter("breed");
        String gender = request.getParameter("gender");
        String age = request.getParameter("age");
        String descrip = request.getParameter("descrip");
        String cost = request.getParameter("cost");
        String title = request.getParameter("title");
        String traits = request.getParameter("traits");

        // validate input
        boolean inputHasErrors = name.isEmpty()
                || type.isEmpty()
                || breed.isEmpty()
                || gender.isEmpty()
                || age.isEmpty()
                || descrip.isEmpty()
                || cost.isEmpty()
                || title.isEmpty()
                || traits.isEmpty();

        if (inputHasErrors) {
            response.sendRedirect("/petads");
            return;
        }

        // create and save a new pets
//        Pet pet = new Pet(name, type, breed, gender, Integer.parseInt(age));
//        DaoFactory.getPetsDao().insert(pet);
//        response.sendRedirect("/ads");
//        Pet pet = (Pet) request.getSession().getAttribute("name");
        Pet pet = new Pet(name, type, breed, gender, age, descrip, cost, title, traits);
        DaoFactory.getPetsDao().insert(pet);
        response.sendRedirect("/ads");
    }
}
