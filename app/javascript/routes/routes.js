import Vue from 'vue/dist/vue.esm.js'
import VueRouter from 'vue-router'
import Index from '../components/index'
import SampleImages from '../components/sample_images/sample_images'
import AboutTheOrder from '../components/about_the_order/about_the_order'
import Order from '../components/order/order'
import Contact from '../components/contact/contact'
import Payment from '../components/payment/payment'
import NotFound from '../components/common/not_found'
import PaymentSuccess from '../components/payment/payment_success'

Vue.use(VueRouter)

export default new VueRouter({
  mode: 'history',
  routes: [
    { path: '/', component: Index },
    { path: '/sample_images', component: SampleImages },
    { path: '/about_the_order', component: AboutTheOrder },
    { path: '/sample_images/:id/order', component: Order, props: true },
    { path: '/payment/:order_number', component: Payment },
    { path: '/not_found/:order_number', component: NotFound },
    { path: '/payment/:order_number/success', component: PaymentSuccess },
    { path: '/contact', component: Contact }
  ],
})