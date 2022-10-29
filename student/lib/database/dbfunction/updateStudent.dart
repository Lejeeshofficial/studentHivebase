import 'package:flutter/material.dart';
 
import 'package:image_picker/image_picker.dart';
import 'package:student/database/dbfunction/functions.dart';
import 'package:student/database/model/datamodel.dart';

final updateNameController = TextEditingController();
final updateAgeController = TextEditingController();
final updateCourseController = TextEditingController();
final updateYearController = TextEditingController();
ImagePicker imagePicker = ImagePicker();
var image;
Future<void> updateStudent(BuildContext context, int index) async {
  // updateNameController.text = studentListNotifer.value[index].name;
  // updateAgeController.text = studentListNotifer.value[index].age;
  // updateCourseController.text = studentListNotifer.value[index].course;
  // updateYearController.text = studentListNotifer.value[index].year;
  // print(updateNameController.text);

  return showDialog(
    context: context,
    builder: (context) {
      return Scaffold(
          resizeToAvoidBottomInset:
              false, // matiyad..dirext returen alertdialog//botom overflow thadayan
          body: AlertDialog(
            title: Text('Update Student Details'),
            content: SingleChildScrollView(
              reverse: true,
              child: Column(
                //colum indairnu njam mati
                mainAxisSize: MainAxisSize.min,
                // scrollDirection: Axis.vertical,
                children: [
                  TextField(
                   // onChanged: (value) {},
                    controller: updateNameController,
                    decoration: InputDecoration(hintText: '${studentListNotifer.value[index].name}'),
                  ),
                  TextField(
                    onChanged: (value) {},
                    controller: updateAgeController,
                    decoration: InputDecoration(hintText: '${studentListNotifer.value[index].age}'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    onChanged: (value) {},
                    controller: updateCourseController,
                    decoration: InputDecoration(hintText: '${studentListNotifer.value[index].course}'),
                  ),
                  TextField(
                    onChanged: (value) {},
                    controller: updateYearController,
                    decoration: InputDecoration(hintText: '${studentListNotifer.value[index].year}'),
                  ),
                  Row(
                    children: [
                      ElevatedButton.icon(
                          onPressed: () async {
                            XFile? img = await imagePicker.pickImage(
                                source: ImageSource.gallery);
                            if (img == null) {
                              image = studentListNotifer.value[index].image;
                            } else {
                              image = img.path;
                            }
                          },
                          icon: Icon(Icons.image),
                          label: Text('Image')),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            onUpdateButtonClicked(index, context);
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.done),
                          label: Text('submit')),
                    ],
                  )
                ],
              ),
            ),
          ));
    },
  );
}

Future<void> onUpdateButtonClicked(int index, context) async {
  final updateName = updateNameController.text;
  final updateAge = updateAgeController.text;
  final updateCourse = updateCourseController.text;
  final updateYear = updateYearController.text;
  if (updateName.isEmpty ||
      updateAge.isEmpty ||
      updateCourse.isEmpty ||
      updateYear.isEmpty) {
    return;
  } else {
    final values = StudentModel(
        name: updateName,
        age: updateAge,
        course: updateCourse,
        year: updateYear,
        image: image);
    updated(values, index);
  }
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green,
      margin: EdgeInsets.all(10),
      content: Text('updated')));
}
