import Vue from 'vue'
import Vuetify from "vuetify"; // 追加
import "vuetify/dist/vuetify.min.css"; // 追加

Vue.use(Vuetify); // 追加
const vuetify = new Vuetify(); // 追加

document.addEventListener('DOMContentLoaded', () => {
  const home = new Vue({
    el: '#home',
    vuetify
  })
})
