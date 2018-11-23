<template>
  <div id="app">
    <MyNav/>
    <router-view/>
    <MyFooter/>
  </div>
</template>

<script>
import MyNav from '@/components/MyNav.vue'
import MyFooter from '@/components/MyFooter.vue'
export default {
  components: {
    MyNav,
    MyFooter
  }
}
</script>

<style lang="scss">

</style>
