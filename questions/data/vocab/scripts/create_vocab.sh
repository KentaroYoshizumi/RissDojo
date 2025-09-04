#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: filename|word|description
VOCAB_LIST=(
  "security_incident|セキュリティインシデント|情報セキュリティに関する事故や脅威が発生した事象。"
  "triage|トリアージ|インシデントや障害の優先度を迅速に判断し、対応の順序を決定すること。"
  "snapshot|スナップショット|システムやデータのある時点の状態を保存したコピー。"
  "ping_pong_infection|ピンポン感染|コンピュータウイルスが相互に感染し合うことで再発を繰り返す現象。"
  "digital_forensics|デジタルフォレンジックス|デジタル機器やデータを調査・分析し、不正の証拠を収集する技術。"
  "bcp|BCP(Business Continuity Plan)|災害や障害時に重要業務を継続するための計画。"
  "bcm|BCM(Business Continuity Management)|事業継続計画(BCP)を策定・運用・改善するための管理プロセス。"
  "rto|RTO(Recovery Time Objective)|システム障害から復旧するまでに許容される最長時間。"
  "rpo|RPO(Recovery Point Objective)|障害発生時に復旧できるデータの最新時点を示す目標。"
)

# JSONファイル作成ループ
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
