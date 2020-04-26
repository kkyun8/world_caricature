<template>
  <!-- TODO: 修正予定-->
  <div id="register-body">
    <div class="py-5">
      <b-container fluid>
        <b-row>
          <b-col sm="3">
            <label>NAME</label>
          </b-col>
          <b-col sm="9">
            <b-form-input v-model="name" type="text"></b-form-input>
          </b-col>
        </b-row>
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
          <b-col sm="3">
            <label>PASSWORD CONFRIM</label>
          </b-col>
          <b-col sm="9">
            <b-form-input v-model="confirm" type="text"></b-form-input>
          </b-col>
        </b-row>
        <b-row>
          <b-col>
            <b-button @click.prevent="register()">ログイン</b-button>
          </b-col>
        </b-row>
      </b-container>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";

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
    async register() {
      if (
        this.name.length === 0 ||
        this.email.length === 0 ||
        this.password.length === 0 ||
        this.confirm.length === 0
      ) {
        return alert("入力必須");
      }

      await this.$store.dispatch("auth/register", {
        name: this.name,
        email: this.email,
        password: this.password,
        confirm: this.confirm
      });

      if (this.apiStatus) {
        this.$router.push("/");
      }
    }
  }
};
</script>

<style>
</style>