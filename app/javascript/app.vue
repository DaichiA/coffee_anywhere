<template>
  <v-app id="app"> <!-- 追加 -->
      <v-btn>Vuetifyのボタン</v-btn> <!-- 追加 -->
        <div>
          <p>{{ message }}</p>
        </div>

        <v-tabs color="brown">
          <v-tab>Item One</v-tab>
          <v-tab>Item Two</v-tab>
          <v-tab>Item Three</v-tab>
        </v-tabs>

  </v-app> <!-- 追加 -->
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
