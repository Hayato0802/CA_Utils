# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

Co-Assign Utilsは、Co-Assignワークシート（勤怠管理システム）の使い勝手を向上させるChrome拡張機能です。HRMOSの勤怠データと連携して工数入力を効率化します。

## アーキテクチャ

### 主要ファイル構成

- **manifest.json**: Chrome拡張機能の設定ファイル（v3）
- **background.js**: メッセージ通信のハブとして機能。Co-AssignとHRMOS間のデータ連携を仲介
- **content-script-coassign.js**: Co-Assignサイトで動作する主要スクリプト。UI拡張と工数管理機能を提供
- **content-script-hrmos.js**: HRMOSサイトで勤怠データを取得するスクリプト
- **popup.html/popup.js**: 拡張機能の設定画面（Googleカレンダー連携用メールアドレス設定）

### 通信フロー

1. Co-Assignページで工数チェックや勤務時間取得がトリガーされる
2. content-script-coassign.jsがbackground.jsにメッセージを送信
3. background.jsがHRMOSタブでcontent-script-hrmos.jsを実行
4. HRMOSから勤怠データを取得してCo-Assignに返す

### 主要機能

1. **工数未入力チェック**: HRMOSで勤怠が入力されているがCo-Assignで工数が未入力の日をハイライト
2. **勤務時間自動入力**: HRMOSから開始・終了時刻を取得してCo-Assignに自動入力
3. **工数調整ボタン**: ±5分/±60分の調整ボタンと過不足自動調整機能
4. **Googleカレンダー連携**: ベータ機能として実装
5. **勤務時間差分表示**: HRMOSとCo-Assign間の勤務時間合計の差分を表示

## 開発時の注意事項

### エラーハンドリング

- 全ての関数で try-catch を使用してエラーをキャッチ
- DOM操作は安全なヘルパー関数（safeQuerySelector、safeArrayAccess等）を使用
- エラーメッセージはshowMessage関数でユーザーに通知

### URL監視

- MutationObserverでページ遷移を監視
- worksheetページ以外では機能を無効化し、クリーンアップを実行

### 時刻処理

- HRMOSの「翌」表記は24時間を加算して処理
- 時刻計算はtimeToMinutes/minutesToTime関数で統一

## デバッグ・テスト

拡張機能のテストは以下の手順で実施：

1. Chrome拡張機能管理ページでデベロッパーモードを有効化
2. 「パッケージ化されていない拡張機能を読み込む」でプロジェクトフォルダを選択
3. Co-AssignとHRMOSの両方を開いて動作確認

## ビルド・デプロイ

現在はパッケージ化されていない拡張機能として動作。manifest.jsonのバージョンを更新してリリース。