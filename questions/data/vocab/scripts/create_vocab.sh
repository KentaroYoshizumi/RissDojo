#!/bin/bash
set -e

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: filename|word|description
VOCAB_LIST=(
  "dhcp|DHCP|Dynamic Host Configuration Protocol: IPアドレスやネットワーク設定を自動的に割り当てるプロトコル。"
  "dns|DNS(Domain Name System)|ドメイン名とIPアドレスを相互変換する仕組み。"
  "dhcp_relay_agent|DHCPリレーエージェント|異なるネットワーク間でDHCP要求を中継する機能。"
  "name_resolution|名前解決|ドメイン名をIPアドレスへ変換する処理。"
  "domain_name|ドメイン名|インターネット上でのホストを識別する名前。"
  "fqdn|完全修飾ドメイン名(FQDN)|ホスト名＋ドメイン名＋TLDを含む完全なドメイン名。"
  "tld|TLD(Top Level Domain)|ドメイン名の最上位部分(.com, .jpなど)。"
  "sld|SLD(Second Level Domain)|TLDの直下に位置するドメイン部分。"
  "a_record|Aレコード|ドメイン名をIPv4アドレスに対応付けるDNSレコード。"
  "mx_record|MXレコード|メールサーバを指定するDNSレコード。"
  "cname_record|CNAMEレコード|別名（エイリアス）を定義するDNSレコード。"
  "soa_record|SOAレコード|ゾーンの管理情報を定義するDNSレコード。"
  "caa_record|CAAレコード|証明書発行を許可する認証局を指定するDNSレコード。"
  "content_server|コンテンツサーバ|権威DNSサーバの一種で、正規の応答を提供する。"
  "cache_server|キャッシュサーバ|過去のDNS応答を保存し再利用するDNSサーバ。"
  "stub_resolver|スタブリゾルバ|OSやアプリが利用する簡易的なDNSクライアント。"
  "primary_server|プライマリサーバ|DNSゾーンの正本データを保持するサーバ。"
  "secondary_server|セカンダリサーバ|プライマリからゾーン情報をコピーして保持するサーバ。"
  "zone|ゾーン|DNSで管理されるドメイン空間の単位。"
  "zone_transfer|ゾーン転送|プライマリからセカンダリへゾーン情報を同期する仕組み。"
  "zone_file|ゾーンファイル|ゾーンの設定情報を記述するファイル。"
  "open_resolver|オープンリゾルバ|外部からの問い合わせに応答する設定のDNSサーバ。"
)

# JSONファイル作成ループ
for item in "${VOCAB_LIST[@]}"; do
  IFS='|' read -r fname word desc <<< "$item"
  file="$OUTPUT_DIR/$fname.json"
  printf '{\n  "word": "%s",\n  "description": "%s"\n}\n' "$word" "$desc" > "$file"
  echo "Created: $file"
done
