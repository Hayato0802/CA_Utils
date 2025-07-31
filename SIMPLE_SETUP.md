# 🚀 かんたんセットアップガイド

## 📝 これまでとの違い（3つだけ！）

| これまで | これから |
|---------|----------|
| すぐ使える | 初回だけ設定が必要（5分） |
| 個人のGitHub | 会社のGitHub |
| config.js不要 | **config.jsが必要** |

## 🎯 初回セットアップ（3ステップ）

### 1️⃣ ファイルの準備

1. ZIPファイルをダウンロードして解凍
2. フォルダを開く

### 2️⃣ 設定ファイルを作る（最重要！）

#### 📋 やること
1. `config.example.js`をコピー
2. 名前を`config.js`に変更
3. メモ帳で開いて、以下を書き換え：

```
❌ 変更前：example-timetracking.com
✅ 変更後：co-assign.com（IT部門から聞く）

❌ 変更前：hr.example.com  
✅ 変更後：p.ieyasu.co（IT部門から聞く）
```

4. 保存して閉じる

### 3️⃣ Chromeに読み込む

1. Chrome開く → アドレスバーに`chrome://extensions/`
2. 右上の「デベロッパーモード」をON
3. 「パッケージ化されていない拡張機能を読み込む」
4. さっきのフォルダを選択

## ✅ 完了！

Co-AssignとHRMOSを開いて動作確認してください。

## ⚠️ 注意事項

### 🔴 絶対に忘れないで！
- **config.jsファイルがないと動きません**
- アップデート時は**config.jsをバックアップ**してください

### 💡 困ったときは
- config.jsの内容が分からない → IT部門に聞く
- エラーが出る → config.jsを確認
- それでもダメ → IT部門に連絡

---

## 📱 IT部門の方へ

利用者に提供する情報：
```
1. Co-AssignのURL：https://[サブドメイン].co-assign.com
2. HRMOSのURL：https://[ドメイン]/works/
3. GitHubのURL：https://github.com/[組織]/[リポジトリ]
```