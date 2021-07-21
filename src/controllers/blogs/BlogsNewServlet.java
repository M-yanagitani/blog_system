package controllers.blogs;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Blog;

/**
 * Servlet implementation class ReportsNewServlet
 */
@WebServlet("/blogs/new")
public class BlogsNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogsNewServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("_token", request.getSession().getId());

        Blog b = new Blog();
        b.setBlog_date(new Date(System.currentTimeMillis()));
        request.setAttribute("blog", b);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/blogs/new.jsp");
        rd.forward(request, response);
    }

}