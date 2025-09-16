#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: filename|word|description
VOCAB_LIST=(
  "smtp|SMTP|電子メールを送信するための標準プロトコル。"
  "pop3|POP3|メールサーバからメールを取得するプロトコル。"
  "apop|APOP|POP3の拡張で、パスワードを暗号化して送信する認証方式。"
  "imap4|IMAP4|メールサーバ上でメールを管理し、複数端末から同期可能なプロトコル。"
  "pgp|PGP(Pretty Good Privacy)|メールの暗号化と署名に使われるセキュリティ技術。"
  "pop_before_smtp|POP Before SMTP|SMTP送信前にPOP認証を行う方式。"
  "smtp_auth|SMTP Authentication(SMTP-Auth)|SMTPで送信者認証を行う方式。"
  "smtps|SMTPS|SMTP over SSL/TLSで安全にメールを送信するプロトコル。"
  "domain_auth|送信ドメイン認証|送信メールが正当なドメインから送られたか検証する技術。"
  "spf|SPF(Sender Policy Framework)|送信元IPがそのドメインの送信を許可されているかを判定するDNSレコード。"
  "txt_record|TXTレコード|DNSでテキスト情報を格納するレコード。SPFなどに使用される。"
  "dkim|DKIM(DomainKeys Identified Mail)|電子署名を用いて送信者の正当性を確認する技術。"
)

# JSONファイル作成ループ
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
