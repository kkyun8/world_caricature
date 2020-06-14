<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="/">
      <!-- TODO: アイコン作成-->
      <img
        src=""
        width="30"
        height="30"
        class="d-inline-block align-top"
        alt=""
        loading="lazy"
      />
      World Caricature ワルード似顔絵
    </a>
    <button
      class="navbar-toggler"
      type="button"
      data-toggle="collapse"
      data-target="#navbarColor01"
      aria-controls="navbarColor01"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="/sample_images">サンプルイメージ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">注文確認</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/about_the_order">注文について</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/news">お知らせ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/contact">お問い合わせ・作家募集</a>
        </li>
      </ul>
      <!-- TODO: -->
      <ul class="navbar-nav navbar-right">
        <li class="nav-item">
          <a class="nav-link" href="/register">作家登録</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/login">作家登録</a>
        </li>
        <!-- <template v-if="userName != null || userName != ''">
          <li class="nav-item">{{ userName }}</li></template
        >
        <template> -->
      </ul>
    </div>
    <!-- <div class="py-3"></div> -->
  </nav>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  computed: {
    ...mapGetters({
      userName: "auth/userName",
    }),
  },
};
</script>

<style lang="scss"></style>
