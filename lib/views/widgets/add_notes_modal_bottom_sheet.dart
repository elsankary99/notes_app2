import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/add_notes_form.dart';

class AddNoteBottonSheet extends StatelessWidget {
  const AddNoteBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: SingleChildScrollView(child: AddNoteForm()),
    );
  }
}
