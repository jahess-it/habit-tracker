
<template>
  <div>
    <Navbar location="createcategory"></Navbar>
    <CategoryCreator></CategoryCreator>
  </div>
</template>

<script>
import Api from "../api";
import { } from '../auth';
import CategoryCreator from "../components/CategoryCreator.vue";
import Habit from "../components/Habit.vue";
import Navbar from "../components/Navbar.vue";
import { getJwtToken } from "../auth";
import { getUserIdFromToken } from "../auth";

export default {
  components: { CategoryCreator, Navbar }
};
</script>
