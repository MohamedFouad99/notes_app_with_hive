// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notes_app_with_hive/widgets/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: ((context) => EditNoteView()))),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.yellow,
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
                  'flutter',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
              subtitle: Text(
                'build your carerr build your carerr build your carerr build your carerr',
                style: TextStyle(
                    color: Colors.black.withOpacity(.6), fontSize: 18),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                  )),
            ),
            Text(
              'july5,2023',
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
