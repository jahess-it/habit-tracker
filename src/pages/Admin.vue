<template>
  <div>
    <Navbar location="admin"></Navbar>

    <div>
      <b-button variant="primary" :pressed.sync="show_users">
        {{ show_users ? "Show Habits" : "Show Users" }}
      </b-button>
    </div>

    <div v-if="show_users">
      <div v-if="users_loading">Loading users . . .</div>
      <div v-else>
        <div v-for="user in users" :key="user.username">
          <p>Placeholder</p>
        </div>
      </div>
    </div>
    <div v-else>
      <div v-if="habits_loading">Loading habits . . .</div>
      <div v-else>
        <div v-for="habit in habits" :key="habit.habit_id">
          <Habits :habit="habit"></Habit>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import Api from "../api";
  import Navbar from "../components/Navbar.vue";
  import Habits from "../components/Habits.vue";
  
  export default {
    name: "admin",
    data: function () {
      return {
        show_users: true,
        users_loading: true,
        users: [],
        habits_loading: true,
        habits: []
      };
    },
    created: function () {
      Api.getAllAccounts().then((res) => {
        this.users = res.data;
        this.users_loading = false;
      });
      Api.getAllHabits().then((res) => {
        this.habits = res.data;
        this.habits_loading = false;
      });
    },
    components: {
      Habits,
      Navbar
    }
  };
</script>
