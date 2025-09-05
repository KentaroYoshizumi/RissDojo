#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: filename|word|description
VOCAB_LIST=(
  "iso_19011|ISO 19011|マネジメントシステムの監査に関する国際規格。監査の指針を提供する。"
  "system_audit|システム監査|情報システムの有効性、効率性、安全性を評価する監査活動。"
  "internal_control|内部統制|業務の有効性や法令遵守を確保するための組織的仕組み。"
  "forensics|フォレンジックス|不正や犯罪の証拠を収集・分析する技術や手法。"
  "it_control|IT統制|内部統制の一部で、IT環境に関わるリスクを管理する仕組み。"
  "system_management_standard|システム管理基準|情報システムの適切な管理を行うための指針。"
  "system_audit_standard|システム監査基準|システム監査を行う際の基本的な基準や手順を定めたもの。"
  "detailed_control_measures|詳細管理策|情報セキュリティ対策を具体的に実施するための個別施策。"
  "audit_working_paper|監査調書|監査の過程や根拠を記録した文書。"
  "sampling|サンプリング|監査や調査で一部を抽出して検証を行う手法。"
  "auditability|可監査性|監査を実施可能にするための記録や仕組みの整備度。"
  "mid_long_term_plan|中長期計画書|組織の中期・長期的な方針や目標を示した計画書。"
  "basic_plan|基本計画書|システムや事業運営の基本的な計画を示した文書。"
  "individual_plan|個別計画書|特定のプロジェクトや領域に特化した計画書。"
  "corrective_action|是正処置|問題点を改善し、再発を防止するための対応策。"
)

# JSONファイル作成ループ
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
