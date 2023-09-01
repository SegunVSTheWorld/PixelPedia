import axios from 'axios';

export default {

    getCurrentPlayersForGame(steamAppId) {
        //steamAppId = 1222670;
        return axios.get(`/steam/app/${steamAppId}/currentplayers`);
    },

    getNewsForGame(steamAppId) {
        //steamAppId = 1222670;
        return axios.get(`/steam/app/${steamAppId}/news`);
    },

    getAchievementPercentagesForGame(steamAppId) {
        return axios.get(`/steam/app/${steamAppId}/achievementpercentages`);
    }

}