<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <p>bienvenido {{prenom}} {{nom}}</p>
    <p>dynamique: {{fullname}}</p>
  </div>
</template>

<script>
export default {
  name: 'Hello',
  data () {
    return {
      msg: 'this is hello vue !',
      nom: 'crosoft',
      prenom: 'mike'
    }
  },
  computed: {
    fullname: function () {
      return this.prenom + ' ' + this.nom
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
  color:  #0d176b;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color:  #2a9b1b;
}
</style>
