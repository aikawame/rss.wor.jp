<template>
  <article id="error" class="page">
    <section class="hero is-primary">
      <div class="hero-body has-text-centered">
        <h1 class="title has-text-weight-normal" v-if="error.statusCode === 404">ページが見つかりません</h1>
        <h1 class="title has-text-weight-normal" v-else>エラーが発生しました</h1>
      </div>
    </section>
    <section class="contents">
      <section class="error-message container has-text-centered" v-if="error.statusCode === 404">
        <p>
          お探しのページは存在しません。
        </p>
        <p>
          恐れ入りますが、暫くしてからもう一度アクセスしてください。
        </p>
      </section>
      <section class="error-message container has-text-centered" v-else>
        <p>
          現在、サイトの表示に問題が発生しています。
        </p>
        <p>
          恐れ入りますが、暫くしてからもう一度アクセスしてください。
        </p>
      </section>
      <section class="return-link container has-text-centered">
        <p>
          <a class="button" href="/">
            トップページへ戻る
          </a>
        </p>
      </section>
    </section>
  </article>
</template>

<script>
export default {
  props: ['error']
}
</script>

<style scoped>
.contents {
  margin-top: 4rem;
  margin-bottom: 4rem;
}

.error-message {
  margin-bottom: 1.5rem;
}
</style>
