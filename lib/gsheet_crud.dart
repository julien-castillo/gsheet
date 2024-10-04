import 'package:gsheet/gsheet_setup.dart';
import 'package:gsheets/gsheets.dart';

insertDataIntoSheet(userDetailsList) async {
  await gsheetCrudUserDetails!.values.map.appendRows(userDetailsList);
  print('DataStored !');
}