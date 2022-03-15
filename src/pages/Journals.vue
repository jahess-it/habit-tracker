<template>
  <div>
    <div class="topnav">
      <a href="/">Home</a>
      <a href="/Week">Week</a>
      <a href="/Month">Month</a>
      <a class="active" href="/Journals">Journals</a>
    </div>
    <br />
    <div>
      <h1 style="text-align: center">Habit Tracker</h1>
    </div>
    <div>
      <h2 style="text-align: center">Your Journal</h2>
    </div>
    <div v-if="loading">Loading journals . . .</div>
    <ul v-else>
      <div v-for="journal in journals" :key="journal.day">
        <Journal :journal="journal"></Journal>
      </div>
    </ul>
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
