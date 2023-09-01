<template>
  <div>
      <div class="ratingbar-container" :class="{overallratingbarcontainer : isOverall}">
            <div class="ratingbar" :class="{overallratingbar : isOverall}" :style="{width: rating * 10 + '%', backgroundColor: backgroundColor}"></div>                
        </div>
  </div>
</template>

<script>
export default {
    props: ['rating', 'isOverall'],
    computed: {
        backgroundColor() {
            const rating = Math.floor(this.rating);
            let color = 'white';
            switch(rating) {
                case 10: color = '#33ff00'; break;
                case 9: color = '#66ff00'; break;
                case 8: color = '#99ff00'; break;
                case 7: color = '#ccff00'; break;
                case 6: color = '#ffff00'; break;
                case 5: color = '#ffcc00'; break;
                case 4: color = '#ff9900'; break;
                case 3: color = '#ff6600'; break;
                case 2: color = '#ff3300'; break;
                case 1: color = '#ff0000'; break;
                default: color = 'black';
            }
            return color;
        }
    }
}
</script>

<style>
.ratingbar-container {
    display: flex;
    width: 200px;
    height: 20px;
    background-color: gray;
    border-radius: 10px;
}
.ratingbar {
    height: 100%;
    border-radius: 10px;
}
.overallratingbarcontainer {
    width: 250px;
    height: 30px;
    border-radius: 15px;
}
.overallratingbar {
    border-radius: 15px;
}
</style>