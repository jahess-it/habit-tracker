<template>
  <div style="background-color: #ADD8E6">
    <p>
    <b>Day: {{this.habit.day}}</b>
    Entry: {{this.habit.journal}}
    Rating: {{this.habit.day_rating}}
    </p>
  </div>
</template>

<script>
  export default {
    name: "journal",
    props: {
      journal: Object
    },
    data: function () {
      return {};
    },
    created: function () {}
  };
</script>
