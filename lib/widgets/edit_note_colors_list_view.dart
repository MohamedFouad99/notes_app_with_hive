import 'package:flutter/material.dart';

import '../models/note_model.dart';
import 'colors_list_view.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex;

  List<Color> colors = const [
    Color(0xff2B2D42),
    Color(0xff92DCE5),
    Color(0xffF8F7F9),
    Color(0xffF7EC59),
    Color(0xffFF66D8),
  ];
  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: InkWell(
                borderRadius: BorderRadius.circular(28),
                onTap: () {
                  currentIndex = index;
                  widget.note.color = colors[index].value;
                  setState(() {});
                },
                child: ColorItem(
                    colors: colors[index], isActive: currentIndex == index)),
          );
        },
      ),
    );
  }
}
