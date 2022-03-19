<template>
  <div :style="{'background-color': this.habit.display_color}">
    <p><b>{{this.habit.title}}</b>
    Time Spent: {{this.habit.time_spent}} <button type="button">Input Time</button>
    Habit Rating: {{this.habit.habit_rating}} <button type="button">Input Rating</button>
    Day: {{this.habit.day}} 
    Complete: {{this.habit.complete}} <button type="button" @click="handleAdd()"> Completed </button>
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
      time_spent: 0,
      habit_rating: 0,
      day: "",
      complete: false,
      };
    },
    created: function () {
    },
    methods: {
    handleAdd() {
      this.loading = true;
      this.message = "";
      Api.updateHabitInstance({
        title: this.title,
        time_spent: this.time_spent,
        habit_rating: this.habit_rating,
        day: this.day,
        complete: !this.complete,
      })
        .then(() => {
          this.loading = false;
          this.$router.push("/");
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
