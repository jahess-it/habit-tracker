<template>
  <div :style="{'background-color': this.habit.display_color}">
    <p><b>{{this.habit.title}}</b>
    Time Spent: {{this.habit.time_spent}} <button type="button">Input Time</button>
    Habit Rating: {{this.habit.habit_rating}} 
    <form name="form" @submit.prevent="handleRating"> 
    <div class="form-group">
    <input type="text" class="form-group" v-model="habit_rating" name="habit_rating"> </div>
    <input type="submit"> </form>
    Day: {{this.habit.day}} 
    Complete: {{this.habit.complete}} <button type="button" @click="handleComplete()"> Completed </button>
    </p>
  </div>
</template>

<script>
import Api from "../api";
import { getJwtToken, getUserIdFromToken } from "../auth";

  export default {
    name: "habit",
    props: {
      habit: Object
    },
    data () {
      return {
      title: "",
      habit_id: "",
      username: "",
      time_spent: 0,
      habit_rating: 0,
      day: "",
      complete: false,
      };
    },
    created: function () {
    },
    methods: {
    handleComplete() {
      this.loading = true;
      this.message = "";
      Api.updateHabitInstance({
        habit_id: this.habit.habit_id,
        username: this.habit.username,
        day: this.habit.day,
        complete: !this.habit.complete
      })
        .then(() => {
          this.loading = false;
          this.$router.go()
        })
        .catch((error) => {
          console.log(error);
          if (error.response) {
            this.message = error.response.data.message;
          }
          this.loading = false;
        });
    },
    handleTime() {
      this.loading = true;
      this.message = "";
      Api.updateHabitInstance({
        habit_id: this.habit.habit_id,
        username: this.habit.username,
        day: this.habit.day,
        complete: !this.habit.complete
      })
        .then(() => {
          this.loading = false;
          this.$router.go()
        })
        .catch((error) => {
          console.log(error);
          if (error.response) {
            this.message = error.response.data.message;
          }
          this.loading = false;
        });
    },
    handleRating() {
      this.loading = true;
      this.message = "";
      Api.updateHabitInstance({
        habit_id: this.habit.habit_id,
        username: this.habit.username,
        day: this.habit.day,
        habit_rating: this.habit.complete
      })
        .then(() => {
          this.loading = false;
          this.$router.go()
        })
        .catch((error) => {
          console.log(error);
          if (error.response) {
            this.message = error.response.data.message;
          }
          this.loading = false;
        });
    },
  },
};
</script>
