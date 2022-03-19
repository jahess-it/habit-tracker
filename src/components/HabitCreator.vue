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
            <label for="category_name"
              >Habit Category
              <router-link to="/createcategory">(Create)</router-link>
            </label>
            <b-form-select
              name="category_name"
              v-model="category_name"
              :options="categories"
            ></b-form-select>
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
            <b-form-checkbox
              id="checkbox-1"
              v-model="timed"
              name="checkbox-1"
              value="true"
              unchecked-value="false"
            >
              Timed
            </b-form-checkbox>
          </div>
          <div class="form-group">
            <b-form-checkbox
              id="checkbox-1"
              v-model="ratable"
              name="checkbox-1"
              value="true"
              unchecked-value="false"
            >
              Ratable
            </b-form-checkbox>
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
import { getJwtToken, getUserIdFromToken } from "../auth";
import Checkbox from "./Checkbox";

export default {
  components: { Checkbox },
  name: "HabitCreator",
  data() {
    return {
      timed: false,
      ratable: false,
      title: "",
      category_name: "",
      description: "",
      loading: false,
      message: "",
      categories: [],
    };
  },
  created: function () {
    Api.getCategories(getUserIdFromToken(getJwtToken())).then((res) => {
      for (var category of res.data) {
        this.categories.push({
          value: category.category_name,
          text: category.category_name,
        });
      }
    });
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
