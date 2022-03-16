<template>
  <div>
    <div class="topnav">
      <a href="/">Home</a>
      <a class="active" href="/Week">Week</a>
      <a href="/Month">Month</a>
      <a href="/Journals">Journals</a>
      <a style="float:right" href="/logout">Logout</a>
      <a style="float:right" href="/Account">Account</a>
    </div>
  </div>
</template>

<script>
import Api from "../api";
import { } from '../auth';
import HabitCreator from "../components/HabitCreator.vue";
import { getJwtToken } from "../auth";
import { getUserIdFromToken } from "../auth";
export default {
  name: "Week",
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
    Api.getWeekView(this.username).then((res) => {
      this.habits = res.data;
      this.loading = false;
    });
  },
  components: { Habit }
};
</script>
