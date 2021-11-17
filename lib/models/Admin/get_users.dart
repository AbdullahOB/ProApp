import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:io';

Future<List<ParseObject>> get_users() async {
  QueryBuilder<ParseUser> queryUsers =
      QueryBuilder<ParseUser>(ParseUser.forQuery());

  final ParseResponse apiResponse = await queryUsers.query();

  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}
