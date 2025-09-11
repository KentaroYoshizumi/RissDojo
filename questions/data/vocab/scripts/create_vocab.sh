#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: filename|word|description
VOCAB_LIST=(
  "repeater|リピータ|物理層で信号を中継・増幅して伝送距離を延長する機器。"
  "hop_limit|段数制限|ネットワーク機器を中継できる最大段数の制限。"
  "ethernet|イーサネット|LANで広く使われる有線ネットワーク規格。"
  "csma_cd|CSMA/CD|イーサネットでの衝突検出アクセス制御方式。"
  "hub|ハブ|複数の機器を接続し、信号を全ポートに中継する装置。"
  "cascade_connection|カスケード接続|複数のハブやスイッチを直列に接続する方法。"
  "bridge|ブリッジ|データリンク層でセグメント間を中継し、トラフィックを制御する機器。"
  "collision_domain|コリジョンドメイン|同時送信で衝突が発生するネットワーク領域。"
  "segment|セグメント|ネットワークを分割した単位領域。"
  "collision|コリジョン|複数の端末が同時に送信し、信号が衝突する現象。"
  "broadcast_storm|ブロードキャストストーム|過剰なブロードキャストが発生し、ネットワーク全体が輻輳する状態。"
  "spanning_tree|スパニングツリー|ループを防ぐために経路を制御するプロトコル。"
  "bpdu_packet|BPDUパケット|スパニングツリーで交換される制御用パケット。"
  "filtering|フィルタリング|不要な通信を遮断または制御する処理。"
  "switching_hub|スイッチングハブ|宛先MACアドレスに基づいて通信を転送するハブ。"
  "atm|ATM(Asynchronous Transfer Mode)|固定長セルを使う高速通信方式。"
)

# JSONファイル作成ループ
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
