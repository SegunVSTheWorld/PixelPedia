<template>
  <div id="detailsPage" :style="{ 
    background: gradientBackground + '0% 0% / 200% 200% repeat',
    animation: 'Animation 20s ease infinite'
    }">
    <img class= "art" ref="boxArt" id="boxArt" v-bind:src="videoGame.boxArt" alt="">
    <div class= "title"><h2>{{ videoGame.title }}</h2></div>
    <div id="details">
      <div class = "price"><h6>Release Price:</h6> <span>${{videoGame.releasePrice}}</span></div>
      <div class = "date"><h6>Release Date:</h6> <span>{{ videoGame.releaseDate }}</span></div>
      <div class = "description">
        <h6>Description:</h6>
        <span>{{ videoGame.description }}</span>
      </div>
      <div class = "publisher"><h6>Publisher:</h6> <span>{{ videoGame.publisherName }}</span></div>
      <div class = "system"><h6>Systems:</h6> 
        <span v-for="system in videoGame.systems" v-bind:key="system">{{system}}</span>
      </div>
      <div class="studio"><h6>Studios:</h6> 
        <span v-for="studio in videoGame.studios" v-bind:key="studio">{{studio}}</span>
      </div>
      <div class="genre"><h6>Genres:</h6>
        <div class="genres">
          <span v-for="genre in videoGame.genres" v-bind:key="genre">{{genre}} </span>
        </div>
      </div>
      <div class="rating" v-if="dataLoaded">
        <h6>Rating:</h6> 
        <img :src="ratingImgUrl" :alt="videoGame.rating" :title="videoGame.rating">
      </div>
      
      
    </div>
    <div id="details-ratings">
      <div class="average-ratings">
        <h6>Average Rating:</h6>
        <RatingDisplay :rating="averageRatings" v-if="this.$store.getters.getGameRatings.length > 0" />
        <div v-if="this.$store.getters.getGameRatings.length < 1">Not Yet Rated</div>
      </div>
      <div class="videogamedetails-jumpbuttons">
        <router-link :to="{hash: '#steamdetails'}" tag="button" @click.native="anchorHashCheck()" v-if="isOnSteam">Steam Details</router-link>
        <router-link :to="{hash: '#videogamereviews'}" tag="button" @click.native="anchorHashCheck()">View Reviews</router-link>
        <router-link :to="{hash: '#addvideogamereview'}" tag="button" @click.native="anchorHashCheck()">Rate & Review</router-link>
      </div>
    </div>
    <div class="edit-delete" v-if="canEdit">
      <button @click="$router.push({name: 'editvideogame', params: {id: videoGame.id}})" id="edit-game">Edit</button>
      <button @click.prevent="deleteGame" id="delete-game">Delete</button>
    </div>
    
  </div>
</template>


<script>
import videogameService from "../services/videogameService";
import ColorThief from "colorthief";
import RatingDisplay from '@/components/RatingDisplay.vue'

export default {
  components: {
    RatingDisplay
  },
  data() {
    return {
      videoGame: {},
      palette: null,
      dataLoaded: false
    };
  },
  methods: {
    anchorHashCheck() {
      if (window.location.hash === this.$route.hash) {
        const el = document.getElementById(this.$route.hash.slice(1))
        if (el) {
          const scrollOptions = {
            top: el.offsetTop,
            behavior: 'smooth'
          };
          window.scrollTo(scrollOptions);
        }
      }
    },
    deleteGame() {
      this.$router.push({ name: 'deletevideogame', params: { id: this.videoGame.id } });
    }    
  },
  computed: {
    isOnSteam() {
      return this.dataLoaded && this.videoGame.steamId;
    },
    canEdit() {
      return this.$store.getters.userIsAdmin;
    },
    ratingImgUrl() {
      return require(`../assets/${this.videoGame.rating}.png`);
    },
    gradientBackground() {
      if (this.palette) {
        const gradientColors = this.palette
          .map(color => `rgb(${color[0]}, ${color[1]}, ${color[2]})`)
          .join(', ');

        return `linear-gradient(to right, ${gradientColors})`;
      }

      return 'none';
    },
    averageRatings() {
      const ratings = this.$store.getters.getGameRatings;
      const avgRatings = {};
      avgRatings.storyRating = ratings.reduce((sum, rating) => {
        return sum += rating.storyRating;
      }, 0) / ratings.length;
      avgRatings.visualRating = ratings.reduce((sum, rating) => {
        return sum += rating.visualRating;
      }, 0) / ratings.length;
      avgRatings.audioRating = ratings.reduce((sum, rating) => {
        return sum += rating.audioRating;
      }, 0) / ratings.length;
      avgRatings.gameplayRating = ratings.reduce((sum, rating) => {
        return sum += rating.gameplayRating;
      }, 0) / ratings.length;
      avgRatings.difficultyRating = ratings.reduce((sum, rating) => {
        return sum += rating.difficultyRating;
      }, 0) / ratings.length;
      avgRatings.overallRating = ratings.reduce((sum, rating) => {
        return sum += rating.overallRating;
      }, 0) / ratings.length;
      return avgRatings;
    }
  },
  mounted() {
    this.$store.commit('RESET_REVIEWS_AND_COMMENTS');
    videogameService
      .getVideoGameById(this.$route.params.id)
      .then((response) => {
        this.videoGame = response.data;
        this.dataLoaded = true;

        const colorThief = new ColorThief();
        const img = new Image();

        img.addEventListener('load', () => {
          this.palette = colorThief.getPalette(img);
          //console.log(this.palette);
        });

        let imageURL = this.videoGame.boxArt;
        let googleProxyURL = 'https://images1-focus-opensocial.googleusercontent.com/gadgets/proxy?container=focus&refresh=2592000&url=';

        img.crossOrigin = 'Anonymous';
        img.src = googleProxyURL + encodeURIComponent(imageURL);
      });
      this.anchorHashCheck()
  }
};
</script>


