<template>
  <div>
      <h3>Edit Your Profile</h3>
      <form action="#" @submit.prevent="updateProfile()"  id="editprofileform">
        <div>User Name: {{user.username}}</div>
        <div>Email Address: <input type="text" v-model="user.email"></div>
        <div>Steam ID: <input type="text" v-model="user.steamId"></div>
        <div>Tagline: <input type="text" v-model="user.tagline"></div>
        <img :src="user.avatarURL" alt="" class="userimage">
        <div>Avatar URL: <input type="text" v-model="user.avatarURL"></div>
        Bio: <textarea name="" id="" cols="30" rows="10" v-model="user.bio"></textarea>
        <div id="submit-div"><input type="submit"></div>
        
      </form>
      
  </div>
</template>

<script>
import UserService from '@/services/UserService.js'

export default {
    data() {
        return {
            user: {}
        }
    },
    methods: {
        updateProfile() {
            this.user.authorities = '';
            console.log(this.user);
            UserService.editProfile(this.user);
        }
    },
    created() {
        const userId = this.$store.state.user.id;
        UserService.getUserById(userId).then(response => {
            this.user = response.data;
        });
    }
}
</script>

<style>
#editprofileform {
    display: flex;
    flex-direction: column;
    align-items: center;
}
</style>