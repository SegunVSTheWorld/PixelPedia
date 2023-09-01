<template>
  <div class="videogamelistcontainer">
      <div class="search-and-order">
      <input type="text" placeholder="Search" v-model="searchTerm" class="searchbox">
      Order By: 
      <select name="" id="" v-model="orderBy">
          <option value="nameASC">Name (A-Z)</option>
          <option value="nameDESC">Name (Z-A)</option>
          <option value="dateNew">Date (Newest to Oldest)</option>
          <option value="dateOld">Date (Oldest to Newest)</option>
      </select>
    </div>
    <div id="videogamelist">  
    <div v-for="videogame in filteredVideoGameList" v-bind:key="videogame.id" class="videoGameCard"><router-link  v-bind:to="{name: 'videogamedetails', params: {id: videogame.id}, hash: '#detailsPage'}"> <video-game-card v-bind:videogame="videogame"/> </router-link></div>
    </div>
  </div>
</template>

<script>
import videogameService from "../services/videogameService.js";
import VideoGameCard from './VideoGameCard.vue';
import VideoGameCardVue from './VideoGameCard.vue';

export default {
  components: { VideoGameCard },
    name: "videogamelist",
    component: {
        VideoGameCardVue,
    },
    data() {
        return{
            videoGameList: [],
            searchTerm: '',
            orderBy: ''
        }
    },
    computed: {
        filteredVideoGameList: {
            get: function() {
                let filteredList = this.videoGameList;
                const searchTerm = this.searchTerm.toLowerCase();
                if (this.searchTerm !== '') {
                    filteredList = this.videoGameList.filter(videogame => {
                        return (videogame.title.toLowerCase().includes(searchTerm))
                            || (videogame.publisherName.toLowerCase().includes(searchTerm))
                            || (videogame.genres.toString().toLowerCase().includes(searchTerm))
                            || (videogame.systems.toString().toLowerCase().includes(searchTerm))
                            || (videogame.studios.toString().toLowerCase().includes(searchTerm))
                            || (videogame.releaseDate.includes(searchTerm));
                    });
                }
                if (this.orderBy === 'nameASC') {
                    filteredList.sort((a, b) => {
                        const nameA = a.title.toUpperCase(); // ignore upper and lowercase
                        const nameB = b.title.toUpperCase(); // ignore upper and lowercase
                        if (nameA < nameB) {
                            return -1;
                        }
                        if (nameA > nameB) {
                            return 1;
                        }

                        // names must be equal
                        return 0;
                    });
                }
                if (this.orderBy === 'nameDESC') {
                    filteredList.sort((a, b) => {
                        const nameA = a.title.toUpperCase(); // ignore upper and lowercase
                        const nameB = b.title.toUpperCase(); // ignore upper and lowercase
                        if (nameA > nameB) {
                            return -1;
                        }
                        if (nameA < nameB) {
                            return 1;
                        }

                        // names must be equal
                        return 0;
                    });
                }
                if (this.orderBy === 'dateNew') {
                    filteredList.sort((a, b) => {
                        const nameA = a.releaseDate.toUpperCase(); // ignore upper and lowercase
                        const nameB = b.releaseDate.toUpperCase(); // ignore upper and lowercase
                        if (nameA > nameB) {
                            return -1;
                        }
                        if (nameA < nameB) {
                            return 1;
                        }

                        // names must be equal
                        return 0;
                    });
                }
                if (this.orderBy === 'dateOld') {
                    filteredList.sort((a, b) => {
                        const nameA = a.releaseDate.toUpperCase(); // ignore upper and lowercase
                        const nameB = b.releaseDate.toUpperCase(); // ignore upper and lowercase
                        if (nameA < nameB) {
                            return -1;
                        }
                        if (nameA > nameB) {
                            return 1;
                        }

                        // names must be equal
                        return 0;
                    });
                }

                
                return filteredList;
            },
            set: function() {

            }
            
        }
    },
    created(){
        videogameService.getVideoGames().then(response =>{
            this.videoGameList = response.data;
            this.filteredVideoGameList = response.data;
        }).catch(error => {
            if(error.response){
                console.log(error);
            }
            else if(error.request){
                console.log(error);
            }
            else{
                console.log(error);
            }
        })    
    }

}
</script>

<style>
.videogamelistcontainer {
    display: flex;
    flex-direction: column;
    align-items: center;
}
.search-and-order {
    margin: 10px;
    margin-top: 20px;
    justify-self: center;
}
.searchbox {
    border-radius: 5px;
    border: none;
}
.videoGameCard a {
    text-decoration: none;
    color: whitesmoke;
}
.videoGameCard{
    margin: 5px;
    padding: 5px;
    border: 1px solid grey;
    background-color: lightslategray;
    border-radius: 10px;
    position: relative;
    box-shadow: 5px 5px 5px rgba(0, 0, 0, .3);
}
#videogamelist{
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-top: 25px;
}

</style>