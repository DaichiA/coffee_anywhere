import { createRouter, createWebHistory } from 'vue-router'
import HelloWorld from '../components/HelloWorld.vue'
import Hi from '../components/Hi.vue'

export const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      name: 'hello',
      component: HelloWorld,
    },
    {
      path: '/hi',
      name: 'hi',
      component: Hi,
    },
  ],
})