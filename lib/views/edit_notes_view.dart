import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/constant.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';
import 'package:notes_app/views/widgets/edit_note_color.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subtitle ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).featchAllNote();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextFormFiel(
                onChanged: (value) {
                  title = value;
                },
                hintText: widget.note.title),
            const SizedBox(height: 16),
            CustomTextFormFiel(
                onChanged: (value) {
                  subtitle = value;
                },
                hintText: widget.note.subTitle,
                maxLines: 5),
            const SizedBox(height: 16),
            EditNotesColor(
              note: widget.note,
            )
          ],
        ),
      ),
    );
  }
}
