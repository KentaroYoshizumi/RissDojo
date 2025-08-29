#!/bin/sh
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# filename|word|description
while IFS='|' read -r fname word desc; do
  [ -z "$fname" ] && continue  # 空行スキップ
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done <<'EOF'
certification_audit|認証審査|規格や基準適合を第三者が審査する。
surveillance_audit|維持審査(サーベイランス)|認証維持のための定期審査。
renewal_audit|更新審査|認証の有効期限更新のための再審査。
followup_audit|フォローアップ監査|不適合の是正状況を確認する監査。
iso_iec_15408|ISO/IEC 15408|情報セキュリティ評価基準（Common Criteria）。
facility_check|ファシリティチェック|設備・環境を確認しリスクを評価する。
volume_license|ボリュームライセンス|多数端末向けの一括ソフトウェアライセンス。
site_license|サイトライセンス|組織/拠点単位で包括的に使えるライセンス。
penetration_test|ペネトレーションテスト|攻撃を模して脆弱性を確認するテスト。
security_patch|セキュリティパッチ|脆弱性を修正するソフトウェア更新。
jpcert_cc|JPCERT/CC|日本のインシデント対応機関。
exploit_code|Exploitコード|脆弱性を悪用するためのコード。
zero_day_attack|ゼロデイ攻撃|未公開・未修正の脆弱性を突く攻撃。
audit_trail|監査証跡|操作履歴を追跡可能にする記録。
audit_criteria|監査基準|監査で用いる評価基準・要件。
EOF
