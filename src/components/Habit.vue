<template>
  <div :style="{'background-color': this.habit.display_color}">
    <p>
    <span :style="float:left"> {{this.habit.title}} </span>
    <span> {{this.habit.description}} </span>
    <span :style="float:right"> {{this.habit.cetegory_name}} </span>
    </p>
  </div>
  <div :style="{'background-color': this.habit.display_color}">
    <p>{{this.habit.title}}</p>
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
