#!/bin/bash

OUTPUT_DIR="/Users/kentaroyoshizumi/Desktop/RissDojo/questions/data/vocab"
mkdir -p "$OUTPUT_DIR"

# 単語リスト: "日本語,英語ファイル名,説明"
cat <<EOF | while IFS=',' read -r word filename description
トレードオフ,trade_off,ある要素を優先すると別の要素が犠牲になる関係。
平文,plaintext,暗号化されていない読み取り可能なデータ。
復号,decryption,暗号化されたデータを元の平文に戻す処理。
共通鍵暗号方式,symmetric_key_encryption,送信者と受信者が同じ鍵を使う暗号方式。
公開鍵暗号方式,public_key_encryption,公開鍵で暗号化し秘密鍵で復号する暗号方式。
CRYPTREC,cryptrec,日本の暗号技術評価委員会。安全な暗号リストを策定。
NICT,nict,情報通信研究機構。日本の情報通信分野の研究機関。
DES(Data Encryption Standard),des_standard,古典的な共通鍵暗号方式で現在は安全性に問題あり。
転置,transposition,文字の順序を入れ替えて暗号化する方式。
換字,substitution,文字を他の文字に置き換えて暗号化する方式。
AES(Advanced Encryption Standard),aes_standard,現在主流の強力な共通鍵暗号方式。
TripleDES,triple_des,DESを3回適用して強度を高めた暗号方式。
AES-CBC,aes_cbc,AESの動作モードの一つでブロックを連鎖的に暗号化する。
AES-CTR,aes_ctr,AESの動作モードの一つでカウンタを利用する。
PQC(Post-Quantum Cryptography),post_quantum_crypto,量子コンピュータ時代に安全な暗号方式。
ムーアの法則,moores_law,半導体集積度が約18か月で2倍になる経験則。
RSA,rsa,代表的な公開鍵暗号方式。大きな素因数分解を困難とする。
ボトルネック,bottleneck,システム全体の性能を制約する要素。
量子暗号,quantum_cryptography,量子力学を利用した安全性の高い暗号通信。
Diffie Hellman鍵交換アルゴリズム(DH),diffie_hellman_key_exchange,安全に共通鍵を共有するための鍵交換方式。
前方秘匿性,forward_secrecy,過去の通信内容が将来の鍵漏洩でも解読されない性質。
後方秘匿性,backward_secrecy,新しい鍵が漏洩しても過去の通信が守られる性質。
EOF

do
  filepath="$OUTPUT_DIR/$filename.json"
  cat > "$filepath" <<JSON
{
    "word": "$word",
    "description": "$description"
}
JSON
  echo "Created: $filepath"
done
