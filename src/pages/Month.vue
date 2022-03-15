<template>
  <div>
    <div class="topnav">
      <a href="/">Home</a>
      <a href="/Week">Week</a>
      <a class="active" href="/Month">Month</a>
      <a href="/Journals">Journals</a>
    </div>
    <br />
    <div>
      <h1 style="text-align: center">Habit Tracker</h1>
    </div>
    <div>
      <h2 style="text-align: center">This Week</h2>
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
  name: "Month",
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
    Api.getMonthView(this.username).then((res) => {
      this.habits = res.data;
      this.loading = false;
    });
  },
  components: { Habit }
};
</script>
