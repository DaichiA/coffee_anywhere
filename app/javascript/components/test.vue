<template>
  <div class="alert alert-danger">
      <h2>{{ title }}</h2>
      <p>{{ message }}</p>
  </div>
</template>

<script>
  export default {
    name: 'test',
    data() {
      return {
        title: 'Hello',
        message: 'テストです',
      }
    }
  }
</script>