<template>
  <div>
    <Navbar location="journals"></Navbar>
    <br />
    <div>
      <h1 style="text-align: center">Habit Tracker</h1>
    </div>
    <div>
      <h2 style="text-align: center">Your Journal</h2>
    </div>
    <button @click="goToCreatejournal()" class="btn btn-primary btn-block">
       <span>Log Journal Entry</span>
    </button>
    <div v-if="loading">Loading journals . . .</div>
    <div v-else class="card card-container p-4">
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
import Navbar from "../components/Navbar.vue";
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
  methods: {
    goToCreatejournal() {
   this.$router.push('/createjournal'); 
      }
  },
  components: { Journal, Navbar }
};
</script>
