<template>
  <div :style="{'background-color': this.habit.display_color}" style="padding: 25px;">
  <p :style="this.habit.complete ? 'text-decoration' : ''">
    <span><b>{{this.habit.title}} on {{this.habit.day}}</b></span>
    <span style="float:right"> Complete: {{this.habit.complete}} 
      <b-button type="button" class="btn-sm" @click="handleComplete()"> Completed </b-button>
    </span>

    <form v-if="habit.timed" name="form" @submit.prevent="handleTime">
      Time Spent: {{this.habit.time_spent}}
      <span class="form-group">
      <input type="text" placeholder="Input Time" class="form-group" v-model="time_spent" name="time_spent">
      <b-button type="submit" class="form-group btn-sm" style="vertical-align: bottom;"> Submit Time </b-button> </span>
    </form>
    <form v-if="habit.ratable" name="form" @submit.prevent="handleRating">
      Habit Rating: {{this.habit.habit_rating}}
      <span class="form-group">
      <input type="text" placeholder="Input Rating" class="form-group" v-model="habit_rating" name="habit_rating">
      <b-button type="submit" class="form-group btn-sm" style="vertical-align: bottom;"> Submit Rating </b-button> </span>
    </form>
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
        time_spent: this.time_spent
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
        habit_rating: this.habit_rating
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
