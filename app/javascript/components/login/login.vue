<template>
  <!-- TODO: -->
  <div id="login-body">
    <div class="py-5">
      <div class="container">
        <div class="form-group">
          <div class="form-group">
                  <a class="btn btn-outline-primary" style="width:24%; color:#3b5999" href="/users/auth/facebook"><font-awesome-icon :icon="['fab', 'facebook']" size="2x"/></i></a>
                  <a class="btn btn-outline-primary" style="width:24%; color:#55acee" href="/users/auth/twitter"><font-awesome-icon :icon="['fab', 'twitter']" size="2x"/></a>
                  <a class="btn btn-outline-primary" style="width:24%; color:#dd4b39" href="/users/auth/google"><font-awesome-icon :icon="['fab', 'google']" size="2x"/></a>
                  <a class="btn btn-outline-primary" style="width:24%; color:#e4405f" href="#"><font-awesome-icon :icon="['fab', 'instagram']" size="2x"/></a>
          </div>
        <div class="row">
          <div class="col-3">
            <label>EMAIL</label>
          </div>
          <div class="col-9">
            <input id="email" v-model="email" type="text">
          </div>
        </div>
        <div class="row">
          <div class="col-3">
            <label>PASSWORD</label>
          </div>
          <div class="col-9">
            <input id="password" v-model="password" type="password">
          </div>
        </div>
        <div class="row">
          <div class="col">
            <button class="btn btn-primary" @click.prevent="login()">ログイン</button>
          </div>
        </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: "",
      password: ""
    };
  },
  methods: {
    async login() {
      if (this.email.length === 0 || this.password.length === 0) {
        return alert("入力必須");
      }
      const params = { email:this.email, password:this.password }
      await this.$store.dispatch('auth/login',params)
      await console.log(this.$store.state.auth.user)
    }
  }
};
</script>

<style>
</style>
