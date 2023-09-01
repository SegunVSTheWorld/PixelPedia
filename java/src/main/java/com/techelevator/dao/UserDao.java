package com.techelevator.dao;

import com.techelevator.model.User;
import com.techelevator.model.VideoGameInListDTO;
import com.techelevator.model.VideoGameList;

import java.util.List;

public interface UserDao {

    List<User> findAll();

    User getUserById(int userId);

    User findByUsername(String username);

    int findIdByUsername(String username);

    boolean create(String username, String password, String role);

    VideoGameList[] getVideoGameListByUserId (int userid);

    void updateVideoGameList (VideoGameInListDTO videoGameList);


    void deleteVideoGameList (VideoGameInListDTO videoGameList);

    User editUserProfile (User user, int id);

}
