#!/bin/bash

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: "日本語,英語ファイル名,説明"
cat <<EOF | while IFS=',' read -r word filename description
アクセスコントロール,access_control,システムやデータへのアクセスを制御する仕組み。
権限管理,privilege_management,ユーザーやプロセスに付与する操作権限を管理する仕組み。
識別,identification,利用者が誰であるかを名乗る行為。
認可,authorization,特定の操作を許可または禁止する判断を行うこと。
認証,authentication,利用者が名乗った本人であるかを確認すること。
ローカルノード,local_node,ネットワークに接続された各端末やサーバを指す用語。
UUID(Universal Unique Identifier),uuid,重複しない一意の識別子を生成するための標準規格。
ディレクトリサーバ認証方式,directory_server_authentication,ディレクトリサーバを利用してユーザー認証を行う方式。
スタンドアロン認証方式,standalone_authentication,単独の端末やシステム内で認証を完結させる方式。
クリアテキスト認証,cleartext_authentication,暗号化されていない平文のパスワードを用いる認証方式。
チャレンジレスポンス認証,challenge_response_authentication,サーバからのチャレンジに対して正しい応答を返すことで認証する方式。
チャレンジコード,challenge_code,チャレンジレスポンス認証でサーバが送信する一時的な乱数。
ハッシュ値,hash_value,データから算出された固定長の値でデータの改ざん検出に利用される。
ハッシュ関数,hash_function,入力データからハッシュ値を生成する一方向性の関数。
ワンタイムパスワード,one_time_password,一度だけ使用できるパスワードでセキュリティを強化する。
S/KEY,skey,ワンタイムパスワードの一方式でハッシュ連鎖を利用する。
シーケンス番号,sequence_number,通信の順序を制御するために付与される連番。
シード,seed,乱数生成やワンタイムパスワード生成の初期値となる値。
時刻同期方式,time_synchronization,時刻情報を基準にワンタイムパスワードなどを生成する方式。
ソルト,salt,ハッシュ化の際に追加されるランダムな値で辞書攻撃やレインボーテーブル攻撃を防ぐ。
二要素認証,two_factor_authentication,異なる二種類の要素を用いて行う強固な認証方式。
リスクベース認証,risk_based_authentication,アクセス環境や行動パターンに応じてリスクを評価し認証強度を変える方式。
EOF

do
  filepath="$OUTPUT_DIR/${filename}.json"
  cat > "$filepath" <<JSON
{
    "word": "$word",
    "description": "$description"
}
JSON
  echo "Created: $filepath"
done
