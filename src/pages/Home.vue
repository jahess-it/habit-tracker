<template>
  <div>
    <b-jumbotron>
      <p>Welcome to the Habit Tracker!</p>
    </b-jumbotron>
    <br />
    <div v-if="loading">Loading habits . . .</div>
    <ul v-else>
      <li v-for="habit in habits" :key="habit.habit_id">
        <Habit habit="habit"></Habit>
      </li>
    </ul>
  </div>
</template>

<script>
import Api from "../api";
import { } from '../auth';
import Habit from "../components/Habit.vue";

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
    Api.getUpcomingHabits(global.username).then((res) => {
      this.habits = res.data;
      this.loading = false;
    });
  },
  components: { Habit }
};
</script>