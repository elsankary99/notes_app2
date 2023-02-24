import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

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
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(children: [
        const SizedBox(
          height: 25,
        ),
        CustomTextFormFiel(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            }),
        const SizedBox(height: 16),
        CustomTextFormFiel(
            onSaved: (value) {
              subTitle = value;
            },
            hintText: 'Content',
            maxLines: 5),
        const SizedBox(height: 25),
        BlocBuilder<AddNoteCubit, AddNoteState>(
          builder: (context, state) {
            return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currenDate = DateTime.now();
                    var formateCurrenDate =
                        DateFormat(r'dd/mm/yyyy').format(currenDate);
                    NoteModel note = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formateCurrenDate,
                        color: Colors.green.value);
                    BlocProvider.of<AddNoteCubit>(context).addNot(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                });
          },
        ),
        const SizedBox(
          height: 25,
        ),
      ]),
    );
  }
}
