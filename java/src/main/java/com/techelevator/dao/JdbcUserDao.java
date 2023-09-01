package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import com.techelevator.model.VideoGame;
import com.techelevator.model.VideoGameInListDTO;
import com.techelevator.model.VideoGameList;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.parameters.P;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.techelevator.model.User;

@Component
public class JdbcUserDao implements UserDao {

    private final JdbcTemplate jdbcTemplate;
    private final VideoGameDAO videoGameDAO;

    public JdbcUserDao(JdbcTemplate jdbcTemplate, VideoGameDAO videoGameDAO) {
        this.jdbcTemplate = jdbcTemplate;
        this.videoGameDAO = videoGameDAO;
    }

    @Override
    public int findIdByUsername(String username) {
        if (username == null) throw new IllegalArgumentException("Username cannot be null");

        int userId;
        try {
            userId = jdbcTemplate.queryForObject("select user_id from users where username = ?", int.class, username);
        } catch (EmptyResultDataAccessException e) {
            throw new UsernameNotFoundException("User " + username + " was not found.");
        }

        return userId;
    }

	@Override
	public User getUserById(int userId) {
		String sql = "SELECT * FROM users WHERE user_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
		if (results.next()) {
			return mapRowToUser(results);
		} else {
			return null;
		}
	}

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        String sql = "select * from users";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            User user = mapRowToUser(results);
            users.add(user);
        }

        return users;
    }

    @Override
    public User findByUsername(String username) {
        if (username == null) throw new IllegalArgumentException("Username cannot be null");

        for (User user : this.findAll()) {
            if (user.getUsername().equalsIgnoreCase(username)) {
                return user;
            }
        }
        throw new UsernameNotFoundException("User " + username + " was not found.");
    }

    @Override
    public boolean create(String username, String password, String role) {
        String insertUserSql = "insert into users (username,password_hash,role) values (?,?,?)";
        String password_hash = new BCryptPasswordEncoder().encode(password);
        String ssRole = role.toUpperCase().startsWith("ROLE_") ? role.toUpperCase() : "ROLE_" + role.toUpperCase();

        return jdbcTemplate.update(insertUserSql, username, password_hash, ssRole) == 1;
    }

    @Override
    public VideoGameList[] getVideoGameListByUserId(int userid) {
        List<VideoGame> videoGameLists = new ArrayList<>();

        VideoGameList[] gameLists = new VideoGameList[4];
        gameLists[0] = new VideoGameList();
        gameLists[0].setListName("Played");
        gameLists[0].setUserId(userid);
        gameLists[0].setVideoGameArray(getVideoGamesByListNameAndId("Played", userid).toArray(new VideoGame[0]));
        gameLists[1] = new VideoGameList();
        gameLists[1].setListName("Currently");
        gameLists[1].setUserId(userid);
        gameLists[1].setVideoGameArray(getVideoGamesByListNameAndId("Currently", userid).toArray(new VideoGame[0]));
        gameLists[2] = new VideoGameList();
        gameLists[2].setListName("Wishlist");
        gameLists[2].setUserId(userid);
        gameLists[2].setVideoGameArray(getVideoGamesByListNameAndId("Wishlist", userid).toArray(new VideoGame[0]));
        gameLists[3] = new VideoGameList();
        gameLists[3].setListName("Custom");
        gameLists[3].setUserId(userid);
        gameLists[3].setVideoGameArray(getVideoGamesByListNameAndId("Custom", userid).toArray(new VideoGame[0]));


       return gameLists;
    }

    @Override
    public void updateVideoGameList(VideoGameInListDTO videoGameList) {
        String sql = "INSERT INTO vg_list(user_id, list_name, vg_id) VALUES (?, ?, ?);";

        jdbcTemplate.update(sql, videoGameList.getUserId(), videoGameList.getListName(), videoGameList.getGameId());

    }

    @Override
    public void deleteVideoGameList(VideoGameInListDTO videoGameList) {
        String sql = "DELETE FROM vg_list WHERE user_id = ? AND list_name = ? AND  vg_id = ?;";

        jdbcTemplate.update(sql, videoGameList.getUserId(), videoGameList.getListName(), videoGameList.getGameId());

    }

    @Override
    public User editUserProfile(User user, int id) {
        String sql = "UPDATE users SET avatar_pic = ?, bio = ?, steam_user_id = ?, email = ?, tagline = ? WHERE user_id = ?;";

        jdbcTemplate.update(sql, user.getAvatarURL(), user.getBio(), user.getSteamId(), user.getEmail(), user.getTagline(), id);
        return getUserById(id);
    }


    private List<VideoGame> getVideoGamesByListNameAndId(String listName, int id){
        List<Integer> idList = new ArrayList<>();
        List<VideoGame> videoGames = new ArrayList<>();
        String sql = "SELECT vg_id FROM vg_list WHERE list_name = ? AND user_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, listName, id);

        while(results.next()){
            idList.add(results.getInt("vg_id"));
        }
        for(Integer vgid : idList ){
            videoGames.add(videoGameDAO.getVideoGameById(vgid));
        }

        return videoGames;
    }

    private User mapRowToUser(SqlRowSet rs) {
        User user = new User();
        user.setId(rs.getInt("user_id"));
        user.setUsername(rs.getString("username"));
        user.setPassword(rs.getString("password_hash"));
        user.setAuthorities(Objects.requireNonNull(rs.getString("role")));
        user.setSteamId(rs.getInt("steam_user_id"));
        user.setBio(rs.getString("bio"));
        user.setEmail(rs.getString("email"));
        user.setTagline(rs.getString("tagline"));
        user.setAvatarURL(rs.getString("avatar_pic"));
        user.setActivated(true);
        return user;
    }
}



