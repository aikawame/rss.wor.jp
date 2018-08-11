<template>
  <article id="index" class="page">
    <section class="hero is-medium is-primary">
      <div class="hero-body has-text-centered">
        <h1 class="title has-text-weight-normal">
          <span class="has-text-weight-normal">RSS愛好会</span>
          <span class="subtitle is-size-4">RSSを未来へ繋げるために</span>
        </h1>
        <p>
          RSSフィード配信を本家サイトに代わって行っています。
        </p>
      </div>
    </section>
    <section class="contents">
      <section class="ad container">
        <adsbygoogle ad-slot="5977540638" />
      </section>
      <section class="categories container">
        <transition-group name="categories">
          <feed-category v-for="category in categories" :key="category.label" :category="category" />
        </transition-group>
        <div class="has-text-centered" v-if="Object.keys(categories).length === 0" aria-hidden="true">
          <span class="icon loader"></span>
        </div>
      </section>
      <section class="ad container">
        <adsbygoogle ad-slot="8622502386" />
      </section>
      <section class="notice container">
        <h2 class="title is-4">
          注意事項
        </h2>
        <ul>
          <li>
            本サービスに対する異常なトラフィックを検知した場合、アクセス遮断等の措置を実施する場合があります。
          </li>
          <li>
            記事本文の配信については、著作権やトラフィック等の観点から実施しておりませんのでご了承ください。
          </li>
          <li>
            本サービスは、配信するフィードに運営者からのお知らせを挿入する場合があります。
          </li>
        </ul>
      </section>
    </section>
  </article>
</template>

<script>
import axios from 'axios';
import FeedCategory from '~/components/FeedCategory.vue'

export default {
  components: {
    FeedCategory
  },
  data() {
    return {
      categories: {},
      current: 1
    };
  },
  mounted() {
    let db_path = process.env.NODE_ENV === 'production' ? 'db' : 'db_dev';
    axios.get('https://assets.wor.jp/rss/' + db_path + '/show_categories.json').then(res => {
      this.categories = res.data;
    });
  }
};
</script>

<style scoped>
@media (min-width: 769px) {
  .hero {
    background: url("/img/icon.svg"), linear-gradient(#fa9d39, #e3702d);
    background-position-y: 100%;
    background-repeat: no-repeat;
  }

  h1 .subtitle::before {
    content: " ─ ";
  }
}

@media (max-width: 768px) {
  h1 .subtitle {
    display: block;
  }
}

.categories-enter-active,
.catgories-leave-active {
  transition: opacity 0.5s;
}

.categories-enter,
.categories-leave-to {
  opacity: 0;
}

.notice ul {
  padding-left: 1rem;
}

.notice li {
  list-style-type: square;
}
</style>
