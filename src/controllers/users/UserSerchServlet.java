package controllers.users;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Follow;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class UserSerchServlet
 */
@WebServlet("/users/serch")
public class UserSerchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSerchServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        User login_user = (User)request.getSession().getAttribute("login_user");

        int page = 1;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        } catch(NumberFormatException e) { }
        List<User> users = em.createNamedQuery("getUserCode", User.class)
                             .setParameter("code", request.getParameter("code"))
                             .getResultList();
        int users_count = 0;
        if(users != null){
            users_count = users.size();
        }

        List<Follow> follows = em.createNamedQuery("getMyAllFollows", Follow.class)
                .setParameter("user", login_user)
                .getResultList();

        em.close();

        request.setAttribute("users", users);
        request.setAttribute("follows", follows);
        request.setAttribute("users_count", users_count);
        request.setAttribute("page", page);
        if(request.getSession().getAttribute("flush") != null) {
            request.setAttribute("flush", request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/users/index.jsp");
        rd.forward(request, response);

    }

}