package controllers.followers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Follow;
import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class FollowersCreateServlet
 */
@WebServlet("/followers/create")
public class FollowersCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowersCreateServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            EntityManager em = DBUtil.createEntityManager();

            Follow f = new Follow();
            User u = em.find(User.class, Integer.parseInt(request.getParameter("follow_id"))); // 相手
            f.setFollow_user(u); // 相手
            f.setFollower_user((User) request.getSession().getAttribute("login_user")); // 自分

            em.getTransaction().begin();
            em.persist(f);
            em.getTransaction().commit();
            request.getSession().setAttribute("flush", "登録が完了しました。");
            em.close();

            response.sendRedirect(request.getContextPath() + "/followers/index");
    }

}
