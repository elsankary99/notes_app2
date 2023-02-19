import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottonSheet extends StatelessWidget {
  const AddNoteBottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: SingleChildScrollView(child: AddNoteForm()),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? titl, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(children: [
        CustomTextFormFiel(
            hintText: 'Title',
            onSaved: (value) {
              titl = value;
            }),
        const SizedBox(height: 16),
        CustomTextFormFiel(
            onSaved: (value) {
              subtitle = value;
            },
            hintText: 'Content',
            maxLines: 5),
        const SizedBox(height: 35),
        CustomButton(onTap: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
          } else {
            autovalidateMode = AutovalidateMode.always;
            setState(() {});
          }
        }),
      ]),
    );
  }
}
