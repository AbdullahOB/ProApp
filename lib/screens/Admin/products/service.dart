import 'dart:io';

import 'package:pro_app/components/main_button.dart';
import 'package:pro_app/models/Admin/get_items.dart';
import 'package:pro_app/models/Admin/set_items.dart';
import 'package:pro_app/widgets/title_text.dart';
import 'package:pro_app/components/text_field.dart';
import 'package:flutter/material.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:image_picker/image_picker.dart';

class Service extends StatefulWidget {
  const Service({Key? key}) : super(key: key);

  @override
  _ServiceState createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
  var loadcategories = true;
  var categories = [];
  var categoriesChoice = <S2Choice<dynamic>>[];

  var imageFile;
  var selectedLanguages;
  var selectedTags;
  var selectedCategories;
  var name;
  var price;
  var oldprice;
  var discription;

  @override
  void initState() {
    get_all_orders();
    super.initState();
  }

  Future<void> get_all_orders() async {
    categories = await get_items(
      tableName: "categories",
    );

    setState(() {
      loadcategories = categories.isEmpty ? true : false;
    });
    print(categories);

    for (var cat in categories) {
      categoriesChoice
          .add(S2Choice<dynamic>(value: cat["objectId"], title: cat["name"]));
    }
    selectedCategories = categoriesChoice[0].value;
  }

  setPicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        imageFile = File(image.path);
      } else {
        print('No image selected.');
      }
    });
  }

  setName(value) {
    setState(() {
      name = value;
    });
  }

  setOldPrice(value) {
    setState(() {
      oldprice = value;
    });
  }

  setPrice(value) {
    setState(() {
      price = value;
    });
  }

  setDiscription(value) {
    setState(() {
      discription = value;
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
          text: "Admin Panel / Add New Service",
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
            text: "Add New Service",
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Colors.green,
          ),
          Container(
            height: 10,
          ),
          TextButton(
            onPressed: () => {print("object")},
            child: _item(true, "Service name", "text", setName),
          ),
          _item(false, "Service old price", "number", setOldPrice),
          _item(false, "Service price", "number", setPrice),
          _item(false, "Service Discription", "longtext", setDiscription),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              loadcategories
                  ? Text("there is no categories to choose from")
                  : dropDownCostum(queryData, "Category"),
              dropDownCostum(queryData, "Language"),
              dropDownCostum(queryData, "Tags"),
            ],
          ),
          ButtonMain(
              text: "ok",
              press: () async {
                await set_product(
                    name,
                    oldprice,
                    price,
                    discription,
                    selectedCategories.value,
                    selectedLanguages.value,
                    selectedTags.value,
                    imageFile);
              }),
          Container(
            height: 100,
          )
        ]))
      ],
    );
  }

  var languages = <S2Choice<dynamic>>[
    S2Choice<dynamic>(value: "en", title: 'English'),
    S2Choice<dynamic>(value: "tr", title: 'Turkish'),
    S2Choice<dynamic>(value: "ar", title: 'Arabic'),
  ];
  var tags = <S2Choice<dynamic>>[
    S2Choice<dynamic>(value: "no", title: 'no'),
    S2Choice<dynamic>(value: "pubg", title: 'pubg'),
    S2Choice<dynamic>(value: "freefire", title: 'freefire'),
    S2Choice<dynamic>(value: "likee", title: 'likee'),
    S2Choice<dynamic>(value: "bigo", title: 'bigo'),
  ];

  dropDownCostum(queryData, name) {
    return SmartSelect<dynamic>.single(
      selectedChoice: name == "Language"
          ? languages[0]
          : name == "Tags"
              ? tags[0]
              : categoriesChoice[0],
      choiceItems: name == "Language"
          ? languages
          : name == "Tags"
              ? tags
              : categoriesChoice,
      onChange: (value) {
        setState(() {
          name == "Language"
              ? selectedLanguages = value
              : name == "Tags"
                  ? selectedTags = value
                  : selectedCategories = value;
        });
      },
      modalType: S2ModalType.bottomSheet,
      choiceType: S2ChoiceType.chips,
      title: name,
    );
  }

  Widget _item(withImage, hintstring, fieldtype, function) {
    return SizedBox(
      height: 80,
      child: Row(
        children: <Widget>[
          withImage
              ? TextButton(
                  onPressed: () => {setPicture()},
                  child: AspectRatio(
                    aspectRatio: 1.2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: imageFile != null
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black87,
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: FileImage(imageFile),
                                            fit: BoxFit.cover)),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                          ),
                        ),
                        imageFile == null
                            ? Center(
                                child: Icon(
                                  Icons.photo,
                                  color: Colors.blue,
                                  size: 40,
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  ))
              : SizedBox(),
          Expanded(
            child: TextInput(
              child: TextFormField(
                keyboardType: fieldtype == "number"
                    ? TextInputType.number
                    : TextInputType.text,
                onChanged: (value) {
                  function(value);
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
