<template>
  <div>
    <p>
      Username: {{this.account.username}}
      </p>
      <p>
      Email: {{this.account.email}} <button type="button">Change Email</button>
      </p>
      Mobile Phone: {{this.account.mobile_phone}} <button type="button">Change Number</button>
      <p>
      <button type="button">Change Password</button>
      </p>
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
