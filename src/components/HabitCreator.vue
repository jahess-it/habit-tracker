<template>
  <div>
    <b-breadcrumb>
      <b-breadcrumb-item to="/"> Habits </b-breadcrumb-item>
      <b-breadcrumb-item active>Add Habit</b-breadcrumb-item>
    </b-breadcrumb>
    <div class="card card-container p-4">
      <form name="form" @submit.prevent="handleAdd">
        <div>
          <div class="form-group">
            <label for="habitname">Habit Name</label>
            <input
              v-model="charname"
              type="text"
              class="form-control"
              name="title"
            />
          </div>
          <div class="form-group">
            <label for="optionalhabitdescription">Optional Habit Description</label>
            <textarea
              v-model="charlevel"
              class="form-control"
              name="description"
            />
          </div>
          <div class="form-group">
            <label for="habitcategory">Habit Category</label>
            <textarea
              v-model="charfeat"
              class="form-control"
              name="category_name"
            />
          </div>
          <div class="form-group">
            <button class="btn btn-primary btn-block" :disabled="loading">
              <span
                v-show="loading"
                class="spinner-border spinner-border-sm"
              ></span>
              <span>Add Habit</span>
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
  name: "HabitCreator",
  data() {
    return {
      title: "",
      content: "",
      loading: false,
      message: "",
    };
  },
  methods: {
    handleAdd() {
      this.loading = true;
      this.message = "";
      Api.addHabit({ title: this.title, content: this.content })
        .then(() => {
          this.loading = false;
          this.$router.push("/admin/");
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
