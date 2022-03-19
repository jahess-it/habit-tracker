<template>
  <div>
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
      admin: false
    },
    created: function () {
      this.admin = (user.privilege_level == "a");
    },
    methods: {
      confirmDemote() {
        this.$vbModal.msgBoxConfirm(`Demote admin user ${user.username} to basic user?`, {
          title: "Demote Admin",
          okVariant: "danger",
          okTitle: "Demote User"
        }).then((res) = > {
          //TODO: API call to demote user
        }).catch((err) => {
          console.log(err.response);
        });
      }
    }
  };
</script>
