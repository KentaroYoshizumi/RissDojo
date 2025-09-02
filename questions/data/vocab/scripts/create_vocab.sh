#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: filename|word|description
VOCAB_LIST=(
  "risk_assessment|リスクアセスメント|リスクを特定し、その発生可能性や影響度を評価する活動。"
  "detailed_risk_analysis|詳細リスク分析|リスクに関してより詳細なデータやモデルを用いて行う評価手法。"
  "matrix_chart|マトリックスチャート|複数の要素やリスクを縦軸と横軸に配置し、関係性や優先度を可視化する図表。"
  "direct_loss|直接損失|事故や障害の発生により直接的に発生する損害。"
  "indirect_loss|間接損失|直接損失に付随して生じる二次的な損害。"
  "response_cost|対応費用|事故や障害への対応のために必要となる費用。"
  "quantitative_risk_evaluation|定量的リスク評価|リスクを数値や金額で定量的に表す評価手法。"
  "qualitative_risk_evaluation|定性的リスク評価|リスクを高・中・低などの段階で表す評価手法。"
  "risk_control|リスクコントロール|リスクを管理・低減するための一連の取り組み。"
  "risk_mitigation|リスク低減|リスクの発生確率や影響を軽減させる対策。"
  "risk_avoidance|リスク回避|リスクの原因を排除し、発生そのものを避ける対策。"
  "risk_retention|リスク保有|リスクを容認し、自社で負担する方針。"
  "risk_transfer|リスク移転|保険契約などによりリスクを第三者に移す方法。"
  "contingency_plan|コンティンジェンシープラン|予期せぬ事態に備えた代替計画。"
)

# JSONファイル作成ループ
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
