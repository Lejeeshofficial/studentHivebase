import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student/Screens/addstudentdetails.dart';
import 'package:student/database/dbfunction/functions.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({Key? key}) : super(key: key);

  final img2 =
      'https://expertphotography.b-cdn.net/wp-content/uploads/2020/05/change_background_color_photoshop_teal_background.jpg';

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return  Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(img2),
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(
          //   Colors.white.withOpacity(0.8),
          //   BlendMode.darken,
          // ),
        ),
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Student Details',style: GoogleFonts.getFont('Lato'),),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Click to Add Student",
                    style: TextStyle(fontSize: 24.0, color: Colors .black),
                  ),
                ),
                ElevatedButton.icon(
                  label: Text('Add Students'),
                  icon: Icon(Icons.add,size: 23,),
                  
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (contxt) => studentDetails()));
                  },
                   
                )
              ]),
        ),
      ),
    );
  }
}
