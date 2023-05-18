import 'dart:io';

import 'package:amenities_app/constant.dart';
import 'package:amenities_app/widgets/button_widgets.dart';
import 'package:amenities_app/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellerAddProduct extends StatefulWidget {
  const SellerAddProduct({Key? key}) : super(key: key);

  @override
  State<SellerAddProduct> createState() => _SellerAddProductState();
}

class _SellerAddProductState extends State<SellerAddProduct> {
  final ImagePicker _picker =ImagePicker();
  File? image;

  // TextEditingController productController = TextEditingController();
  // late final List<XFile>? files;
  // Future<void> getLostData() async {
  //   final ImagePicker picker = ImagePicker();
  //   final LostDataResponse response = await picker.retrieveLostData();
  //   if (response.isEmpty) {
  //     return;
  //   }
  //   files = response.files;
  //   if (files != null) {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Card(
                  child: Center(
                    child: GestureDetector(
                      onTap: ()async{
                       XFile? pikedImage = await _picker.pickImage(source: ImageSource.gallery);
                       // XFile? pikedImage = await _picker.pickImage(source: ImageSource.gallery);
                       setState(() {
                         image= File(pikedImage!.path);
                       });
                      },
                      child:  Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: Colors.teal.shade300,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 50,
                            ),
                            Text(
                              "Selct images",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                image==null?Text("There is no image"):Container(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                        child: Image.file(image!,height: 200,width: 200,))),
              ],
            ),

    customTextField(hintText: 'File name'),
            Spacer(),
            primarybutton(btnText: 'save'),
          ],
        ),
      ),
    );
  }
}
