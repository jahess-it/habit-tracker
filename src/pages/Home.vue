<template>
  <div>
    <Navbar location="home"></Navbar>
    <br />
    <div>
      <h1 style="text-align: center">Habit Tracker</h1>
    </div>
    
    <div>
      <h2 style="text-align: center">Your Habits</h2>
    </div>
    <button @click="goToCreatehabit()" class="btn btn-primary btn-block">
       <span>Create Habit</span>
    </button>
    <div v-if="loading1">Loading habits . . .</div>
    <div v-else class="card card-container p-4">
      <div v-for="habit in habitss" :key="habit.habit_id">
        <Habits :habit="habit"></Habits>
      </div>
    </div>
    
    <div>
      <h2 style="text-align: center">Upcoming Habits</h2>
    </div>
    <button @click="goToSchedulehabit()" class="btn btn-primary btn-block">
       <span>Schedule Habit</span>
    </button>
    <div v-if="loading2">Loading habits . . .</div>
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
import Habits from "../components/Habits.vue";
import Navbar from "../components/Navbar.vue";
import { getJwtToken } from "../auth";
import { getUserIdFromToken } from "../auth";

export default {
  name: "Home",
  data: function () {
    return {
      loading1: false,
      loading2: false,
      habits: [],
      habitss: []
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
  methods: {
    goToSchedulehabit() {
   this.$router.push('/schedulehabit'); 
      },
    goToCreatehabit() {
   this.$router.push('/createhabit'); 
      }
  },
  components: { Habit, Habits, Navbar }
};
</script>
