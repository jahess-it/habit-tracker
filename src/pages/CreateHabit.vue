<template>
  <div>
    <div class="topnav">
      <a href="/">Home</a>
      <a href="/Week">Week</a>
      <a href="/Month">Month</a>
      <a href="/Journals">Journals</a>      
      <a class="active" href="/CreateHabit">Create Habit</a>
      <a style="float:right" href="/logout">Logout</a>
      <a style="float:right" href="/Account">Account</a>
    </div>
  </div>
</template>

<script>
import Api from "../api";
import { } from '../auth';
import HabitCreator from "../components/HabitCreator.vue";
import Habit from "../components/Habit.vue";
import { getJwtToken } from "../auth";
import { getUserIdFromToken } from "../auth";
export default {
  
};
</script>
