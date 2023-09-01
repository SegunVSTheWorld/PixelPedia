<template>
    <div class="comment-card-container">
        <div class="comment-user">
            
            <UserCard :user="commenter" />
        </div>
        
        <div class="comment-card">
            <div class="confirm-review-delete" v-if="confirmingDelete">
                    <div>Are you sure you want to delete this comment?</div>
                    <div>
                        <button @click.prevent="deleteThis()">Yes</button>
                        <button @click.prevent="confirmingDelete = false">No</button>
                    </div>
                </div>
            <div class="comment-text">
                {{comment.commentText}}
            </div>
            <div class="comment-date">{{comment.date}}</div>
            <div class="comment-edit-delete">
                <button @click.prevent="$store.commit('TOGGLE_EDIT_COMMENTS', comment.commentId)" v-if="canEdit">Edit</button>
                <button @click.prevent="confirmingDelete = !confirmingDelete" v-if="canDelete">Delete</button>
            </div>
            
            
            <CommentForm v-if="$store.state.editingComments.includes(this.comment.commentId)" :comment="comment" />
        </div>
        
  </div>
</template>

<script>
import UserService from '@/services/UserService.js'
import VideoGameService from '@/services/videogameService.js'
import CommentForm from '@/components/CommentForm.vue'
import UserCard from '@/components/UserCard.vue'

export default {
    components: {
        CommentForm,
        UserCard
    },
    props: ['comment'],
    data() {
        return {
            commenter: {},
            confirmingDelete: false
        }
    },
    computed: {
        canEdit() {
            if (this.$store.state.user.id === this.comment.userId) {
                return true;
            }
            return false;
        },
        canDelete() {
            if (this.$store.getters.userIsAdmin) {
                return true;
            }
            if (this.$store.state.user.id === this.comment.userId) {
                return true;
            }
            return false;
        }
    },
    created() {
        UserService.getUserById(this.comment.userId).then(response => {
            this.commenter = response.data;
        })
    },
    methods: {
        deleteThis() {
            VideoGameService.deleteComment(this.comment.commentId).then(() => {
                this.$store.dispatch('loadReviews', this.$route.params.id);
            })
        }
    }
}
</script>

<style>
.comment-card-container {
    margin: 10px;
    margin-left: 20%;
    display: flex;
    
}
.comment-card {
    background: linear-gradient(rgba(30, 30, 30, .8), rgba(30, 30, 30, .2));
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
    border-bottom-right-radius: 20px;
    border: 1px solid white;
    padding: 20px;
    margin: 5px;
    height: 100px;
    width: 90%;
    display: flex;
    flex-direction: column;
    position: relative;
}
.comment-text {
    justify-self: center;
}
.comment-user {
    align-self: flex-end;
}
.comment-date {
    font-style: italic;
    align-self: flex-end;
}
.comment-edit-delete {
    position: absolute;
    top: 5px;
    right: 5px;
}
</style>