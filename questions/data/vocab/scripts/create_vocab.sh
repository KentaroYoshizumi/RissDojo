#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: filename|word|description
VOCAB_LIST=(
  "subnet_mask|サブネットマスク|IPアドレスをネットワーク部とホスト部に分けるために使用される値。"
  "classless_subnet_mask|クラスレスサブネットマスク|CIDR方式で利用される柔軟なサブネットマスク。"
  "broadcast_address|ブロードキャストアドレス|同一ネットワーク上のすべてのホストにデータを送るためのアドレス。"
  "network_address|ネットワークアドレス|ネットワークを識別するための先頭のアドレス。"
  "ip_multicast|IPマルチキャスト|特定のグループに属する複数ホストに同時送信する通信方式。"
  "ip_address_class|IPアドレスクラス|IPアドレスをA～Eのクラスに分類した方式。"
  "nic|NIC|コンピュータをネットワークに接続するためのハードウェア（Network Interface Card）。"
  "arp|ARP(Address Resolution Protocol)|IPアドレスからMACアドレスを解決するプロトコル。"
  "well_known_port|Well-Knownポート|0～1023番に割り当てられた、よく知られたサービス用のポート番号。"
  "submission_port|サブミッションポート|メール送信時に利用される587番ポート。"
)

# JSONファイル作成ループ
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
