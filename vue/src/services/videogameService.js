import axios from "axios";

export default{

    getVideoGames(){
        return axios.get('/videogames');
    },
    
    getVideoGameById(id){
        return axios.get('/videogames/' + id);
    },

    addVideoGame(videogame) {
        return axios.post('/videogames', videogame);
    },

    getGenres() {
        return axios.get('/videogames/genres');
    },

    getCompanies() {
        return axios.get('/videogames/companies');
    },

    getSystems() {
        return axios.get('./videogames/systems');
    },

    deleteGame(gameId) {
        return axios.delete(`/videogames/${gameId}`)
    },

    updateGame(videogame) {
        return axios.put('/videogames', videogame)
    },

    addGameReview(review) {
        return axios.post('/videogames/reviews', review)
    },

    editGameReview(review) {
        return axios.put(`/videogames/reviews/${review.reviewId}`, review)
    },

    getReviewsByGameId(gameId) {
        return axios.get(`/videogames/${gameId}/reviews`)
    },

    deleteReview(id) {
        return axios.delete(`/videogames/reviews/${id}`)
    },

    addComment(comment) {
        return axios.post(`/videogames/reviews/${comment.reviewId}/comments`, comment);
    },

    updateComment(comment) {
        return axios.put(`/videogames/reviews/comments/${comment.commentId}`, comment);
    },

    deleteComment(commentId) {
        return axios.delete(`/videogames/reviews/comments/${commentId}`);
    },

    addRating(rating) {
        return axios.post('/videogames/ratings', rating);
    },

    getRatingsForGame(gameId) {
        return axios.get(`/videogames/${gameId}/ratings/`);
    },

    updateRating(rating) {
        return axios.put(`/videogames/ratings/${rating.ratingId}`, rating);
    },

    deleteRating(ratingId) {
        return axios.delete(`/videogames/ratings/${ratingId}`);
    }
}