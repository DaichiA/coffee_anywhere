<!--
<template>
  <div class="alert alert-primary">
      <h2>{{ data.title }}</h2>
      <p>{{ data.msg }}</p>
  </div>
</template>
-->

<script>
  import { h, ref } from 'vue'

  export default {
    name: 'Hi',
    setup(props) {
      const data = ref({
        title: 'Hi',
        msg: 'メッセージ'
      })
      return ()=> h('div', {
        class: 'alert alert-warning'
      },
      [
        h('h2', data.value.title),
        h('p', data.value.msg)
      ])
    }
  }
</script>
