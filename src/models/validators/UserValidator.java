package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.User;

public class UserValidator {
    public static List<String> validate(User u, Boolean codeDuplicateCheckFlag, Boolean passwordCheckFlag) {
        List<String> errors = new ArrayList<String>();

        String code_error = validateCode(u.getCode(), codeDuplicateCheckFlag);
        if(!code_error.equals("")) {
            errors.add(code_error);
        }

        String name_error = validateName(u.getName());
        if(!name_error.equals("")) {
            errors.add(name_error);
        }

        String password_error = validatePassword(u.getPassword(), passwordCheckFlag);
        if(!password_error.equals("")) {
            errors.add(password_error);
        }

        return errors;
    }

    // ユーザID
    private static String validateCode(String code, Boolean codeDuplicateCheckFlag) {
        // 必須入力チェック
        if(code == null || code.equals("")) {
            return "ユーザIDを入力してください。";
        }

        // すでに登録されているユーザIDとの重複チェック
        if(codeDuplicateCheckFlag) {
            EntityManager em = utils.DBUtil.createEntityManager();
            long employees_count = (long)em.createNamedQuery("checkRegisteredCode", Long.class).setParameter("code", code).getSingleResult();
            em.close();
            if(employees_count > 0) {
                return "入力されたユーザIDはすでに存在しています。";
            }
        }

        return "";
    }

    // 社員名の必須入力チェック
    private static String validateName(String name) {
        if(name == null || name.equals("")) {
            return "名前を入力してください。";
        }

        return "";
    }

    // パスワードの必須入力チェック
    private static String validatePassword(String password, Boolean passwordCheckFlag) {
        // パスワードを変更する場合のみ実行
        if(passwordCheckFlag && (password == null || password.equals(""))) {
            return "パスワードを入力してください。";
        }
        return "";
    }
}