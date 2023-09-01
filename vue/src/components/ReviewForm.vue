<template>
  <div>
      <form action="#" class="reviewform" @submit.prevent="review || rating ? updateReview() : addRating()">
          <div class="rating-and-review">
              <div>
              <h4>Rating</h4>
            <table>
                <tr>
                    <td>Story:</td>
                    <td><input type="range" min="0" max="10" v-model="newRating.storyRating" /></td>
                    <td>{{newRating.storyRating}}</td>
                </tr>
                <tr>
                    <td>Visual:</td>
                    <td><input type="range" min="0" max="10" v-model="newRating.visualRating" /></td>
                    <td>{{newRating.visualRating}}</td>
                </tr>
                <tr>
                    <td>Audio:</td>
                    <td><input type="range" min="0" max="10" v-model="newRating.audioRating" /></td>
                    <td>{{newRating.audioRating}}</td>
                </tr>
                <tr>
                    <td>Gameplay:</td>
                    <td><input type="range" min="0" max="10" v-model="newRating.gameplayRating" /></td>
                    <td>{{newRating.gameplayRating}}</td>
                </tr>
                <tr>
                    <td>Difficulty:</td>
                    <td><input type="range" min="0" max="10" v-model="newRating.difficultyRating" /></td>
                    <td>{{newRating.difficultyRating}}</td>
                </tr>
                <tr>
                    <td>Overall:</td>
                    <td><input type="range" min="0" max="10" v-model="newRating.overallRating" /></td>
                    <td>{{newRating.overallRating}}</td>
                </tr>
            </table>
            <button @click.prevent="plusReview = !plusReview" v-if="!review">{{plusReview ? 'Remove Review' : 'Write a Review'}}</button>
            </div>
            
            <div v-if="plusReview || review" class="plusreview">
                <h4>Review</h4>
                <label for="reviewtitle">Review Title: </label>
                <input type="text" name="reviewtitle" id="reviewtitle"  v-model="newReview.reviewTitle" required />
                <label for="reviewtext">Review Text: </label>
                <textarea name="reviewtext" id="reviewtext" cols="30" rows="6" v-model="newReview.reviewText"></textarea>
            </div>    
        </div>
        
            <div id="submit-div"><input type="submit" :value="submitButtonText"></div>
          
      </form>
  </div>
</template>

<script>
import VideoGameService from '@/services/videogameService.js'

export default {
    data() {
        return {
            newRating: {},
            newReview: {},
            showSelf: true,
            plusReview: false
        }
    },
    computed: {
        submitButtonText() {
            if (this.review || this.rating) {
                return 'Update';
            } else if (this.plusReview) {
                return 'Submit Rating & Review';
            }
            return 'Submit Rating';
        }
    },
    props: ['review', 'rating'],
    created() {
        this.showSelf = this.show;
        if (this.review) {
            this.newReview = this.review;
        }
        if (this.rating) {
            this.newRating = this.rating;
        } else {
            this.resetRating();
        }
    },
    methods: {
        addRating() {
            this.newRating.gameId = this.$route.params.id;
            this.newRating.userId = this.$store.state.user.id;
            if (this.plusReview) {
                this.newReview.gameId = this.$route.params.id;
                this.newReview.userId = this.$store.state.user.id;
                VideoGameService.addGameReview(this.newReview).then((response) => {
                    this.newRating.reviewId = response.data.reviewId;
                    VideoGameService.addRating(this.newRating).then(() => {
                        this.$store.dispatch('loadReviews', this.$route.params.id);
                        this.newReview = {};
                        this.resetRating();
                    });
                    
                }).catch(error => {
                    console.error(error);
                });
            } else {
                VideoGameService.addRating(this.newRating).then(() => {
                    this.$store.dispatch('loadReviews', this.$route.params.id);
                this.resetRating();
                });                
            }
            
        },
        updateReview() {
            if (this.review) {
                VideoGameService.updateRating(this.newRating).then(() => {
                    this.$store.commit('TOGGLE_EDIT_RATING');
                    this.$store.dispatch('loadReviews', this.$route.params.id);
                });
                VideoGameService.editGameReview(this.newReview).then(() => {
                    this.$store.dispatch('loadReviews', this.$route.params.id);
                    this.$store.commit('TOGGLE_EDIT_REVIEW', this.review.reviewId);
                });
            } else if (this.newReview.reviewTitle) {
                this.newReview.gameId = this.$route.params.id;
                this.newReview.userId = this.$store.state.user.id;
                VideoGameService.addGameReview(this.newReview).then(response => {
                    this.newRating.reviewId = response.data.reviewId;
                    VideoGameService.updateRating(this.newRating).then(() => {
                        this.$store.dispatch('loadReviews', this.$route.params.id);
                    });
                });
            } else {
                VideoGameService.updateRating(this.newRating).then(() => {
                    this.$store.commit('TOGGLE_EDIT_RATING');
                    this.$store.dispatch('loadReviews', this.$route.params.id);
                });
            }            
        },
        resetRating() {
            this.newRating = {
                storyRating: 0,
                visualRating: 0,
                audioRating: 0,
                gameplayRating: 0,
                difficultyRating: 0,
                overallRating: 0
            };
        }
    }
}
</script>

<style>
.reviewform {
    display: flex;
    flex-direction: column;
}
.reviewform label {
    margin-top: 10px;
}
.rating-and-review {
    display: flex;
    justify-content: center;
}

.plusreview {
    display: flex;
    flex-direction: column;
    flex-grow: 1;
}
</style>