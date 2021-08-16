package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Table(name = "followers")
@NamedQueries({
    @NamedQuery(
        name = "getAllFollowers",
        query = "SELECT f FROM Follow AS f ORDER BY f.id DESC"
    ),
    @NamedQuery(
        name = "getFollowersCount",
        query = "SELECT COUNT(f) FROM Follow AS f"
    ),
    @NamedQuery(
            name = "getMyAllFollows",
            query = "SELECT f FROM Follow AS f WHERE f.follower_user = :user ORDER BY f.id DESC"
        ),
    @NamedQuery(
            name = "getMyFollowersCount",
            query = "SELECT COUNT(f) FROM Follow AS f WHERE f.follower_user = :user ORDER BY f.id DESC"
        ),
})
@Entity
public class Follow{
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne // 関係性を保存する フォローする人の情報
    @JoinColumn(name = "follow_user", nullable = false)
    private User follow_user;

    @ManyToOne // ログインユーザー
    @JoinColumn(name = "follower_user", nullable = false)
    private User follower_user;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getFollow_user() {
        return follow_user;
    }

    public void setFollow_user(User follow_user) {
        this.follow_user = follow_user;
    }

    public User getFollower_user() {
        return follower_user;
    }

    public void setFollower_user(User follower_user) {
        this.follower_user = follower_user;
    }

}