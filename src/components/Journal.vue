<template>
  <div style="background-color: #ADD8E6">
    <p>
    <b>Day: {{this.journal.day}}</b>
    Entry: {{this.journal.journal}}
    Rating: {{this.journal.day_rating}}
    </p>
  </div>
</template>

<script>
  export default {
    name: "Journal",
    props: {
      journal: Object
    },
    data: function () {
      return {};
    },
    created: function () {}
  };
</script>
