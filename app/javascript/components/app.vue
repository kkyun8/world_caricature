<template>
  <div>
    <MainNav />
    <router-view></router-view>
    <Footer />
  </div>
</template>

<script>
import MainNav from "../components/common/navbar";
import Footer from "../components/common/footer";
export default {
  components: {
    MainNav,
    Footer
  }
};
</script>

<style>
</style>