<template>
  <div id="app">
    <b-container>
      <router-view></router-view>
    </b-container>
  </div>
</template>

<script>
export default {
  name: "App",
  components: {},
  data: function () {
    return {
      global: {
        username: null
      }
    };
  }
};
</script>

<style>
</style>
