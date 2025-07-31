# Co-Assign Utils 導入・運用手順書

## ⚠️ 重要：これまでとの変更点

### 🔄 運用が変わる部分

1. **初回セットアップが必要になりました**
   - 以前：ダウンロードしてすぐ使える
   - 今後：**config.jsファイルの作成が必要**（初回のみ、5分程度）

2. **GitHubのURLが変わります**
   - 以前：個人のGitHubアカウント
   - 今後：組織のGitHubアカウント（IT部門から連絡）

3. **アップデートコマンドが変わります**
   - 以前：`irm https://github.com/Hayato0802/...`
   - 今後：IT部門から提供される新しいコマンド

## 📋 導入手順（初めての方向け）

### ステップ1：ファイルのダウンロード

1. **ダウンロードリンクを開く**
   - IT部門から提供されたダウンロードリンクをクリック
   - 例：`https://github.com/[組織名]/[リポジトリ名]/releases`

2. **ZIPファイルをダウンロード**
   - 最新版の`co-assign-utils-*.zip`をクリック
   - ダウンロードフォルダに保存されます

3. **ZIPファイルを解凍**
   - ダウンロードしたZIPファイルを右クリック
   - 「すべて展開...」を選択
   - デスクトップなど分かりやすい場所に展開

### ステップ2：設定ファイルの作成（重要！）

1. **解凍したフォルダを開く**
   - 先ほど展開したフォルダをダブルクリックで開く

2. **config.example.jsを探す**
   - フォルダ内の`config.example.js`というファイルを見つける
   - このファイルを右クリック → 「コピー」

3. **貼り付けて名前を変更**
   - 同じフォルダ内で右クリック → 「貼り付け」
   - 貼り付けたファイル`config.example - コピー.js`を右クリック
   - 「名前の変更」を選択
   - **config.js**に変更（`.example`の部分を削除）

4. **メモ帳で編集**
   - `config.js`を右クリック → 「プログラムから開く」 → 「メモ帳」
   - 以下の3箇所を書き換えます：

```javascript
// 変更前
TIMETRACKING_URL_PATTERN: 'https://*.example-timetracking.com/worksheet/*',
TIMETRACKING_BASE_URL: 'https://subdomain.example-timetracking.com/worksheet',
HR_SYSTEM_URL_PATTERN: 'https://hr.example.com/works/*',

// 変更後（IT部門から提供される情報に書き換え）
TIMETRACKING_URL_PATTERN: 'https://*.co-assign.com/worksheet/*',
TIMETRACKING_BASE_URL: 'https://blueship.co-assign.com/worksheet',
HR_SYSTEM_URL_PATTERN: 'https://p.ieyasu.co/works/*',
```

5. **保存して閉じる**
   - メモ帳で「ファイル」→「上書き保存」
   - メモ帳を閉じる

### ステップ3：Chrome拡張機能として読み込む

1. **Chromeを開く**
   - Google Chromeを起動

2. **拡張機能ページを開く**
   - アドレスバーに以下を入力してEnter：
   ```
   chrome://extensions/
   ```

3. **デベロッパーモードを有効化**
   - 右上の「デベロッパーモード」スイッチをクリックしてONにする
   - スイッチが青色になればOK

4. **拡張機能を読み込む**
   - 「パッケージ化されていない拡張機能を読み込む」ボタンをクリック
   - ステップ2で編集したフォルダを選択
   - 「フォルダーの選択」をクリック

5. **拡張機能をピン留め**
   - Chromeの右上のパズルピースアイコン🧩をクリック
   - 「Co-Assign Utils」の横の📌をクリック

### ステップ4：動作確認

1. **必要なサイトを開く**
   - Co-Assignを開く
   - HRMOSを別タブで開く

2. **機能が動作することを確認**
   - 工数未入力の日がオレンジ色でハイライト表示される
   - 各種ボタンが表示される

## 🔄 アップデート手順

### 方法1：PowerShellを使用（推奨）

1. **PowerShellを開く**
   - Windowsキー + X → 「Windows PowerShell」を選択

2. **アップデートコマンドを実行**
   - IT部門から提供されたコマンドをコピー＆ペースト
   - 例：
   ```powershell
   irm https://github.com/[組織名]/[リポジトリ名]/releases/latest/download/update.ps1 | iex
   ```

3. **Chrome拡張機能をリロード**
   - `chrome://extensions/`を開く
   - Co-Assign Utilsの更新ボタン🔄をクリック

### 方法2：手動アップデート

1. 最新版のZIPファイルをダウンロード
2. **重要：config.jsファイルをバックアップ**
3. 古いフォルダを新しいファイルで上書き
4. **バックアップしたconfig.jsを戻す**
5. Chrome拡張機能をリロード

## ❓ よくある質問

### Q: config.jsファイルを作らないとどうなりますか？
**A:** 拡張機能が正しく動作しません。必ず作成してください。

### Q: config.jsに入力する情報が分かりません
**A:** IT部門にお問い合わせください。以下の情報を提供してもらえます：
- Co-AssignのURL
- HRMOSのURL

### Q: アップデート時にconfig.jsが消えてしまいました
**A:** config.jsは毎回作り直す必要があります。config.example.jsをコピーして再度作成してください。

### Q: 「デベロッパーモードは危険」という警告が出ます
**A:** 社内利用の拡張機能では正常な表示です。そのまま進めてください。

## 📞 サポート

不明な点がございましたら、IT部門までお問い合わせください。

---

**付録：IT部門向け情報**

配布時に以下の情報を利用者に提供してください：
1. GitHubリポジトリのURL
2. config.js用の設定値
   - TIMETRACKING_URL_PATTERN
   - TIMETRACKING_BASE_URL  
   - HR_SYSTEM_URL_PATTERN
3. PowerShellアップデートコマンド（リポジトリURLを含む）