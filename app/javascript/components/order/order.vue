<template>
<div id="order-body">
  <div class="text-center py-4" style="	background-image: url(https://pingendo.com/site-assets/cover.jpg);	background-position: top left;	background-size: 100%;	background-repeat: repeat;">
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
  <div class="py-4 text-center">
    <div class="container">
      <div class="row py-3">
        <div class="mx-auto col-lg-8 col-10">
          <h1 class="my-2">注文詳細設定</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 p-lg-5 p-3">
          <form class="text-center">
            <div>
              <img class="img-fluid d-block align-items-center mx-auto img-thumbnail w-75" src="https://static.pingendo.com/img-placeholder-1.svg">
            </div>
          </form>
        </div>
        <div class="col-md-6 p-lg-5" style="">
          <div class="form-row text-left">
            <div class="form-group my-3 w-100 p-2">
              <label><b>フレームサイズ</b></label>
              <select v-model="order.flame_size" class="w-100">
                <option value="M">M（+¥4000）</option>
                <option value="L">L（+¥7000）</option>
              </select>
            </div>
          </div>
          <p class="">Paragraph. Then, my friend, when darkness overspreads my eyes, and heaven and earth seem to dwell in my soul and absorb its power, like the form of a beloved mistress, then I often think with longing.</p>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 p-lg-5 p-3">
          <form class="text-center">
            <div>
              <img class="img-fluid d-block align-items-center mx-auto img-thumbnail w-75" src="https://static.pingendo.com/img-placeholder-1.svg">
            </div>
          </form>
        </div>
        <div class="col-md-6 p-lg-5" style="">
          <div class="form-row text-left">
            <div class="form-group my-3 w-100 p-2">
              <label><b>プレミアムラッピングの有無</b></label>
              <select v-model="order.premium_wrapping" class="w-100" >
                <option v-bind:value="false">しない</option>
                <option v-bind:value="true">プレミアムラッピング希望（+¥500）</option>
              </select>
            </div>
          </div>
          <p class="">Paragraph. Then, my friend, when darkness overspreads my eyes, and heaven and earth seem to dwell in my soul and absorb its power, like the form of a beloved mistress, then I often think with longing.</p>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5">
    <div class="container">
      <div class="row py-3">
        <div class="mx-auto col-lg-6 col-6">
          <h1 class="my-2 text-center">注文情報</h1>
        </div>
      </div>
      <div class="row">
        <div class="mx-auto col-md-6 p-4">
          <div class="card border-primary">
            <img class="card-img-top" src="./chi1.jpg" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">{{sample_image.name}}</h5>
              <p class="card-text" >{{sample_image.order_type}}</p>
            </div>
            <ul class="list-group list-group-flush">
              <li class="list-group-item">価格：{{sample_image.price}}</li>
              <li class="list-group-item">人数：{{sample_image.number_of_people}}</li>
              <li class="list-group-item">作品情報：{{sample_image.information}}</li>
            </ul>
          </div>
        </div>
        <div class="col-md-6 p-4 my-auto mx-auto">
          <ul class="list-group list-group-flush text-right">
            <li class="list-group-item  d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">作品価格</h6>
              </div>
              <span class="text-muted">¥{{sample_image.price}}</span>
            </li>
            <li class="list-group-item  d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">フレーム</h6>
              </div>
              <span class="text-muted">¥{{flame_price}}</span>
            </li>
            <li v-if="order.premium_wrapping" class="list-group-item  d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">プレミアムラッピング</h6>
              </div>
              <span class="text-muted">¥{{wrapping_price}}</span>
            </li>
            <li class="list-group-item  d-flex justify-content-between lh-condensed">
              <div>
                <h5 class="my-0">支払い金額</h5>
              </div>
              <span class="text-muted"><b>¥{{price_result}}</b></span>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <div class="py-4 text-center">
    <div class="container">
      <div class="row py-3">
        <div class="mx-auto col-lg-8 col-10">
          <h1 id="customerForm" class="my-2">注文者情報</h1>
        </div>
      </div>
      <alert v-bind="{ 'show_alert': show_alert, 'error_messages': error_messages }"  class="mx-auto col-md-12 col-lg-6"/>
      <div class="row">
        <div class="mx-auto col-md-12 col-lg-6" style="">
          <form class="text-left">
            <div class="form-row">
              <div class="form-group col-md-6"> <label><b>名前（漢字）</b><span class="text-danger">＊全角文字</span></label> <input v-model="order.name_kanji" type="text" class="form-control" placeholder="山田太郎" maxlength="25"> </div>
              <div class="form-group col-md-6"> <label><b>名前（ふりがな）</b><span class="text-danger">＊全角文字</span></label> <input v-model="order.name_furigana" type="text" class="form-control" placeholder="やまだたろう" maxlength="25"> </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-6"> <label><b>メール</b></label><span class="text-danger" style="font-size: 11px">＊簡単ログインは以下のアイコンクリック</span><input v-model="order.email" type="text" class="form-control" placeholder="gmail@gmail.com" maxlength="50">
                <div class="form-group py-2">
                  <a class="btn btn-outline-primary" style="width:24%; color:#3b5999" href="#"><font-awesome-icon :icon="['fab', 'facebook']" size="2x"/></i></a>
                  <a class="btn btn-outline-primary" style="width:24%; color:#55acee" href="#"><font-awesome-icon :icon="['fab', 'twitter']" size="2x"/></a>
                  <a class="btn btn-outline-primary" style="width:24%; color:#dd4b39" href="#"><font-awesome-icon :icon="['fab', 'google']" size="2x"/></a>
                  <a class="btn btn-outline-primary" style="width:24%; color:#e4405f" href="#"><font-awesome-icon :icon="['fab', 'instagram']" size="2x"/></a>
                </div>
              </div>
              <div class="form-group col-md-6"> <label><b>ラインID</b></label><span class="text-danger" style="font-size: 11px">＊ワンタッチログインはアイコンクリック</span><input v-bind:value="order.line_id == '' ? 'ラインロゴをクリックしてください。':'ラインIDが登録されました。'" type="text" class="form-control" placeholder="＊小文字・半角英数字と「 . , - , _ 」のみ" readonly>
                <div class="form-group py-2">
                  <a class="btn btn-outline-primary w-100" style="color:#00c300" @click="getLineId()" ><font-awesome-icon :icon="['fab', 'line']" size="2x"/></a>
                </div>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-12"><label><b><U>写真ファイル送信方法/問合せ対象設定</U></b></label></div>
              <div class="form-group col-md-12">
                <span class="text-danger">＊似顔絵作業に必要な写真を送信アカウント</span>
              </div>
              <div class="form-group col-md-6">
                <input type="radio" id="typeEmail" name="imageSendType" value="email" v-model="order.communication_type"><label for="typeEmail">メールで送信</label>
                <div class="form-control" style="height:100px; border: 1px solid">
                  オーダーの決済が確認されたら、決済完了メールを送信します。
                  <br><u>決済完了メールに写真を添付して転送してください。</u>
                </div>
              </div>
              <div class="form-group col-md-6">
                <input type="radio" id="typeLine" name="imageSendType" value="line" v-model="order.communication_type"><label for="typeLine">ラインで送信</label>
                <div class="form-control" style="height:100px; border: 1px solid">
                  公式アカウントに写真を転送することで終わりです。
                  ライン上で注文確認などもできます。<br><span class="text-danger">＊おすすめ、ライン友達追加不要</span>
                </div>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-6"> <label><b>電話番号（携帯）</b><span class="text-danger">＊半角数字11桁のみ</span></label> <input v-model="order.cell_phone_number" type="number" class="form-control" placeholder="09012345678" maxlength="11"> </div>
              <div class="form-group col-md-6"> <label><b>電話番号（家）</b><span class="text-danger">＊半角数字10、11桁のみ</span></label> <input v-model="order.home_phone_number" type="number" class="form-control" placeholder="0481234567" maxlength="11"> </div>
            </div>
            <div class="form-group"><label><b>お届け先（郵便番号）</b><span class="text-danger">＊半角数字7桁ハイフンなし</span></label>
              <div class="input-group w-75">
                <input v-model="order.postal_code" type="number" class="form-control" placeholder="1234567"  maxlength="7">
                <div class="input-group-append"><button class="btn btn-primary" type="button">住所取得</button></div>
              </div>
            </div>
            <div class="form-group"><label><b>お届け先（都道府県市区町）</b></label><input id="address1" v-model="order.address1" type="text" class="form-control" placeholder="東京都豊島区" maxlength="25"></div>
            <div class="form-group"><label><b>お届け先（村番地など）</b></label><input v-model="order.address2" type="text" class="form-control" placeholder="東池袋1-1-1　101号" maxlength="25"></div>
            <div class="form-group"><label><b>コメント</b></label>
              <textarea v-model="order.comment" class="form-control"></textarea>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="py-1">
      <div class="container my-5">
        <div class="row">
          <div class="col-md-12">
            <div class="row">
              <div class="col-md-6 align-items-center p-3" style=""><a class="btn btn-outline-primary w-100" @click="modalShow = !modalShow" >サンプルイメージ一覧に戻る<i class="fa fa-backward"></i> </a></div>
              <div class="col-md-6 align-items-center p-3" style=""><a class="btn btn-primary w-100" v-on:click="createOrder" ><i class="fa fa-arrow-circle-right"></i>支払いに進む</a></div>
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
</div>
</template>

