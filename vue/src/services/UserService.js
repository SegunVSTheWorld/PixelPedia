import axios from "axios";

export default{

    getUserById(userId) {
        return axios.get(`/users/${userId}`);
    },

    editProfile(user) {
        return axios.put(`/users/${user.id}`, user);
    },

    getListsForUser(userId) {
        return axios.get(`/users/${userId}/lists`);
    },

    addGameToList(gameToAdd) {
        return axios.post(`/users/lists/addgame`, gameToAdd);
    },

    removeGameFromList(gameToRemove) {
        console.log('deleting');
        console.log(gameToRemove);
        return axios.put(`/users/lists/deletegame`, gameToRemove);
    }

}