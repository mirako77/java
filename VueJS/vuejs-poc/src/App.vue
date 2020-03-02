<template>
  <div id="app">
    <!-- <img src="./assets/logo.png"> -->
    <Hello/>
  </div>
</template>

<script>
import Hello from './components/Hello'

export default {
  name: 'App',
  components: {
    Hello
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #1c1350;
  margin-top: 20px;
}
</style>
