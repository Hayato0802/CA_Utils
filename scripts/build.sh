#!/bin/bash
# CRXファイル生成スクリプト
# 使用方法: ./build.sh <version>

VERSION=$1
if [ -z "$VERSION" ]; then
    echo "エラー: バージョンを指定してください"
    echo "使用方法: ./build.sh <version>"
    exit 1
fi

echo "Co-Assign Utils v$VERSION のCRXファイルを生成中..."

# 作業ディレクトリの作成
WORK_DIR="build_temp"
rm -rf $WORK_DIR
mkdir -p $WORK_DIR

# 必要なファイルをコピー
cp manifest.json $WORK_DIR/
cp background.js $WORK_DIR/
cp content-script-coassign.js $WORK_DIR/
cp content-script-hrmos.js $WORK_DIR/
cp popup.html $WORK_DIR/
cp popup.js $WORK_DIR/
cp -r images $WORK_DIR/

# manifest.jsonのバージョンを更新
cd $WORK_DIR
jq --arg version "$VERSION" '.version = $version' manifest.json > manifest.tmp.json
mv manifest.tmp.json manifest.json

# ZIP形式でパッケージング（CRXの基本形式）
zip -r ../co-assign-utils-${VERSION}.crx *

cd ..
rm -rf $WORK_DIR

echo "CRXファイルの生成が完了しました: co-assign-utils-${VERSION}.crx"

# Note: 実際のCRX v3形式には署名が必要ですが、
# Chrome Web Store外での配布では開発者モードでZIPファイルとして読み込むため、
# ZIPファイルを.crx拡張子で保存しています。