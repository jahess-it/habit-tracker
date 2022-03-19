<template>
  <div>
    <div class="card card-container p-4">
      <form name="form" @submit.prevent="handleAdd">
        <div>
          <div class="form-group">
            <label for="habit_id">Habit Name</label>
            <b-form-select
              v-model="habit_id"
              :options="habits"
              class="form-control"
              name="habit_id"
            />
          </div>
          <div class="form-group">
            <label for="day">Day</label>
            <b-form-datepicker
              v-model="day"
              :min="new Date()"
              class="form-control"
              name="day"
            />
          </div>

          <div class="form-group">
            <button class="btn btn-primary btn-block" :disabled="loading">
              <span
                v-show="loading"
                class="spinner-border spinner-border-sm"
              ></span>
              <span>Schedule Habit</span>
            </button>
          </div>
        </div>
      </form>

      <div v-if="message" class="alert alert-danger">
        {{ message }}
      </div>
    </div>
  </div>
</template>

<script>
import Api from "../api";
import { getJwtToken, getUserIdFromToken } from "../auth";

export default {
  name: "HabitScheduler",
  data() {
    return {
      habit_id: "",
      day: "",
      complete: false,
      loading: false,
      message: "",
      habits: []
    };
  },
  created: function () {
    Api.getAllHabits(getUserIdFromToken(getJwtToken())).then((res) => {
      for (var habit of res.data) {
        this.habits.push({
          value: habit.habit_id,
          text: habit.title
        });
      }
    });
  },
  methods: {
    handleAdd() {
      this.loading = true;
      this.message = "";
      Api.addDaySummary({ day: this.day }).then((_) => {
        Api.addHabitInstance({
          habit_id: this.habit_id,
          day: this.day,
          complete: this.complete,
        }).then((_) => {
          this.loading = false;
          this.$router.push("/");
        }).catch((error) => {
          console.log(error);
          if (error.response) {
            this.message = error.response.data.message;
          }
          this.loading = false;
        });
      }).catch((error) => {
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
