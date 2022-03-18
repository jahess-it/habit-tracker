<template>
  <Navbar location="admin"></Navbar>
  
  <div>
    <b-form-group>
      <b-form-radio v-model="show_users" value="true">Show Users</b-form-radio>
      <b-form-radio v-model="show_users" value="false">Show Habits</b-form-radio>
    </b-form-group>
  </div>
  
  <div v-if="show_users">
    <div v-for="user in users" :key="user.username">
      <p>Placeholder</p>
    </div>
  </div>
  <div v-else>
    <div v-for="habit in habits" :key="habit.habit_id">
      <Habit :habit="habit"></Habit>
    </div>
  </div>
</template>

<script>
  import Api from "../api";
  import Navbar from "../components/Navbar.vue";
  import Habit from "../components/Habit.vue";
  
  export default {
    name: "admin",
    data: function () {
      return {
        show_users: true,
        users: [],
        habits: []
      };
    },
    created: function () {
      this.users = Api.getAllAccounts();
      this.habits = Api.getAllHabits();
    },
    components: {
      Habit,
      Navbar
    }
  }
</script>
