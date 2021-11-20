import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<bool> set_favourite(product_id, user_id) async {
  var user = await ParseUser.forQuery().getObject(user_id.toString());
  var transitions = ParseObject('favourite')
    ..set(
        'product_id',
        await ParseObject('products')
          ..objectId = product_id.toString())
    ..set('user_id', user.result);
  final ParseResponse parseResponse = await transitions.save();
  if (parseResponse.success) {
    return true;
  } else {
    return false;
  }
}


