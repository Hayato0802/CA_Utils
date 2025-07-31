# Co-Assign Utils

Co-Assign ワークシートの使い勝手を向上させるChrome拡張機能

## 機能

- 🔍 **工数未入力チェック**: HRMOSで勤怠が入力されているがCo-Assignで工数が未入力の日をハイライト
- ⏰ **勤務時間自動入力**: HRMOSから開始・終了時刻を取得してCo-Assignに自動入力
- ➕➖ **工数調整ボタン**: ±5分/±60分の調整ボタンと過不足自動調整機能
- 📅 **Googleカレンダー連携**: ベータ機能として実装
- 📊 **勤務時間差分表示**: HRMOSとCo-Assign間の勤務時間合計の差分を表示

## インストール方法

### 方法1: PowerShellスクリプトを使用（推奨）

最新版を自動でインストールするには、PowerShellで以下のコマンドを実行してください：

```powershell
irm https://github.com/[organization]/[repository]/releases/latest/download/update.ps1 | iex
```
※ [organization]/[repository] は実際のリポジトリ名に置き換えてください

特定のバージョンをインストールする場合：

```powershell
# 特定のバージョンは手動でダウンロードしてください
# https://github.com/[organization]/[repository]/releases
```

### 方法2: 手動インストール

1. [Releases](https://github.com/[organization]/[repository]/releases)ページから最新の`co-assign-utils-*.zip`をダウンロード
2. ZIPファイルを任意のフォルダに解凍
3. Chromeで`chrome://extensions/`を開く
4. 右上の「デベロッパーモード」を有効化
5. 「パッケージ化されていない拡張機能を読み込む」をクリック
6. 解凍したフォルダを選択

## 更新方法

### 自動更新通知

拡張機能は24時間ごとに新しいバージョンをチェックします。新しいバージョンが利用可能な場合：

1. 拡張機能アイコンに「NEW」バッジが表示されます
2. ポップアップを開くと更新通知が表示されます
3. 「ダウンロードページへ」リンクをクリックして最新版を入手

### 手動更新

1. 拡張機能のポップアップを開く
2. 「更新を確認」ボタンをクリック
3. 新しいバージョンがある場合は通知が表示されます

## 使い方

### 初期設定

1. 拡張機能アイコンをクリック
2. Googleカレンダー連携用のメールアドレスを入力（オプション）
3. 「保存」をクリック

### 基本的な使い方

1. Co-AssignとHRMOSの両方を開く
2. Co-Assignの稼働管理画面で自動的に以下が実行されます：
   - 工数未入力の日がオレンジ色でハイライト
   - 勤務時間と稼働時間が一致しない行が赤枠で表示
3. 工数入力画面では：
   - 「HRMOSから勤務時間取得」ボタンで時間を自動入力
   - 各プロジェクトの横にある調整ボタンで時間を微調整

### ショートカット

- **+ボタン**: 左クリックで+5分、右クリックで+60分
- **-ボタン**: 左クリックで-5分、右クリックで-60分
- **🕒ボタン**: 労働時間と稼働時間の差分を自動調整

## トラブルシューティング

### インストールスクリプトが動作しない場合

PowerShellの実行ポリシーが制限されている可能性があります：

```powershell
# 実行ポリシーを一時的に変更
Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

# その後、インストールスクリプトを実行
```

### 拡張機能が動作しない場合

1. ChromeとHRMOSの両方が開いているか確認
2. Co-AssignのURLが`https://*.co-assign.com/worksheet/*`に一致しているか確認
3. 拡張機能の権限が正しく設定されているか確認

## 開発者向け情報

### ビルド方法

```bash
# 依存関係のインストール（初回のみ）
# ※この拡張機能は外部依存関係がないため不要

# ビルドスクリプトの実行
chmod +x scripts/build.sh
./scripts/build.sh 1.57
```

### リリース方法

1. `manifest.json`のバージョンを更新
2. 変更をコミット
3. タグを作成してプッシュ：
   ```bash
   git tag v1.57
   git push origin v1.57
   ```
4. GitHub Actionsが自動的にビルドとリリースを作成

### ディレクトリ構成

```
co-assign_utils/
├── manifest.json           # Chrome拡張機能マニフェスト
├── background.js          # バックグラウンドスクリプト（更新チェック含む）
├── content-script-coassign.js  # Co-Assignサイト用スクリプト
├── content-script-hrmos.js     # HRMOSサイト用スクリプト
├── popup.html/js          # 拡張機能ポップアップ
├── images/                # アイコン画像
├── scripts/               # ビルド・インストールスクリプト
│   ├── build.sh          # CRXファイル生成
│   └── install.ps1       # Windowsインストーラー
└── .github/workflows/     # GitHub Actions設定
    └── release.yml       # 自動リリースワークフロー
```

## ライセンス

このプロジェクトは社内利用を目的としています。

## サポート

問題や要望がある場合は、[Issues](https://github.com/[organization]/[repository]/issues)で報告してください。