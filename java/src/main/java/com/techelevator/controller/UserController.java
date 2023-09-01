package com.techelevator.controller;

import com.techelevator.dao.UserDao;
import com.techelevator.model.User;
import com.techelevator.model.VideoGame;
import com.techelevator.model.VideoGameInListDTO;
import com.techelevator.model.VideoGameList;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequestMapping (path = "/users")
public class UserController {

    private UserDao userDao;

    UserController(UserDao userDao){
        this.userDao = userDao;
    }

    @RequestMapping (path = "/{id}", method =  RequestMethod.GET)
    public User getUsernameById(@PathVariable int id){
        return userDao.getUserById(id);
    }

    @RequestMapping (path = "/{userid}/lists", method = RequestMethod.GET)
    public VideoGameList[] getUserVideoGameList(@PathVariable int userid){
        return userDao.getVideoGameListByUserId(userid);
    }

    @RequestMapping (path = "/lists/addgame" , method = RequestMethod.POST)
    public void updateVideoGameList(@RequestBody VideoGameInListDTO videoGameList){
        userDao.updateVideoGameList(videoGameList);
    }

    @RequestMapping (path = "/lists/deletegame" , method = RequestMethod.PUT)
    public void deleteVideoGameList(@RequestBody VideoGameInListDTO videoGameList){
        userDao.deleteVideoGameList(videoGameList);
    }

    @RequestMapping (path = "/{id}" , method = RequestMethod.PUT)
    public User editUser (@RequestBody User user, @PathVariable int id){
        return userDao.editUserProfile(user, id);
    }

}
