<template>
  <!-- TODO: 修正予定-->
  <div id="register-body">
    <div class="py-5">
      <div class="container-fluid">
        <div class="row">
          <div class="col-sm-3">
            <label>NAME</label>
          </div>
          <div class="col-sm-9">
            <input v-model="name" id="name" type="text" />
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <label>EMAIL</label>
          </div>
          <div class="col-sm-9">
            <input v-model="email" id="email" type="email" />
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <label>PASSWORD</label>
          </div>
          <div class="col-sm-9">
            <input v-model="password" id="password" type="password" />
          </div>
        </div>
        <div class="row">
          <div class="col-sm-3">
            <label>PASSWORD CONFRIM</label>
          </div>
          <div class="col-sm-9">
            <input v-model="password_confirmation" id="password_confirmation" type="password" />
          </div>
        </div>
        <div class="row">
          <div>
            <button type="button" @click.prevent="register()">登録</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  data() {
    return {
      name: "",
      email: "",
      password: "",
      password_confirmation: ""
    };
  },
  computed: {
    // ...mapState({
    //   apiStatus: state => state.auth.apiStatus
    // })
  },
  methods: {
    async register() {
      //TODO: type = 0 artist 1 user
      if (
        this.name.length === 0 ||
        this.email.length === 0 ||
        this.password.length === 0 ||
        this.password_confirmation.length === 0
      ) {
        return alert("入力必須");
      }
      const user = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.password_confirmation
        }
      await this.$store.dispatch("auth/register", user)

      // if (this.apiStatus) {
      //   this.$router.push("/");
      // }
    }
  }
};
</script>

<style>
</style>