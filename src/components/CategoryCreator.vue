<template>
  <div>
    <div class="card card-container p-4">
      <form name="form" @submit.prevent="handleAdd">
        <div>
          <div class="form-group">
            <label for="habitname">Category Name</label>
            <input
              v-model="category_name"
              type="text"
              class="form-control"
              name="category_name"
            />
          </div>
          <div class="form-group">
            <div>
              <b-form-select
                v-model="display_color"
                :options="options"
              ></b-form-select>
            </div>
          </div>
          <div class="form-group">
            <button class="btn btn-primary btn-block" :disabled="loading">
              <span
                v-show="loading"
                class="spinner-border spinner-border-sm"
              ></span>
              <span>Add Category</span>
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
  name: "CategoryCreator",
  data() {
    return {
      category_name: "",
      loading: false,
      message: "",
      display_color: null,
        options: [
          { value: null, text: 'Please select an option' },
          { value: '#FF0000', text: 'Red' },
          { value: '#00FF00', text: 'Green' }
        ]
    };
  },
  methods: {
    handleAdd() {
      this.loading = true;
      this.message = "";
      Api.addCategory({
        category_name: this.category_name,
        display_color: this.display_color,
      })
        .then(() => {
          this.loading = false;
          this.$router.push("/createhabit");
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
