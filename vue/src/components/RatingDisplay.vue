<template>
  <div>
      <table>
              <tr>
                  <td>Story:</td>
                  <td>
                      <RatingBar :rating="rating.storyRating" />
                  </td>
                  <td>{{rating.storyRating}}</td>
              </tr>
              <tr>
                  <td>Visual:</td>
                  <td>
                      <RatingBar :rating="rating.visualRating" />
                  </td>
                  <td>{{rating.visualRating}}</td>
              </tr>
              <tr>
                  <td>Audio:</td>
                  <td>
                      <RatingBar :rating="rating.audioRating" />
                  </td>
                  <td>{{rating.audioRating}}</td>
              </tr>
              <tr>
                  <td>Gameplay:</td>
                  <td>
                      <RatingBar :rating="rating.gameplayRating" />
                  </td>
                  <td>{{rating.gameplayRating}}</td>
              </tr>
              <tr>
                  <td>Difficulty:</td>
                  <td>
                      <RatingBar :rating="rating.difficultyRating" />
                  </td>
                  <td>{{rating.difficultyRating}}</td>
              </tr>
              <tr>
                  <td>Overall:</td>
                  <td>
                      <RatingBar :rating="rating.overallRating" :isOverall="true" />
                  </td>
                  <td>{{rating.overallRating}}</td>
              </tr>
          </table>
  </div>
</template>

<script>
import RatingBar from '@/components/RatingBar.vue'

export default {
    props: ['rating'],
    components: {
        RatingBar
    },
    methods: {
        
    }
}
</script>

<style>

</style>