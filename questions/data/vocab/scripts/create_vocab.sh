#!/bin/sh

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

vocab_data='
information_security_policy.json|{ "word": "情報セキュリティポリシー", "description": "組織における情報セキュリティに関する基本的な方針を定めた文書" }
residual_risk.json|{ "word": "残留リスク", "description": "リスク対応を行った後も残るリスク" }
obsolescence.json|{ "word": "死文化", "description": "制度やルールが形骸化し、実際には守られなくなること" }
isms.json|{ "word": "情報セキュリティマネジメントシステム(ISMS)", "description": "情報資産の機密性・完全性・可用性を管理・維持する仕組み" }
baseline_approach.json|{ "word": "ベースラインアプローチ", "description": "標準的なセキュリティ対策を最低限として全体に適用する手法" }
bs7799_1.json|{ "word": "BS7799-1", "description": "英国で制定された情報セキュリティ管理規格の第1部（管理策コード）" }
bs7799_2.json|{ "word": "BS7799-2", "description": "英国で制定された情報セキュリティ管理規格の第2部（ISMS認証基準）" }
iso_iec_27002.json|{ "word": "ISO/IEC 27002", "description": "情報セキュリティ管理策の国際的な実践規範" }
jis_q_27002.json|{ "word": "JIS Q 27002", "description": "ISO/IEC 27002を日本工業規格化した規格" }
jis_q_27001.json|{ "word": "JIS Q 27001", "description": "情報セキュリティマネジメントシステム(ISMS)の要求事項を規定した日本工業規格" }
information_security_event.json|{ "word": "情報セキュリティ事象", "description": "情報システムやネットワークにおけるセキュリティ関連の事象" }
information_security_incident.json|{ "word": "情報セキュリティインシデント", "description": "情報セキュリティの侵害や違反に該当する事象" }
jipdec.json|{ "word": "JIPDEC(日本情報処理開発協会)", "description": "日本における個人情報保護や情報セキュリティ認証を推進する団体" }
information_security_governance.json|{ "word": "情報セキュリティガバナンス", "description": "経営層が主体となって組織全体の情報セキュリティを管理・統制する仕組み" }
csirt_guideline.json|{ "word": "CSIRTガイド", "description": "CSIRTの設立や運営に関する参考となるガイドライン" }
version_control.json|{ "word": "世代管理", "description": "ファイルやデータの更新履歴を管理し、特定の版を復元できるようにする仕組み" }
procedure.json|{ "word": "Procedure", "description": "業務や処理の手順を定めた文書" }
csirt.json|{ "word": "CSIRT", "description": "Computer Security Incident Response Teamの略で、セキュリティインシデントに対応する専門組織" }
jpcert_cc.json|{ "word": "JPCERT/CC", "description": "日本のコンピュータセキュリティインシデント対応チーム（Japan Computer Emergency Response Team Coordination Center）" }
soc.json|{ "word": "SOC(Security Operation Center)", "description": "組織のセキュリティ監視・分析・対応を行う専門チーム" }
psirt.json|{ "word": "PSIRT", "description": "Product Security Incident Response Teamの略で、製品やサービスに関するセキュリティインシデントに対応するチーム" }
'

echo "$vocab_data" | while IFS="|" read -r filename json; do
  echo "$json" > "$OUTPUT_DIR/$filename"
  echo "Created: $OUTPUT_DIR/$filename"
done
