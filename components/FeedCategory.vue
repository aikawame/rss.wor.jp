<template>
  <section class="category">
    <h2 class="title is-4">
      {{ category.name }}
    </h2>
    <div class="websites">
      <section class="website panel" v-for="website in category.websites" :key="website.label">
        <h3 class="panel-heading">
          {{ website.name }}
        </h3>
        <a class="panel-block" v-for="feed in website.feeds"
           :key="feed.label" :href="'https://assets.wor.jp/rss/rdf/' + website.label + '/' + feed.label + '.rdf'">
          <span class="panel-icon"><i class="icon-rss-square" aria-hidden="true"></i></span>{{ feed.name }}
        </a>
      </section>
    </div>
  </section>
</template>

<script>
export default {
  props: ['category']
};
</script>

<style scoped>
.panel:not(:last-child) {
  margin-bottom: 1rem;
}

.categories-enter-active,
.catgories-leave-active {
  transition: opacity 0.5s;
}

.categories-enter,
.categories-leave-to {
  opacity: 0;
}
</style>
