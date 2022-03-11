<template>
  <div :style="{'background-color': this.habit.display_color}">
    <p>{this.habit.title + " " +
    this.habit.description + " " + 
    this.habit.category_name}</p>
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
    created: function () {}
  };
</script>
