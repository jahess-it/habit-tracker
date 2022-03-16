<template>
  <div class="topnav">
    <a :class="{ active: location == 'home' }" href="/">Home</a>
    <a :class="{ active: location == 'week' }" href="/week">Week</a>
    <a :class="{ active: location == 'month' }" href="/month">Month</a>
    <a :class="{ active: location == 'journals' }" href="/journals">Journals</a>
    <a :class="{ active: location == 'createhabit' }" href="/create_habit">Create Habit</a>
    <a :class="{ active: location == 'admin' }" sytle="float:right" href="/admin">Admin</a>
    <a :class="{ active: location == 'logout' }" style="float:right" href="/logout">Logout</a>
    <a :class="{ active: location == 'account' }" style="float:right" href="/account">Account</a>
  </div>
</template>

<script>
  export default {
    name: "navbar",
    props: {
      location: String
    },
    data: function () {
      return {};
    },
    created: function () {}
  };
</script>
