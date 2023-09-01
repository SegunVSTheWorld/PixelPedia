package com.techelevator.controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

@RequestMapping("/steam")
@CrossOrigin
@RestController
public class SteamAPIController {

    private String baseUrl = "https://api.steampowered.com";

    @GetMapping("/app/{id}/currentplayers")
    public Object getCurrentPlayersForGame(@PathVariable int id) {
        String url = baseUrl + "/ISteamUserStats/GetNumberOfCurrentPlayers/v1?appid=" + id;
        RestTemplate restTemplate = new RestTemplate();
        Object result = restTemplate.getForObject(url, Object.class);
        return result;
    }

    @GetMapping("/app/{id}/news")
    public Object getNewsForGame(@PathVariable int id) {
        String url = baseUrl +"/ISteamNews/GetNewsForApp/v2?appid=" + id + "&count=5";
        RestTemplate restTemplate = new RestTemplate();
        Object result = restTemplate.getForObject(url, Object.class);
        return result;
    }

    @GetMapping("/app/{id}/achievementpercentages")
    public Object getAchievementPercentagesForGame(@PathVariable int id) {
        String url = baseUrl + "/ISteamUserStats/GetGlobalAchievementPercentagesForApp/v0002/?gameid=" + id;
        RestTemplate restTemplate = new RestTemplate();
        Object result = restTemplate.getForObject(url, Object.class);
        return result;
    }

}
