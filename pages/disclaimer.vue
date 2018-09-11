<template>
  <article v-html="article"></article>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      article: null
    };
  },
  created() {
    axios.get('https://raw.githubusercontent.com/aikawame/worklover.wor.jp/develop/pages/disclaimer.vue').then(res => {
      this.article = res.data.replace(/<\/?template>/, '');
    });
  }
}
</script>
