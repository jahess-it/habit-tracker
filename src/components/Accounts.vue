<template>
  <div>
    <p>
      <b>Username:</b> {{this.account.username}}
      </p>
      <p>
      <b>Email:</b> {{this.account.email}}
      </p>
      <b>Mobile Phone:</b> {{this.account.mobile_phone}}
  </div>
</template>

<script>
  export default {
    name: "accounts",
    props: {
      account: Object
    },
    data: function () {
      return {};
    },
    created: function () {}
  };
</script>
