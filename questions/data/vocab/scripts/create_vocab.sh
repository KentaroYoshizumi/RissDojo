#!/bin/bash
set -euo pipefail

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト（英語ファイル名 | 日本語の単語 | 簡単な説明）
cat <<EOF | while IFS="|" read -r filename word description
syslog_protocol|syslogプロトコル|システムログを送信するプロトコル
syslog_process|syslogプロセス|syslogの処理を行うプロセス
syslogd_process|syslogdプロセス|syslogメッセージを管理するデーモン
ntp|NTP(Network Time Protocol)|時刻同期のためのプロトコル
sntp|SNTP(Simple Network Time Protocol)|簡易版のNTP
asset_ledger|資産管理台帳|IT資産を記録する台帳
hub_network|ハブ型ネットワーク|ハブを中心に接続するネットワーク
snmp|SNMP|ネットワーク機器の監視プロトコル
load_share|ロードシェアシステム|負荷分散システム
management_pdu|管理情報(PDU)|SNMPで使うプロトコルデータユニット
mib|MIB|SNMPで管理される情報ベース
rmon|RMON|SNMPの拡張監視仕様
trap_pdu|Trap(PDUの一種)|SNMPで通知に使うPDU
trusted_os|Trusted OS|セキュリティ機能を強化したOS
tcsec|TCSEC|米国のセキュリティ評価基準
secure_os|セキュアOS|セキュリティ機能が組み込まれたOS
least_privilege|minimal特権|必要最小限の権限で運用する考え方
selinux|SELinux|Linuxのセキュリティ強化機能
te|TE(Type Enforcement)|SELinuxの強制アクセス制御方式
rbac|RBAC(Role Based Access Control)|役割に基づくアクセス制御
cloud_computing|クラウドコンピューティング|インターネット経由で提供される計算資源
sla|SLA|サービス品質保証契約
slo|SLO|サービス品質目標
casb|CASB(Cloud Access Security Broker)|クラウド利用を監視・制御する仕組み
iaas|IaaS|クラウドで提供されるインフラ
paas|PaaS|クラウドで提供される開発環境
saas|SaaS|クラウドで提供されるソフトウェア
jisx9401|JIS X 9401|日本のクラウド関連規格
byod|BYOD(Bring Your Own Device)|私物端末を業務利用する形態
thin_client|シンクライアント|処理をサーバー側に依存する端末
mdm|MDM(Mobile Device Management)|モバイル端末の管理システム
shadow_it|シャドーIT|管理外のIT利用
biometric|生体認証|指紋や顔などによる認証
principle_of_least_privilege|最小権限の原則|必要最低限の権限のみを付与する原則
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
