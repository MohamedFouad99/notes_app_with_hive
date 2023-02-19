import 'package:flutter/material.dart';
import 'package:notes_app_with_hive/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          SizedBox(
            height: 26,
          ),
          CustomTextFiled(
            hint: 'Title',
          ),
          SizedBox(
            height: 18,
          ),
          CustomTextFiled(
            hint: 'Content',
            maxLines: 6,
          ),
        ],
      ),
    );
  }
}
