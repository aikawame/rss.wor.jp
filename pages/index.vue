<template>
  <article class="index">
    <section class="hero is-medium is-primary">
      <div class="hero-body has-text-centered">
        <h1 class="title has-text-weight-normal">
          <span class="has-text-weight-normal">RSS愛好会</span>
          <span class="subtitle is-size-4">RSSを未来へ繋げるために</span>
        </h1>
        <p>
          昨今減少しつつあるRSSフィード配信を、本家サイトに代わって行っています。
        </p>
      </div>
    </section>
    <section class="contents">
      <feed-list/>
      <section class="notice container">
        <h2 class="title is-4">
          <i class="fas fa-rss"></i>&nbsp;注意事項
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
import FeedList from '~/components/FeedList.vue'

export default {
  components: {
    FeedList
  }
}
</script>

<style>
.hero {
  background: linear-gradient(#fa9d39, #e3702d);
}

@media (min-width: 769px) {
  .hero {
    background: url("~/assets/img/icon.svg"), linear-gradient(#fa9d39, #e3702d);
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

.contents {
  padding: 2rem 0;
}

@media (max-width: 1087px) {
  .contents .container {
    padding: 0.5rem 0.75rem;
  }
}

.notice ul {
  padding-left: 1rem;
}

.notice li {
  list-style-type: square;
}
</style>
