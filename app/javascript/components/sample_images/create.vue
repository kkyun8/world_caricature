<template>
  <div id="sample-image-body">
    <div class="py-5">
      <div class="container py-2">
        <h4>サンプル登録</h4>
        <form>
          <div class="form-row">
            <div class="form-group col-md-12">
              <label for="name">サンプル名</label>
              <input
                type="text"
                v-model="name"
                class="form-control"
                id="name"
              />
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-12">
              <label for="information">説明</label>
              <input
                type="text"
                v-model="information"
                class="form-control"
                id="information"
              />
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-3">
              <label for="price">値段</label>
              <select id="price" v-model="price" class="form-control">
                <option selected>選択してください。</option>
                <option>...</option>
              </select>
            </div>
            <div class="form-group col-md-3">
              <label for="number_of_people">人数</label>
              <select
                id="number_of_people"
                v-model="numberOfPeople"
                class="form-control"
              >
                <option selected>選択してください。</option>
                <option>...</option>
              </select>
            </div>
            <div class="form-group col-md-3">
              <label for="order_type">オーダータイプ</label>
              <select id="order_type" class="form-control">
                <option selected>オーダータイプを選択してください。</option>
                <option>...</option>
              </select>
            </div>
            <div class="form-group col-md-3">
              <label for="image_url">イメージアップロード</label>
              <div class="input-group mb-3">
                <div class="custom-file">
                  <input type="file" class="custom-file-input" id="image_url" />
                  <label
                    class="custom-file-label"
                    for="inputFile"
                    data-browse="参照"
                    >ファイルを選択</label
                  >
                </div>
              </div>
            </div>
          </div>
          <button type="button" @click.prevent="" class="btn btn-primary">
            サンプル登録
          </button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      name: "",
      information: "",
      orderType: 0,
      orderTypeRange: [],
      price: 0,
      priceRange: [],
      numberOfPeople: 0,
      numberOfPeopleRange: [],
      imageUrl: "",
    };
  },
  methods: {
    // TODO: price order type numberofpeople master 作成
    // aws s3 連携
    async postTest() {
      await axios.post("/api/url/").then((response) => {
        console.log(response);
      });
    },
  },
};
</script>

<style></style>
