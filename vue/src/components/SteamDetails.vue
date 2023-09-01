<template>
  <div id="steamdetails" v-if="steamId">
      <h3>Steam Details</h3>
      <h4>Current Players:</h4> 
      <div class="steam-player-count">{{currentPlayers.toLocaleString()}}</div>
      <!--h4>Achievement Percentages: </h4>
      <div v-for="(achievement, index) in achievementPercentages.achievements" :key="'achievement-' + index">
         {{achievement.name}} - {{achievement.percent}}%
      </div-->
      <h4>Latest News:</h4>
      <SteamNewsItem v-for="(newsitem, index) in news.newsitems" :key="index" :newsitem="newsitem" />
      
      <div class="goto-steam-page"><h4><a :href="`https://store.steampowered.com/app/${steamId}`" target="_blank">Got To Steam Page -></a></h4></div>
  </div>
</template>

<script>
import SteamNewsItem from '@/components/SteamNewsItem.vue'
import SteamService from '@/services/SteamService.js'
import VideoGameService from '@/services/videogameService.js'
export default {
   components: {
      SteamNewsItem
   },
   data() {
      return {
        steamId: 0,
        currentPlayers: 0,
        news: {},
        achievementPercentages: {}
      }
   },
   created() {
       //Get SteamId from game
      VideoGameService.getVideoGameById(this.$route.params.id).then((response) => {
         this.steamId = response.data.steamId;
         if (this.steamId > 0) {
            SteamService.getCurrentPlayersForGame(this.steamId).then(response => {
               this.currentPlayers = response.data.response.player_count;
            });
            SteamService.getNewsForGame(this.steamId).then(response => {
               this.news = response.data.appnews;
            });
            SteamService.getAchievementPercentagesForGame(255710).then(response => {
               this.achievementPercentages = response.data.achievementpercentages;
               console.log(this.achievementPercentages);
            })
         }
         
      });
   }
}
</script>

<style>
#steamdetails {
   display: flex;
   flex-direction: column;
}
.steam-player-count {
   background-color: rgba(30, 30, 30, .7);
   padding: 5px;
   border-radius: 5px;
   width: 100px;
   text-align: right;
}
.goto-steam-page {
   align-self: flex-end;
}
</style>