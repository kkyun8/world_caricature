<template>
<div id="order-body">
  <div class="text-center py-4">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center">
          <h1>注文の流れ</h1>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-lg-3 col-6 p-4"> <i class="d-block fa fa-circle fa-3x mb-2 text-muted"></i>
          <h4> <b>One</b> </h4>
          <p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy.</p>
        </div>
        <div class="col-lg-3 col-6 p-4"> <i class="d-block fa fa-stop-circle-o fa-3x mb-2 text-muted"></i>
          <h4> <b>Two</b> </h4>
          <p>I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.</p>
        </div>
        <div class="col-lg-3 col-6 p-4"> <i class="d-block fa fa-stop-circle fa-3x mb-2 text-muted"></i>
          <h4> <b>Three</b> </h4>
          <p>I feel that I never was a greater artist than now. When, while the lovely valley teems with vapour around me.</p>
        </div>
        <div class="col-lg-3 col-6 p-4"> <i class="d-block fa fa-circle-o fa-3x mb-2 text-muted"></i>
          <h4> <b>Four</b> </h4>
          <p>Oh, would I could describe these conceptions, could impress upon paper all that is living so full.</p>
        </div>
      </div>
    </div>
  </div>
  <div class="py-4">
    <div class="container">
      <div class="row">
        <div class="col-md-6 p-lg-5 p-3">
          <div class="row">
            <div class="col-md-12">
              <h1 class="">Heading 1</h1>
            </div>
          </div><img class="img-fluid d-block" src="https://static.pingendo.com/img-placeholder-1.svg" width="1500">
        </div>
        <div class="col-md-6 d-flex flex-column justify-content-center">
          <div class="card">
            <div class="card-body h-25" style="">
              <h5 class="card-title"><b>作品情報</b></h5>
              <p class="card-text">人数：<br></p>
              <p class="card-text">サイズ：<br></p>
              <p class="card-text" contenteditable="true">プレゼント有無：<br></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <nav class="navbar navbar-expand-md navbar-light bg-light fixed-top">
    <div class="container"> <button class="navbar-toggler navbar-toggler-right border-0 collapsed" type="button" data-toggle="collapse" data-target="#navbar6" aria-expanded="false">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="navbar-collapse collapse" id="navbar6" style=""> <a class="navbar-brand text-primary d-none d-md-block" href="#">
          <i class="fa d-inline fa-lg fa-circle"></i>
          <b contenteditable="true">ワルード似顔絵</b>
        </a>
        <ul class="navbar-nav mx-auto">
          <li class="nav-item"> <a class="nav-link" href="#">サンプルイメージ</a> </li>
          <li class="nav-item"> <a class="nav-link" href="#">注文確認</a> </li>
          <li class="nav-item"> <a class="nav-link" href="#">注文について</a> </li>
          <li class="nav-item"> <a class="nav-link" href="#">お知らせ</a> </li>
          <li class="nav-item"> <a class="nav-link" href="#">お問い合わせ・作家募集<br></a> </li>
        </ul>
      </div>
    </div>
  </nav>
  <customer-info />
  <div class="py-1">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="row">
            <div class="col-md-6 align-items-center p-2" style=""><a class="btn btn-outline-primary w-100" href="#">サンプルイメージ一覧に戻る<i class="fa fa-backward"></i> </a></div>
            <div class="col-md-6 align-items-center p-2" style=""><a class="btn btn-primary w-100" href="#"><i class="fa fa-arrow-circle-right"></i>支払いに進む</a></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="py-4">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center">
          <h1>ご利用規約</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 p-3">
          <p>When I hear the buzz of the little world among the stalks, and grow familiar with the countless indescribable forms of the insects and flies, then I feel the presence of the Almighty, who formed us in his own image, and the breath of that universal love which bears and sustains us.</p>
        </div>
        <div class="col-md-6 p-3">
          <p>And then, my friend, when darkness overspreads my eyes, and heaven and earth seem to dwell in my soul and absorb its power, like the form of a beloved mistress, then I often think with longing, Oh, would I could describe these conceptions, could impress upon paper all that is living so full.</p>
        </div>
      </div>
    </div>
  </div>
</div>
</template>

<script>
import axios from 'axios';
import CustomerInfomation from './customer_infomation.vue'
import Axios from 'axios';

export default {

  components: {
    'customer-info': CustomerInfomation
  },
  data: function(){
    return {
      image: []
    }
  },
  mounted: function(){
    this.getSampleImage();

  },
  methods: {
    getSampleImage: function(){
      let id = this.$route.params['id']
      axios.get('/api/sample_images/' + this.id ).then((response) => {

      },(error) => {

      });
    }
  },
}
</script>

<style lang="scss">

</style>