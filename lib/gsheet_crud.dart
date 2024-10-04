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
      .insertRowByKey('621007ydE1HiSj91', {'name': 'updated New New Name'});
  print('===> Data Updated ! <===');
}
