<template>
<div class="emulatorList">
    <div v-bind:to="emulator[0].name" class="videoGameCard" @mouseover="playSound(emulator[0])" @mouseout="pauseSound(emulator[0])"><router-link v-bind:to="emulator[0].routerLink"><img class="gbaGif" v-bind:src="emulator[0].gifImage" v-show="emulator[0].active"><img class="gbaGif" v-bind:src="emulator[0].blackImage" v-show="!emulator[0].active"><div><img class="gba" v-bind:src="emulator[0].imageUrl"></div></router-link></div>
    <div v-bind:to="emulator[1].name" class="videoGameCard" @mouseover="playSound(emulator[1])" @mouseout="pauseSound(emulator[1])"><router-link v-bind:to="emulator[1].routerLink"><img class="pspGif" v-bind:src="emulator[1].gifImage" v-show="emulator[1].active"><img class="pspBlack" v-bind:src="emulator[1].blackImage" v-show="!emulator[1].active"><div><img class="psp" v-bind:src="emulator[1].imageUrl"></div></router-link></div>
</div>
</template>


<script>

export default{ 
    data(){
    return{
        emulator: [
          {
            name: 'GBA',
            routerLink: '/emulatorlist/gba',
            imageUrl: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.pngkey.com%2Fpng%2Ffull%2F142-1425125_the-gameboy-advance-launched-in-japan-15-years.png&f=1&nofb=1&ipt=ec4334e682c75bb49bf8314d412ecf828981193c407f9c979afd53b2e5af08b2&ipo=images',
            gifImage: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmedia.tenor.com%2FeU6-5B11bd8AAAAC%2Ftextgif-nintendo.gif&f=1&nofb=1&ipt=a311b60dce40429bb7bf275080543ae7ff50a571a49dd21ed75acc7ee8500c0a&ipo=images',
            blackImage: 'https://community.usa.canon.com/t5/image/serverpage/image-id/8218iBEAE12A7A45C909D?v=1.0',
            sound: new Audio('/audio/gba.mp3'),
            active: false,
          },
          {
            name: 'PS1',
            routerLink: '/emulatorlist/ps1',
            imageUrl: 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fpluspng.com%2Fimg-png%2Fplaystation-png-hd-playstation-3000.png&f=1&nofb=1&ipt=2d34926b5bafd80d4b935691d0b81139970e9375a2ec41d77ab25d877b0421e4&ipo=images',
            gifImage: 'https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExemkwY3ljcWZoeWYyY2Q2M25jZzAwbHd6OGtjdXpjdGRlYjJpOGo1dCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/BdtHOz9xmcvRe/giphy.gif',
            blackImage: '',
            sound: new Audio('/audio/playstationJingle.mp3'),
            active: false,
          }
            ]
      }
    },
    methods: {
    playSound (emulator) {
      if(emulator.sound) {
        emulator.active = true;
        emulator.sound.play(1);
      }
    },
    pauseSound(emulator) {
      if(emulator.sound) {
        emulator.active = false;
        emulator.sound.pause();
        emulator.sound.currentTime = 0;
      }
    }
    }
}

</script>

<style>
.emulatorList{
  display: flex;
}
.gba{
    width: 400px;
    border-radius: 10px;
}
.gbaGif{
    position: absolute;
    width: 210px;
    right: 100px;
    bottom:55px;
    z-index: 1;
    border-radius: 10px
}
.psp{
  width: 230px;
  background-color: black;
  border-radius: 10px;
}
.pspGif{
  position: absolute;
    width: 230px;
    z-index: 1;
    border-radius: 10px
}
.pspBlack{
  position: absolute;
    width: 110px;
    right: 50px;
    bottom:36px;
    z-index: 1;
    border-radius: 3px
}

</style>