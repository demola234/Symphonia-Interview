import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Text(
        "Tasks",
        style: GoogleFonts.poppins(),
      ),
    ));
  }
}
