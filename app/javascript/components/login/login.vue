<template>
  <!-- TODO: -->
  <div id="login-body">
    <div class="py-5">
      <b-container fluid>
        <b-form-group>
          <b-form-group>
                  <a class="btn btn-outline-primary" style="width:24%; color:#3b5999" href="#"><font-awesome-icon :icon="['fab', 'facebook']" size="2x"/></i></a>
                  <a class="btn btn-outline-primary" style="width:24%; color:#55acee" href="#"><font-awesome-icon :icon="['fab', 'twitter']" size="2x"/></a>
                  <a class="btn btn-outline-primary" style="width:24%; color:#dd4b39" href="#"><font-awesome-icon :icon="['fab', 'google']" size="2x"/></a>
                  <a class="btn btn-outline-primary" style="width:24%; color:#e4405f" href="#"><font-awesome-icon :icon="['fab', 'instagram']" size="2x"/></a>
          </b-form-group>
        <b-row>
          <b-col sm="3">
            <label>EMAIL</label>
          </b-col>
          <b-col sm="9">
            <b-form-input v-model="email" type="text"></b-form-input>
          </b-col>
        </b-row>
        <b-row>
          <b-col sm="3">
            <label>PASSWORD</label>
          </b-col>
          <b-col sm="9">
            <b-form-input v-model="password" type="text"></b-form-input>
          </b-col>
        </b-row>
        <b-row>
          <b-col>
            <b-button @click.prevent="login()">ログイン</b-button>
          </b-col>
        </b-row>
        </b-form-group>
      </b-container>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex'

export default {
  data() {
    return {
      email: "",
      password: ""
    };
  },
  computed: {
    ...mapState({
      apiStatus: state => state.auth.apiStatus
    })
  },
  methods: {
    async login() {
      if (this.email.length === 0 || this.password.length === 0) {
        return alert("入力必須");
      }
      const params = { email:this.email, password:this.password }
      await this.$store.dispatch('auth/login',params )

      if(this.apiStatus){
        this.$router.push('/')
      }
    }
  }
};
</script>

<style>
</style>
