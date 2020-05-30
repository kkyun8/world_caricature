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
                  <input
                    type="file"
                    class="custom-file-input"
                    id="image_url"
                    @change="onFile"
                  />
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
          <div v-if="uploadedImage" class="form-row">
            <div class="form-group">
              <img
                class="rounded float-left"
                v-show="uploadedImage"
                :src="uploadedImage"
                alt=""
              />
              <input type="hidden" id="type" name="type" :value="imageType" />
              <div class="card-body">
                <button class="btn btn-warning" @click.prevent="remove()">
                  ファイル削除
                </button>
              </div>
            </div>
          </div>
          <button
            type="button"
            @click.prevent="create()"
            class="btn btn-primary"
          >
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
      uploadedImage: "",
      imageType: "",
      getFile: "",
    };
  },
  methods: {
    // TODO: price order type numberofpeople master 作成
    // aws s3 連携
    async create() {
      const url = document.getElementById("image_url").value;
      const response = await axios
        .post("/api/sample_images", {
          file: this.getFile,
          type: this.imageType,
        })
        .then((response) => {
          console.log(response);
        });
    },
    onFile(event) {
      //TODO: file sizeはどこまで？
      const files = event.target.files || event.dataTransfer.files;
      if (files[0].type.indexOf("image") < 0) {
        return alert("イメージファイルを指定してください。");
      }

      this.getImage(files[0]);
    },
    getImage(file) {
      const reader = new FileReader();
      this.getFile = file;
      this.imageType = file.type;
      reader.onload = (e) => {
        this.uploadedImage = e.target.result;
      };
      // preview 表示
      reader.readAsDataURL(file);
    },
    remove() {
      this.uploadedImage = false;
    },
  },
};
</script>

<style></style>
