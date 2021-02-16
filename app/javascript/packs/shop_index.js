import Vue from 'vue'
import Vuetify from "vuetify"; // 追加
import "vuetify/dist/vuetify.min.css"; // 追加

Vue.use(Vuetify); // 追加
const vuetify = new Vuetify({
  theme: {
    themes: {
      light: {
        primary: 'black', 
        accent: '#808080' // グレー
      },
    },
  },
}); 

document.addEventListener('DOMContentLoaded', () => {
  const shop_index = new Vue({
    el: '#shop_index',
    vuetify
  })
})
