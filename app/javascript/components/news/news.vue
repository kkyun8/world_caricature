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
          <!-- <b-pagination aria-controls="my-table"
            v-model="currentPage"
            :total-rows="dataTotalRows"
            :per-page="dataPerPage"
            first-text="First"
            prev-text="Prev"
            next-text="Next"
            last-text="Last"></b-pagination> -->
        </div>
      </div>
{{dataArticles}}

    </div>
    <!-- Gallery -->
 </div>
</template>
<script>
import axios from 'axios'

export default {
  props: {
    currentPage: Number,
    totalRows: Number,
    perPage: Number,
    articles: Array,
  },
  // components: {
  //   'articles': Articles,
  // },
  data: function(){
    return {
      //TODO:
      dataCurrentPage: 1,
      dataTotalRows: 0,
      dataPerPage: 0,
      paginate: {
        totalPages: 0, 
        nextPage: 0, 
        prevPage: 0,
        firstPageFlg: false,
        lastPageFlg: false,
      },
      dataArticles: this.articles,
    }
  },
  watch:{
    currentPage: function(newVal, oldVal){
      if(newVal){
        this.getList(newVal);
      }
    }
  },
  mounted: function(){
    //TODO:
    this.getList(this.dataCurrentPage)
  },
  methods: {
    getList: function(page){
      axios.get('/api/news/',page).then((response) => {
        const data = response.data
        this.paginate = data.paginate
        this.dataCurrentPage = data.currentPage
        
        this.dataArticles = data.news;
        this.dataTotalRows = data.totalRows
        this.dataPerPage = data.perPage
        console.log(response);
      });
    }
  },
}

</script>
<style lang="scss">

</style>