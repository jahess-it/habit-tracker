<template>
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
