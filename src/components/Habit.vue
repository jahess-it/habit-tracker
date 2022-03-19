<template>
  <div :style="{'background-color': this.habit.display_color}">
    <p><b>{{this.habit.title}}</b>
    Time Spent: {{this.habit.time_spent}} <button type="button">Input Time</button>
    Habit Rating: {{this.habit.habit_rating}} <button type="button">Input Rating</button>
    Day: {{this.habit.day}} <button type="button" @click="goToRegister()"> Completed </button>
    </p>
  </div>
</template>

<script>
  export default {
    name: "habit",
    props: {
      habit: Object
    },
    data: function () {
      return {};
    },
    created: function () {},
    methods: {
      updateCompleted() {
        this.habit.complete = !this.habit.complete
        Api.updateHabitInstance({ this.habit }).then((_) => {
        }).catch((error) => {
          console.log(error);
          if (error.response) {
            this.message = error.response.data.message;
          }
          this.loading = false;
        });
    }
  };
</script>


  data() {
    return {
      category_name: "",
      loading: false,
      message: "",
      display_color: null,
        options: [
          { value: null, text: 'Please select a color' },
          { value: '#C8E0FA', text: 'Blue' },
          { value: '#F4ACA8', text: 'Red' },
          { value: '#FFC8A1', text: 'Orange' },
          { value: '#C3FAC2', text: 'Green' },
          { value: '#FFEDB9', text: 'Yellow' },
          { value: '#D3D3D3', text: 'Gray' }
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
