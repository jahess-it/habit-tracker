<template>
  <div>
    <div class="card card-container p-4">
      <form name="form" @submit.prevent="handleAdd">
        <div>
          <div class="form-group">
            <label for="habit_id">Habit ID</label>
            <input
              v-model="habit_id"
              type="text"
              class="form-control"
              name="habit_id"
            />
          </div>
          <div class="form-group">
            <label for="day">Day</label>
            <input
              v-model="day"
              type="text"
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
              <span>Add Habit Schedule</span>
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

export default {
  name: "HabitScheduler",
  data() {
    return {
      habit_id: "",
      day: "",
      loading: false,
      message: "",
    };
  },
  methods: {
    handleAdd() {
      this.loading = true;
      this.message = "";
      Api.addDaySummary({ day: this.day  })
      // Api.addHabitInstance({ habit_id: this.habit_id, day: this.day  })
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