<style>
.art{
  grid-area: art;
  justify-content: center;
  display: flex;
  width: 500Px;
  border-radius: 10px;
}
.title{
  grid-area: title;
}
.title h2 {
  margin: 5px;
  text-shadow: 1px 1px 2px black;
  font-weight: 900;
  font-size: 1.8rem;
}
.rating {
  grid-area: rating;
  display: flex;
  flex-direction: column;
}
.rating img {
  width: 50px;
  align-self: center;
}
.date{
  grid-area: date;
  height: 30px;
  vertical-align: middle;
}
.date span{
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
  white-space: nowrap;
}
.price{
  grid-area: price;
  height: 30px;
  vertical-align: middle;
}
.price span{
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
  white-space: nowrap;
}
.system{
  grid-area: system;
}
.system span {
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
  white-space: nowrap;
}
.publisher{
  grid-area: publisher;
  height: 30px;
  vertical-align: middle;
}
.publisher span{
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
  white-space: nowrap;
}
.studio{
  grid-area: studio;
}
.studio span{
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
  white-space: nowrap;
}
.genre{
  grid-area: genre;
  
}
.genres {
  display: flex;
  flex-wrap: wrap;
}
.genre span{
  margin: 3px;
  padding: 3px;
  background-color: dimgray;
  border-radius: 5px;
  white-space: nowrap;
}
.description{
  grid-area: description;
}
.edit-delete {
  grid-area: edit-delete;
  display: flex;
  justify-content: right;
}
.edit-delete button {
  border-radius: 5px;
  border: 1px solid white;
  padding: 3px;
  margin: 2px;
  width: 50px;
  height: 30px;
}
.videogamedetails-jumpbuttons {
  grid-area: jump;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.videogamedetails-jumpbuttons button {
  font-size: 1rem;
  width: 200px;
}
#delete-game {
  background-color: rgb(228, 59, 59);
  color: white;
}
#edit-game {
  background-color: rgb(60, 226, 60);
  color: white;
}
#edit-game:hover, #delete-game:hover {
  background-color: white;
  color: black;
  cursor: pointer;
}
.average-ratings {
  grid-area: average-ratings;
}
#details h6, #details-ratings h6 {
  font-size: 1rem;
  margin: 5px;
  border-bottom: 1px solid white;
}
#details {
  background-color: rgba(30, 30, 30, .7);
  border-radius: 20px;
  padding: 10px;
  grid-area: details;
  max-width: 800px;
  display: grid;
  grid-template-columns: auto auto 120px;
  gap: 30px;
  grid-template-areas: "publisher price date"
                      "studio system rating"
                      "genre genre rating"
                      "description description description";
  align-items: center;
}
#details-ratings {
  background-color: rgba(30, 30, 30, .7);
  border-radius: 20px;
  padding: 10px;
  grid-area: ratings;
  display: grid;
  grid-template-columns: auto auto auto;
  gap: 30px;
  grid-template-areas: "average-ratings average-ratings jump";
}
#detailsPage{
  padding: 10px;
  border-radius: 20px;
  grid-area: gradient-background;
  margin-top: 20px;
  display:grid;
  gap: 5px;
  grid-template-columns: auto auto 1fr auto;
  grid-template-areas: 
  "title title title edit-delete" 
  "art art details details"
  "art art details details"
  "art art ratings ratings"
  "art art ratings ratings";
  align-items: flex-start;
  box-shadow: 5px 5px 5px rgba(0, 0, 0, .3);
  
  /*-webkit-box-reflect: below 5px linear-gradient(to bottom, rgba(0,0,0,0.0), rgba(0,0,0,0.1)); */
}

@keyframes Animation { 
    0%{background-position:0% 0%}
    50%{background-position:100% 0%}
    100%{background-position:-0% 0%}
}

</style>