#!/bin/bash
set -euo pipefail

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

while IFS="|" read -r word filename description; do
  filepath="$OUTPUT_DIR/$filename"
  cat > "$filepath" <<JSON
{
  "word": "$word",
  "description": "$description"
}
JSON
  echo "作成しました: $filepath"
done <<'EOF'
フォールトアボイダンス|fault_avoidance.json|故障が発生しないように設計・運用で予防すること
フォールトトレランス|fault_tolerance.json|故障が発生してもシステム全体が継続動作できる仕組み
フェールセーフ|fail_safe.json|故障時に安全側に動作を移す仕組み
フェールオーバー|failover.json|障害発生時に自動的に待機系へ切り替える仕組み
RAID|RAID.json|複数のディスクを組み合わせて冗長性や性能を高める技術
フェールソフト|fail_soft.json|障害が起きても必要最小限の機能を残して動作を続ける仕組み
フールプルーフ|fool_proof.json|利用者が誤操作しても安全に動作する仕組み
フォールトマスキング|fault_masking.json|故障が発生しても外部からは正常に見えるようにする仕組み
故障予防|failure_prevention.json|故障が起きないよう事前に対策すること
UPS(Uninterruptible Power Supply)|UPS.json|停電時に一時的に電力を供給する装置
CVCF(Constant-Voltage Constsnt-Frequency)|CVCF.json|電圧と周波数を一定に保つ電源装置
パリティチェック|parity_check.json|データの誤りを検出するための検査方式
世代管理|generation_management.json|複数世代のバックアップを管理する手法
センドバック保守|send_back_maintenance.json|故障品をメーカーへ返送して修理する保守方式
オンサイト保守|on_site_maintenance.json|保守員が現地へ訪問して修理する方式
故障監視|failure_monitoring.json|システムの稼働状況を監視して故障を検出すること
故障復旧|failure_recovery.json|故障からシステムを復旧させること
ナレッジマネジメント|knowledge_management.json|組織内の知識を共有・活用する管理手法
FMEA(Failure Mode and Effect Analysis)|FMEA.json|故障モードとその影響を分析する手法
FTA(Fault Tree Analysis)|FTA.json|故障要因をツリー構造で解析する手法
性能管理|performance_management.json|システム性能を維持・改善するための管理
バックアップ|backup.json|データを保護するために別の媒体へ保存すること
リストア|restore.json|バックアップからデータを復元すること
バックアップ計画|backup_plan.json|バックアップの方針・頻度・方法を定めた計画
フルバックアップ|full_backup.json|全てのデータを対象にしたバックアップ
増分バックアップ|incremental_backup.json|前回以降に変更されたデータだけを保存するバックアップ
差分バックアップ|differential_backup.json|フルバックアップ以降に変更されたデータを保存する方式
守秘義務条項|confidentiality_clause.json|秘密保持を契約上で義務づける条項
消磁|demagnetization.json|磁気データを完全に消去すること
廃棄管理|disposal_management.json|不要になった機器やデータを安全に廃棄すること
業務継続性|business_continuity.json|障害や災害時にも業務を継続できる性質
遠隔地保存|remote_storage.json|災害対策のため遠隔地にデータを保管すること
IDA(Internet Data Center)|IDC.json|インターネットサービス用の大規模データセンター
NAS(Network Attached Storage)|NAS.json|ネットワーク経由で利用する外部ストレージ
SAN(Storage Area Network)|SAN.json|専用ネットワークを使ってストレージを接続する方式
SCSI-3|SCSI3.json|SCSI規格の第三世代で高性能なデータ転送を実現する方式
Fiber Channel|fiber_channel.json|高速データ転送を実現するストレージ接続規格
データ爆発|data_explosion.json|急激なデータ量増加の現象
EOF
