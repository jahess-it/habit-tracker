<template>
  <div>
    <b-jumbotron>
      <h1 style="text-align: center">Habit Tracker</h1>
    </b-jumbotron>
    <br />
    <div class="topnav">
      <a class="active" href="#home">Home</a>
      <a href="#news">News</a>
      <a href="#contact">Contact</a>
      <a href="#about">About</a>
    </div>
    <div v-if="loading">Loading habits . . .</div>
    <ul v-else>
      <div v-for="habit in habits" :key="habit.habit_id">
        <Habit :habit="habit"></Habit>
      </div>
    </ul>
  </div>
</template>

<script>
import Api from "../api";
import { } from '../auth';
import Habit from "../components/Habit.vue";
import { getJwtToken } from "../auth";
import { getUserIdFromToken } from "../auth";

export default {
  name: "Home",
  data: function () {
    return {
      loading: false,
      habits: []
    };
  },
  created: function () {
    this.loading = true;
    this.token = getJwtToken();
    this.username = getUserIdFromToken(this.token);
    Api.getUpcomingHabits(this.username).then((res) => {
      this.habits = res.data;
      this.loading = false;
    });
  },
  components: { Habit }
};
</script>
