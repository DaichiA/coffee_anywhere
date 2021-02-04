<template>
  <div id="vue-app2">
    <div class="alert alert-danger">
        <h2>{{ title }}</h2>
        <p>{{ message }}</p>
        <LoginForm :errors="errors" :session="session" @submit="loginUser" />
        <a href="http://localhost:3000/signup">登録</a>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import LoginForm from './LoginForm.vue'

export default {
  components: {
    LoginForm
  },
  data() {
    return {
      title: 'Hello',
      message: 'テストです',
      errors: '',
      session: {
        email: '',
        password: ''
      }
    }
  },
  methods: {
    loginUser() {
      axios
        .post('/api/v1/sessions', this.session )
        // .then(response => {
        //   this.$router.push({ path: '/Hi' })
        // })
        .then(response => {
          // window.location.href = 'http://localhost:3000/shops';  
          window.location.reload();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        })
    }
  }
}
</script>