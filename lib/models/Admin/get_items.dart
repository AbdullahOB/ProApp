import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<List<ParseObject>> get_items({required tableName}) async {
  QueryBuilder<ParseObject> queryTodo =
      QueryBuilder<ParseObject>(ParseObject(tableName))
        ..whereEqualTo("activated", true);
  final ParseResponse apiResponse = await queryTodo.query();

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

Future<List<dynamic>> get_items_with_many_relations_many(
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
          ..whereRelatedTo('products', 'orders', results["objectId"])
          ..includeObject(["category"]);

    final ParseResponse ds = await ss.query();
    products.add({results["objectId"]: ds.result});
  }

  if (apiResponse.success && apiResponse.results != null && products != []) {
    return [apiResponse.results as List<ParseObject>, products];
  } else {
    return [];
  }
}

Future<List<ParseObject>> get_transitions_for_current_user() async {
  var user = await ParseUser.forQuery()
      .getObject((await ParseUser.currentUser())["objectId"].toString());

  final QueryBuilder<ParseObject> query1 =
      QueryBuilder<ParseObject>(ParseObject('transitions'));
  query1.whereEqualTo("from_user_id", user.result);

  final QueryBuilder<ParseObject> query2 =
      QueryBuilder<ParseObject>(ParseObject('transitions'));
  query2.whereLessThan('to_user_id', user.result);

  QueryBuilder<ParseObject> mainQuery = QueryBuilder.or(
    ParseObject("transitions"),
    [query1, query2],
  )..includeObject(["form_user_id", "to_user_id"]);

  final ParseResponse apiResponse = await mainQuery.query();

  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}

Future<List<ParseObject>> get_coins_for_current_user() async {
  var user = await ParseUser.forQuery()
      .getObject((await ParseUser.currentUser())["objectId"].toString());

  QueryBuilder<ParseObject> query =
      QueryBuilder<ParseObject>(ParseObject("coins"))
        ..whereEqualTo("user_id", user.result)
        ..includeObject(["user_id"]);

  final ParseResponse apiResponse = await query.query();

  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}
