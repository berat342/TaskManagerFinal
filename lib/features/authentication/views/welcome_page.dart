import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/common/widgets/fading_text.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';
import 'package:todo_app/core/res/colours.dart';
import 'package:todo_app/core/res/image_res.dart';

class welcome_page extends StatelessWidget {
  const welcome_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageRes.todo),
          const WhiteSpace(height: 100),
          const FadingText(
            'ToDo with Riverpod',
            textAlign: TextAlign.center,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          const WhiteSpace(height: 10),
          Text(
            'Welcome!!! Do you want to clear tasks super fast with ToDo?',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colours.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
