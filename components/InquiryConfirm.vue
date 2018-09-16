<template>
  <div class="modal">
    <div class="modal-background">
    </div>
    <div class="modal-card">
      <header class="modal-card-head">
        <p class="modal-card-title">お問い合わせ送信</p>
        <button class="delete" aria-label="close" @click="$emit('close')"></button>
      </header>
      <section class="modal-card-body">
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
          <dd class="preamble">
            <span class="pre">{{ body }}</span>
          </dd>
        </dl>
        <p class="notification" :class="notificationClass" v-if="notification">
          {{ notification }}
        </p>
      </section>
      <footer class="modal-card-foot">
        <button
          class="button is-info"
          v-if="status === 'init'"
          @click="sendEmail"
        >送信</button>
        <button
          class="button is-info"
          :class="{ 'is-loading': status === 'doing' }"
          v-else
          @click="$emit('done')"
        >閉じる</button>
        <button class="button" ref="cancel-button" @click="$emit('close')">キャンセル</button>
      </footer>
    </div>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  props: ['name', 'email', 'subject', 'body', 'grcres'],
  data() {
    return {
      notification: '以上の内容を送信してよろしいですか？',
      status: 'init'
    }
  },
  computed: {
    nameForView() {
      return this.name || '（匿名）';
    },
    emailForView() {
      return this.email || '（空欄）';
    },
    notificationClass() {
      switch(this.status) {
        case 'done':
          return 'is-success';
        case 'error':
          return 'is-danger';
        default:
          return '';
      }
    }
  },
  methods: {
    sendEmail() {
      this.status = 'doing';
      axios.post('https://iq24yooluk.execute-api.ap-northeast-1.amazonaws.com/api/', {
        name: this.nameForView,
        email: this.email,
        subject: this.subject,
        body: this.body,
        grcres: this.grcres
      }).then(() => {
        this.status = 'done';
        this.notification = '送信が完了しました。';
      }).catch(() => {
        this.status = 'error';
        this.notification = '送信に失敗しました。暫くしてからもう一度お試しください。';
      });
    }
  }
}
</script>

<style scoped>
.modal {
  display: flex;
}

.modal-card-foot {
  display: flex;
}

.modal-card-foot button {
  flex-grow: 1;
}

.pre {
  white-space: pre;
}
</style>
