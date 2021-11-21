// ignore_for_file: non_constant_identifier_names

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<bool> set_favourite(productId, userId) async {
  var user = await ParseUser.forQuery().getObject(userId.toString());
  var transitions = ParseObject('favourite')
    ..set(
        'product_id', ParseObject('products')..objectId = productId.toString())
    ..set('user_id', user.result);
  final ParseResponse parseResponse = await transitions.save();
  if (parseResponse.success) {
    return true;
  } else {
    return false;
  }
}

Future<bool> set_order(
    product_id, total_amount, total_amount_with_coupons, coupon, message,
    {status = "in process"}) async {
  var user = await ParseUser.currentUser();
  print(user);
  var transitions = ParseObject('orders')
    ..set('user_id', user)
    ..set('manager_id', user["manager_id"])
    ..set('total_amount', total_amount)
    ..set('total_amount_with_coupons', total_amount_with_coupons)
    ..set('coupon', coupon == null ? null : coupon)
    ..set('status', status)
    ..set('message', message)
    ..addRelation(
        'products', [(ParseObject('products')..objectId = product_id)]);
  final ParseResponse parseResponse = await transitions.save();
  if (parseResponse.success) {
    return true;
  } else {
    return false;
  }
}
