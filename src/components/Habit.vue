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
      newHabit: Object
      };
    },
    created: function () {
    },
    methods: {
    handleAdd() {
      this.loading = true;
      this.message = "";
      newHabit = this.habit;
      newHabit.complete = !newHabit.complete;
      Api.updateHabitInstance({
        newHabit
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
