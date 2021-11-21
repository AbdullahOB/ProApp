import 'package:pro_app/components/main_button.dart';
import 'package:pro_app/models/Admin/set_items.dart';
import 'package:pro_app/widgets/title_text.dart';
import 'package:pro_app/components/text_field.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var name;
  setName(value) {
    setState(() {
      name = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Column(
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
          _item(false, "Category Name", "number"),
          ButtonMain(
              text: "ok",
              press: () async {
                await set_category(name);
              }),
          Container(
            height: 100,
          )
        ]))
      ],
    );
  }

  Widget _item(withImage, hintstring, fieldtype) {
    return SizedBox(
      height: 80,
      child: Row(
        children: <Widget>[
          withImage
              ? AspectRatio(
                  aspectRatio: 1.2,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 70,
                          width: 70,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Center(
                        child: Icon(
                          Icons.photo,
                          color: Colors.blue,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                )
              : SizedBox(),
          Expanded(
            child: TextInput(
              child: TextFormField(
                keyboardType: fieldtype == "number"
                    ? TextInputType.number
                    : TextInputType.text,
                onChanged: (value) async {
                  await setName(value);
                },
                decoration: InputDecoration(
                  hintText: hintstring,
                  border: InputBorder.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
