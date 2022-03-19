<template>
  <div style="background-color: #ADD8E6; padding: 25px;">
    <p>Username: {{ user.username }}<span v-if="admin"> (admin)</span></p>
    <p>Email: {{ user.email }}</p>
    <p>Mobile Phone #: {{ user.mobile_phone }}</p>
    <b-button v-if="admin" variant="warning" @click="confirmDemote()">Demote Admin</b-button>
    <b-button v-else variant="success" @click="confirmPromote()">Promote User</b-button>
    <b-button variant="danger" @click="confirmDelete()"><b-icon icon="trash"></b-icon></b-button>
  </div>
</template>

<script>
  import Api from "../api";
  
  export default {
    name: "user",
    props: {
      user: Object
    },
    data: function () {
      return {
        admin: false
      };
    },
    created: function () {
      this.admin = (this.user.privilege_level == "a");
    },
    methods: {
      confirmDemote() {
        this.$bvModal.msgBoxConfirm(`Demote admin user ${this.user.username} to basic user?`, {
          title: "Demote Admin",
          okVariant: "danger",
          okTitle: "Demote User"
        }).then((res) => {
          if (res) {
            //TODO: API call to demote user
            console.log(`${this.user.username} demoted`);
          }
        }).catch((err) => {
          console.log(err.response);
        });
      },
      confirmPromote() {
        this.$bvModal.msgBoxConfirm(`Promote basic user ${this.user.username} to admin user?`, {
          title: "Promote User",
          okVariant: "danger",
          okTitle: "Promote to Admin"
        }).then((res) => {
          if (res) {
            //TODO: API call to promote user
            console.log(`${this.user.username} promoted`);
          }
        }).catch((err) => {
          console.log(err.response);
        });
      },
      confirmDelete() {
        this.$bvModal.msgBoxConfirm(`Delete user ${this.user.username}?`, {
          title: "Delete User",
          okVariant: "danger",
          okTitle: "Delete"
        }).then((res) => {
          if (res) {
            //TODO: API call to delete user
            console.log(`${this.user.username} deleted`);
          }
        }).catch((err) => {
          console.log(err.response);
        });
      }
    }
  };
</script>
