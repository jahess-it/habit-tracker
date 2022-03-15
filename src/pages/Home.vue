<template>
  <div>
    <div class="topnav">
      <a class="active" href="/">Home</a>
      <a href="/Week">Week</a>
      <a href="/Month">Month</a>
      <a href="/">Other</a>
    </div>
    <br />
    <div>
      <h1 style="text-align: center">Habit Tracker</h1>
    </div>
    
    <div>
      <h2 style="text-align: center">Your Habits</h2>
    </div>
    <div v-if="loading1">Loading habits . . .</div>
    <ul v-else>
      <div v-for="habits in habitss" :key="habits.habit_id">
        <Habits :habits="habits"></Habits>
      </div>
    </ul>
    
    <div>
      <h2 style="text-align: center">Upcoming Habits</h2>
    </div>
    <div v-if="loading2">Loading habits . . .</div>
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
import Habits from "../components/Habits.vue";
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
    this.loading1 = true;
    this.loading2 = true;
    this.token = getJwtToken();
    this.username = getUserIdFromToken(this.token);
    Api.getUpcomingHabits(this.username).then((res) => {
      this.habits = res.data;
      this.loading2 = false;
    });
    Api.getAllHabits(this.username).then((res) => {
      this.habitss = res.data;
      this.loading1 = false;
    });
  },
  components: { Habit, Habits }
};
</script>
