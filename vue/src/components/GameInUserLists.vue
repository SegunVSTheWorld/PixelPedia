<template>
  <div class="gameinuserlist" v-if="dataLoaded">
      <div class="lists">
          <span v-if="listsGameIsIn.includes('Played')">Played
              <button v-if="isCurrentUser" @click.prevent="removeGameFromList('Played')">X</button>
            </span> 
          <span v-if="listsGameIsIn.includes('Currently')">Currently Playing
              <button v-if="isCurrentUser" @click.prevent="removeGameFromList('Currently')">X</button>
            </span>
          <span v-if="listsGameIsIn.includes('Wishlist')">Wishlist
              <button v-if="isCurrentUser"  @click.prevent="removeGameFromList('Wishlist')">X</button>
            </span>
          <span v-if="listsGameIsIn.includes('Custom')">Custom List
              <button v-if="isCurrentUser" @click.prevent="removeGameFromList('Custom')">X</button>
            </span>
      </div>
      <div v-if="isCurrentUser">
          Add to List: 
          <select name="" id="" v-model="listNameToAdd">
              <option value="Played" v-if="!listsGameIsIn.includes('Played')">Played</option>
              <option value="Currently" v-if="!listsGameIsIn.includes('Currently')">Currently Playing</option>
              <option value="Wishlist" v-if="!listsGameIsIn.includes('Wishlist')">Wishlist</option>
              <option value="Custom" v-if="!listsGameIsIn.includes('Custom')">Custom List</option>
          </select>
          <button @click.prevent="addGameToList()">Add</button>
      </div>
  </div>
</template>

<script>
import UserService from '@/services/UserService.js'
export default {
    props: ['gameId', 'userId'],
    data() {
        return {
            lists: [],
            listNameToAdd: '',
            thisUserId: 0,
            dataLoaded: false
        }
    },
    computed: {
        isCurrentUser() {
            return this.userId === this.$store.state.user.id
        },
        listsGameIsIn() {
            const listNames = [];
            this.lists.forEach(list => {
                list.videoGameArray.find(game => {
                    if (game.id == this.$route.params.id) {
                        listNames.push(list.listName);
                    }
                })
            });
            return listNames;
        }
    },
    methods: {
        addGameToList() {
            if(this.listNameToAdd) {
                UserService.addGameToList({userId: this.$store.state.user.id, gameId: this.$route.params.id, listName: this.listNameToAdd});
                UserService.getListsForUser(this.$store.state.user.id).then(response => {
                    this.lists = response.data;
                    this.listNameToAdd = '';
                });
            }            
        },
        removeGameFromList(listName) {
            console.log(listName);
            const obj = {userId: this.$store.state.user.id, gameId: this.$route.params.id, listName: listName};
            console.log(obj);
            UserService.removeGameFromList(obj).catch(error => {
                console.error(error);
            });
            UserService.getListsForUser(this.$store.state.user.id).then(response => {
                    this.lists = response.data;
                    console.log('deleted');
                });
        },
        loadLists() {
            UserService.getListsForUser(this.$store.state.user.id).then(response => {
                this.lists = response.data;
                this.thisUserId = this.$store.state.user.id;
                this.dataLoaded = true;
                console.log(this.lists);
                console.log(this.listsGameIsIn);
            }).catch(error => {
                console.error(error);
            });
        }
    },
    created() {
        console.log('loading');
        this.loadLists();
    }
}
</script>

<style>
.gameinuserlist {
    width: 100%;
    display: flex;
    justify-content: space-between;
}

.gameinuserlist .lists span {
    background-color: Gray;
    border-radius: 5px;
    margin: 5px;
    padding: 2px;
}

</style>