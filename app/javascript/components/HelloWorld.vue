<template>
  <div class="alert alert-info">
      <h2>{{ title }}</h2>
      <p>{{ msg }}</p>
  </div>
</template>

<script>
  export default {
    name: 'HelloWorld',
    data() {
      return {
        title: 'HelloWorld',
        msg: 'テストメッセージ',
      }
    }
  }
</script>