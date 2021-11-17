import 'dart:io';

import 'package:pro_app/components/mainButton.dart';
import 'package:pro_app/models/Admin/get_items.dart';
import 'package:pro_app/models/Admin/set_items.dart';
import 'package:pro_app/models/Admin/update_items.dart';
import 'package:pro_app/screens/Admin/components/textfield.dart';
import 'package:pro_app/widgets/title_text.dart';
import 'package:pro_app/components/textField.dart';
import 'package:flutter/material.dart';
import 'package:awesome_select/awesome_select.dart';
import 'package:image_picker/image_picker.dart';

class EditService extends StatefulWidget {
  final id;
  final name;
  final oldprice;
  final price;
  final discription;
  final selectedCategories;
  final selectedLanguages;
  final imageFile;
  const EditService(
      {Key? key,
      this.id,
      this.name,
      this.oldprice,
      this.price,
      this.discription,
      this.selectedCategories,
      this.selectedLanguages,
      this.imageFile})
      : super(key: key);

  @override
  _EditServiceState createState() => _EditServiceState(
      id: this.id,
      name: this.name,
      oldprice: this.oldprice,
      price: this.price,
      discription: this.discription,
      selectedCategories: this.selectedCategories,
      selectedLanguages: this.selectedLanguages,
      imageFile: this.imageFile);
}

class _EditServiceState extends State<EditService> {
  var imageFile;
  var selectedLanguages;
  var selectedCategories;
  var name;
  var price;
  var oldprice;
  var discription;
  var id;
  _EditServiceState(
      {this.id,
      this.name,
      this.oldprice,
      this.price,
      this.discription,
      this.selectedCategories,
      this.selectedLanguages,
      this.imageFile});

  var loadcategories = true;
  var categories = [];
  var categoriesChoice = <S2Choice<dynamic>>[];

  void initState() {
    get_all_orders();
    super.initState();
  }

  Future<void> get_all_orders() async {
    categories = await get_items(
      tableName: "categories",
    );

    setState(() {
      loadcategories = categories.length == 0 ? true : false;
    });
    print(categories);

    for (var cat in categories) {
      categoriesChoice
          .add(S2Choice<dynamic>(value: cat["objectId"], title: cat["name"]));
    }
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
                _item(true, "Service name", "text", setName,
                    value: name.toString()),
                _item(false, "Service old price", "number", setOldPrice,
                    value:
                        oldprice != null ? oldprice.toString() : 0.toString()),
                _item(false, "Service price", "number", setPrice,
                    value: price.toString()),
                _item(false, "Service Discription", "longtext", setDiscription,
                    value: discription.toString()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    loadcategories
                        ? Text("there is no categories to choose from")
                        : dropDownCostum(queryData, "Category"),
                    dropDownCostum(queryData, "Language"),
                  ],
                ),
                ButtonMain(
                    text: "ok",
                    press: () async {
                      await update_product(
                          id,
                          name,
                          oldprice,
                          price,
                          discription,
                          selectedCategories,
                          selectedLanguages,
                          imageFile);
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

  var languages = <S2Choice<dynamic>>[
    S2Choice<dynamic>(value: "en", title: 'English'),
    S2Choice<dynamic>(value: "tr", title: 'Turkish'),
    S2Choice<dynamic>(value: "ar", title: 'Arabic'),
  ];

  dropDownCostum(queryData, name) {
    return SmartSelect<dynamic>.single(
      selectedChoice: name == "Language"
          ? languages.firstWhere((element) =>
              element.value.toString() == selectedLanguages.toString())
          : categoriesChoice.firstWhere((element) =>
              element.value.toString() == selectedCategories.toString()),
      choiceItems: name == "Language" ? languages : categoriesChoice,
      onChange: (value) {
        setState(() {
          name == "Language"
              ? selectedLanguages = value.value.toString()
              : selectedCategories = value.value.toString();
        });
      },
      modalType: S2ModalType.bottomSheet,
      choiceType: S2ChoiceType.chips,
      title: name,
    );
  }

  Widget _item(with_image, hintstring, fieldtype, function, {value = ""}) {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          with_image
              ? TextButton(
                  onPressed: () => {setPicture()},
                  child: AspectRatio(
                    aspectRatio: 1.2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 70,
                            width: 70,
                            child: imageFile != null
                                ? Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black87,
                                        borderRadius: BorderRadius.circular(10),
                                        image: imageFile.runtimeType
                                                    .toString() ==
                                                "ParseFile"
                                            ? DecorationImage(
                                                image: NetworkImage(
                                                    imageFile["url"]
                                                        .toString()),
                                                fit: BoxFit.cover)
                                            : DecorationImage(
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
                initialValue: value,
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
