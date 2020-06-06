import Vue from "vue/dist/vue.esm.js";
import Vuex from "vuex";
import store from "../store/index";
import Router from "../routes/routes";
import BootstrapVue from "bootstrap-vue";
import axios from "axios";
import VueAxiosPlugin from "./plugins/vue-axios";
import App from "../components/app";
import "es6-promise/auto";
import InfiniteLoading from "vue-infinite-loading";
import { library } from "@fortawesome/fontawesome-svg-core";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { fas } from "@fortawesome/free-solid-svg-icons";
import { fab } from "@fortawesome/free-brands-svg-icons";
import { far } from "@fortawesome/free-regular-svg-icons";
import aws from "./plugins/aws";

Vue.mixin(aws);

Vue.use(Vuex);
Vue.use(VueAxiosPlugin, { axios: axios });
Vue.use(BootstrapVue);
Vue.use(InfiniteLoading);

library.add(fas, far, fab);

Vue.component("font-awesome-icon", FontAwesomeIcon);

const app = new Vue({
  router: Router,
  el: "#app",
  store,
  components: { App },
  template: "<App />",
});
