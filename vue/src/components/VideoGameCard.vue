<template>
  <div>
    <div @mouseover="hover = true" @mouseleave="hover = false">
      <img class="boxart" v-bind:src="videogame.boxArt" alt="" :class="{bounce: !hover}">
    </div>
    <div  @mouseover="hover = true" @mouseleave="hover = false" class="boxart-details" :class="{'boxart-details-text-hover' : hover}">
      <div class="boxart-details-text">{{videogame.title}}</div>      
    </div> 
  </div>
</template>

<script>
export default {
    name: "VideoGameCard",
    props: ["videogame"],
    data(){
      return{
        hover: false
        };
    }

};
</script>

<style>
  .boxart{
    display: block;
    margin-left: auto;
    margin-right: auto;
    height: 200px;
    align-self: center;
    border-radius: 10px;
    min-width: 100px;
    transition: all .5s;
    position: relative;
    z-index: 1;
  }

  .bounce {
    animation: bounce 1s ease;
  }

  .boxart:hover {
    transform: translateY(-2rem);
    z-index: 1;
  }

  .boxart-details {
    margin: 0px;    
    height: 50%;
    width: 100%;
    position: absolute;
    vertical-align: bottom;
    bottom: 0px;
    top: auto;
    left: 0px;
    background-image: linear-gradient( rgba(119,136,153, 0), rgba(119,136,153, 1));
    border-radius: 10px;
    z-index: 0;
  }

  .boxart-details-text {
    position: absolute;
    vertical-align: bottom;
    font-weight: bold;
    bottom: 0px;
    padding: 6px;
  }

  .boxart-details-text-hover {
    z-index: 2;
  }

  @keyframes bounce {
    0% {transform: translateY(-2rem)}
    20% {transform: translateY(.5rem)}
    40% {transform: translateY(-1.5rem)}
    60% {transform: translateY(0)}
    80% {transform: translateY(-.5rem)}
    100% {transform: translateY(0)}
  }
</style>