import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/Global.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  @override
  Widget build(BuildContext context) {
    ImagePicker imagePicker = ImagePicker();
    TextEditingController FullName = TextEditingController(text: StudentsData[SelctedIndex].student_name);
    TextEditingController STD = TextEditingController(text: StudentsData[SelctedIndex].student_standard.toString());
    TextEditingController Grid = TextEditingController(text: StudentsData[SelctedIndex].student_grid.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data'),
      ),
      body: Column(
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      XFile? xFileImage = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      setState(() {
                        if (xFileImage != null) {
                          fileImage2 = File(xFileImage!.path);
                          StudentsData[SelctedIndex].student_image=fileImage2;
                        }
                      });
                    },
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage:
                      StudentsData[SelctedIndex].student_image != null ? FileImage(StudentsData[SelctedIndex].student_image) : null,
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    controller: FullName,
                    autocorrect: true,
                    decoration: InputDecoration(
                      label: Text('Name'),
                        border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty)
                        {
                          return 'Fill The Field';
                        }
                    },
                    controller: STD,
                    autocorrect: true,
                    decoration: InputDecoration(
                      label: Text('STD'),
                        border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  SizedBox(height: 15,),

                  TextFormField(
                    validator: (value) {
                      if(value!.isEmpty)
                      {
                        return 'Fill The Field';
                      }
                    },
                    controller: Grid,
                    autocorrect: true,
                    decoration: InputDecoration(
                      label: Text('GR ID'),
                        border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  SizedBox(height: 15,),
                  ElevatedButton(onPressed: () {
                    setState(() {

                    });
                    StudentsData[SelctedIndex].student_grid=Grid.text;
                    StudentsData[SelctedIndex].student_image=fileImage2;
                    StudentsData[SelctedIndex].student_standard=STD.text;
                    StudentsData[SelctedIndex].student_name=FullName.text;
                  }, child: Text('Submit')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

File? fileImage2;
