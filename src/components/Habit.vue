<template>
  <div :style="{'background-color': _habit.display_color}">
    <p>{{_habit.title}}</p>
  </div>
</template>

<script>
  export default {
    name: "habit",
    props: {
      habit
    },
    data: function () {
      return {
        _habit: null
      };
    },
    created: function () {
      _habit = this.habit
    },
  };
</script>
