<template>
  <div id="app">
    <b-container>
      <Nav :nav="nav"></nav>
      <router-view></router-view>
    </b-container>
  </div>
</template>

<script>
import Nav from "../components/Nav.vue";

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
  components: { Nav }
};
</script>

<style>
</style>
