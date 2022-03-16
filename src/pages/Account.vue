<template>
  <div>
    <div class="topnav">
      <a href="/">Home</a>
      <a href="/Week">Week</a>
      <a href="/Month">Month</a>
      <a href="/Journals">Journals</a>
      <a style="float:right" href="/logout">Logout</a>
      <a class="active" style="float:right" href="/Account">Account</a>
    </div>
    <br />
    <div>
      <h1 style="text-align: center">Habit Tracker</h1>
    </div>
    <div>
      <h2 style="text-align: center">Your Account</h2>
    </div>
    <div v-if="loading">Loading account . . .</div>
    <div v-else>
      <p>
      Username: {{this.account.username}}
      </p>
      <p>
      Email: {{this.account.email}} <button type="button">Change Email</button>
      </p>
      Mobile Phone: {{this.habit.mobile_phone}} <button type="button">Change Number</button>
      <p>
      <button type="button">Change Password</button>
      </p>
    </div>
  </div>
</template>

<script>
import Api from "../api";
import { } from '../auth';
import { getJwtToken } from "../auth";
import { getUserIdFromToken } from "../auth";
export default {
  name: "Account",
  data: function () {
    return {
      loading: false,
      account: []
    };
  },
  created: function () {
    this.loading = true;
    this.token = getJwtToken();
    this.username = getUserIdFromToken(this.token);
    Api.getAccount(this.username).then((res) => {
      this.account = res.data;
      this.loading = false;
    });
  },
  components: { }
};
</script>
