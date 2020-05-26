import Vue from "vue/dist/vue.esm.js";
import VueRouter from "vue-router";
import Index from "../components/index";
import SampleImages from "../components/sample_images/sample_images";
import SampleImageCreate from "../components/sample_images/create"
import AboutTheOrder from "../components/about_the_order/about_the_order";
import Order from "../components/order/order";
import Contact from "../components/contact/contact";
import Payment from "../components/payment/payment";
import NotFound from "../components/common/not_found";
import PaymentSuccess from "../components/payment/payment_success";
import News from "../components/news/news";
import Register from "../components/register/register";
import Login from "../components/login/login";

Vue.use(VueRouter);

export default new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: Index },
    { path: "/sample_images", component: SampleImages },
    { path: "/sample_images/new", component: SampleImageCreate },
    { path: "/about_the_order", component: AboutTheOrder },
    { path: "/sample_images/:id/order", component: Order, props: true },
    { path: "/payment/:order_number", component: Payment },
    { path: "/not_found/:order_number", component: NotFound },
    { path: "/payment/:order_number/success", component: PaymentSuccess },
    { path: "/news", component: News },
    { path: "/contact", component: Contact },
    { path: "/register", component: Register },
    { path: "/login", component: Login },
  ],
});