<script>
import axios from 'axios';
import CustomerInfomation from './customer_infomation'
import Alert from '../common/alert/alert'
import { mapGetters } from "vuex";

export default {
  props: ['id']
  ,

  components: {
    'customer-info': CustomerInfomation,
    'alert': Alert,
  },

  data: function(){
    return {
      postal_api_url: '',
      postal_api_key: '',
      auth_key: '',
      sample_image: '',
      order: {
        sample_image_id: '',
        order_number: '',
        order_status: 1,
        flame_size: 'M',
        premium_wrapping: false,
        price: 0,
        name_kanji: '',
        name_furigana: '',
        email: '',
        line_id: '',
        communication_type: 'email',
        cell_phone_number: '',
        home_phone_number: '',
        postal_code: '',
        address1: '',
        address2: '',
        comment: '',
      },
      error_messages: [],
      show_alert: false,
      peyment_flg: false,
      wrapping_price: 0,
      communication_type_seleted: '',
    }
  },
  created: function() {
    //画面の最上に
    scrollTo(0, 0);
  },
  mounted: function() {
    this.getSampleImage();

    this.postal_api_url = this.getPostalCodeApiUrl;
    this.postal_api_key = this.getPostalCodeApiKey;
    this.auth_key = this.getAuthKey;
  },

  watch: {
    'order.premium_wrapping': function(val){
      if(val){
        this.wrapping_price = 500
      }
    },
    'order.postal_code': function(){

      var postal_check = new RegExp(/^[0-9]{7}$/);
      var res = postal_check.test(this.order.postal_code);

      if (this.order.postal_code.indexOf('-') >= 0) return 
      if (!res) return

      axios.get(this.postal_api_url + this.postal_api_key + 'postcode=' + this.order.postal_code ).then((response) => {
        if ( response.status === 200 ) {
          if (response.data.size == 0) return

          const result = response.data.data[0]

          this.order.address1 = result.allAddress
          document.getElementById('address1').focus();
          // TODO: scrollERRO document.getElementById('address1').focus().scrollIntoView({ behavior: 'smooth', block: 'center' });
        }
        //取得失敗しても画面に表示しない
      },(error) => {

      });
    }
  },

  computed:{
    ...mapGetters(["getPostalCodeApiUrl", "getPostalCodeApiKey","getAuthKey"]),
    /**
     * フレーム価格セット
     */
    flame_price: function() {
      if (this.order.flame_size == 'M'){
        return 4000;
      }else if (this.order.flame_size =='L'){
        return 7000;
      }
    },

    /**
     * 価格計算
     */
    price_result: function() {
      return this.order.price = this.flame_price + this.wrapping_price + this.sample_image.price 
    },
  },
  
  methods: {
    /**
     * LINE ログイン
     */
    getLineId: function() {
	    // app public keyを使用してOAuth.ioを初期化します
	    OAuth.initialize(this.auth_key);
	    // ポップアップを開きます。
	    OAuth.popup('line').then(line => {
		  // ログインに成功したら、ユーザーの名前を表示させます。
		  // #me() は便利なメソッドです。
		  // 取得したユーザーのデータをコンソールで確認出来ます。
		  line.me().then(data => {
        this.order.line_id = data.userId
		    });
	    });
    },
    /** 
    * サンプルイメージデータ取得
    */
    getSampleImage: function(){
      let id = this.$route.params['id']
      axios.get('/api/sample_images/' + this.id ).then((response) => {
        this.sample_image = response.data.sample_image
        this.order.sample_image_id = response.data.sample_image.id
      },(error) => {

      });
    },

    /** 
    * フォームチェック
    */
    checkForm: function(){
      //全角文字のみ（空文字NG）
      const japanese_check = new RegExp(/^[^\x20-\x7e]+$/);
      //半角数字のみ（空文字NG）
      const number_check = new RegExp(/^[0-9]+$/);
      //携帯電話 11桁 000-0000-0000
      const cell_phone_number_check = new RegExp(/^([0-9]{3})-([0-9]{3})-([0-9]{4})+$/);
      //内線電話 10桁
      const home_phone_number_check = new RegExp(/^([0-9]{2})-([0-9]{3})-([0-9]{4})+$/);
    },

    /**
    * オーダー情報読み込み
    */
    // selectOrder: function(){

    // },

    /**
    * オーダー作成
    */
   
// TODO: オーダー作成後エラー発生
// vue.runtime.esm.js:640 [Vue warn]: $attrs is readonly.
//        <Alert> at app/javascript/components/common/alert/alert.vue
//          <Order> at app/javascript/components/order/order.vue
// vue.runtime.esm.js:640 [Vue warn]: $listeners is readonly.
    createOrder: async function() {
      //order_number取得
      this.order.order_number = this.createOrderNumber()
      let responseOrder = '';

      try {
        const insertOrder = await axios.post('/api/orders/', this.order).then((response) => {
          this.error_messages = []
          if(response.status === 200){
            if(response.data.result == 'FAIL') {
              response.data.messages.forEach(element => {
                this.error_messages.push(element)
                this.show_alert = true
              });
              document.getElementById('customerForm').scrollIntoView({ behavior: 'smooth' });
              return null;
            }else if (response.data.result == 'SUCCESS') {
              this.show_alert = false
              return response.data.order;
            }
          }
        });
        const confirm = await this.confirmPromise('オーダを登録すると注文情報を変更できません。よろしいですか？');
        const updateOrder = await this.updateOrder(insertOrder, confirm);
        const sendLineMessage = await this.sendLineMessageToUser(updateOrder)
        if(updateOrder){
          //削除フラグがfalseの場合、決済ページに遷移
          if(!updateOrder.delflg) this.$router.push('/payment/' + updateOrder.order_number)
        }
      }catch (error) {
        console.log(error)
      }

    },

    updateOrder(order, confirm){
      return new Promise((resolve, reject) => {
        if(order == null) {
          reject("order not found")
        }
        const order_number = order.order_number
        let getOrder = order
        //キャンセルを押下した場合、falseになる
        getOrder.delflg = !confirm
        axios.put('/api/orders/' + order_number, order).then((response) => {
          if(response.status !== 200){
            // TODO: エラーテーブルに登録
            reject('save error')
          }else{
            if (response.data.result == 'SUCCESS') {
              resolve(order)
            }else{
              // TODO: エラーテーブルに登録
              reject('save error')
            }
          }
        })
        .catch((error) => {
          // TODO: エラーテーブルに登録
          console.log(error)
          reject(error)
        });
      });
    },

    confirmPromise(message){
        if (window.confirm(message)) {
          return Promise.resolve(true);
        }else{
          return Promise.resolve(false);
        }
    },

    /**
     * オーダ作成完了後、メッセージ送信
     */
    sendLineMessageToUser: function(updateOrder) {
      return new Promise((resolve, reject) => {
        if(updateOrder.delflg) reject()
        const id = updateOrder.line_id
        axios.post('/api/line_order_to_user', { id })
        .then((response) => {
          if(response.data.result == 'SUCCESS') resolve(true);
        });
      })
    },
    /**
     * オーダー番号作成 現在時間＋数字8桁
     */
    createOrderNumber() {
      
      const random = Math.random().toString(10).slice(-8)

      const today = new Date();
      const yyyy = today.getFullYear();
      const mm = ('00' + (today.getMonth()+1)).slice(-2);
      const dd = ('00' + today.getDate()).slice(-2);
      const hh = ('00' + today.getHours()).slice(-2);
      const mi = ('00' + today.getMinutes()).slice(-2);
      const ss = ('00' + today.getSeconds()).slice(-2);

      const yyyyMMddhhmmss = yyyy + mm + dd + hh + mi + ss;

      return yyyyMMddhhmmss + random
    }
  },
}
</script>

<style lang="scss">

</style>