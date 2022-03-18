<template>
  <div>
    <Navbar location="schedulehabit"></Navbar>
    <HabitScheduler></HabitScheduler>
  </div>
</template>

<script>
import Api from "../api";
import { } from '../auth';
import HabitScheduler from "../components/HabitScheduler.vue";
import Habit from "../components/Habit.vue";
import Navbar from "../components/Navbar.vue";
import { getJwtToken } from "../auth";
import { getUserIdFromToken } from "../auth";

export default {
  components: { HabitScheduler, Habit, Navbar }
};
</script>
