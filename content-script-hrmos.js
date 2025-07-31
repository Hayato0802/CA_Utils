(function () {
  try {
    // デバッグ情報を追加
    console.log('[CA-Utils] HRMOSデータ取得開始');
    
    // 勤務表の左上のプルダウンから年と月までを取得
    const selectElement = document.querySelector('#select');
    if (!selectElement) {
      console.error('[CA-Utils] プルダウン要素が見つかりません');
      return [];
    }
    
    const year_month = selectElement.value;
    console.log('[CA-Utils] 年月:', year_month);

    // 取得したいDOM要素を選択
    let workTimes = [];
    
    // 勤務表の行を取得 - セレクタを拡張
    const rows = document.querySelectorAll('tr.noColor, tr.dayBlue, tr.dayRed, tr[class*="day"], tbody tr');
    console.log('[CA-Utils] 取得した行数:', rows.length);
    
    if (rows.length === 0) {
      console.warn('[CA-Utils] 勤務表の行が見つかりません');
      // テーブル構造をデバッグ
      const tables = document.querySelectorAll('table');
      console.log('[CA-Utils] ページ内のテーブル数:', tables.length);
      tables.forEach((table, index) => {
        console.log(`[CA-Utils] テーブル${index + 1}:`, table.className, 'rows:', table.querySelectorAll('tr').length);
      });
    }
    
    rows.forEach((row, index) => {
      try {
        // 日付セルの取得方法を複数試す
        let dateText = '';
        const dateCell = row.querySelector('.cellDate span') || 
                        row.querySelector('.cellDate') || 
                        row.querySelector('td:first-child span') ||
                        row.querySelector('td:first-child');
        
        if (dateCell) {
          dateText = dateCell.innerText || dateCell.textContent || '';
          dateText = dateText.trim();
        }
        
        let date = dateText ? year_month + "-" + dateText.padStart(2, '0') : '';
        
        // 時刻セルの取得方法を複数試す
        let startTime = '';
        const startCell = row.querySelector('.cellTime01 .item01') || 
                         row.querySelector('.cellTime01') || 
                         row.querySelector('td:nth-child(2)');
        if (startCell) {
          startTime = (startCell.innerText || startCell.textContent || '').trim();
        }
        
        let endTime = '';
        const endCell = row.querySelector('.cellTime02 .item01') || 
                       row.querySelector('.cellTime02') || 
                       row.querySelector('td:nth-child(3)');
        if (endCell) {
          endTime = (endCell.innerText || endCell.textContent || '').trim();
        }
        
        let restTime = '';
        const restCell = row.querySelector('.cellTime07') || 
                        row.querySelector('td:nth-child(8)');
        if (restCell) {
          restTime = (restCell.innerText || restCell.textContent || '').trim();
        }
        
        let workTime = '';
        const workCell = row.querySelector('.cellTime08') || 
                        row.querySelector('td:nth-child(9)');
        if (workCell) {
          workTime = (workCell.innerText || workCell.textContent || '').trim();
        }

        // デバッグ情報
        if (index < 5) {
          console.log(`[CA-Utils] 行${index + 1}: date=${date}, start=${startTime}, end=${endTime}, rest=${restTime}, work=${workTime}`);
        }

        // 開始時刻、終了時刻の両方が取得できた場合、workTimesに追加
        if (startTime && endTime && date) {
          workTimes.push({ date, startTime, endTime, restTime, workTime });
        }
      } catch (rowError) {
        console.error(`[CA-Utils] 行${index + 1}の処理中にエラー:`, rowError);
      }
    });

    console.log('[CA-Utils] 取得した勤務データ数:', workTimes.length);
    if (workTimes.length > 0) {
      console.log('[CA-Utils] サンプルデータ:', workTimes[0]);
    }
    
    return workTimes;
  } catch (error) {
    console.error('[CA-Utils] HRMOSデータ取得エラー:', error);
    return [];
  }
})()
