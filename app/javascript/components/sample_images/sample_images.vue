<template>
  <div id="sample-image-body">
    <div class="py-5">
      <div class="container py-2">
        <div class="row text-center">
          <div class="mx-auto col-lg-6">
            <h1>
              サンプルイメージ検索
              <br />
            </h1>
            <p class="mb-4" contenteditable="true">お客様が欲しがってる似顔絵イメージと同一な物が会ったら選択してください。簡単に注文できます。</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <form class="form-inline d-flex justify-content-center">
              <div class="input-group">
                <input
                  v-model="keyword"
                  class="form-control form-control-lg"
                  id="form"
                  placeholder="キーワード入力"
                />
              </div>
            </form>
          </div>
        </div>
      </div>
      <div class="container py-3">
        <div class="row">
          <div class="col-md-12">
            <h2 class>おすすめ キーワード</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <a
              v-for="viewKeyword in viewKeywords"
              v-bind:key="viewKeyword.id"
              class="btn btn-outline-primary mx-2"
              v-on:click="setKeyword(viewKeyword.name)"
            >{{ viewKeyword.name }}</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Gallery -->
    <div class="py-5">
      <div class="container">
        <div v-if="images">
          <v-image :images="images" />
        </div>
        <infinite-loading @infinite="infiniteHandler">
          <div slot="spinner">
            <div class="loader"></div>
          </div>
          <div slot="no-more"></div>
        </infinite-loading>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import InfiniteLoading from "vue-infinite-loading";
import Image from "./image.vue";
import { mapMutations, mapGetters } from "vuex";
import { timeout } from "q";

const api = "/api/sample_images";

export default {
  components: {
    // imageが表示されるcomponentを設定 ./image.vue
    "v-image": Image,
    InfiniteLoading
  },
  data: function() {
    return {
      keyword: "",
      start: 0,
      images: [],
      // loading画面表示
      viewKeywords: []
    };
  },

  // mapGettersはcomputedに宣言
  computed: {
    ...mapGetters(["getSampleImages"])
  },

  watch: {
    keyword: function(val) {
      if (val.length < 1) {
        return (this.images = this.getSampleImages);
      } else {
        return (this.images = this.getSampleImages.filter(array => {
          return (
            array.name.indexOf(val) >= 0 || array.information.indexOf(val) >= 0
          );
        }));
      }
    }
  },
  created: function() {
    //画面の最上に
    scrollTo(0, 0);
  },

  mounted: function() {
    // this.fetchImages();
    this.getViewKeyword();
  },

  // mapMutationsはmethodに宣言
  methods: {
    ...mapMutations(["setSampleImages"]),

    // TODO ロジック修正予定infinite-loadingのクラス宣言
    infiniteHandler($state) {

      axios.get(api + "/?start=" + this.start).then(response => {
        if(!response.data.sample_images.length){
          $state.complete();
          //TODO END メッセージ
        }else{
          response.data.sample_images.forEach(element => {
              this.images.push(element);
              this.start = element.id
              $state.loaded();
          });
        }
        
      },error => {
        $state.complete();
      });
    },

    // 自然数判断
    isInteger(x) {
      return Math.round(x) === x;
    },

    // 画面に表示されるrowの最後のObject判断, 一つのrowに４つのイメージを表示s
    isRowStart(count) {
      if (count == 0) return true;
      let x = (count + 1) / 4;
      return Math.round(x) === x;
    },

    replateChar(val) {
      val.replace(/[Ａ-Ｚａ-ｚ０-９]/g, function(s) {
        return String.fromCharCode(s.charCodeAt(0) - 65248);
      });
    },

    //キーワードゲット、DB未作成
    getViewKeyword() {
      // axios.get('/api/sample_images').then((response) => {
      //   response.data.sample_images.forEach(element => {
      //     this.viewKeywords.push(element)
      //   })
      // },(error) =>{
      // });
    },

    setKeyword(val) {
      this.keyword = val;
    }
  }
};
</script>

<style lang="scss">
</style>