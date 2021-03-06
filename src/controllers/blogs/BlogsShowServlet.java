package controllers.blogs;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Blog;
import utils.DBUtil;

/**
 * Servlet implementation class ReportsShowServlet
 */
@WebServlet("/blogs/show")
public class BlogsShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogsShowServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        Blog b = em.find(Blog.class, Integer.parseInt(request.getParameter("id")));

//        36行目はバラすと下記の様な感じ。
//        "/WEB-INF/views/blogs/show.jsp" 25行目 id=${blog.id} は
//        Blog.javaのidとは関係がないただの変数名

//        Integer a = Integer.parseInt(request.getParameter("id"));
//        Blog b = em.find(Blog.class, a);


        em.close();

        request.setAttribute("blog", b);
        request.setAttribute("_token", request.getSession().getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/blogs/show.jsp");
        rd.forward(request, response);
    }

}