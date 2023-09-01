package com.techelevator.dao;

import com.techelevator.model.VideoGame;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class JDBCVideoGameDAOTests extends BaseDaoTests {

    private JDBCVideoGameDAO jdbcVideoGameDAO;

    private static final BigDecimal BIG_DECIMAL = new BigDecimal(70.00);
    private static final VideoGame VIDEO_GAME_1 = new VideoGame(1, "Test Game", LocalDate.now(), BIG_DECIMAL,"This is a description", "Microsoft", "M", "url", 1 );

    @Before
    public void setup(){
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcVideoGameDAO = new JDBCVideoGameDAO(jdbcTemplate);
    }

    @Test
    public void returns_list_of_video_games(){
        List<VideoGame> videoGames = jdbcVideoGameDAO.getVideoGameList();

        Assert.assertEquals(26, videoGames.size());

    }

    @Test
    public void get_game_returns_correct_video_game(){
        VideoGame videoGame = jdbcVideoGameDAO.getVideoGameById(1);

        BigDecimal releasePrice = new BigDecimal(60.00);
        LocalDate releaseDate = LocalDate.of(2011, 11, 15);


        VideoGame testGame = new VideoGame(1, "Halo: Combat Evolved", releaseDate, releasePrice, "This is Halo. It is a game.", "Bungie", "", "", 1);
        Assert.assertEquals(testGame.getId(), videoGame.getId());
        Assert.assertEquals(testGame.getTitle(), videoGame.getTitle());
        Assert.assertEquals(testGame.getReleaseDate(), videoGame.getReleaseDate());
        Assert.assertTrue(testGame.getReleasePrice().compareTo(videoGame.getReleasePrice()) == 0);
        Assert.assertEquals(testGame.getDescription(), videoGame.getDescription());
        Assert.assertEquals(testGame.getPublisherName(), videoGame.getPublisherName());
    }

    @Test
    public void add_video_game_test(){
        VideoGame videoGame = jdbcVideoGameDAO.addVideoGame(VIDEO_GAME_1);

        int newId = videoGame.getId();
        Assert.assertTrue( newId > 0);


        VideoGame actual = jdbcVideoGameDAO.getVideoGameById(newId);
        assertVideoGamesMatch(videoGame, actual);
    }

    @Test
    public void update_video_game_test(){
        VideoGame videoGame = jdbcVideoGameDAO.getVideoGameById(1);
        videoGame.setSteamId(123);
        videoGame.setReleaseDate(LocalDate.now());
        BigDecimal price = new BigDecimal(60.00);
        videoGame.setReleasePrice(price);
        videoGame.setPublisherName("Microsoft");
        videoGame.setTitle("Maurice's game");
        videoGame.setRating("M");
        videoGame.setBoxArt("Maurice.com");
        videoGame.setDescription("Maurice's game is the best game ever. Made by the best person ever. 10/10 would recommend.");
        jdbcVideoGameDAO.updateVideoGame(videoGame);

        VideoGame actual = jdbcVideoGameDAO.getVideoGameById(1);
        assertVideoGamesMatch(videoGame, actual);
    }

    @Test
    public void delete_video_game_test(){
        jdbcVideoGameDAO.deleteVideoGame(1);
        VideoGame videoGame = jdbcVideoGameDAO.getVideoGameById(1);

        Assert.assertNull(videoGame.getTitle());
        Assert.assertNull(videoGame.getBoxArt());
        Assert.assertNull(videoGame.getDescription());
        Assert.assertEquals(0, videoGame.getId());
        Assert.assertNull(videoGame.getReleasePrice());
        Assert.assertEquals(0,videoGame.getId());
        Assert.assertEquals(0,videoGame.getSteamId());
        Assert.assertEquals(0, videoGame.getGenres().length);
        Assert.assertEquals(0, videoGame.getSystems().length);
        Assert.assertEquals(0, videoGame.getStudios().length);
        Assert.assertNull(videoGame.getPublisherName());
        Assert.assertNull(videoGame.getRating());
        Assert.assertNull(videoGame.getReleaseDate());

    }



    private void assertVideoGamesMatch(VideoGame expected, VideoGame actual){
        Assert.assertEquals(expected.getId(), actual.getId());
        Assert.assertEquals(expected.getTitle(), actual.getTitle());
        Assert.assertEquals(expected.getReleaseDate(), actual.getReleaseDate());
        Assert.assertEquals(expected.getDescription(), actual.getDescription());
        Assert.assertEquals(expected.getBoxArt(), actual.getBoxArt());
        Assert.assertEquals(expected.getRating(), actual.getRating());
        Assert.assertEquals(expected.getPublisherName(), actual.getPublisherName());
        Assert.assertEquals(expected.getSteamId(), actual.getSteamId());
        if(expected.getGenres() != null && actual.getGenres() != null){
            Assert.assertEquals(expected.getGenres().length, actual.getGenres().length);
        }
        if(expected.getSystems() != null && actual.getSystems() != null){
            Assert.assertEquals(expected.getSystems().length, actual.getSystems().length);
        }
        if (expected.getStudios() != null && actual.getStudios() != null) {
            Assert.assertEquals(expected.getStudios().length, actual.getStudios().length);
        }
    }
}
