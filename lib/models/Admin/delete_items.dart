import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

/// delete_items gets the table name and object id as parameters.
///in delete items we just update the state of [activated] to [false].

Future<bool> delete_item(id, tablename) async {
  print(id.toString());
  var delete = ParseObject(tablename)
    ..objectId = id.toString()
    ..set("activated", false);

  final ParseResponse parseResponse = await delete.save();

  if (parseResponse.success) {
    return true;
  } else {
    return false;
  }
}
