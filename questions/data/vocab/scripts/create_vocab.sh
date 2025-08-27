#!/bin/sh

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# ファイル名とJSONデータを交互に並べる
vocab_data='
reverse_proxy.json|{ "word": "リバースプロキシ", "description": "クライアントからのリクエストを受け取り、内部サーバに転送するプロキシサーバ" }
oauth.json|{ "word": "OAuth", "description": "ユーザの認証情報を共有せずに外部サービスに認可を与える仕組み" }
openid.json|{ "word": "OpenID", "description": "分散型の認証方式で、複数のサービス間で共通のIDを利用できる仕組み" }
asn1.json|{ "word": "ASN.1", "description": "データ構造を記述するための標準記法（Abstract Syntax Notation One）" }
mime.json|{ "word": "MIME", "description": "電子メールで文字以外のデータを扱うための拡張規格" }
base64.json|{ "word": "base64", "description": "バイナリデータをテキスト形式で表現するためのエンコード方式" }
padding.json|{ "word": "パディング", "description": "暗号化やデータ処理で必要な長さに揃えるために追加する余分なデータ" }
smime.json|{ "word": "S/MIME", "description": "電子メールに暗号化と電子署名を提供する規格" }
envelope.json|{ "word": "エンベロープ", "description": "暗号化や署名データを格納するための構造（メッセージの封筒のような役割）" }
tamper_resistance.json|{ "word": "耐タンパ性", "description": "不正改ざんや解析を防ぐためのハードウェアやソフトウェアの特性" }
edsa.json|{ "word": "EDSA", "description": "Elliptic Curve Digital Signature Algorithmの略で、楕円曲線を用いたデジタル署名方式" }
tpm.json|{ "word": "TPM", "description": "Trusted Platform Moduleの略で、暗号処理や鍵の安全な管理を行うハードウェアチップ" }
ic_chip.json|{ "word": "ICチップ", "description": "集積回路を搭載したチップで、認証や暗号処理に利用される" }
rfid.json|{ "word": "RFID(Radio Frequency IDentification)", "description": "電波を用いて非接触で情報を読み書きできる技術" }
pin.json|{ "word": "PIN(Personal Identification Number)", "description": "本人認証に使用する暗証番号" }
'

echo "$vocab_data" | while IFS="|" read -r filename json; do
  echo "$json" > "$OUTPUT_DIR/$filename"
  echo "Created: $OUTPUT_DIR/$filename"
done
