// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_hive/cubits/cubit/notes_cubit.dart';
import 'package:notes_app_with_hive/models/note_model.dart';
import 'package:notes_app_with_hive/widgets/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: ((context) => EditNoteView()))),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 18),
                child: Text(
                  note.title,
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
              subtitle: Text(
                note.subtitle,
                style: TextStyle(
                    color: Colors.black.withOpacity(.6), fontSize: 18),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                  )),
            ),
            Text(
              note.date,
              style: TextStyle(
                color: Colors.black.withOpacity(.6),
              ),
            )
          ],
        ),
      ),
    );
  }
}
