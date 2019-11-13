<template>
<div id="sample-image-body">
  <div class="py-5">
    <div class="container py-2">
      <div class="row text-center">
        <div class="mx-auto col-lg-6">
          <h1>サンプルイメージ検索<br></h1>
          <p class="mb-4" contenteditable="true">お客様が欲しがってる似顔絵イメージと同一な物が会ったら選択してください。簡単に注文できます。</p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <form class="form-inline d-flex justify-content-center">
            <div class="input-group"> <input type="email" class="form-control form-control-lg" id="form" placeholder="キーワード入力">
              <div class="input-group-append"> <button class="btn btn-primary" type="button"><i class="fa fa-search"></i></button> </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="container py-3">
      <div class="row">
        <div class="col-md-12">
          <h2 class="">おすすめ キーワード</h2>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12"><a class="btn btn-outline-primary mx-2" href="#">Outline</a><a class="btn btn-outline-primary mx-2" href="#">Outline</a><a class="btn btn-outline-primary mx-2" href="#">Outline</a><a class="btn btn-outline-primary mx-2" href="#">Outline</a><a class="btn btn-outline-primary mx-2" href="#">Outline</a></div>
      </div>
    </div>
  </div>
  <!-- Gallery -->
  <div class="py-5">
    <div class="container">
      <div if="images">
        <v-image :images="images" :imagesCount="imagesCount"/>
      </div>
    </div>
  </div>
</div>
</template>
<script>
import axios from 'axios';
import Image from './image.vue'

export default {
  components: {
    'v-image': Image,
  },
  data: function () {
      return {
        keyword: '',
        images: [],
        imagesCount: 0
      }
  },
  mounted: function (){
    this.fetchImages();
  },
  computed: {
  },
  methods:{
    fetchImages: function() {
      var getRow = [];
      
      axios.get('/api/sample_images').then((response) => {
        response.data.sample_images.forEach(element => {
          var getImageCount = this.imagesCount;
          this.imagesCount++
          
          // indexが4,8,12...の場合、pushしてgetRow初期化
          if(this.isRow(getImageCount) && getImageCount != 0){
            var newLength = getRow.unshift(element)
            this.images.push(getRow);
            getRow = [];
          }else{
            var newLength = getRow.unshift(element)
            return;
          }
        });
        if(getRow.length != 0){
          this.images.push(getRow);
        }
      },(error) => {
        console.log(error);
      });
    },
    isInteger(x) {
      return Math.round(x) === x;
    },
    isRow(count) {
      if (count == 0) return true
      let x = (count + 1) / 4;
      return Math.round(x) === x;
    },
  }
}
</script>
<style lang="scss">

</style>