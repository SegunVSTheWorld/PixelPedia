<template>
  <div>
    <VideoGameDetails />
    <h3>My Lists</h3>
    <GameInUserLists :gameId="$route.params.id" :userId="$store.state.user.id" />
    <SteamDetails />
    <VideoGameReviews />    
  </div>
</template>

<script>
import VideoGameDetails from '../components/VideoGameDetails.vue';
import VideoGameReviews from '../components/VideoGameReviews.vue';
import SteamDetails from '../components/SteamDetails.vue';
import GameInUserLists from '../components/GameInUserLists.vue'

export default {
  components: { 
    VideoGameDetails,
    VideoGameReviews,
    SteamDetails,
    GameInUserLists
  }
};
</script>

<style>
</style>