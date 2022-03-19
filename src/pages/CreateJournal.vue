<template>
  <div>
    <Navbar location="createhabit"></Navbar>
    <HabitCreator></HabitCreator>
  </div>
</template>

<script>
import Api from "../api";
import { } from '../auth';
import JournalCreator from "../components/JournalCreator.vue";
import Navbar from "../components/Navbar.vue";
import Habit from "../components/Habit.vue";
import { getJwtToken } from "../auth";
import { getUserIdFromToken } from "../auth";
export default {
  components: { JournalCreator, Habit, Navbar }
};
</script>
