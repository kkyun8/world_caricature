<template>
  <div>
    <nav class="navbar navbar-expand-md navbar-light bg-light fixed-top">
      <div class="container">
        <button
          class="navbar-toggler navbar-toggler-right border-0 collapsed"
          type="button"
          data-toggle="collapse"
          data-target="#navbar6"
          aria-expanded="false"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbar6" style>
          <a class="navbar-brand text-primary d-none d-md-block" href="/">
            <i class="fa d-inline fa-lg fa-circle"></i>
            <b>ワルード似顔絵</b>
          </a>
          <ul class="navbar-nav mx-auto">
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
              <a class="nav-link" href="/contact">
                お問い合わせ・作家募集
                <br />
              </a>
            </li>
          </ul>
          <a class="btn btn-outline-primary" href="/register">作家登録</a>
          <a class="btn btn-outline-primary" href="/login">ログイン</a>
        </div>
      </div>
    </nav>
    <div class="py-3"></div>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {};
</script>

<style lang="scss"></style>
