<template>
  <div>
    <p><b>Username:</b> {{this.account.username}}</p>
    <p><b>Email:</b> {{this.account.email}}</p>
    <p><b>Mobile Phone:</b> {{this.account.mobile_phone}}</p>
    <b-button variant="danger" @click="confirmDelete()">Delete My Account</b-button>
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
    created: function () {},
    methods: {
      confirmDelete() {
        this.$bvModal.msgBoxConfirm(
          "Delete your account? All data associated with your account will be deleted. This action cannot be undone!",
          {
            title: "Delete User",
            okVariant: "danger",
            okTitle: "Delete"
          }
        ).then((res) => {
          if (res) {
            console.log(this.account);
            Api.deleteUser(this.account).then((_) => {
              console.log("Deleted");
              this.$router.push("/logout");
            }).catch((err) => {
              console.log(err.response);
            });
          }
        }).catch((err) => {
          console.log(err.response);
        });
      }
    }
  };
</script>
