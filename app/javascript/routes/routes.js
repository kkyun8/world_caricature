import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Index from '../components/index.vue'
import SampleImages from '../components/sample_images/sample_images.vue'
import AboutTheOrder from '../components/about_the_order/about_the_order.vue'
import Contact from '../components/contact/contact.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Index },
    { path: '/sample_images', component: SampleImages },
    { path: '/about_the_order', component: AboutTheOrder },
    { path: '/contact', component: Contact }
  ],
})