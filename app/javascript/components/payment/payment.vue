<template>
<div id="payment-body">
  <div class="py-5">
    <div class="container">
      <div class="row py-3">
        <div class="mx-auto col-lg-6 col-6">
          <h1 class="my-2 text-center">商品支払い</h1>
        </div>
      </div>
      <div class="row">
        <div class="mx-auto col-md-6 p-4">
          <div class="card border-primary">
            <div class="card-header">
              <strong>商品情報</strong>
              <small>記入した情報を確認してください。</small>
            </div>
            <img class="card-img-top" src="../order/chi1.jpg" alt="Card image cap">
            <div class="card-body">
              <h5 class="card-title">作品情報</h5>
              <p class="card-text">フレームサイズ： <br>プレミアムラッピング有無：<br>商品情報；<br>
              </p>
            </div>
            <ul class="list-group list-group-flush">
              <li class="list-group-item">
                <h5 class="card-title">名前</h5>山田太郎 やまだたろう
              </li>
              <li class="list-group-item">
                <h5 class="card-title">写真送信方法</h5>写真データーはメールORラインI'dで送信
              </li>
              <li class="list-group-item">
                <h5 class="card-title">電話番号</h5>090-1234-1234 080-1234-1234
              </li>
              <li class="list-group-item">
                <h5 class="card-title">住所</h5>埼玉県朝霞市仲町２−１−６　２０６号　埼玉県朝霞市仲町２−１−６　２０６号
              </li>
              <li class="list-group-item">
                <h5 class="card-title">コメント</h5>あああああああああああああああああああああああああああああああああああああああああああああああああああああ
              </li>
              <li class="list-group-item">
                <div class="card-body">
                  <a href="#" class="btn btn-primary w-100">
                    <h4 class="m-0 p-0"> 注文情報を修正</h4>
                  </a>
                </div>
              </li>
            </ul>
          </div>
        </div>
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
                      <span class="text-muted"><b>¥14000</b></span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="card border-primary mb-5">
            <div class="card-header">
              <strong>クレジットカード</strong>
              <small>カード情報を記入してください。</small>
            </div>
            <div class="card-body align-items-center">
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group">
                    <label for="name">名前</label>
                    <input class="form-control" id="name" type="text" placeholder="Enter your name">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm-12">
                  <div class="form-group">
                    <label for="ccnumber">番号</label>
                    <div class="input-group">
                      <input class="form-control" type="text" placeholder="0000 0000 0000 0000" autocomplete="email">
                      <div class="input-group-append">
                        <span class="input-group-text">
                          <i class="mdi mdi-credit-card"></i>
                        </span>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="form-group col-sm-4">
                  <label for="ccmonth">月</label>
                  <select class="form-control" id="ccmonth">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                  </select>
                </div>
                <div class="form-group col-sm-4">
                  <label for="ccyear">年</label>
                  <select class="form-control" id="ccyear">
                    <option value="2014">2014</option>
                    <option value="2015">2015</option>
                    <option value="2016">2016</option>
                    <option value="2017">2017</option>
                    <option value="2018">2018</option>
                    <option value="2019">2019</option>
                    <option value="2020">2020</option>
                    <option value="2021">2021</option>
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                  </select>
                </div>
                <div class="col-sm-4">
                  <div class="form-group">
                    <label for="cvv">CVV/CVC</label>
                    <input class="form-control" id="cvv" type="text" placeholder="123">
                  </div>
                </div>
              </div>
            </div>
            <div class="card-footer">
              <div class="input-group">
                <button href="#" class="btn btn-primary w-100">
                  <h3 class="m-0 p-0"> 決済</h3>
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
      </div>
    </div>
  </div>
</div>
</template>
<script>
export default {
  
}
</script>
<style lang="sass">

</style>