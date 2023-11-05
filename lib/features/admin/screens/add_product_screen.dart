import 'package:amazonclone/constant/utils.dart';
import 'package:amazonclone/services/auth_services.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../constant/global_variables.dart';
import '../services/services.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  static const String id = "addProductScreen";

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
 final productKeyForm = GlobalKey<FormState>();
  String category = "Mobile";
  List<File> images = [];

  @override
  void dispose() {
    super.dispose();
    _quantityController.dispose();
    _productNameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
  }

  void selectImages() async {
    var result = await pickImages();

    setState(() {
      images = result;
    });
  }

  void sell(){
    if(productKeyForm.currentState!.validate() && images.isNotEmpty) {
      AdminServices().sellProduct(

          name: _productNameController.text,
          description: _descriptionController.text,
          quantity: double.parse(_quantityController.text),
          images: images,
          category: category,
          price: double.parse(_priceController.text),
          context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: productKeyForm,
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              images.isNotEmpty
                  ? CarouselSlider(
                      items: images.map((e) {
                        return Builder(builder: (BuildContext context) {
                          return Image.file(
                            e,
                            fit: BoxFit.fitHeight,
                            height: 200,
                          );
                        });
                      }).toList(),
                      options:
                          CarouselOptions(viewportFraction: 1, height: 200),
                    )
                  : GestureDetector(
                onTap: (){
                  selectImages();
                },
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(20),
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.folder_open),
                              Text(
                                "Select Product Images",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ),
                  ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: _productNameController,
                hint: "Product Name",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: _descriptionController,
                hint: "Description",
                maxLine: 7,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: _priceController,
                hint: "Price",
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: _quantityController,
                hint: "Quantity",
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: DropdownButton(
                  items: GlobalVariables.productCategory
                      .map((String categoryName) {
                    return DropdownMenuItem(
                        value: categoryName, child: Text(categoryName));
                  }).toList(),
                  onChanged: (String? val) {
                    setState(() {
                      category = val!;
                    });
                  },
                  value: category,
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                  ),
                ),
              ),
              CustomButton(text: "Save", onPress: sell,)
            ],
          ),
        ),
      )),
    );
  }
}
