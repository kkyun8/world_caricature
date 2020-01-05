<template>
          <div class="mx-auto col-md-6 p-4 align-items-center">
          <div class="card border-primary mb-5">
            <div class="card-header">
              <strong>支払い情報</strong>
            </div>
            <div class="card-body align-items-center">
              <div class="row">
                <div class="col-sm-12">
                  <ul class="list-group list-group-flush text-right">
                    <li class="list-group-item  d-flex justify-content-between lh-condensed">
                      <div>
                        <h6 class="my-0">作品価格</h6>
                      </div>
                      <span class="text-muted">¥10000</span>
                    </li>
                    <li class="list-group-item  d-flex justify-content-between lh-condensed">
                      <div>
                        <h6 class="my-0">フレーム</h6>
                      </div>
                      <span class="text-muted">¥4000</span>
                    </li>
                    <li class="list-group-item  d-flex justify-content-between lh-condensed">
                      <div>
                        <h5 class="my-0"><b>支払い金額</b></h5>
                      </div>
                      <span class="text-muted"><b>¥{{order.price}}</b></span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="card border-primary mb-5">
            <div class="card-header">
              <strong>クレジットカード</strong>
              <br>
              <small style="color:red;">＊ワルカリではウェブ決済サービス（square）を利用してるので安全です。
                <br>squareについてはhttps://developer.squareup.com/jp/jaを参考してください。
              </small>
            </div>
              <div class="card-body align-items-center">
                <div class="row" v-show="showPaymentFormFlg">
                  <div class="col-sm-12">
                      <div class="form-group" slot="spinner">
                        <div class="loader"></div>
                      </div>
                   </div>
               </div>
               <div class="row">
                <div class="col-sm-12">
                  <div class="form-group">
                    <div id="sq-card-number"></div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-6">
                  <div class="form-group">
                    <div id="sq-expiration-date"></div>
                  </div>
                </div>
                <div class="col-sm-6">
                  <div class="form-group">
                    <div id="sq-cvv"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-footer">
              <div class="input-group">
                <small style="color:red;">＊入力フォームが見えない場合、インターネット接続状態をご確認ください。</small>
                <button id="sq-creditcard" class="btn btn-primary w-100" @click="onGetCardNonce($event)">
                  <h3 class="m-0 p-0">決済</h3>
                </button>
              </div>
            </div>
            <input id="price" type="hidden" name="price">
            <input id="order-number" type="hidden" name="order_number">
            <input id="order-id" type="hidden" name="order_id">
            <input id="sample-image-id" type="hidden" name="sample_image_id">
            <!-- <input id="payment-result" type="hidden" v-model="paymentResult"> -->
            <input id="order-update" type="hidden" v-model="orderUpdateResult">
            <input id="payment_result" type="text" v-model="payment_result">
            <input type="text" v-model="test">
          </div>
          <div class="card border-primary">
            <div class="card-header">
              <strong>その他</strong>
              <small>以下のキャッシュレスで支払い可能です。</small>
            </div>
            <div class="card-body align-items-center">
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group">
                    <button href="#" class="form-control btn btn-dark my-2">Google pay</button>
                    <button id="sq-apple-pay" class="button-apple-pay"></button>
                    <button href="#" class="form-control btn my-2 btn-success">Line pay</button>
                    <button href="#" class="form-control btn my-2 btn-danger">Rakuten pay</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
</template>

<script>
import Alert from '../common/alert/alert'
import axios from 'axios'
import dotenv from 'dotenv'
import { async } from 'q'

