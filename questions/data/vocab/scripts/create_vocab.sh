#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: filename|word|description
VOCAB_LIST=(
  "protocol|プロトコル|通信でデータをやり取りする際の規約や手順を定めたルール。"
  "osi_reference_model|OSI基本参照モデル|国際標準化機構（ISO）が定めた7階層の通信モデル。"
  "stack|スタック|プロトコルやソフトウェアを階層的に組み合わせた仕組み。"
  "broadcast_communication|ブロードキャスト通信|ネットワーク上の全ノードに同時に送信される通信方式。"
  "broadcast_domain|ブロードキャストドメイン|ブロードキャストが届く範囲を表すネットワークの論理的な区切り。"
  "smtp|SMTP|電子メールを送信するためのプロトコル（Simple Mail Transfer Protocol）。"
  "http|HTTP|Webで情報をやり取りするためのプロトコル（HyperText Transfer Protocol）。"
  "tcp|TCP|信頼性のあるコネクション型通信を提供するプロトコル。"
  "udp|UDP|コネクションレス型で軽量な通信を提供するプロトコル。"
  "circuit_switching|回線交換方式|通信のために物理回線を確立し、接続を維持する方式。"
  "payload|ペイロード|通信データのうち、実際に伝えたい情報部分。"
  "connection_oriented|コネクション型通信|通信の前に接続を確立してからデータを送信する方式。"
  "connectionless|コネクションレス型通信|接続を確立せずにデータを送信する方式。"
  "ip|IP|インターネットで使用されるネットワーク層のプロトコル（Internet Protocol）。"
  "tcp_ip_protocol_suite|TCP/IPプロトコルスイート|インターネットで利用されるプロトコル群の総称。"
  "best_effort|ベストエフォート|品質保証を行わず、可能な限りの努力で通信を提供する方式。"
  "ethernet|イーサネット|LANで広く利用されている通信規格。"
  "icmp|ICMP|エラーメッセージや制御メッセージを伝えるプロトコル（Internet Control Message Protocol）。"
  "global_routing_prefix|グローバルルーティングプレフィックス|IPv6アドレスにおけるインターネット上のルーティングに使われる識別子部分。"
  "anycast|エニーキャスト|複数のノードのうち、最も近いノードにデータを送信する通信方式。"
  "three_way_handshake|３ウェイハンドシェイク|TCPでコネクションを確立するために行う3段階の手順。"
  "syn_flag|SYN|TCP接続開始を要求するフラグ。"
  "ack_flag|ACK|TCPで応答確認を示すフラグ。"
  "sequence_number|シーケンス番号|TCPで送信データの順序を管理する番号。"
  "ack_number|ACK番号|TCPで受信側が次に受信を期待するシーケンス番号を示す番号。"
  "tcp_header_format|TCPヘッダフォーマット|TCPヘッダの各フィールド構造を定めた形式。"
  "ip_header|IPヘッダ|IPパケットに含まれる送信元・宛先や制御情報を格納する部分。"
)

# JSONファイル作成ループ
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
