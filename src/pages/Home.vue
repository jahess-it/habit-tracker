<template>
  <!--<div>
    <Navbar :navbar="navbar"></Navbar>
  </div> -->
  <div class="topnav" id="myTopnav">
    <a href="#home" class="active">Home</a>
    <a href="#week">Week</a>
    <a href="#Month">Month</a>
    <a href="#admin">Admin</a>
    <a href="javascript:void(0);" class="icon" onclick="myFunction()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
  <div>
    <b-jumbotron>
      <h1 style="text-align: center">Habit Tracker</h1>
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
