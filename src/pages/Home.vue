<template>
  <div>
    <div class="topnav">
      <router-link to="/" class="navbar, active">Home</router-link>
      <router-link to="/Week" class="navbar">Week</router-link>
      <router-link to="/Month" class="navbar">Month</router-link>
      <router-link to="/" class="navbar">Other</router-link>
    </div>
    <br />
    <div>
      <h1 style="text-align: center">Habit Tracker</h1>
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
