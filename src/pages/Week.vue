<template>
  <div>
    <Navbar location="week"></Navbar>
    <br />
    <div>
      <h1 style="text-align: center">Habit Tracker</h1>
    </div>
    <div>
      <h2 style="text-align: center">This Week</h2>
    </div>
    <button @click="goToSchedulehabit()" class="btn btn-primary btn-block">
       <span>Schedule Habit</span>
    </button>
    <div v-if="loading">Loading habits . . .</div>
    <div v-else class="card card-container p-4">
      <div v-for="habit in habits" :key="habit.habit_id">
        <Habit :habit="habit"></Habit>
      </div>
    </div>
  </div>
</template>

<script>
import Api from "../api";
import { } from '../auth';
import Habit from "../components/Habit.vue";
import Navbar from "../components/Navbar.vue";
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
  methods: {
    goToSchedulehabit() {
   this.$router.push('/schedulehabit'); 
      }
  },
  components: { Habit, Navbar }
};
</script>
