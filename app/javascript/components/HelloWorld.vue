<template>
  <div class="alert alert-info">
      <h2>{{ data.title }}</h2>
      <p>{{ data.msg }}</p>
  </div>
</template>

<script>
  import { ref, reactive } from 'vue'

  export default {
    name: 'HelloWorld',
    setup(props, context) {
      const data = reactive({
        title: 'HelloWorld',
        msg: 'テストメッセージ',
      })
      return {
        data
      }
    }
  }
</script>