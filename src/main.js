import Vue from "vue";
import VueRouter from "vue-router";
import { BootstrapVue, IconsPlugin } from "bootstrap-vue";

import App from "./App.vue";
import Home from "./pages/Home";
import Admin from "./pages/Admin";
import Login from "./pages/Login";
import Logout from "./pages/Logout";
import Register from "./pages/Register";
import Week from "./pages/Week";
import Month from "./pages/Month";
import Journals from "./pages/Journals";
import Account from "./pages/Account";
import CreateHabit from "./pages/CreateHabit";
import ScheduleHabit from "./pages/ScheduleHabit";
import CreateCategory from "./pages/CreateCategory";
import CreateJournal from "./pages/CreateJournal";

Vue.config.productionTip = false;
Vue.config.devtools = true;

import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";
import { getJwtToken, getRoleFromToken } from "./auth";

Vue.use(BootstrapVue);
Vue.use(IconsPlugin);
Vue.use(VueRouter);

const checkAuth = function(to, _, next) {
  const token = getJwtToken();
  if (token === undefined || token === "undefined" || token === null) {
    // redirect to login because we don't have token yet
    next({
      path: "/login",
      params: { nextUrl: to.fullPath },
    });
  } else {
    next();
  }
};

const checkAdmin = function(to, _, next) {
  const token = getJwtToken();
  if (token === undefined || token === "undefined" || token === null) {
    // redirect to login because we don't have token yet
    next({
      path: "/login",
      params: { nextUrl: to.fullPath }
    });
  } else if (getRoleFromToken(token) != "a") {
    // redirect to home because user is unauthorized
    next({
      path: "/"
    });
  } else {
    next();
  }
};

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: Home, beforeEnter: checkAuth },
    { path: "/week", component: Week, beforeEnter: checkAuth },
    { path: "/month", component: Month, beforeEnter: checkAuth },
    { path: "/journals", component: Journals, beforeEnter: checkAuth },
    { path: "/account", component: Account, beforeEnter: checkAuth },
    { path: "/schedulehabit", component: ScheduleHabit, beforeEnter: checkAuth },
    { path: "/createhabit", component: CreateHabit, beforeEnter: checkAuth },
    { path: "/createcategory", component: CreateCategory, beforeEnter: checkAuth },
    { path: "/createjournal", component: CreateJournal, beforeEnter: checkAuth },
    { path: "/login", component: Login },
    { path: "/logout", component: Logout },
    { path: "/register", component: Register },
    {
      path: "/admin",
      component: Admin,
      beforeEnter: checkAdmin,
    },
  ]
});

new Vue({
  router,
  render: (h) => h(App),
}).$mount("#app");
