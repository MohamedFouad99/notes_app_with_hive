import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cubit/notes_cubit.dart';
import '../models/note_model.dart';
import 'colors_list_view.dart';
import 'custom_app_bar.dart';
import 'custom_text_field.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({
    super.key,
    required this.note,
  });
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title;
  String? content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .06),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = content ?? widget.note.subtitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .06,
          ),
          CustomTextFiled(
            onChange: (value) {
              title = value;
            },
            hint: widget.note.title,
          ),
          const SizedBox(
            height: 18,
          ),
          CustomTextFiled(
            onChange: (value) {
              content = value;
            },
            hint: widget.note.subtitle,
            maxLines: 6,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .06,
          ),
          EditNoteColorList(note: widget.note),
        ],
      ),
    );
  }
}
