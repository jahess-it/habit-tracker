<template>
  <div>
    <div class="topnav">
      <a href="/">Home</a>
      <a href="/Week">Week</a>
      <a href="/Month">Month</a>
      <a class="active" href="/Journals">Journals</a>
      <a style="float:right" href="/logout">Logout</a>
      <a style="float:right" href="/Account">Account</a>
    </div>
    <br />
    <div>
      <h1 style="text-align: center">Habit Tracker</h1>
    </div>
    <div>
      <h2 style="text-align: center">Your Journal</h2>
    </div>
    <div v-if="loading">Loading journals . . .</div>
    <div v-else>
      <div v-for="journal in journals" :key="String(journal.day)">
        <Journal :journal="journal"></Journal>
      </div>
    </div>
  </div>
</template>

<script>
import Api from "../api";
import { } from '../auth';
import Journal from "../components/Journal.vue";
import { getJwtToken } from "../auth";
import { getUserIdFromToken } from "../auth";
export default {
  name: "Journals",
  data: function () {
    return {
      loading: false,
      journals: []
    };
  },
  created: function () {
    this.loading = true;
    this.token = getJwtToken();
    this.username = getUserIdFromToken(this.token);
    Api.getJournals(this.username).then((res) => {
      this.journals = res.data;
      this.loading = false;
    });
  },
  components: { Journal }
};
</script>
