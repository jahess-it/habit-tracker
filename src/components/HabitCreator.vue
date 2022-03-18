<template>
  <div>
    <div class="card card-container p-4">
      <form name="form" @submit.prevent="handleAdd">
        <div>
          <div class="form-group">
            <label for="title">Habit Name</label>
            <input
              v-model="title"
              type="text"
              class="form-control"
              name="title"
            />
          </div>
          <div class="form-group">
            <label for="category_name">Habit Category</label>
            <input
              v-model="category_name"
              type="text"
              class="form-control"
              name="category_name"
            />
          </div>
          <div class="form-group">
            <label for="description">Description (Optional)</label>
            <input
              v-model="description"
              type="text"
              class="form-control"
              name="description"
            />
          </div>
          <div class="form-group">
            <Checkbox
              v-model="timed"
              name="timed"
              text="timed"
            />
          </div>
          <div class="form-group">
            <label for="ratable">Ratable</label>
            <input
              v-model="ratable"
              type="text"
              class="form-control"
              name="ratable"
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
import Checkbox from "./checkbox.vue";

export default {
  components: { Checkbox },
  name: "HabitCreator",
  data() {
    return {
      timed: false,
      ratable: "",
      title: "",
      category_name: "",
      description: "",
      loading: false,
      message: "",
    };
  },
  methods: {
    handleAdd() {
      this.loading = true;
      this.message = "";
      Api.addHabit({
        timed: this.timed,
        ratable: this.ratable,
        title: this.title,
        category_name: this.category_name,
        description: this.description,
      })
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
