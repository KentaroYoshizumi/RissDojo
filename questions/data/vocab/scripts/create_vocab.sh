#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト：filename|word|description
VOCAB_LIST=(
  "service_management|サービスマネジメント|ITサービスを計画・提供・運用・改善する一連の活動。"
  "sla|SLA(Service Level Agreement)|サービス提供者と利用者間で合意されたサービス品質を定める文書。"
  "ola|OLA|組織内の部門間で取り交わすサービス品質に関する合意。"
  "itil|ITIL(Information Technology Infrastructure Library)|ITサービスマネジメントのベストプラクティスを体系化したフレームワーク。"
  "jis_q_20000|JIS Q 20000|ITサービスマネジメントに関する日本工業規格。"
  "jis_q_20000_1|JIS Q 20000-1|ITサービスマネジメントシステムに関する要求事項を定めた日本工業規格。"
  "help_desk|ヘルプデスク|利用者からの問い合わせや問題を受付・対応する窓口。"
  "service_desk|サービスデスク|ITサービスの提供・問い合わせ・障害対応を行う窓口。"
  "local_service_desk|ローカルサービスデスク|特定拠点でのみ運用されるサービスデスク。"
  "central_service_desk|中央サービスデスク|組織全体を対象としたサービスデスク。"
  "virtual_service_desk|ヴァーチャルサービスデスク|リモートやオンラインで提供されるサービスデスク。"
  "follow_the_sun|フォロー・ザ・サン|世界中のタイムゾーンを活用した24時間サポート体制。"
  "facility_management|ファシリティマネジメント|施設や設備の運用・保守・改善活動。"
  "ups|UPS(Uninterruptible Power Supply)|停電時に一定時間電源を供給する装置。"
  "pbl|PBL(Project Based Learning)|課題解決型学習の教育手法。"
  "cafeteria|カフェテリア方式|従業員が選択的に福利厚生を利用できる方式。"
  "faq|FAQ(Frequently Asked Question)|よくある質問とその回答の一覧。"
  "probability_of_occurrence|発生確率|特定の事象が発生する可能性の度合い。"
  "acceptance_level|受容水準|リスクを許容できる水準。"
  "jis_q_31000|JIS Q 31000|リスクマネジメントに関する日本工業規格。"
)

# ループで JSON ファイルを作成
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
