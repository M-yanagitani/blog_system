package models;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "users")
@NamedQueries({
    @NamedQuery(
        name = "getAllUsers",
        query = "SELECT u FROM User AS u ORDER BY u.id DESC"
    ),
    @NamedQuery(
        name = "getUsersCount",
        query = "SELECT COUNT(u) FROM User AS u"
    ),
    @NamedQuery(
        name = "checkRegisteredCode",
        query = "SELECT COUNT(u) FROM User AS u WHERE u.code = :code"
    ),
    @NamedQuery(
        name = "checkLoginCodeAndPassword",
        query = "SELECT u FROM User AS u WHERE u.code = :code AND u.password = :pass"
    ),
    @NamedQuery(
            name = "getUserCode",
            query = "SELECT u FROM User AS u WHERE u.code = :code"
    )
})

@Entity
public class User {
    @Id
    @Column(name = "id") // リソース内での連番
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "code", nullable = false, unique = true) // ユーザID
    private String code;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "blog_title", length = 30, nullable = false)
    private String blog_title;

    @Column(name = "profile", length = 50, nullable = false)
    private String profile;

    @Column(name = "password", length = 64, nullable = false)
    private String password;

    @Column(name = "created_at", nullable = false)
    private Timestamp created_at;

    @Column(name = "updated_at", nullable = false)
    private Timestamp updated_at;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getBlog_title() {
        return blog_title;
    }

    public void setBlog_title(String blog_title) {
        this.blog_title = blog_title;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    public Timestamp getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }

}
