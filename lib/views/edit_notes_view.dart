import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNotesViewBody extends StatelessWidget {
  const EditNotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: const [
            SizedBox(
              height: 30,
            ),
            CustomAppBar(title: 'Edit Note', icon: Icons.check),
            SizedBox(
              height: 40,
            ),
            CustomTextFormFiel(hintText: 'Title'),
            SizedBox(height: 16),
            CustomTextFormFiel(hintText: 'Content', maxLines: 5),
          ],
        ),
      ),
    );
  }
}
