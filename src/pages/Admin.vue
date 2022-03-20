<template>
  <div>
    <Navbar location="admin"></Navbar>
    <br />
    <div>
      <h1 style="text-align: center">Habit Tracker</h1>
    </div>

    <b-tabs content-class="mt-3" style="padding: 25px;">
      <b-tab title="Users" active>
        <div v-if="users_loading">Loading users . . .</div>
        <div v-else>
          <div v-for="user in users" :key="user.username">
            <User :user="user"></User>
          </div>
        </div>
      </b-tab>
      <b-tab title="Habits">
        <div v-if="habits_loading">Loading habits . . .</div>
        <div v-else>
          <div v-for="habit in habits" :key="habit.habit_id">
            <Habits :habit="habit"></Habits>
          </div>
        </div>
      </b-tab>
    </b-tabs>
  </div>
</template>

<script>
  import Api from "../api";
  import Navbar from "../components/Navbar.vue";
  import Habits from "../components/Habits.vue";
  import User from "../components/User.vue";
  
  export default {
    name: "admin",
    data: function () {
      return {
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
      Navbar,
      User
    }
  };
</script>
