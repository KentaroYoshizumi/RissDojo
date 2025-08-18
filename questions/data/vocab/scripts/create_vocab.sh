#!/bin/bash
set -euo pipefail

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# word|filename|description の形式で列挙して最後にEOFで閉じる
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
IPS(Intrusion Prevention System)|IPS.json|不正な通信を検知し、遮断まで行うシステム
IDS(Intrusion Detection System)|IDS.json|不正アクセスを検知するシステム
ホスト型IDS|host_based_IDS.json|特定の端末やサーバ上で動作し、不正アクセスを検知するIDS
ネットワーク型IDS|network_based_IDS.json|ネットワークトラフィックを監視して不正を検知するIDS
インラインモード|inline_mode.json|通信経路上に設置して不正を直接遮断する動作モード
プロミスキャスモード|promiscuous_mode.json|全てのパケットを受信して監視するモード
Misuse検知法|misuse_detection.json|既知の攻撃パターンに基づき不正を検知する手法
Anomaly検知法|anomaly_detection.json|通常と異なる挙動を異常として検知する手法
IDP(Intrusion Detection and Prevention system)|IDP.json|IDSとIPSの機能を兼ね備えたシステム
フォールスポジティブ|false_positive.json|正常な通信を誤って攻撃と判定すること
フォールスネガティブ|false_negative.json|攻撃を誤って正常と判定してしまうこと
ハニーポット|honeypot.json|攻撃者を誘導して調査するための疑似システム
コリジョンドメイン|collision_domain.json|同一ネットワークで衝突が発生する領域
サニタイジング|sanitizing.json|入力値を安全に処理するために不要・危険な部分を除去すること
エスケープ処理|escape_processing.json|特殊文字を無害化するための処理
プレースホルダ|placeholder.json|SQL文などで変数部分を一時的に置き換える仕組み
バインド機構|bind_mechanism.json|プレースホルダと値を結びつける仕組み
プリペアドステートメント|prepared_statement.json|SQLインジェクションを防ぐための安全なSQL実行方法
ディレクトリトラバーサル|directory_traversal.json|不正に上位ディレクトリへアクセスする攻撃手法
コマンドインジェクション|command_injection.json|外部コマンドを不正に実行させる攻撃手法
信頼性|reliability.json|障害が少なく、安定して動作する性質
可用性|availability.json|必要な時にシステムが利用可能である性質
保守性|maintainability.json|修正や改善が容易にできる性質
完全性|integrity.json|データが改ざんされず正確である性質
安全性|safety.json|利用者やシステムを危険から守る性質
MTTR(平均処理時間)|MTTR.json|障害発生から復旧までにかかる平均時間
MTBF(平均故障時間)|MTBF.json|故障と故障の間の平均稼働時間
EOF
