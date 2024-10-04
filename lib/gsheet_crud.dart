import 'package:gsheet/gsheet_setup.dart';

insertDataIntoSheet(userDetailsList) async {
  await gsheetCrudUserDetails!.values.map.appendRows(userDetailsList);
  print('===> Data Stored ! <===');
}

List dataFromSheet = [];

readDataFromSheet() async {
  dataFromSheet = (await gsheetCrudUserDetails!.values.map.allRows())!;
  print('===> Data Fetched ! <===');
}

updateDataFromSheet() async {
  await gsheetCrudUserDetails!.values.map
      .insertRowByKey('', {'name': 'updated New New Name'}); // ID
  print('===> Data Updated ! <===');
}

deleteDataFromSheet() async {
  final index = await gsheetCrudUserDetails!.values.rowIndexOf(''); // ID
  await gsheetCrudUserDetails!.deleteRow(index);
  print('===> Row Deleted ! <===');
}
