import Vue from 'vue/dist/vue.esm.js'
import Vuex from 'vuex'
import Router from '../routes/routes'
import BootstrapVue from 'bootstrap-vue'
import axios from "axios"; 
import VueAxiosPlugin from "./plugins/vue-axios"
import MainNav from '../components/common/navbar'
import Footer from '../components/common/footer'
import 'es6-promise/auto'
import InfiniteLoading from 'vue-infinite-loading'
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'

require('dotenv').config();

Vue.use(Vuex)
Vue.use(VueAxiosPlugin, { axios: axios })
Vue.use(BootstrapVue)
Vue.use(InfiniteLoading)

library.add(fas, far, fab)

Vue.component('font-awesome-icon', FontAwesomeIcon)

// 検索機能のため、stateにsampleImages追加
export const store = new Vuex.Store({
  //state 宣言
  state: {
    sampleImages: [],
  },
  //stateを読み込むことができるgetters宣言
  getters: {
    getSampleImages: function (state) {
      return state.sampleImages
    }
  },
  //state変更ができるmutations宣言
  mutations: {
    setSampleImages(state, val) {
      state.sampleImages = val
    }
  },
});

var app = new Vue({
  router: Router,
  el: '#app',
  store,
  components: {
    'navbar': MainNav,
    'footerbar': Footer,
  }
});
