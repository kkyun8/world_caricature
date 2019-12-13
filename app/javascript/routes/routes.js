import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Index from '../components/index.vue'
import SampleImages from '../components/sample_images/sample_images.vue'
import AboutTheOrder from '../components/about_the_order/about_the_order.vue'
import Order from '../components/order/order.vue'
import Payment from '../components/payment/payment.vue'
import Contact from '../components/contact/contact.vue'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Index },
    { path: '/sample_images', component: SampleImages },
    { path: '/about_the_order', component: AboutTheOrder },
    { path: '/sample_images/:id/order', component: Order, props: true },
    { path: '/payment/:id', component: Payment },
    { path: '/contact', component: Contact }
  ],
})