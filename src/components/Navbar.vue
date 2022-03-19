<template>
  <div class="topnav">
    <a :class="{ active: location == 'home' }" href="/">Home</a>
    <a :class="{ active: location == 'week' }" href="/week">Week</a>
    <a :class="{ active: location == 'month' }" href="/month">Month</a>
    <a :class="{ active: location == 'journals' }" href="/journals">Journals</a>
    <a :class="{ active: location == 'createhabit' }" href="/createhabit">Create Habit</a>
    <a :class="{ active: location == 'schedulehabit' }" href="/schedulehabit">Schedule Habit</a>
    <a :class="{ active: location == 'logout' }" style="float:right" href="/logout">Logout</a>
    <a :class="{ active: location == 'account' }" style="float:right" href="/account">Account</a>
    <a v-if="admin" :class="{ active: location == 'admin' }" style="float:right" href="/admin">Admin</a>
  </div>
</template>

<script>
  import { getRoleFromToken, getJwtToken } from "../auth";

  export default {
    name: "navbar",
    props: {
      location: String
    },
    data: function () {
      return {
        admin: false
      };
    },
    created: function () {
      this.admin = getRoleFromToken(getJwtToken()) == "a";
    }
  };
</script>
