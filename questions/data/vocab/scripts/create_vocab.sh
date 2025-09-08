#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: filename|word|description
VOCAB_LIST=(
  "assembler|アセンブラ|機械語に対応する低水準のプログラミング言語。ソースコードを機械語に変換する役割も持つ。"
  "directory_traversal_attack|ディレクトリトラバーサル攻撃|相対パス指定などを悪用して、本来アクセスできないファイルやディレクトリに不正アクセスする攻撃手法。"
  "symbolic_link|シンボリックリンク|ファイルやディレクトリへの参照を持つ特殊なファイル。ショートカットのような役割を果たす。"
  "race_condition|レースコンディション|複数の処理が同時に実行され、処理順序によって結果が変わってしまう問題。"
  "sandbox|サンドボックス|外部から持ち込んだプログラムを隔離された環境で実行し、システムへの影響を防ぐ仕組み。"
  "class_loader|クラスローダ|Javaなどでクラスを動的にロードする仕組み。セキュリティ制御の対象となる。"
  "json_hijacking|JSONハイジャック|JSONデータを利用して攻撃者に機密情報を盗み取られる脆弱性攻撃。"
  "jsonp|JSONP(JavaScript Object Notation with Padding)|クロスドメインでデータを取得するために考案された仕組み。安全性に課題がある。"
  "xml_http_request|XMLHttpRequest|JavaScriptから非同期通信を行うAPI。AJAXの基盤技術として広く利用される。"
  "same_origin_policy|Same-Originポリシ|異なるオリジン間でのデータアクセスを制限するブラウザのセキュリティモデル。"
)

# JSONファイル作成ループ
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
