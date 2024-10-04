import 'package:gsheet/gsheet_setup.dart';

insertDataIntoSheet(userDetailsList) async {
  await gsheetCrudUserDetails!.values.map.appendRows(userDetailsList);
  print('DataStored !');
}

List dataFromSheet = [];

readDataFromSheet () async {
  dataFromSheet = (await gsheetCrudUserDetails!.values.map.allRows())!;
  print('===> Data Fetched ! <===');
}