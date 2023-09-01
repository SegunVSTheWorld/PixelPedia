<template>
    <div>
        <h1>Are you sure you want to delete this game?</h1>
        <div id="game-information">
            <img :src="videoGame.boxArt" alt="" class="boxart">
            <div>{{videoGame.title}}</div>
        </div>
        <div class="confirm-buttons">
            <button @click.prevent="deleteGame">Yes</button>
            <button @click.prevent="$router.push({name: 'home'})">No</button>
        </div>
    </div>
</template>

<script>
import videogameService from "../services/videogameService";
export default {
    data() {
        return {
            videoGame: {}
        }
    },
    created() {
        videogameService.getVideoGameById(this.$route.params.id)
        .then((response) => {
            this.videoGame = response.data;
        });
    },
    methods: {
        deleteGame() {
            videogameService.deleteGame(this.videoGame.id).then( response => {
                console.log(response);
                this.$router.push({name: 'home'});
            });
        }
        
    }
}
</script>

<style>
#game-information {
    display: flex;
    flex-direction: column;
    align-items: center;
}
.confirm-buttons {
    text-align: center;
    margin: 10px;
}
.confirm-buttons button {
    margin: 5px;
    width: 100px;
}
</style>