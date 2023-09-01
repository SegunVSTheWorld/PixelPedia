
<template>
  <div>
    <iframe id ="gbaEmulator" src="/gbajs2-master/index.html"></iframe>
  </div>
</template>

<script>
export default {
};
</script>
<style>
  .gbaEmulator {
    display: flex;
    align-items: center;
    justify-content: center;
}
div iframe{
  position: absolute;
  top: -25;
  left: 0;
  width: 100%;
  height: 100%;
  border: none;
}
</style>