<template>
  <div class="steamnewsitem">
      <a :href="newsitem.url" target="_blank"><h4>{{newsitem.title}}</h4></a>
      <div class="steamnewsitemdate">{{formattedDate}}</div>
  </div>
</template>

<script>
export default {
    props: ['newsitem'],
    computed: {
        formattedDate() {
            let date;
            if(this.newsitem) {
                date = new Date(this.newsitem.date * 1000);
                return date;
            } else {
                date = Date.now();
            }
            return date;
        }
    }
}
</script>

<style>
.steamnewsitem {
    background-color: rgba(51, 51, 51, 1);
    border-radius: 10px;
    padding: 3px;
    padding-left: 5px;
    padding-right: 5px;
    margin: 3px;
    display: flex;
    justify-content: space-between;
}
.steamnewsitem h4 {
    margin: 2px;
}
.steamnewsitemdate {
    font-style: italic;
    font-size: .8rem;
    align-self: flex-end;
}
</style>