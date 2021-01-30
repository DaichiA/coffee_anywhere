<template>
<div id="vue-app">
  <router-link to="/" class="btn btn-primary mx-2">
    Go to top
  </router-link>
  <router-link to="/hi" class="btn btn-warning mx-2">
    Go to Hi
  </router-link>
  <hr>
  <router-view></router-view>
</div>
</template>

<script>
  import HelloWorld from './components/HelloWorld.vue'
  import Hi from './components/Hi.vue'

  export default {
    name: 'App',
    created() {
      console.log('------ App created!! -------')
    },
    mounted() {
      console.log('====== App mounted!! ========')
    },
    components: {
      HelloWorld,
      Hi
    }
  }
</script>