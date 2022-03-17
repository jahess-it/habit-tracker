<template>
  <div>
    <Navbar location="createhabit"></Navbar>
    <HabitCreator></HabitCreator>
  </div>
</template>

<script>
import Api from "../api";
import { } from '../auth';
import HabitCreator from "../components/HabitCreator.vue";
import Habit from "../components/Habit.vue";
import Navbar from "../components/Navbar.vue";
import { getJwtToken } from "../auth";
import { getUserIdFromToken } from "../auth";

export default {
  components: { HabitCreator, Habit, Navbar }
};
</script>
