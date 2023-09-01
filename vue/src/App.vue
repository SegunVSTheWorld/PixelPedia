<template>
  <div id="app">
    <header>
      <div id="sitename"><h1><router-link v-bind:to="{ name: 'home' }">
        <img src="/images/logo.png" alt="" height="60px">
      </router-link></h1></div>
      <div id="nav" v-if="$store.state.token != ''">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <span v-if="$store.getters.userIsAdmin"><router-link v-bind:to="{ name: 'addvideogame' }" v-if="$store.getters.userIsAdmin">Add Video Game</router-link>&nbsp;|&nbsp;</span>
      <router-link v-bind:to="{ name: 'emulatorlist' }">Emulators</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'viewprofile', params: {id: this.$store.state.user.id} }">My Profile</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout ({{$store.state.user.username}})</router-link>
    </div>
    </header>    
    <main>
      <router-view />
    </main>
    <footer></footer>
  </div>
</template>

<script>

export default {
  
}
</script>


<style>
  #app{
    margin: 0px;
    padding: 0px;
    height: 100%;
    width: 100%;
    display: grid;
    grid-template-columns: 33% 1fr 33%;
    grid-template-rows: 75px 1fr 30px;
    grid-template-areas: 
    "Header Header Header"
    "body body body"
    "Footer Footer Footer"
    ;
    justify-items: center;
  }
  header{
    width: 100%;
    display: flex;
    justify-content: space-between;
    background: linear-gradient(rgba(51, 51, 51, 1), rgba(51, 51, 51, 0));
    align-items: center;
    grid-area: Header;
  }
  #sitename {
    margin: 20px;
    margin-bottom: 10px;
    text-shadow: 1px 1px 2px black;
  }
  #sitename img {
    transition: all .5s;
    
  }
  #sitename img:hover {
    scale: 110%;
  }
  #nav {
    margin: 20px;
  }
  main{
    grid-area: body;
    padding-bottom: 50px;
  }
  body{
    padding: 0px;
    margin: 0px;
    background-color: #454545;
    background-image: url("@/assets/background.png");
    background-repeat: no-repeat;
    background-position-x: right;
    background-position-y: bottom;
    background-attachment: fixed;
    color: whitesmoke;
    font-family: Arial, Helvetica, sans-serif;
  }
  a{
    color: lightblue;
    text-decoration: none;
  }
  footer {
    grid-area: Footer;
  }
  .preview-boxart {
    width: 200px;
    border-radius: 10px;
  }

  select {
    border-radius: 5px;
  }

  button {
    border-radius: 5px;
    height: 20px;
    border: none;
    margin: 2px;
    background-color: lightgray;
  }

  button:hover {
    cursor: pointer;
    background-color: white;
  }

  input, textarea {
    border-radius: 5px;
    border: none;
  }

  h3 {
    margin-top: 50px;
    border-bottom: 1px solid white;
    background: linear-gradient(to right, rgba(51, 51, 51, 1), rgba(51, 51, 51, 0));
    z-index: 1;
    position: relative;
    padding: 10px;
    left: -10px;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
    text-shadow: 1px 1px 2px black;
}
</style>
