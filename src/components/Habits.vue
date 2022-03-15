<template>
  <div :style="background-color: #ADD8E6">
    <p>{{this.habit.title}}
    Description: {{this.habit.description}}
    Timed: {{this.habit.timed}}
    Ratable: {{this.habit.ratable}}
    category_name: {{this.habit.category_name}}
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
    created: function () {}
  };
</script>
