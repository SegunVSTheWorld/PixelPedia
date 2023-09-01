import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import VideoGameService from '../services/videogameService.js'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    gameReviews: [],
    editingReview: [],
    viewingComments: [],
    editingComments: [],
    gameRatings: [],
    editingRating: false
  },
  getters: {
    getGameRatings(state) {
      return state.gameRatings;
    },
    getRatingForReview: (state) => (reviewId) => {
      return state.gameRatings.find(rating => 
        rating.reviewId === reviewId
      );
    },
    userIsAdmin(state) {
      if (state.user.authorities) {
        const userAuth = state.user.authorities.find(auth => auth.name === 'ROLE_ADMIN');
        return userAuth != null;
      }
      return false;
    }
  },
  mutations: {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    LOAD_REVIEWS(state, reviews) {
      state.gameReviews = reviews;
    },
    LOAD_RATINGS(state, ratings) {
      state.gameRatings = ratings;
    },
    TOGGLE_EDIT_REVIEW(state, reviewId) {
      if (state.editingReview.includes(reviewId)) {
        state.editingReview.splice(state.editingReview.indexOf(reviewId), 1);
      } else {
        state.editingReview.push(reviewId);
      }
    },
    TOGGLE_VIEW_COMMENTS(state, reviewId) {
      if (state.viewingComments.includes(reviewId)) {
        state.viewingComments.splice(state.viewingComments.indexOf(reviewId), 1);
      } else {
        state.viewingComments.push(reviewId);
      }
    },
    TOGGLE_EDIT_COMMENTS(state, commentId) {
      if (state.editingComments.includes(commentId)) {
        state.editingComments.splice(state.editingComments.indexOf(commentId), 1);
      } else {
        state.editingComments.push(commentId);
      }
    },
    TOGGLE_EDIT_RATING(state) {
      state.editingRating = !state.editingRating;
    },
    RESET_REVIEWS_AND_COMMENTS(state) {
      state.editingReview = [];
      state.viewingComments = [];
      state.editingComments = [];
    }
  },
  actions: {
    loadReviews(context, gameId) {
      VideoGameService.getReviewsByGameId(gameId).then(response => {
        context.commit('LOAD_REVIEWS', response.data);        
      });
      VideoGameService.getRatingsForGame(gameId).then(response => {
        context.commit('LOAD_RATINGS', response.data);
      });
    }
  }
})
