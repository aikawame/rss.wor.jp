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
          <script src="https://www.google.com/recaptcha/api.js" async defer></script>
          <div
            class="g-recaptcha preamble"
            :class="{ 'is-danger': !isValidGrcres }"
            data-sitekey="6Lfhe3AUAAAAAMvWuLYE-a5EotqHSHsv7xbs6ce7"
          ></div>
          <input class="button is-info is-fullwidth" type="submit" value="確認" />
        </form>
      </section>
    </section>
    <inquiry-confirm
      :name="name"
      :email="email"
      :subject="subject"
      :body="body"
      :grcres="grcres"
      v-if="isModalActive"
      @close="toggleModal"
      @done="initForm"
    ></inquiry-confirm>
  </article>
</template>

<script>
import InquiryConfirm from "~/components/InquiryConfirm.vue";

export default {
  components: {
    InquiryConfirm
  },
  data() {
    return {
      name: null,
      email: null,
      subject: '【RSS愛好会】お問い合わせ',
      body: null,
      grcres: null,
      isValidating: false,
      isModalActive: false
    }
  },
  computed: {
    isValidEmail() {
      const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      return !this.isValidating || !this.email || re.test(this.email);
    },
    isValidBody() {
      return !this.isValidating || this.body;
    },
    isValidGrcres() {
      return !this.isValidating || this.grcres;
    },
    isValidForm() {
      return this.isValidEmail && this.isValidBody && this.isValidGrcres;
    }
  },
  methods: {
    initForm() {
      this.name = null;
      this.email = null;
      this.body = null;
      this.isValidating = false;
      this.isModalActive = false;
    },
    checkForm(e) {
      this.isValidating = true;
      this.grcres = grecaptcha.getResponse();
      if (this.isValidForm) this.toggleModal();
      e.preventDefault();
    },
    toggleModal() {
      this.isModalActive = !this.isModalActive;
    }
  }
}
</script>

<style scoped>
form {
  margin: auto;
  max-width: 640px;
}

.g-recaptcha {
  padding-bottom: 1px;
}

.g-recaptcha.is-danger {
  border: #ff3860 solid;
  border-width: 0 0 1px;
  padding-bottom: 0;
}
</style>
