<template>
  <div>
      <h2 v-if="addingNewGame">Add Video Game</h2>
      <h2 v-if="!addingNewGame">Edit Video Game</h2>
      <form action="#" @submit.prevent="addingNewGame ? addNewVideoGame() : updateVideoGame()" id="game-form" v-if="loaded">
          <div id="title-div">
            <label for="title">Title: </label>
            <input type="text" id="title" v-model="newVideoGame.title" required>
          </div>
          <div id="release-date-div">
              <label for="release-date">Release Date: </label>
              <input type="date" id="release-date" v-model="newVideoGame.releaseDate" required>
          </div>
          <div id="release-price-div">
              <label for="release-price">Release Price: </label>
              <input type="number" id="release-price" v-model="newVideoGame.releasePrice" step=".01" required>
          </div>
          <div id="publisher-div">
              <label for="publisher">Publisher: </label>
              <select name="publisher" id="publisher" v-model="newVideoGame.publisherName" required>
                  <option v-for="publisher in companies" :key="publisher" :value="publisher">{{publisher}}</option>
              </select>
          </div>
          <div id="rating-div">
              <label for="rating">Rating: </label>
              <select name="rating" id="rating" v-model="newVideoGame.rating" required>
                  <option value="E">E</option>
                  <option value="E10+">E10+</option>
                  <option value="T">T</option>
                  <option value="M">M</option>
              </select>
          </div>
          <div id="boxart-div">
            <label for="boxart">Boxart: </label>
            <input type="text" id="boxart" v-model="newVideoGame.boxArt">
            <img :src="newVideoGame.boxArt" alt="" class="preview-boxart">
          </div>
          <div id="genres-div">
            <form action="#" autocomplete="false" @submit.prevent="addGenre(genreToAdd)">
                <label for="genres">Genres: </label>
                <div><input type="text" placeholder="Genre" list="genrelist" v-model="genreToAdd"><input type="submit" value="Add"></div>
                <div v-for="genre in newVideoGame.genres" :key="'genre-' + genre">{{genre}} <button @click="removeGenre(genre)">X</button></div>
                <datalist id="genrelist">
                    <option v-for="genre in genres" :key="`option-${genre}`">{{genre}}</option>
                </datalist>
            </form>
          </div>
          <div id="studios-div">
            <form action="#" autocomplete="false" @submit.prevent="addStudio(studioToAdd)">
                <label for="studios">Studios: </label>
                <div><input type="text" placeholder="Studio" list="studiolist" v-model="studioToAdd"><input type="submit" value="Add"></div>
                <div v-for="studio in newVideoGame.studios" :key="'studio-' + studio">{{studio}} <button @click="removeStudio(studio)">X</button></div>
                <datalist id="studiolist">
                    <option v-for="studio in companies" :key="`studio-option-${studio}`">{{studio}}</option>
                </datalist>
            </form>
        </div>
        <div id="systems-div">
            <form action="#" autocomplete="false" @submit.prevent="addSystem(systemToAdd)">
                <label for="systems">Systems: </label>
                <div><input type="text" placeholder="System" list="systemlist" v-model="systemToAdd"><input type="submit" value="Add"></div>
                <div v-for="system in newVideoGame.systems" :key="'system-' + system">{{system}} <button @click="removeSystem(system)">X</button></div>
                <datalist id="systemlist">
                    <option v-for="system in systems" :key="`option-${system}`">{{system}}</option>
                </datalist>
            </form>
          </div>
          <div id="steamid-div">
              <label for="steamid">Steam ID: </label>
              <input type="text" name="steamid" v-model="newVideoGame.steamId">
          </div>
          <div id="description-div">
              <label for="description">Description: </label>
              <textarea name="descritption" id="description" cols="100" rows="10" v-model="newVideoGame.description"></textarea>
          </div>
          <div id="submit-div">
              <input type="submit" name="" id="">
          </div>
      </form>
  </div>
</template>

<script>
import VideoGameService from '@/services/videogameService.js'
import videogameService from '../services/videogameService'

export default {
    props: ["addingNewGame"],
    data() {
        return {
            newVideoGame: {},
            genres: [],
            companies: [],
            systems: [],
            loaded: false,
            genreToAdd: '',
            studioToAdd: '',
            systemToAdd: ''
        }
    },
    methods: {
        createNewVideoGame() {
            return {genres: [], studios: [], systems: []}
        },
        addNewVideoGame() {
            VideoGameService.addVideoGame(this.newVideoGame).then(response => {
                this.$router.push({name: 'videogamedetails', params: {id: response.data.id}, hash: '#detailsPage'});
            });
        },
        updateVideoGame() {
            videogameService.updateGame(this.newVideoGame).then(response => {
                console.log(response);
                this.$router.push({name: 'videogamedetails', params: {id: this.newVideoGame.id}, hash: '#detailsPage'});
            })
        },
        removeGenre(genre) {
            this.newVideoGame.genres.splice(this.newVideoGame.genres.indexOf(genre), 1);
        },
        addGenre(genre) {
            if (this.genres.includes(genre)) {
                this.newVideoGame.genres.push(genre);
                this.genreToAdd = '';
            }            
        },
        removeSystem(system) {
            this.newVideoGame.systems.splice(this.newVideoGame.systems.indexOf(system), 1);
        },
        addSystem(system) {
            if (this.systems.includes(system)) {
                this.newVideoGame.systems.push(system);
                this.systemToAdd = '';
            }            
        },
        removeStudio(studio) {
            this.newVideoGame.studios.splice(this.newVideoGame.studios.indexOf(studio), 1);
        },
        addStudio(studio) {
            if (this.companies.includes(studio)) {
                this.newVideoGame.studios.push(studio);
                this.studioToAdd = '';
            }            
        }
    },
    created() {
        if (this.addingNewGame) {
            this.newVideoGame = this.createNewVideoGame();
            this.loaded = true;
        } else {
            videogameService.getVideoGameById(this.$route.params.id).then( response => {
                this.newVideoGame = response.data;
                this.loaded = true;
            });
        }        
        VideoGameService.getGenres().then(response => {
            this.genres = response.data;
        });
        VideoGameService.getSystems().then(response => {
            this.systems = response.data;
        });
        VideoGameService.getCompanies().then(response => {
            this.companies = response.data;
        });
    }
}
</script>

<style>
#game-form {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-areas: "title release-date release-price"
                        "publisher boxart rating"
                        "genres studios systems"
                        "steamid . ."
                        "description description description"
                        "submit submit submit";
}
#steamid-div {
    grid-area: steamid;
}
#title-div {
    grid-area: title;
}
#release-date-div {
    grid-area: release-date;
}
#release-price-div {
    grid-area: release-price;
}
#publisher-div {
    grid-area: publisher;
}
#rating-div {
    grid-area: rating;
}
#boxart-div {
    grid-area: boxart;
}
#studios-div {
    grid-area: studios;
}
#systems-div {
    grid-area: systems;
}
#title-div {
    grid-area: title;
}
#description-div {
    grid-area: description;
    display: flex;
    flex-direction: column;
}
#submit-div {
    grid-area: submit;
}
#submit-div input {
    width: 100%;
    height: 20px;
}
#submit-div input:hover {
    background-color: white;
    cursor: pointer;
}
form div {
    margin: 10px;
}
</style>