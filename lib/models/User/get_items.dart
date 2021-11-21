import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<List<ParseObject>> get_items_with_relations(
    {required tableName, required includeObject}) async {
  QueryBuilder<ParseObject> queryTodo =
      QueryBuilder<ParseObject>(ParseObject(tableName))
        ..includeObject(includeObject)
        ..whereEqualTo("activated", true);

  final ParseResponse apiResponse = await queryTodo.query();

  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}

Future<List<ParseObject>> get_favourite_with_relations() async {
  var user = await ParseUser.currentUser();
  QueryBuilder<ParseObject> queryTodo =
      QueryBuilder<ParseObject>(ParseObject("favourite"))
        ..includeObject(["product_id", "user_id"])
        ..whereEqualTo("activated", true)
        ..whereEqualTo("user_id", user);

  final ParseResponse apiResponse = await queryTodo.query();

  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}

Future<bool> get_coupon(code) async {
  QueryBuilder<ParseObject> queryTodo =
      QueryBuilder<ParseObject>(ParseObject("coupons"))
        ..whereEqualTo("activated", true)
        ..whereEqualTo("code", code)
        ..whereLessThanOrEqualTo("from", DateTime.now())
        ..whereGreaterThanOrEqualsTo("to", DateTime.now())
        ..first();

  final ParseResponse parseResponse = await queryTodo.query();
  if (parseResponse.success) {
    return true;
  } else {
    return false;
  }
}
