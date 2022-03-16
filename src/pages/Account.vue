<template>
  <Navbar :location="account"></Navbar>
    <br />
    <div>
      <h1 style="text-align: center">Habit Tracker</h1>
    </div>
    <div>
      <h2 style="text-align: center">Your Account</h2>
    </div>
    <div v-if="loading">Loading Account . . .</div>
    <div v-else>
    <div v-for="account in accounts" :key="account.username">
      <Accounts :account="account"></Accounts>
    </div>
    </div>
  </div>
</template>

<script>
import Api from "../api";
import { } from '../auth';
import Accounts from "../components/Accounts.vue";
import Navbar from "../components/Navbar.vue"
import { getJwtToken } from "../auth";
import { getUserIdFromToken } from "../auth";
export default {
  name: "Account",
  data: function () {
    return {
      loading: false,
      accounts: []
    };
  },
  created: function () {
    this.loading = true;
    this.token = getJwtToken();
    this.username = getUserIdFromToken(this.token);
    Api.getAccount(this.username).then((res) => {
      this.accounts = res.data;
      this.loading = false;
    });
  },
  components: { Accounts, Navbar }
};
</script>
