<template>
  <div class="home">
    <video-game-list-vue/>
  </div>
</template>

<script>
import videoGameListVue from '../components/videoGameList.vue';
export default {
  name: "home",
  components:{
    videoGameListVue
  }
};
</script>
