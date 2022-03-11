<template>
  <!--<div>
    <Navbar :navbar="navbar"></Navbar>
  </div> -->
  <div>
    <b-jumbotron>
      <p>Welcome to the Habit Tracker!</p>
    </b-jumbotron>
    <br />
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
//import Navbar from "../components/Navbar.vue";

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
  components: { Habit } //, Navbar }
};
</script>
