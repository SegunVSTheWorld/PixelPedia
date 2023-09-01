<template>
  <div>
      <form action="" class="comment-form" @submit.prevent="submit()">
          <textarea name="" id="" cols="50" rows="10" v-model="newComment.commentText"></textarea>
          <input type="submit">
      </form>
  </div>
</template>

<script>
import VideoGameService from '@/services/videogameService.js'
export default {
    props: ['reviewId', 'comment'],
    data() {
        return {
            newComment: {}
        }
    },
    created() {
        if (this.comment) {
            this.newComment = this.comment;
        }      
    },
    methods: {
        submit() {
            if (this.comment) {
                VideoGameService.updateComment(this.newComment).then(() => {
                    this.$store.commit('TOGGLE_EDIT_COMMENTS', this.comment.commentId);
                });
            } else {
                this.newComment.reviewId = this.reviewId;
                this.newComment.userId = this.$store.state.user.id;
                VideoGameService.addComment(this.newComment).then(() => {
                    this.$store.dispatch('loadReviews', this.$route.params.id);
                    this.newComment = {};
                });
            }            
        }
    }
}
</script>

<style>
.comment-form {
    display: flex;
    flex-direction: column;
}
</style>