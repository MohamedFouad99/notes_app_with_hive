import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_hive/cubits/cubit/notes_cubit.dart';
import 'package:notes_app_with_hive/models/note_model.dart';
import 'package:notes_app_with_hive/widgets/custom_app_bar.dart';
import 'package:notes_app_with_hive/widgets/custom_text_field.dart';

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
        ],
      ),
    );
  }
}
