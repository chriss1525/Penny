// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  server: {
    port: 3003,
  },
  router: {
    base: '/penny/website/',
  },
  devtools: { enabled: true },
  modules: ['@nuxtjs/tailwindcss'],
})
