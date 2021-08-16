package controllers.followers;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Follow;
import utils.DBUtil;

/**
 * Servlet implementation class FollowersDestroyServlet
 */
@WebServlet("/followers/destroy")
public class FollowersDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowersDestroyServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            EntityManager em = DBUtil.createEntityManager();

            // セッションスコープからフォロー情報のIDを取得して
            // 該当のIDのフォロー情報1件のみをデータベースから取得
            Follow f = em.find(Follow.class, Integer.parseInt(request.getParameter("follow_id")));

            em.getTransaction().begin();
            em.remove(f);       // データ削除
            em.getTransaction().commit();
            em.close();

            // indexページへリダイレクト
            response.sendRedirect(request.getContextPath() + "/followers/index");
        }
}
