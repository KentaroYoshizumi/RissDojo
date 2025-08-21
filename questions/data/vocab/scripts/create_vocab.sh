#!/bin/bash
set -euo pipefail

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: ファイル名|単語|説明
cat <<EOF | while IFS="|" read -r filename word description
confidentiality|機密性|情報が許可されていない人に漏れないように保護すること
availability|可用性|必要なときにシステムや情報を利用できる性質
jis_q_27001|JIS Q 27001|情報セキュリティマネジメントシステムの国際規格
access_control|アクセスコントロール|利用者の権限に応じてシステムや情報へのアクセスを制御する仕組み
isms_certification|ISMS認証|JIS Q 27001に基づいて運用されていることを第三者が認証する制度
accountability|責任追跡性|誰がいつ何をしたかを追跡できる性質
authenticity|真正性|正当な送信者や情報であることを保証する性質
reliability|信頼性|システムが意図した通りに動作し続ける性質
profit|プロフィット|企業活動によって得られる利益
balance_point|バランスポイント|コストと効果のバランスが取れる点
roi|ROI(Return On Investment)|投資収益率を表す指標
vulnerability|脆弱性|システムやソフトに存在する弱点
facility_check|ファシリティチェック|施設や設備の安全性を確認する作業
unauthorized_access_law|不法アクセス禁止法|不正にシステムへ侵入することを禁止する法律
physical_vulnerability|物理的脆弱性|地震や火災など物理的要因による弱点
technical_vulnerability|技術的脆弱性|ソフトウェアやハードウェアに存在する技術的な弱点
sfa|SFA(Sales Force Automation)|営業活動を効率化するシステム
broken_windows_theory|割れ窓理論|小さな問題を放置すると大きな問題に発展するという考え方
security_hole|セキュリティホール|プログラムの不備によるセキュリティ上の穴
defect|瑕疵|製品やサービスに存在する欠陥
buffer_overflow|バッファオーバーフロー|メモリ領域を超えてデータを書き込み不正動作を起こす脆弱性
security_literacy|セキュリティリテラシ|セキュリティに関する正しい知識と判断力
hacktivism|ハクティビズム|政治的・社会的主張のために行われるハッキング活動
EOF
do
  filepath="$OUTPUT_DIR/${filename}.json"
  cat > "$filepath" <<JSON
{
  "word": "$word",
  "description": "$description"
}
JSON
  echo "作成しました: $filepath"
done
