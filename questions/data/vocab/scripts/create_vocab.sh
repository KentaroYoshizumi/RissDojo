#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: filename|word|description
VOCAB_LIST=(
  "router|ルータ|異なるネットワーク間でパケットを転送する装置。"
  "broadcast_domain|ブロードキャストドメイン|ブロードキャストが届く範囲のネットワーク領域。"
  "internetworking|インターネットワーキング|複数のネットワークを接続して通信可能にする仕組み。"
  "default_gateway|デフォルトゲートウェイ|他ネットワークに通信する際の中継先ルータ。"
  "routing|経路制御|パケットを転送する最適な経路を決定する仕組み。"
  "routing_table|ルーティングテーブル|ルータやOSが保持する経路情報の一覧。"
  "layer3_switch|レイヤ3スイッチ|スイッチ機能に加えてルーティングも行える装置。"
  "static_routing|スタティックルーティング|管理者が手動で設定する固定経路制御。"
  "dynamic_routing|ダイナミックルーティング|ルータ間で自動的に経路を学習・交換する仕組み。"
  "vlan|VLAN|仮想的にネットワークを分割する仕組み。"
  "address_based_vlan|アドレスベースVLAN|端末のMACアドレスに基づいて分割するVLAN。"
  "policy_based_vlan|ポリシーベースVLAN|ユーザやアプリケーションのポリシーに基づいて分割するVLAN。"
  "trunk_port|トランクポート|複数のVLANトラフィックを同時に通すポート。"
  "access_port|アクセスポート|特定の1つのVLANに属するポート。"
  "vxlan|VXLAN(Virtual Extensible LAN)|L2ネットワークをL3上に仮想的に拡張する技術。"
  "vtep|VTEP(Virtual Tunnel End Point)|VXLANトンネルの端点となる機能を持つ装置。"
)

# JSONファイル作成ループ
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
