import 'package:pro_app/components/main_button.dart';
import 'package:pro_app/models/Admin/set_items.dart';
import 'package:pro_app/models/Admin/update_items.dart';
import 'package:pro_app/screens/Admin/components/textfield.dart';
import 'package:pro_app/widgets/title_text.dart';
import 'package:pro_app/components/text_field.dart';
import 'package:flutter/material.dart';

class EditCategory extends StatefulWidget {
  final id;
  final name;
  const EditCategory({Key? key, this.id, this.name}) : super(key: key);

  @override
  _EditCategoryState createState() =>
      _EditCategoryState(id: id, name: name);
}

class _EditCategoryState extends State<EditCategory> {
  var id;
  var name;
  _EditCategoryState({this.id, this.name});

  setName(value) {
    setState(() {
      name = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Material(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              TitleText(
                text: "Admin Panel / Add New Category",
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              TitleText(
                text: "Osid Alsagir",
                fontSize: 27,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              Expanded(
                  child: ListView(children: [
                TitleText(
                  text: "Add New Category",
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.green,
                ),
                Container(
                  height: 10,
                ),
                textfield(false, "Category Name", "number", setName,
                    value: name.toString()),
                ButtonMain(
                    text: "ok",
                    press: () async {
                      await update_categories(id, name);
                    }),
                Container(
                  height: 100,
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
