<template>
 <div id="news-body">
    <div class="py-5">
      <div class="container py-2">
        <div class="row text-center">
          <div class="mx-auto col-lg-6">
            <h1>
              お知らせ
              <br />
            </h1>
            <p class="mb-4" >お知らせページです。</p>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="mx-auto col-lg-12">
          <b-table hover :items="articles"></b-table>
        </div>
        <div class="mx-auto col-lg-12">
          <b-pagination v-model="currentPage" :total-rows="rows" :per-page="perPage" aria-controls="my-table"></b-pagination>
        </div>
      </div>
    </div>
    <!-- Gallery -->
 </div>
</template>
<script>
import Articles from "./articles"
import axios from 'axios'

export default {
  components: {
    'articles': Articles,
  },
  data: function(){
    return {
      //TODO:
      currentPage: 1,
      rows: 8,
      perPage: 3,
      articles: [],
    }
  },
  created: function(){
    //TODO:
    axios.get('/api/news/',this.currentPage).then((response) => {
      this.articles = response.data.news;
      console.log(response);
    });
  }
}

</script>
<style lang="scss">

</style>