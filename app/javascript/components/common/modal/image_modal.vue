<template>
  <b-modal v-bind:id="id" size="lg" v-bind:title="image.name" scrollable @ok="redirectOrder()">
    <p class="my-2">{{ image.name }}</p><br>
    <p class="my-2">{{ image.information }}</p><br>
    {{image.image_url}}
  </b-modal>
</template>
<script>
export default {
  props: ['id','image']
  ,
  data: function(){
    return {
    }
  },
  methods: {
    redirectOrder(){
      this.$router.push('/sample_images/'+ this.image.id +'/order')
    }
  }
}
</script>
<style lang="scss">

</style>