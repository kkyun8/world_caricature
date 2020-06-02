<template>
  <div id="sample-image-body">
    <div class="py-5">
      <div class="container py-2">
        <h4>サンプル登録</h4>
        <form
          id="sample_image"
          name="sample_image"
          action="/api/sample_images"
          method="POST"
          ref="sample_image"
        >
          <input type="hidden" name="authenticity_token" :value="token" />
          <input type="hidden" id="image_url" name="image_url" value="url" />
          <div class="form-row">
            <div class="form-group col-md-12">
              <label for="name">サンプル名</label>
              <input
                type="text"
                v-model="name"
                class="form-control"
                id="name"
                name="name"
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
                name="information"
              />
            </div>
          </div>
          <div class="form-row">
            <div class="form-group col-md-3">
              <label for="price">値段</label>
              <select id="price" v-model="price" class="form-control">
                <option v-for="p in priceRange" :key="p">
                  {{ p }}
                </option>
              </select>
            </div>
            <div class="form-group col-md-3">
              <label for="number_of_people">人数</label>
              <select
                id="number_of_people"
                name="number_of_people"
                v-model="numberOfPeople"
                class="form-control"
              >
                <option v-for="n in numberOfPeopleRange" :key="n">
                  {{ n }}
                </option>
              </select>
            </div>
            <div class="form-group col-md-3">
              <label for="order_type">オーダータイプ</label>
              <select
                id="order_type"
                name="order_type"
                v-model="orderType"
                class="form-control"
              >
                <option v-for="o in orderTypeRange" :key="o">
                  {{ o }}
                </option>
              </select>
            </div>
            <div class="form-group col-md-3">
              <label for="image_url">イメージアップロード</label>
              <div class="input-group mb-3">
                <div class="custom-file">
                  <input
                    type="file"
                    class="custom-file-input"
                    id="image"
                    name="image"
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
      orderTypeRange: [0, 1, 2, 3],
      price: 10000,
      priceRange: [10000, 12000, 15000],
      numberOfPeople: 1,
      numberOfPeopleRange: [1, 2, 3, 4, 5],
      imageUrl: "",
      uploadedImage: "",
      getFile: "",
      token: document
        .querySelector('meta[name="csrf-token"]')
        .getAttribute("content"),
    };
  },
  methods: {
    // aws s3 連携
    async create() {
      const sample_image = new FormData();
      sample_image.append("name", this.name);
      sample_image.append("information", this.information);
      sample_image.append("order_type", this.orderType);
      sample_image.append("price", this.price);
      sample_image.append("number_of_people", this.numberOfPeople);
      sample_image.append("image", this.getFile);
      sample_image.append("image_url", "url");

      const response = await axios
        .post("/api/sample_images", sample_image, {
          headers: {
            "content-type": "multipart/form-data",
          },
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
