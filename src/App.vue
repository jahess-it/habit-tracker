<link rel="stylesheet" href="./css/style.css">

<template>
  <div id="app">
    <b-container>
      <Navbar></navbar>
      <router-view></router-view>
    </b-container>
  </div>
</template>

<script>
import Navbar from "./components/Navbar.vue";

export default {
  name: "App",
  components: {},
  data: function () {
    return {
      global: {
        username: null
      }
    };
  },
  components: { Navbar }
};
</script>

<style>
</style>
