<template>
      <div id="image-body">
        <div class="row" v-for="imageArray in images" v-bind:key="imageArray.id">
          <div class="col-md-3 col-6 p-3" v-for="image in imageArray" v-bind:key=" image.id">
            <img class="img-fluid d-block" src="https://static.pingendo.com/img-placeholder-1.svg"><p>{{image.name}} </p>
          </div>
        </div>
      </div>
</template>
<script>
export default {
  props: ['images']
  ,
  mounted: function(){
  },
  data: function(){
    return {
    }
  },
  methods:{
  }
}
</script>
