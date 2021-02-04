<template>
  <form @submit.prevent="$emit('submit')">
    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>
    <div>
      <label>email</label>
      <input v-model="session.email" type="text">
    </div>
    <div>
      <label>password</label>
      <input v-model="session.password" type="text">
    </div>
    <button type="submit">Commit</button>
  </form>
</template>

<script>

export default {
  props: {
    session: {},
    errors: ''
  }
}

</script>