<template>
  <div>
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
            <label for="habitname">Habit Category</label>
            <input
              v-model="charname"
              type="text"
              class="form-control"
              name="title"
            />
          </div>
          <div class="form-group">
            <label for="habitname">Description (Optional)</label>
            <input
              v-model="charname"
              type="text"
              class="form-control"
              name="title"
            />
          </div>
          <div class="form-group">
            <label class="radio" :for="id">
              <input
                type="radio"
                :id="id"
                class="radio-button"
                :value="value"
                :name="name"
              />
              Timed
            </label>
          </div>
          <div class="form-group">
            <label class="radio" :for="id">
              <input
                type="radio"
                :id="id"
                class="radio-button"
                :value="value"
                :name="name"
              />
              Ratable
            </label>
          </div>

          <div>
            <label for="habitname">Schedule for these dates:</label>
              <v-row>
                <v-col cols="12" sm="6">
                  <v-date-picker v-model="dates" multiple></v-date-picker>
                </v-col>
                <v-col cols="12" sm="6">
                  <v-menu
                    ref="menu"
                    v-model="menu"
                    :close-on-content-click="false"
                    :return-value.sync="dates"
                    transition="scale-transition"
                    offset-y
                    min-width="auto"
                  >
                    <template v-slot:activator="{ on, attrs }">
                      <v-combobox
                        v-model="dates"
                        multiple
                        chips
                        small-chips
                        label="Multiple picker in menu"
                        prepend-icon="mdi-calendar"
                        readonly
                        v-bind="attrs"
                        v-on="on"
                      ></v-combobox>
                    </template>
                    <v-date-picker v-model="dates" multiple no-title scrollable>
                      <v-spacer></v-spacer>
                      <v-btn text color="primary" @click="menu = false">
                        Cancel
                      </v-btn>
                      <v-btn
                        text
                        color="primary"
                        @click="$refs.menu.save(dates)"
                      >
                        OK
                      </v-btn>
                    </v-date-picker>
                  </v-menu>
                </v-col>
              </v-row>
            </template>
          </div>
        </div>
      </form>
    </div>
  </div>

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
  name: "CategoryCreator",
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
      Api.addCategory({ title: this.title, content: this.content })
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
