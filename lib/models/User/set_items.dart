import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<bool> set_favourite(productId, userId) async {
  var user = await ParseUser.forQuery().getObject(userId.toString());
  var transitions = ParseObject('favourite')
    ..set(
        'product_id',
        ParseObject('products')
          ..objectId = productId.toString())
    ..set('user_id', user.result);
  final ParseResponse parseResponse = await transitions.save();
  if (parseResponse.success) {
    return true;
  } else {
    return false;
  }
}


