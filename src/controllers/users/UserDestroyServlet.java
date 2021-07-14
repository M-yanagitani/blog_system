package controllers.users;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.User;
import utils.DBUtil;

/**
 * Servlet implementation class EmployeesDestroyServlet
 */
@WebServlet("/users/destroy")
public class UserDestroyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDestroyServlet() {
        super();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = request.getParameter("_token");
        if(_token != null && _token.equals(request.getSession().getId())) {
            EntityManager em = DBUtil.createEntityManager();

            User u = em.find(User.class, (Integer)(request.getSession().getAttribute("user_id")));
            em.getTransaction().begin();
            em.remove(u);       // データ削除
            em.getTransaction().commit();
            em.close();

            // セッションスコープ上の不要になったデータを削除
            request.getSession().removeAttribute("user_id");
            request.getSession().setAttribute("flush", "削除が完了しました。");

            response.sendRedirect(request.getContextPath() + "/users/index");
        }
    }

}