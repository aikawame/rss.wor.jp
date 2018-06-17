<template>
  <div class="feed-categories container">
    <transition-group name="categories">
      <section class="category" v-for="category in categories" :key="category.label">
        <h2 class="title is-4">
          <i class="fas fa-rss" aria-hidden="true"></i>&nbsp;{{ category.name }}
        </h2>
        <div class="websites">
          <section class="website panel" v-for="website in category.websites" :key="website.label">
            <h3 class="panel-heading">
              {{ website.name }}
            </h3>
            <a class="panel-block" v-for="feed in website.feeds"
               :key="feed.label" :href="'https://assets.wor.jp/rss/rdf/' + website.label + '/' + feed.label + '.rdf'">
              <span class="panel-icon"><i class="fas fa-rss-square" aria-hidden="true"></i></span>{{ feed.name }}
            </a>
          </section>
        </div>
      </section>
    </transition-group>
    <div class="has-text-centered" v-if="Object.keys(categories).length === 0">
      <span class="icon loader"></span>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: () => {
    return {
      categories: {},
      current: 1
    };
  },
  mounted() {
    axios.get('https://assets.wor.jp/rss/db/show_categories.json').then(res => {
      this.categories = res.data;
    });
  }
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

.websites {
  column-count: 3;
  margin: 1.5rem 0;
}

@media (max-width: 768px) {
  .websites {
    column-count: 1;
  }
}

.website {
  break-inside: avoid;
}
</style>
