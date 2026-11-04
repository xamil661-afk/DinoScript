/**
 * ระบบเช็คชื่อเข้าเรียนผ่าน Google Apps Script (JSONP Endpoint)
 * รองรับการบันทึกข้อมูลลงแท็บแรกของ Google Sheet ทันที
 */

function doGet(e) {
  var lock = LockService.getScriptLock();
  // รอคิวไม่เกิน 30 วินาที เพื่อป้องกัน race condition
  lock.tryLock(30000);

  try {
    var params = e.parameter || {};
    var callback = params.callback || 'callback';

    var orderNo = params.orderNo || '';
    var studentId = params.studentId || '';
    var firstName = params.firstName || '';
    var lastName = params.lastName || '';
    var status = params.status || 'มาเรียน';
    var timestamp = Utilities.formatDate(new Date(), 'Asia/Bangkok', 'dd/MM/yyyy HH:mm:ss');

    var ss = SpreadsheetApp.getActiveSpreadsheet();
    // เลือกแท็บที่มีอยู่แล้ว (แท็บแรก เช่น แผ่นงาน1) หรือแท็บ "เช็คชื่อเข้าเรียน"
    var sheet = ss.getSheetByName('เช็คชื่อเข้าเรียน') || ss.getSheets()[0];
    
    // หากชีตยังไม่มีข้อมูลเลย ให้สร้างหัวตาราง
    if (sheet.getLastRow() === 0) {
      sheet.appendRow(['ลำดับ', 'รหัสนักศึกษา', 'ชื่อ', 'นามสกุล', 'สถานะ', 'วันเวลาที่บันทึก']);
      var headerRange = sheet.getRange(1, 1, 1, 6);
      headerRange.setBackground('#2563eb');
      headerRange.setFontColor('#ffffff');
      headerRange.setFontWeight('bold');
      headerRange.setHorizontalAlignment('center');
      sheet.setFrozenRows(1);
    }

    // เพิ่มแถวข้อมูลใหม่
    sheet.appendRow([orderNo, "'" + studentId, firstName, lastName, status, timestamp]);

    // จัด Alignment กึ่งกลาง
    var lastRow = sheet.getLastRow();
    sheet.getRange(lastRow, 1).setHorizontalAlignment('center');
    sheet.getRange(lastRow, 2).setHorizontalAlignment('center');
    sheet.getRange(lastRow, 5).setHorizontalAlignment('center');
    sheet.getRange(lastRow, 6).setHorizontalAlignment('center');

    var result = {
      status: 'success',
      message: 'บันทึกข้อมูลเรียบร้อยแล้ว',
      sheetName: sheet.getName(),
      row: lastRow
    };

    var output = callback + '(' + JSON.stringify(result) + ');';
    return ContentService.createTextOutput(output)
      .setMimeType(ContentService.MimeType.JAVASCRIPT);

  } catch (err) {
    var errorResult = {
      status: 'error',
      message: err.toString()
    };
    var errOutput = (params.callback || 'callback') + '(' + JSON.stringify(errorResult) + ');';
    return ContentService.createTextOutput(errOutput)
      .setMimeType(ContentService.MimeType.JAVASCRIPT);

  } finally {
    lock.releaseLock();
  }
}
