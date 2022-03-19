<template>
  <div>
    <div class="card card-container p-4">
      <form name="form" @submit.prevent="handleAdd">
        <div>
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
            <label for="journal">Journal Entry</label>
            <input
              v-model="journal"
              type="text"
              class="form-control"
              name="journal"
            />
          <div class="form-group">
            <label for="day_rating">Rating</label>
            <b-form-rating
              v-model="day_rating"
              type="real"
              variant="success"
              show-value
              show-value-max
              class="form-control"
              name="day_rating"
            ></b-form-rating>
          </div>

          <div class="form-group">
            <button class="btn btn-primary btn-block" :disabled="loading">
              <span
                v-show="loading"
                class="spinner-border spinner-border-sm"
              ></span>
              <span>Create Journal Entry</span>
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
  name: "JournalCreator",
  data() {
    return {
      journal: "",
      day: "",
      day_rating: "",
      loading: false,
      message: ""
    };
  },
  methods: {
    handleAdd() {
      this.loading = true;
      this.message = "";
      Api.addDaySummary({ 
          day: this.day,
          journal: this.journal,
          day_rating: this.day_rating,
        })
        .then(() => {
          this.loading = false;
          this.$router.push("/journals");
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
