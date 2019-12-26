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
                <br>＊入力フォームが見えない場合、インターネットが接続されてるかご確認ください。
              </small>
            </div>
            <div class="card-body align-items-center">
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group">
                    <div id="sq-card-number"></div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-4">
                  <div class="form-group">
                    <div id="sq-expiration-date"></div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group">
                    <div id="sq-cvv"></div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="form-group">
                    <div id="sq-postal-code"></div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-footer">
              <div class="input-group">
                <button id="sq-creditcard" class="btn btn-primary w-100" @click="onGetCardNonce($event)">
                  <h3 class="m-0 p-0">決済</h3>
                </button>
              </div>
            </div>
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
                    <button href="#" class="form-control btn btn-dark my-2">Apple pay</button>
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
// import squareConnect from 'square-connect'
import axios from 'axios'

export default {
  name: 'paymentForm',
  props: ['order'],
  
  data: function() {
    return {

    }
  },
  mounted: function() {
          // Create and initialize a payment form object
      this.paymentForm = new SqPaymentForm({
        // Initialize the payment form elements
        
        //TODO: Replace with your sandbox application ID
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
        postalCode: {
            elementId: 'sq-postal-code',
            placeholder: '郵便番号'
        },
        // SqPaymentForm callback functions
        callbacks: {
            /*
            * callback function: cardNonceResponseReceived
            * Triggered when: SqPaymentForm completes a card nonce request
            */
            cardNonceResponseReceived: function (errors, nonce, cardData) {
            if (errors) {
                // Log errors from nonce generation to the browser developer console.
                console.error('Encountered errors:');
                errors.forEach(function (error) {
                    console.error('  ' + error.message);
                });
                alert('Encountered errors, check browser developer console for more details');
                return;
            }
            
               alert(`The generated nonce is:\n${nonce}`);
               //TODO: Replace alert with code in step 2.1
                fetch('/api/square_payment', {
                  method: 'POST',
                  headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                  },
                  body: JSON.stringify({
                    nonce: nonce
                  })
                })
              .catch(err => {
                alert('Network error: ' + err);
              })
              .then(response => {
                if (!response.ok) {
                  return response.text().then(errorInfo => Promise.reject(errorInfo));
                }
                return response.text();
              })
              .then(data => {
                console.log(JSON.stringify(data));
                alert('Payment complete successfully!\nCheck browser developer console for more details');
              })
              .catch(err => {
                console.error(err);
                alert('Payment failed to complete!\nCheck browser developer console for more details');
              });
            }
        }
      });
      this.paymentForm.build();
  },
  methods: {
    onGetCardNonce: function(event) {
      
      event.preventDefault();
      this.paymentForm.requestCardNonce();
    },
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