import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<List<ParseObject>> get_items({required tableName}) async {
  QueryBuilder<ParseObject> queryTodo =
      QueryBuilder<ParseObject>(ParseObject(tableName));
  final ParseResponse apiResponse = await queryTodo.query();

  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}

Future<List<ParseObject>> get_user_data({required user_id}) async {
  QueryBuilder<ParseUser> queryUsers =
      QueryBuilder<ParseUser>(ParseUser.forQuery())
        ..whereEqualTo("objectId", user_id);
  final ParseResponse apiResponse = await queryUsers.query();

  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}

Future<List<ParseObject>> get_items_with_relations(
    {required tableName, required includeObject}) async {
  QueryBuilder<ParseObject> queryTodo =
      QueryBuilder<ParseObject>(ParseObject(tableName))
        ..includeObject(includeObject);

  final ParseResponse apiResponse = await queryTodo.query();

  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}

Future<List<dynamic>> get_items_with_one_relations_many(
    {required tableName, required includeObject}) async {
  List<dynamic> products = [];
  QueryBuilder<ParseObject> queryTodo =
      QueryBuilder<ParseObject>(ParseObject(tableName))
        ..includeObject(includeObject)
        ..setLimit(4);
  final ParseResponse apiResponse = await queryTodo.query();

  for (var results in apiResponse.results as List<ParseObject>) {
    QueryBuilder<ParseObject> ss =
        QueryBuilder<ParseObject>(ParseObject("products"))
          ..whereRelatedTo('products', 'orders', results["objectId"]);
    final ParseResponse ds = await ss.query();
    products.add({results["objectId"]: ds.result});
  }

  if (apiResponse.success && apiResponse.results != null && products != []) {
    return [apiResponse.results as List<ParseObject>, products];
  } else {
    return [];
  }
}