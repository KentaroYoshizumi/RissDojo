#!/bin/bash

# 出力ディレクトリ
OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト
WORDS=(
"VPN"
"暗号化"
"認証"
"インターネットVPN"
"IP-VPN"
"トランスポートモード"
"トンネルモード"
"ペイロード"
"IPsec"
"PPTP"
"MS-CHAP2"
"RC4"
"SSL-VPN"
"SDN(Software-Difined Networking)"
"Open Flow"
"Datapath ID"
"フロー"
"フローテーブル"
"フローエントリ"
"NFV(Network Function Virtualization)"
"SA(Security Association)"
"IKEフェーズ"
"IPsecフェーズ"
"SPI(セキュリティパレメータインデックス)"
"ISAKMP SA"
"メインモード"
"アグレッシブモード"
"クイックモード"
"AH(Authentication Header)"
"ESP(Encapsulating Security Payload)"
)

# 各単語に対応する説明（模範解答）
get_description () {
  case "$1" in
    "VPN") echo "仮想プライベートネットワーク。インターネット上で安全に通信する仕組み" ;;
    "暗号化") echo "通信内容を第三者に読まれないよう変換する技術" ;;
    "認証") echo "通信相手が正しい相手であることを確認する仕組み" ;;
    "インターネットVPN") echo "インターネット回線を利用して構築するVPN" ;;
    "IP-VPN") echo "通信事業者の閉域網を利用するVPN方式" ;;
    "トランスポートモード") echo "IPsecでペイロード部分のみを暗号化する方式" ;;
    "トンネルモード") echo "IPsecでパケット全体を暗号化し新しいIPヘッダを付加する方式" ;;
    "ペイロード") echo "通信データの実際の中身部分" ;;
    "IPsec") echo "インターネットプロトコルの通信を暗号化・認証する仕組み" ;;
    "PPTP") echo "古いVPNプロトコルでセキュリティが弱い" ;;
    "MS-CHAP2") echo "Microsoftのチャレンジハンドシェイク認証プロトコル第2版" ;;
    "RC4") echo "ストリーム暗号方式の一つだが脆弱性がある" ;;
    "SSL-VPN") echo "SSL/TLSを用いて暗号化するVPN方式" ;;
    "SDN(Software-Difined Networking)") echo "ネットワークをソフトウェアで集中制御する仕組み" ;;
    "Open Flow") echo "SDNを実現するための標準プロトコル" ;;
    "Datapath ID") echo "OpenFlowスイッチを識別するためのID" ;;
    "フロー") echo "SDNにおける通信経路の単位" ;;
    "フローテーブル") echo "SDNスイッチが持つフロー制御ルールの表" ;;
    "フローエントリ") echo "フローテーブルの1行に相当する制御ルール" ;;
    "NFV(Network Function Virtualization)") echo "ネットワーク機能を仮想化して提供する技術" ;;
    "SA(Security Association)") echo "暗号化や認証に関する共有情報のセット" ;;
    "IKEフェーズ") echo "IPsecで暗号鍵や認証方式を決める交渉プロセス" ;;
    "IPsecフェーズ") echo "IKEで確立した鍵を使って実際の暗号化通信を行う段階" ;;
    "SPI(セキュリティパレメータインデックス)") echo "SAを識別するためのID" ;;
    "ISAKMP SA") echo "IKEで確立される鍵交換用のセキュリティアソシエーション" ;;
    "メインモード") echo "IKEフェーズ1で行う6回の通信による認証方式" ;;
    "アグレッシブモード") echo "IKEフェーズ1で行う3回の通信による高速だが安全性が低い認証方式" ;;
    "クイックモード") echo "IKEフェーズ2で実際の暗号鍵を交換する方式" ;;
    "AH(Authentication Header)") echo "IPsecで認証のみを行うヘッダ" ;;
    "ESP(Encapsulating Security Payload)") echo "IPsecで暗号化と認証を行うヘッダ" ;;
    *) echo "説明が未登録です" ;;
  esac
}

# JSONファイルを作成
for WORD in "${WORDS[@]}"; do
  DESC=$(get_description "$WORD")
  FILE="$OUTPUT_DIR/${WORD}.json"
  cat <<EOF > "$FILE"
{
    "word": "$WORD",
    "description": "$DESC"
}
EOF
  echo "作成しました: $FILE"
done
