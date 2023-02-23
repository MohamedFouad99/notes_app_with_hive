import 'package:flutter/material.dart';
import 'package:notes_app_with_hive/widgets/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .02),
          const CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
