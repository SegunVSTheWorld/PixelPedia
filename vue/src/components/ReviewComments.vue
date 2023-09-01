<template>
  <div class="review-comments">
      <CommentCard v-for="comment in comments" :key="`comment-${comment.commentId}`" :comment="comment" />
      <div v-if="comments.length === 0">There are no comments.</div>
      
      <div class="comment-form-container"><CommentForm v-if="addingComment" :reviewId="reviewId" /></div>
      <div class="add-comment"><button @click.prevent="addComment()">{{addingComment ? 'Cancel' : 'Add Comment'}}</button></div>
  </div>
</template>

<script>
import CommentCard from '@/components/CommentCard.vue'
import CommentForm from '@/components/CommentForm.vue'

export default {
    props: ['comments', 'reviewId'],
    data() {
        return {
            addingComment: false
        }
    },
    components: {
        CommentCard,
        CommentForm
    },
    methods: {
        addComment() {
            this.addingComment = !this.addingComment;
        }
    }
}
</script>

<style>
.review-comments {
    display: flex;
    flex-direction: column;
}
.add-comment {
    align-self: flex-end;
}
.comment-form-container {
    align-self: flex-end;
}
</style>