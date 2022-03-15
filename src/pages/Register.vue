<template>
  <div class="col-md-12">
    <div class="card card-container">
      <img
        id="profile-img"
        src="//ssl.gstatic.com/accounts/ui/avatar_2x.png"
        class="profile-img-card"
      />
      <form name="form" @submit.prevent="handleRegister">
        <div>
          <div class="form-group">
            <label for="username">Username</label>
            <input
              v-model="username"
              type="text"
              class="form-control"
              name="username"
            />
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input
              v-model="email"
              type="email"
              class="form-control"
              name="email"
            />
          </div>
          <div class="form-group">
            <label for="mobile_phone">Mobile Phone</label>
            <input
              v-model="mobile_phone"
              type="tel"
              class="form-control"
              name="mobile_phone"
            />
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input
              v-model="password"
              type="password"
              class="form-control"
              name="password"
            />
          </div>
          <div class="form-group">
            <button class="btn btn-primary btn-block" :disabled="loading">
              <span
                v-show="loading"
                class="spinner-border spinner-border-sm"
              ></span>
              <span>Register</span>
            </button>
          </div>
        </div>
      </form>

       <button @click="goToLogin()" class="btn btn-primary btn-block" :disabled="loading">
              <span
                v-show="loading"
                class="spinner-border spinner-border-sm"
              ></span>
              <span>Login Page</span>
        </button>

      <div v-if="message" class="alert alert-danger">
        {{ message }}
      </div>
    </div>
  </div>
</template>

<script>
import Api from "../api";
export default {
  name: "Register",
  data() {
    return {
      username: "",
      email: null,
      mobile_phone: null,
      password: "",
      loading: false,
      message: "",
    };
  },
  methods: {
    handleRegister() {
      this.message = "";
      this.loading = true;

      Api.register(this.username, this.password, this.email, this.mobile_phone)
        .then(() => {
          this.$router.push("/login");
        })
        .catch((error) => {
          console.log(error);
          if (error.response) {
            this.message = error.response.data.message;
          }
          this.loading = false;
        });
    },
    goToLogin() {
   this.$router.push('/login'); 
      }
  },
};
</script>

<style scoped>
label {
  display: block;
  margin-top: 10px;
}

.card-container.card {
  max-width: 350px !important;
  padding: 40px 40px;
}

.card {
  background-color: #f7f7f7;
  padding: 20px 25px 30px;
  margin: 0 auto 25px;
  margin-top: 50px;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.profile-img-card {
  width: 96px;
  height: 96px;
  margin: 0 auto 10px;
  display: block;
  -moz-border-radius: 50%;
  -webkit-border-radius: 50%;
  border-radius: 50%;
}
</style>
