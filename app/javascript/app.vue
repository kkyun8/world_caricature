<template>
<div id="app">
  <MainNav></MainNav>
    <p> {{ message }} </p>
  <Footer></Footer>
</div>
</template>

<script>
import MainNav from './components/common/navbar';
import Footer from './components/common/footer'

export default {
  components : {
    MainNav,
    Footer
  },
  data: function () {
    return {
      message: "Hello Vue!@@"
    }
  }
}
</script>


<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

</style>
