import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:io';

Future<bool> update_coupons(id, name, code, percentage, from, to) async {
  print(id.toString());
  var coupon = ParseObject('coupons')
    ..objectId = id.toString()
    ..set("name", name)
    ..set("code", code)
    ..set("percentage", int.parse(percentage.toString()))
    ..set("from", from)
    ..set("to", to);

  final ParseResponse parseResponse = await coupon.save();

  if (parseResponse.success) {
    return true;
  } else {
    return false;
  }
}

Future<bool> update_categories(id, name) async {
  print(id.toString());
  var categories = ParseObject('categories')
    ..objectId = id.toString()
    ..set("name", name);

  final ParseResponse parseResponse = await categories.save();

  if (parseResponse.success) {
    return true;
  } else {
    return false;
  }
}

Future<bool> update_product(id, name, oldprice, price, discription, categoryId,
    language, tag, image) async {
  ParseFileBase? parseFile;
  if (image.runtimeType.toString() != "ParseFile") {
    parseFile = ParseFile(File(image!.path));
    await parseFile.save();
  }

  var parseObject = ParseObject("products")
    ..objectId = id.toString()
    ..set("name", name.toString())
    ..set("old_price",
        int.parse(oldprice == null ? 0.toString() : oldprice.toString()))
    ..set("price", int.parse(price.toString()))
    ..set("discription", discription.toString())
    ..set("language_code", language.toString())
    ..set("tag", tag.toString())
    ..set("category",
        ParseObject('categories')..objectId = categoryId.toString())
    ..set("picture",
        image.runtimeType.toString() != "ParseFile" ? parseFile : image);

  final ParseResponse parseResponse = await parseObject.save();

  if (parseResponse.success) {
    return true;
  } else {
    return false;
  }
}
