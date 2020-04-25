<template>
  <!-- TODO: -->
  <div id="login-body">
    <div class="py-5">
      <b-container fluid>
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
      </b-container>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      email: "",
      password: ""
    };
  },
  methods: {
    login() {
      if (this.email.length === 0 || this.password.length === 0) {
        return alert("入力必須");
      }

      const response = axios
        .post("/api/users", { email: this.email, password: this.password })
        .catch(e => {
          console.log(e);
          alert("エラー発生");
        });

      if (response.status !== 200) {
        response.data;

        this.$router.push("/not_found");
      } else {
      }
    }
  }
};
</script>

<style></style>
