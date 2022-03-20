<template>
  <div style="background-color: #ADD8E6; padding: 25px;">
  <p>
    <span><b>{{this.habit.title}} </b> in {{this.habit.category_name}} </span>
    <span style="float:right"> Timed: {{this.habit.timed}} 
      <b-button type="button" class="btn-sm" @click="handleTimed()"> Toggle Timed </b-button>
    </span>
    <span style="float:right"> Ratable: {{this.habit.ratable}} 
      <b-button type="button" class="btn-sm" @click="handleRatable()"> Toggle Ratable </b-button>
    </span>
    </p>
    <p>
    <span> Description: {{this.habit.description}} </span>



    <form name="form" @submit.prevent="handleTitle"> 
      Change Title:
      <span class="form-group">
      <input type="text" placeholder="Input New Title" class="form-group" v-model="title" name="title">
      <!--<input type="submit" class="form-group" value="Change Title"></span> -->
      <b-button type="submit" class="form-group btn-sm" style="vertical-align: bottom;"> Change Title </b-button> </span>
    </form>
    <form name="form" @submit.prevent="handleDescription"> 
      Change Description:
      <span class="form-group">
      <input type="text" placeholder="Input New Description" class="form-group" v-model="description" name="description">
      <!--<input type="submit" class="form-group" value="Change Description"></span> -->
      <b-button type="submit" class="form-group btn-sm" style="vertical-align: bottom;"> Change Description </b-button> </span>
    </form>
    <b-button
      @click="() => handleDelete()"
      variant="danger"
      ><b-icon icon="trash">
    </b-button>

    </p>
  </div>
  
</template>

<script>
import Api from "../api";
import { getJwtToken, getUserIdFromToken } from "../auth";
export default {
  name: "habit",
  props: {
    habit: Object,
  },
  data() {
    return {
      title: "",
      habit_id: "",
      username: "",
      description: "",
      category_name: "",
      timed: false,
      ratable: false,
    };
  },
  created: function () {},
  methods: {
    handleTimed() {
      this.loading = true;
      this.message = "";
      Api.updateHabit({
        habit_id: this.habit.habit_id,
        timed: !this.habit.timed,
      })
        .then(() => {
          this.loading = false;
          this.$router.go();
        })
        .catch((error) => {
          console.log(error);
          if (error.response) {
            this.message = error.response.data.message;
          }
          this.loading = false;
        });
    },
    handleRatable() {
      this.loading = true;
      this.message = "";
      Api.updateHabit({
        habit_id: this.habit.habit_id,
        ratable: !this.habit.ratable,
      })
        .then(() => {
          this.loading = false;
          this.$router.go();
        })
        .catch((error) => {
          console.log(error);
          if (error.response) {
            this.message = error.response.data.message;
          }
          this.loading = false;
        });
    },
    handleTitle() {
      this.loading = true;
      this.message = "";
      Api.updateHabit({
        habit_id: this.habit.habit_id,
        title: this.title,
      })
        .then(() => {
          this.loading = false;
          this.$router.go();
        })
        .catch((error) => {
          console.log(error);
          if (error.response) {
            this.message = error.response.data.message;
          }
          this.loading = false;
        });
    },
    handleDescription() {
      this.loading = true;
      this.message = "";
      Api.updateHabit({
        habit_id: this.habit.habit_id,
        description: this.description,
      })
        .then(() => {
          this.loading = false;
          this.$router.go();
        })
        .catch((error) => {
          console.log(error);
          if (error.response) {
            this.message = error.response.data.message;
          }
          this.loading = false;
        });
    },
    handleDelete(habit) {
      this.loading = true;
      this.message = "";
      this.$bvModal.msgBoxConfirm(`Delete habit ${this.habit}?`, {
        title: "Delete Habit",
        okVariant: "danger",
        okTitle: "Delete"
      }).then((res) => {
        if (res) {
          Api.deleteHabit(this.habit.habit_id).then(() => {
            this.loading = false;
            this.$router.go();
          });
        }
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
