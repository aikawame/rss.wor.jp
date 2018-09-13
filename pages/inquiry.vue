<template>
  <article id="inquiry" class="page">
    <section class="hero is-primary">
      <div class="hero-body has-text-centered">
        <h1 class="title has-text-weight-normal">
          <span class="has-text-weight-normal">お問い合わせ</span>
        </h1>
      </div>
    </section>
    <section class="contents">
      <section class="form container">
        <form class="box" @submit="checkForm">
          <p class="preamble">
            RSS愛好会へのご意見・ご質問や、フィード追加のご要望等はこちらからお気軽にどうぞ。
            <a href="https://twitter.com/intent/tweet?screen_name=aikawame" target="blank">Twitter</a>からのお問い合わせも歓迎です。
          </p>
          <dl>
            <dt>
              <label class="label">お名前</label>
            </dt>
            <dd class="preamble">
              <input
                class="input"
                type="text"
                placeholder="任意でご入力ください"
                v-model="name"
              />
            </dd>
            <dt>
              <label class="label">メールアドレス</label>
            </dt>
            <dd class="preamble">
              <input
                class="input"
                :class="{ 'is-danger': !isValidEmail }"
                type="text"
                placeholder="返信をご希望の場合はご入力ください"
                v-model="email"
              />
            </dd>
            <dt>
              <label class="label">内容</label>
            </dt>
            <dd class="preamble">
              <textarea
                class="textarea"
                :class="{ 'is-danger': !isValidBody }"
                placeholder="お問い合わせ内容をご入力ください"
                v-model="body"
              >
              </textarea>
            </dd>
          </dl>
          <input class="button is-info is-fullwidth" type="submit" value="確認" />
        </form>
      </section>
    </section>
    <div class="modal" :class="{ 'is-active': modalShown }">
      <div class="modal-background">
      </div>
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">送信確認</p>
          <button class="delete" aria-label="close" @click="modalShown = false"></button>
        </header>
        <section class="modal-card-body">
          <p class="preamble">
            以下の内容を送信してよろしいですか？
          </p>
          <dl>
            <dt class="is-normal">
              <label class="label">お名前</label>
            </dt>
            <dd class="preamble">
              {{ nameForView }}
            </dd>
            <dt class="is-normal">
              <label class="label">メールアドレス</label>
            </dt>
            <dd class="preamble">
              {{ emailForView }}
            </dd>
            <dt class="is-normal">
              <label class="label">内容</label>
            </dt>
            <dd>
              {{ body }}
            </dd>
          </dl>
        </section>
        <footer class="modal-card-foot">
          <button class="button is-info" @click="sendEmail">OK</button>
          <button class="button" @click="modalShown = false">キャンセル</button>
        </footer>
      </div>
    </div>
  </article>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      name: null,
      email: null,
      subject: '【RSS愛好会】お問い合わせ',
      body: null,
      validated: false,
      modalShown: false
    }
  },
  computed: {
    isValidEmail() {
      const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return !this.validated || !this.email || re.test(this.email);
    },
    isValidBody() {
      return !this.validated || this.body;
    },
    isValidForm() {
      return this.isValidEmail && this.isValidBody;
    },
    nameForView() {
      return this.name || '（匿名）';
    },
    emailForView() {
      return this.email || '（空欄）';
    }
  },
  methods: {
    checkForm(e) {
      this.validated = true;
      if (this.isValidForm) this.modalShown = true;
      e.preventDefault();
    },
    sendEmail() {
      this.modalShown = false;
    }
  }
}
</script>

<style scoped>
form {
  margin: auto;
  max-width: 640px;
}

.modal-card-foot {
  display: flex;
}

.modal-card-foot button {
  flex-grow: 1;
}
</style>
