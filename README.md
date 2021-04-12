# instagram_clone

인스타그램 클론

## Web 구성
web 폴더 생성
```
flutter create .
```

## Google SignIn 연동
https://github.com/flutter/plugins/blob/master/packages/google_sign_in/google_sign_in_web/README.md#web-integration

### web/index.html 수정
```
<body>
  <!-- 추가 -->
  <script src="https://www.gstatic.com/firebasejs/7.20.0/firebase-app.js"></script>
  <script src="https://www.gstatic.com/firebasejs/7.20.0/firebase-auth.js"></script>
  <script src="https://www.gstatic.com/firebasejs/7.20.0/firebase-firestore.js"></script>
  <script src="https://www.gstatic.com/firebasejs/7.20.0/firebase-storage.js"></script>
```
```
<head>
  <meta name="google-signin-client_id" content="[YOUR_GOOGLE_SIGN_IN_OAUTH_CLIENT_ID].apps.googleusercontent.com">
```

### Web 실행 방법
```
$ flutter run -d chrome --web-hostname localhost --web-port 7357 --web-renderer html
```

### Web 개발 모드에서 이미지 보이게
https://stackoverflow.com/questions/65653801/flutter-web-cant-load-network-image-from-another-domain