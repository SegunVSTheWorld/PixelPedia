<template>
  <div class="usercard" @click="goToProfile()">
      <h6>{{user.username}}</h6>
      <div class="tagline boxart-details"  :class="{'boxart-details-text-hover' : hover}" @mouseover="hover = true" @mouseleave="hover = false">
          <span class="boxart-details-text">{{user.tagline}}</span>
        </div>
      <img :src="user.avatarURL" alt="" class="usericon" :class="{bounce: !hover}" @mouseover="hover = true" @mouseleave="hover = false">
  </div>
</template>

<script>
export default {
    props: ['user'],
    data() {
        return {
            hover: false
        }
    },
    methods: {
        goToProfile() {
            this.$router.push({name: 'viewprofile', params: {id: this.user.id}});
        }
    }
}
</script>

<style>
.usercard {
    background-color: lightslategray;
    border-radius: 10px;
    width: 120px;
    padding: 5px;
    display: flex;
    flex-direction: column;
    align-items: center;
    box-shadow: 5px 5px 5px rgba(0, 0, 0, .3);
    position: relative;
}
.usercard:hover {
    cursor: pointer;
}
.usercard h6 {
    margin: 3px;
    font-size: 1rem;
    border-bottom: 1px solid white;
    width: 100%;
    text-align: center;
    z-index: 2;
    text-shadow: 1px 1px 2px black;
}
.tagline {
    font-style: italic;
    font-size: .8rem;
    bottom: 0px;
}
.usericon {
    width: 120px;
    height: 120px;
    min-width: 50px;
    min-height: 50px;
    background-color: lightslategray;
    transition: all .5s;
    border-radius: 10px;
    z-index: 1;
}
.usericon:hover {
    transform: translateY(-2rem);
    background-color: rgba(0, 0, 0, 0);
}
</style>