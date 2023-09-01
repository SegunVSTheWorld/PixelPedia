<template>
  <div id="videogamereviews">
      <h3>Reviews for {{videogame.title}}</h3>
      <ReviewCard v-for="(review, index) in reviews" :review="review" :key="index" />
      <div v-if="reviews.length < 1">Not Yet Reviewed</div>
      <h3 id="addvideogamereview">Rate & Review</h3>
      <ReviewCard v-if="userRating && !userReview" :review="userReview" /><div v-if="userReview">You've already reviewed this game.</div>
      <ReviewForm v-if="!userRating" :show="true" :review="userReview" />
  </div>
</template>

<script>
import VideoGameService from '../services/videogameService.js'
import ReviewCard from '../components/ReviewCard.vue'
import ReviewForm from '../components/ReviewForm.vue'

export default {
    components: {
        ReviewCard,
        ReviewForm
    },
    data() {
        return {
            videogame: {}
        }
    },
    computed: {
        reviews() {
            return this.$store.state.gameReviews;
        },
        ratings() {
            return this.$store.getters.getGameRatings;
        },
        userRating() {
            return this.$store.getters.getGameRatings.find(rating => {
                return rating.userId === this.$store.state.user.id;
            });
        },
        userReview() {
            return this.$store.state.gameReviews.find(review => {
                return review.userId === this.$store.state.user.id;
            });
        }
    },
    methods: {
        
    },
    created() {
        VideoGameService.getVideoGameById(this.$route.params.id).then(response => {
            this.videogame = response.data;
        });
        this.$store.dispatch('loadReviews', this.$route.params.id);
    }
}
</script>

<style>

</style>