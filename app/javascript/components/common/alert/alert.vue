<template>
    <b-alert v-model="show_alert" variant="danger" dismissible> <!-- vshow -->
      <div class="p-2 mx-5">
        <h4 class="alert-heading text-left">
        </h4>
        <p v-for="error in error_messages" v-bind:key="error.key" class="mb-0 text-left" style="font-size: 0.8rem;">
          {{error}}
        </p>
      </div>
    </b-alert>
</template>
<script>
export default {
  props: ['error_messages','show_alert']
  ,
  data: function(){
    return {
    }
  }
}
</script>
<style>

</style>