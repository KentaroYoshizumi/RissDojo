#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: filename|word|description
VOCAB_LIST=(
  "iot|IoT|Internet of Things: あらゆるモノがネットワークに接続され通信する仕組み。"
  "protocol_analyzer|プロトコルアナライザ|ネットワーク通信の内容を解析するツール。"
  "gateway|ゲートウェイ|異なるネットワーク間で通信を仲介する装置。"
  "layer4_switch|L4スイッチ|L4情報(TCP/UDPポート)をもとに転送を判断するスイッチ。"
  "nat|NAT(Network Address Translation)|IPアドレスを変換してネットワーク間通信を可能にする技術。"
  "private_ip|プライベートIPアドレス|LAN内部で使用される非公開IPアドレス。"
  "global_ip|グローバルIPアドレス|インターネット上で一意な公開IPアドレス。"
  "ip_masquerade|IPマスカレード|NATの一種で複数端末のIPを単一IPに変換する方法。"
  "nappt|NAPT|Network Address Port Translation: NATのポート変換を含む方式。"
  "nat_plus|NAT＋|NAPTを含む高度なNAT技術の総称。"
  "upnp|UPnP(ユニバーサルプラグアンドプレイ)|家庭内ネットワーク機器の自動設定・通信を支援する技術。"
)

# JSONファイル作成ループ
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
