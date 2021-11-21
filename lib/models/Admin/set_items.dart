import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:io';

Future<bool> set_coupon(name, code, percentage, from, to) async {
  var parseObject = ParseObject("coupons")
    ..set("name", name)
    ..set("code", code)
    ..set("percentage", int.parse(percentage))
    ..set("from", from)
    ..set("to", to);

  final ParseResponse parseResponse = await parseObject.save();

  if (parseResponse.success) {
    return true;
  } else {
    return false;
  }
}

Future<bool> set_category(name) async {
  var parseObject = ParseObject("categories")..set("name", name.toString());

  final ParseResponse parseResponse = await parseObject.save();

  if (parseResponse.success) {
    return true;
  } else {
    return false;
  }
}

Future<bool> set_product(name, oldprice, price, discription, categoryId,
    language, tag, image) async {
  ParseFileBase? parseFile;

  parseFile = ParseFile(File(image!.path));

  await parseFile.save();
  var parseObject = ParseObject("products")
    ..set("name", name.toString())
    ..set("old_price", int.parse(oldprice))
    ..set("price", int.parse(price))
    ..set("discription", discription.toString())
    ..set("language_code", language.toString())
    ..set("tag", tag.toString())
    ..set("category",
        ParseObject('categories')..objectId = categoryId.toString())
    ..set("picture", parseFile);

  final ParseResponse parseResponse = await parseObject.save();

  if (parseResponse.success) {
    return true;
  } else {
    return false;
  }
}

Future<bool> set_coin(userId, amount) async {
  var user = await ParseUser.forQuery().getObject(userId.toString());

  QueryBuilder<ParseObject> queryTodo =
      QueryBuilder<ParseObject>(ParseObject("coins"))
        ..whereEqualTo("user_id", user.result);
  final ParseResponse apiResponse = await queryTodo.query();

  if (apiResponse.results != null) {
    int newAmount = apiResponse.results![0]["amount"] + int.parse(amount);
    if (newAmount > apiResponse.results![0]["amount"]) {
      var coins = ParseObject('coins')
        ..objectId = apiResponse.results![0]["objectId"].toString()
        ..set('amount', int.parse(newAmount.toString()));
      await coins.save();
      await set_transitions(user.result, amount);
      return true;
    } else {
      return false;
    }
  } else {
    if (int.parse(amount) > 0) {
      var parseObject = ParseObject("coins")
        ..set("amount", int.parse(amount))
        ..set("user_id", user.result);
      await parseObject.save();
      await set_transitions(user.result, amount);

      return true;
    } else {
      return false;
    }
  }
}

Future<bool> set_transitions(toUserId, amount) async {
  var fromUserId = await ParseUser.getCurrentUserFromServer(
      (await ParseUser.currentUser())["sessionToken"]);
  var transitions = ParseObject('transitions')
    ..set('amount', int.parse(amount.toString()))
    ..set('from_user_id', fromUserId!.result)
    ..set('to_user_id', toUserId)
    ..set('date_time', DateTime.now());
  final ParseResponse parseResponse = await transitions.save();
  if (parseResponse.success) {
    return true;
  } else {
    return false;
  }
}
