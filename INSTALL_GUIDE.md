# Co-Assign Utils 導入ガイド

勤怠管理システムの工数入力を効率化する Chrome 拡張機能です。

## インストール方法

### 1. PowerShell でインストール

PowerShell を開いて以下のコマンドを実行してください：

```powershell
irm https://github.com/[organization]/[repository]/releases/latest/download/update.ps1 | iex
```

### 2. インストール後の設定

#### 🆕 初回インストールの場合

1. **Chrome 拡張機能ページを開く**

   - Chrome のアドレスバーに `chrome://extensions/` を入力して Enter

2. **デベロッパーモードを有効化**

   - 右上の「デベロッパーモード」スイッチを ON にする

3. **拡張機能を読み込む**
   - 「パッケージ化されていない拡張機能を読み込む」ボタンをクリック
   - 以下のフォルダを選択：
     ```
     C:\Users\[あなたのユーザー名]\AppData\Local\CoAssignUtils
     ```
   - 「フォルダーの選択」をクリック

#### 🔄 更新の場合

1. **Chrome 拡張機能ページを開く**

   - Chrome のアドレスバーに `chrome://extensions/` を入力して Enter

2. **拡張機能をリロード**
   - 「拡張機能名」の更新ボタン 🔄 をクリック
   - または、拡張機能の右下の「削除」の横にある更新アイコンをクリック

## 動作確認

1. 勤怠管理システム（Time Tracking System）を開く
2. HR システム（HR System）を開く
3. 工数未入力の日がオレンジ色でハイライトされることを確認

---

### トラブルシューティング

**Q: PowerShell でエラーが出る**

- 管理者権限は不要です。通常の PowerShell で実行してください。

**Q: 拡張機能が表示されない**

- デベロッパーモードが ON になっているか確認してください。

**Q: 機能が動作しない**

- 勤怠管理システムと HR システムの両方のタブが開いているか確認してください。
