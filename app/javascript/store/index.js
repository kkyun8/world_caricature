import Vue from "vue/dist/vue.esm.js";
import Vuex from "vuex";
import auth from "./auth";
import env from "./env";
import error from "./error";
import message from "./message";

Vue.use(Vuex);

const store = new Vuex.Store({
  modules: {
    env,
    auth,
    error,
    message,
  },
});

export default store;
