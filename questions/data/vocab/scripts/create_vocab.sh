#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: filename|word|description
VOCAB_LIST=(
  "http|HTTP|Web通信の基本プロトコル。サーバとクライアント間でテキストベースのリクエストとレスポンスをやり取りする。"
  "https|HTTPS|HTTPにSSL/TLSを組み合わせて通信を暗号化したプロトコル。"
  "keep_alive|キープアライブ|1つのTCP接続で複数のHTTPリクエスト/レスポンスを処理する仕組み。"
  "url_encode|URLエンコード|URLで使用できない文字を%記号と16進数で表現する方法。"
  "http_basic_auth|HTTP基本認証|ユーザ名とパスワードをBase64で送信するシンプルな認証方式。"
  "get_method|GET|HTTPリクエストメソッドの1つで、リソースの取得に使用される。"
  "post_method|POST|HTTPリクエストメソッドの1つで、データ送信やフォーム送信に使用される。"
  "proxy_server|プロキシサーバ|クライアントとインターネットの間に入り通信を中継・制御するサーバ。"
  "cgi|CGI(Common Gateway Interface)|Webサーバと外部プログラムを連携させる仕組み。"
  "referrer|Referrer|HTTPリクエストで直前のページ情報を送信するヘッダ。"
  "secure_attribute|secure属性|CookieをHTTPS通信時のみに送信する属性。"
  "webdav|WebDAV|HTTPを拡張してWebサーバ上のファイル操作を可能にするプロトコル。"
  "tls|TLS|インターネット通信を暗号化するセキュリティプロトコル。"
  "hsts|HSTS(HTTP Strict Transport Security)|ブラウザにHTTPS接続を強制する仕組み。"
  "ftp|FTP|ファイル転送を行うプロトコル。"
  "ftps|FTPS|FTPにSSL/TLSを追加して暗号化を行うプロトコル。"
  "passive_mode|パッシブ通信|FTPでクライアント側がデータ接続を開始するモード。"
  "pasv_command|PASVコマンド|FTPパッシブモードでサーバが待機ポートを通知するコマンド。"
  "ssh|SSH|安全なリモートログインと通信を提供するプロトコル。"
  "anonymous_ftp|Anonymous FTP|ユーザ名「anonymous」で誰でも利用可能なFTP接続。"
  "tftp|TFTP(Trival File Transfer Protocol)|簡易的なファイル転送プロトコル。認証や暗号化はない。"
  "telnet|Telnet|リモートログイン用のプロトコル。暗号化されないため現在は非推奨。"
  "local_echo|ローカルエコー|端末で入力文字を即時に画面表示する機能。"
  "port_forward|ポートフォワード|外部から内部ネットワークへのアクセスを特定ポート経由で転送する仕組み。"
)

# JSONファイル作成ループ
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
