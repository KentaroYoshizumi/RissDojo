#!/bin/bash

# 出力ディレクトリ
OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"

# 出力ディレクトリを作成（なければ）
mkdir -p "$OUTPUT_DIR"

# 単語リスト（必ずダブルクォートで囲む！）
WORDS=(
  "シングルサインオン"
  "プロキシサーバー"
  "リバースプロキシ"
  "OpenID"
  "SAML"
  "アイデンティティプロバイダ"
  "サービスプロバイダ"
  "識別子"
  "SPNEGO"
  "アサーション"
  "SOAP"
  "WAF"
  "ポジティブモデル"
  "ネガティブモデル"
  "IDS/IPS"
  "DMZ(緩衝地帯)"
  "トポロジ"
  "リモートアクセス"
  "SFA(Sales Force Automation)"
  "PPP(Point to Port Protocol)"
  "PPPoE"
  "NCP"
  "モデム"
  "PIAFS"
  "PPTP"
  "HDLC"
  "PAP"
  "CHAP"
  "EAP"
  "VPN"
  "RAS(リモートアクセスサーバ)"
)

# JSONファイルを1単語ずつ作成
for WORD in "${WORDS[@]}"; do
  FILE="$OUTPUT_DIR/${WORD}.json"
  cat <<EOF > "$FILE"
{
    "word": "$WORD",
    "description": "模範解答をここに記入してください"
}
EOF
  echo "作成しました: $FILE"
done