export default {
  name: 'paymentForm',
  props: 
    ['order','payment_result']
  ,
  components: {
    'alert': Alert,
  },
  data: function() {
    return {
      showPaymentFormFlg: true,
      // paymentResult: false,
      orderUpdateResult: false,
      test: this.payment_result
    }
  },
      //alert(val);
      //this.paymentForm.destroy();
      // if(val){
      //   const order_id = document.getElementById('order-id').value
      //   this.updateOrderStatus(order_id)
      // }
      // return console.log('paymentResult')
  watch:{

  },
  mounted: function() {
      // Create and initialize a payment form object
      this.paymentForm = new SqPaymentForm({
        // Initialize the payment form elements
        
        //Replace with your sandbox application ID
        // TODO: applicationid -> .envから取得
        applicationId: "sandbox-sq0idb-avt1XfxvYu5ZB3SD-SkJtw",

        inputClass: 'sq-input',
        autoBuild: false,
        // Customize the CSS for SqPaymentForm iframe elements
        inputStyles: [{
            fontSize: '16px',
            lineHeight: '24px',
            padding: '16px',
            placeholderColor: '#a0a0a0',
            backgroundColor: 'transparent',
        }],
        // Initialize the credit card placeholders
        cardNumber: {
            elementId: 'sq-card-number',
            placeholder: 'カード番号'
        },
        cvv: {
            elementId: 'sq-cvv',
            placeholder: 'CVV'
        },
        expirationDate: {
            elementId: 'sq-expiration-date',
            placeholder: 'MM/YY'
        },
        postalCode: false,
        // SqPaymentForm callback functions
        callbacks: {
          // requestCardNonce -> callback return
          // callbacks -> square api -> success -> payment insert -> order update

          /*
          * callback function: cardNonceResponseReceived
          * Triggered when: SqPaymentForm completes a card nonce request
          */
          cardNonceResponseReceived: async function (errors, nonce, cardData) {


            // this.testResulta = 'result';
            // const test = document.getElementById('payment-result').value
            // if(test == 'true'){
            //   document.getElementById('payment-result').value = false;
            // }else{
            //   document.getElementById('payment-result').value = true;
            // }
            
            if (errors) {
              let error_messages = ''

              // Log errors from nonce generation to the browser developer console.
              errors.forEach(function (error) {
                let name = ""
                switch (error.field){
                  case 'cardNumber':
                    name = 'カード番号'
                    break
                  case 'cvv':
                    name = 'CVV番号'
                    break
                  case 'expirationDate':
                    name = '有効期限'
                    break
                 case 'postalCode':
                    name = '郵便番号'
                    break
                  default:
                    name = error.field
                }
                const message = 'に誤りがあります。確認してください。'
                error_messages = error_messages +　'\n'　+ name + message
              });

              alert(error_messages)
            }else{
              
              try {
                // payment情報登録
                const price = document.getElementById('price').value
                const order_number = document.getElementById('order-number').value
                const order_id = document.getElementById('order-id').value
                const sample_image_id = document.getElementById('sample-image-id').value

                // TODO: 決済したか確認、payament_flg = true なら表示しない
                fetch('/api/square_payment', {
                  method: 'POST',
                  headers: {
                  'Accept': 'application/json',
                  'Content-Type': 'application/json'
                },
                  body: JSON.stringify({
                  nonce: nonce,
                  price: price,
                  order_number: order_number,
                  order_id: order_id,
                  sample_image_id: sample_image_id
                  })
                })
                .catch(err => {
                  alert('Network error: ' + err);
                })
                .then(response => {
                  if (!response.ok) {
                    // TODO: エラーページ
                    alert(response.text().then(errorInfo => Promise.reject(errorInfo)));
                  }else{
                    //オーダ状態を決済済み（２）に更新
                    axios.put('/api/orders/' + order_number).then(response => {
                      if(response.status == 200){
                        if(response.data.result == 'SUCCESS') {
                          const redirect_order_number = response.data.order.order_number
                          const url = response.data.redirect.replace('*',redirect_order_number)
                          window.location = url
                        }
                      }else{
                      }
                    })
                    .catch(err => {
                    }); 
                  }
                })
                .catch(err => {
                  console.error(err);
                  alert('通信中エラーが発生しました。グラウザを再読み込みしてから再実行ください。');
                });
              
              } catch (error) {
                console.log(error)
                alert(error)
              }
            }
          },
        }
      });
      this.paymentForm.build();
      this.showPaymentFormFlg = false;
  },
  methods: {
    onGetCardNonce: function(event) {
      document.getElementById('price').value = this.order.price;
      document.getElementById('order-number').value = this.order.order_number;
      document.getElementById('order-id').value = this.order.id;
      document.getElementById('sample-image-id').value = this.order.sample_image_id;
      event.preventDefault();
      this.paymentForm.requestCardNonce();
    },
    updateTest() {
      this.payment_result = 'a';
      alert(this.payment_result)
    }
  }
}
</script>

<style>
/* Define how SqPaymentForm iframes should look */
.sq-input {
  height: 56px;
  box-sizing: border-box;
  border: 1px solid #E0E2E3;
  background-color: white;
  border-radius: 6px;
  display: inline-block;
  -webkit-transition: border-color .2s ease-in-out;
     -moz-transition: border-color .2s ease-in-out;
      -ms-transition: border-color .2s ease-in-out;
          transition: border-color .2s ease-in-out;
}

/* Define how SqPaymentForm iframes should look when they have focus */
.sq-input--focus {
  border: 1px solid #12bbad;
}

/* Define how SqPaymentForm iframes should look when they contain invalid values */
.sq-input--error {
  border: 1px solid #E02F2F;
}

</style>