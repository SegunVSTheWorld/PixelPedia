package com.techelevator.dao;

import com.techelevator.model.VideoGame;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JDBCVideoGameDAO implements VideoGameDAO {

    private JdbcTemplate jdbcTemplate;


    public JDBCVideoGameDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<VideoGame> getVideoGameList() {
        List<VideoGame> videoGames = new ArrayList<>();

        String sql = "SELECT id, title, release_date, release_price, description, company_name, box_art, rating, steam_id FROM video_game " +
                "JOIN company ON publisher_id = company_id;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while (results.next()) {
            VideoGame videoGame = mapRowToVideoGame(results);
            videoGame.setStudios(getStudiosByVideoGameId(videoGame.getId()));
            videoGame.setGenres(getGenresByVideoGameId(videoGame.getId()));
            videoGame.setPublisherName(getPublisherNameByVideoGameId(videoGame.getId()));
            videoGame.setSystems(getSystemByVideoGameId(videoGame.getId()));
            videoGames.add(videoGame);

        }
        return videoGames;
    }

    @Override
    public VideoGame getVideoGameById(int id) {
        String sql = "SELECT id, title, release_date, release_price, description, company_name, box_art, rating, steam_id FROM video_game " +
                "JOIN company ON publisher_id = company_id WHERE id=? ";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);

        VideoGame videoGame = new VideoGame();

       if (results.next()) {
           videoGame = mapRowToVideoGame(results);
       }
       videoGame.setGenres(getGenresForVideoGames(id));
       videoGame.setStudios(getStudiosForVideoGames(id));
       videoGame.setSystems(getSystemForVideoGames(id));



        return videoGame;
    }

    @Override
    public VideoGame addVideoGame(VideoGame videoGame) {
        String sql = "INSERT INTO video_game (title, release_date, release_price, description, publisher_id, rating, box_art, steam_id) " +
                "VALUES (?,?, ?, ?, (SELECT company_id FROM company WHERE company_name = ?), ?, ?, ?) " +
                "RETURNING id;";

        int newVideoGameId = jdbcTemplate.queryForObject(sql, int.class, videoGame.getTitle(), videoGame.getReleaseDate(),
                videoGame.getReleasePrice(), videoGame.getDescription(), videoGame.getPublisherName(), videoGame.getRating(), videoGame.getBoxArt(), videoGame.getSteamId());

        videoGame.setId(newVideoGameId);

        String[] genres = videoGame.getGenres();
        String[] studios = videoGame.getStudios();
        String[] systems = videoGame.getSystems();
        if(genres != null) {
            //Loop through array add each item into DB
            for (int i = 0; i < genres.length; i++) {
                String genre = genres[i];
                int genreID = convertGenreNameToID(genre);
                //call a method that inserts into DB
                addGenreToVideoGame(newVideoGameId, genreID);
            }
        }
        if(studios != null) {
            //Same for studios
            for (int i = 0; i < studios.length; i++) {
                String studio = studios[i];
                int studioID = convertStudioNameToID(studio);
                addStudioToVideoGame(newVideoGameId, studioID);
            }
        }
        if(systems != null) {
            //Same for systems
            for (int i = 0; i < systems.length; i++) {
                String system = systems[i];
                int systemID = convertSystemNameToID(system);
                addSystemToVideoGame(newVideoGameId, systemID);
            }
        }

        return videoGame;
    }

    @Override
    public void deleteVideoGame(int videoGameId) {
        //Deletes Video Games
        String sql = "DELETE FROM vg_studio WHERE vg_id = ?;";
        String sql1 = "DELETE FROM vg_genre WHERE vg_id = ?;";
        String sql2 = "DELETE FROM vg_system WHERE vg_id = ?;";
        String sql3 = "DELETE FROM review_likes WHERE review_id IN (SELECT review_id FROM review_rating WHERE game_id = ?);";
        String sql4 = "DELETE FROM review_rating WHERE game_id = ?;";
        String sql5 = "DELETE FROM comment_likes WHERE comment_id IN (SELECT comment_id FROM comment JOIN review ON comment.review_id = review.review_id WHERE game_id = ?);";
        String sql6 = "DELETE FROM comment WHERE review_id = (SELECT review_id FROM review WHERE game_id = ?);";
        String sql7 = "DELETE FROM review WHERE game_id = ?;";
        String sql8 = "DELETE FROM video_game WHERE id = ?;";


        //deleteVideoGameCommentsByGameId(videoGameId);
        //deleteVideoGameReviewsByGameId(videoGameId);



        try {
            jdbcTemplate.update(sql,videoGameId);
            jdbcTemplate.update(sql1,videoGameId);
            jdbcTemplate.update(sql2,videoGameId);
            jdbcTemplate.update(sql3,videoGameId);
            jdbcTemplate.update(sql4,videoGameId);
            jdbcTemplate.update(sql5,videoGameId);
            jdbcTemplate.update(sql6,videoGameId);
            jdbcTemplate.update(sql7,videoGameId);
            jdbcTemplate.update(sql8,videoGameId);

        } catch (DataIntegrityViolationException e) {

            throw new DataIntegrityViolationException("Invalid Video Game ID", e);

        }

    }

    @Override
    public String[] genreArray() {
        List<String> genres = new ArrayList<>();

        String sql = "SELECT genre_name FROM genre;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while (results.next()) {
            genres.add(results.getString("genre_name"));
        }
        return genres.toArray(new String[genres.size()]);
    }

    @Override
    public String[] systemArray() {
        List<String> systems = new ArrayList<>();
        String sql = "SELECT system_name FROM system;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while (results.next()) {
            systems.add(results.getString("system_name"));
        }
        return systems.toArray(new String[systems.size()]);
    }

    @Override
    public String[] companyArray() {
        List<String> companies = new ArrayList<>();
        String sql = "SELECT company_name FROM company;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while (results.next()) {
            companies.add(results.getString("company_name"));
        }
        return companies.toArray(new String[companies.size()]);
    }

    @Override
    public VideoGame updateVideoGame(VideoGame videoGame) {
        VideoGame newvideogame = new VideoGame();
        String sql = "UPDATE video_game " +
                    "SET title = ?, release_date = ?, release_price = ?, description = ?, publisher_id = (SELECT company_id FROM company WHERE company_name = ?), rating = ?, box_art = ?, steam_id = ? " +
                    "WHERE id = ?;";

       jdbcTemplate.update(sql, videoGame.getTitle(), videoGame.getReleaseDate(),
                videoGame.getReleasePrice(), videoGame.getDescription(), videoGame.getPublisherName(), videoGame.getRating(), videoGame.getBoxArt(), videoGame.getSteamId(), videoGame.getId());



       String sqlDeleteGenres = "DELETE FROM vg_genre WHERE vg_id = ?;";
       jdbcTemplate.update(sqlDeleteGenres, videoGame.getId());

       String sqlDeleteStudios = "DELETE FROM vg_studio WHERE vg_id = ?;";
       jdbcTemplate.update(sqlDeleteStudios, videoGame.getId());

       String sqlDeleteSystems = "DELETE FROM vg_system WHERE vg_id = ?;";
       jdbcTemplate.update(sqlDeleteSystems, videoGame.getId());




       String[] genres = videoGame.getGenres();
       String[] studios = videoGame.getStudios();
       String[] systems = videoGame.getSystems();


       for(int i = 0; i < genres.length; i++){
           String genre = genres[i];
           String sqlGenre = "INSERT INTO vg_genre VALUES (?, (SELECT genre_id FROM genre WHERE genre_name = ?));";
           jdbcTemplate.update(sqlGenre, videoGame.getId(), genre);
       }

       for(int i = 0; i < studios.length; i++){
           String studio = studios[i];
           String sqlStudio = "INSERT INTO vg_studio VALUES (?, (SELECT company_id FROM company WHERE company_name = ?));";
           jdbcTemplate.update(sqlStudio, videoGame.getId(), studio);
       }

       for(int i = 0; i < systems.length; i++){
           String system = systems[i];
           String sqlSystem = "INSERT INTO vg_system VALUES (?, (SELECT system_id FROM system WHERE system_name = ?));";
           jdbcTemplate.update(sqlSystem, videoGame.getId(), system);
       }


       newvideogame = getVideoGameById(videoGame.getId());

       return newvideogame;
    }

    private String[] getGenresForVideoGames(int id) {
        List<String> genres = new ArrayList<>();

        String sql = "SELECT genre_name from genre " +
                "JOIN vg_genre ON genre.genre_id = vg_genre.genre_id " +
                "WHERE vg_genre.vg_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);

        while (results.next()) {
            genres.add(results.getString("genre_name"));
        }

        return genres.toArray(new String[genres.size()]);
    }

    private String[] getStudiosForVideoGames(int id) {
        List<String> studios = new ArrayList<>();

        String sql = "SELECT company_name FROM company " +
                "JOIN vg_studio ON company.company_id = vg_studio.studio_id WHERE vg_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
        while (results.next()) {
            studios.add(results.getString("company_name"));
        }

        return studios.toArray(new String[studios.size()]);
    }

    private String[] getSystemForVideoGames(int id) {
        List<String> systems = new ArrayList<>();

        String sql = "SELECT system_name FROM system " +
                "JOIN vg_system ON vg_system.system_id = system.system_id WHERE vg_system.vg_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);

        while (results.next()) {
            systems.add(results.getString("system_name"));
        }

        return systems.toArray(new String[systems.size()]);
    }


    private int convertGenreNameToID(String genre) {
        int id = 0;
        String sql = "SELECT genre_id FROM genre WHERE genre_name = ?;";


        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, genre);

        if (results.next()) {
            id = results.getInt("genre_id");
        }
        return id;
    }

    private void addGenreToVideoGame(int vgID, int genreID) {
        String sql = "INSERT INTO vg_genre VALUES (?, ?);";
        jdbcTemplate.update(sql, vgID, genreID);

    }

    private int convertStudioNameToID(String studio) {
        int id = 0;
        String sql = "SELECT company_id FROM company WHERE company_name = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, studio);

        if (results.next()) {
            id = results.getInt("studio_id");
        }


        return id;
    }

    private void addStudioToVideoGame(int vgID, int studioID) {
        String sql = "INSERT INTO vg_studio VALUES (?, ?);";

        jdbcTemplate.update(sql, vgID, studioID);

    }

    private int convertSystemNameToID(String system) {
        int id = 0;
        String sql = "SELECT system_id FROM system " +
                "JOIN company ON system.manufacturer_id = company.company_id WHERE system_name = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, system);

        if (results.next()) {
            id = results.getInt("system_id");
        }

        return id;
    }

    private void addSystemToVideoGame(int vgID, int systemID) {
        String sql = "INSERT INTO vg_system VALUES (?, ?);";

        jdbcTemplate.update(sql, vgID, systemID);
    }

    private String getPublisherNameByVideoGameId(int videoGameId) {
        String publisher = "";
        String sql = "SELECT company_name FROM company JOIN video_game " +
                "ON company.company_id = video_game.publisher_id WHERE video_game.id = ? GROUP BY company_name;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, videoGameId);

        if (results.next()) {
            publisher = results.getString("company_name");
        }

        return publisher;
    }

    private String[] getGenresByVideoGameId(int videoGameId) {
        List<String> genreList = new ArrayList<>();
        String sql = "SELECT genre_name FROM genre " +
                "JOIN vg_genre ON genre.genre_id = vg_genre.genre_id  " +
                "WHERE vg_id = ? GROUP BY genre_name;";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, videoGameId);
        while (result.next()) {
            genreList.add(result.getString("genre_name"));
        }

        return genreList.toArray(new String[genreList.size()]);

    }

    private String[] getStudiosByVideoGameId(int videoGameId) {
        List<String> studiosList = new ArrayList<>();
        String sql = "SELECT company_name FROM company " +
                "JOIN vg_studio ON company.company_id = vg_studio.studio_id WHERE vg_studio.vg_id = ? " +
                "GROUP BY company_name;";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, videoGameId);
        while (result.next()) {
            studiosList.add(result.getString("company_name"));
        }

        return studiosList.toArray(new String[studiosList.size()]);

    }

    private String[] getSystemByVideoGameId(int videoGameId) {
        List<String> systemList = new ArrayList<>();
        String sql = "SELECT system_name FROM system JOIN vg_system ON system.system_id = vg_system.system_id " +
                "WHERE vg_system.vg_id = ? GROUP BY system_name;";
        SqlRowSet result = jdbcTemplate.queryForRowSet(sql, videoGameId);
        while (result.next()) {
            systemList.add(result.getString("system_name"));
        }

        return systemList.toArray(new String[systemList.size()]);

    }

    private int getPublisherIdByVideoGameId(int videoGameId){
        int id = 0;
        String sql = "SELECT publisher_id FROM video_game WHERE id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, videoGameId);

        if(results.next()){
            id = results.getInt("publisher_id");
        }

        return id;
    }

    private void deleteVideoGameReviewsByGameId(int videoGameId){
        List<Integer> reviewsIds = new ArrayList<>();
        String reviewId = "SELECT review_id FROM review WHERE game_id = ?;";

        SqlRowSet results = jdbcTemplate.queryForRowSet(reviewId, videoGameId);

        while(results.next()){
            reviewsIds.add(results.getInt("review_id"));
        }


        for(Integer id : reviewsIds){
            String sql = "DELETE FROM comment WHERE review_id = ?;";
            String sql1 = "DELETE FROM review_likes WHERE review_id = ?;";
            String sql2 = "DELETE FROM review WHERE review_id = ?;";

            try{
                jdbcTemplate.update(sql, id);
                jdbcTemplate.update(sql1,id);
                jdbcTemplate.update(sql2, id);
            } catch (DataIntegrityViolationException e){
                throw new DataIntegrityViolationException("Invalid Id", e);
            }

        }


    }

    private void deleteVideoGameCommentsByGameId(int videoGameId){
        String sql = "DELETE FROM comment_likes WHERE comment_id = (SELECT comment_id FROM comment JOIN review ON comment.review_id = review.review_id WHERE game_id = ?);";
        String sql1 = "DELETE FROM comment WHERE comment_id = (SELECT comment_id FROM comment JOIN review ON comment.review_id = review.review_id WHERE game_id = ?);";

        try {
            jdbcTemplate.update(sql, videoGameId);
            jdbcTemplate.update(sql1, videoGameId);
        } catch (DataIntegrityViolationException e){
            throw new DataIntegrityViolationException("Invalid game Id", e);
        }
    }

    private VideoGame mapRowToVideoGame(SqlRowSet sqlRowSet) {
        VideoGame videoGame = new VideoGame();

        videoGame.setId(sqlRowSet.getInt("id"));
        videoGame.setTitle(sqlRowSet.getString("title"));
        videoGame.setReleaseDate(sqlRowSet.getDate("release_date").toLocalDate());
        videoGame.setReleasePrice(sqlRowSet.getBigDecimal("release_price"));
        videoGame.setDescription(sqlRowSet.getString("description"));
        videoGame.setPublisherName(sqlRowSet.getString("company_name"));
        videoGame.setRating(sqlRowSet.getString("rating"));
        videoGame.setBoxArt(sqlRowSet.getString("box_art"));
        videoGame.setSteamId(sqlRowSet.getInt("steam_id"));
        return videoGame;
    }

}
