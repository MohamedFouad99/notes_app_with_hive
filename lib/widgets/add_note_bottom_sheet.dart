import 'package:flutter/material.dart';
import 'package:notes_app_with_hive/constant/color.dart';
import 'package:notes_app_with_hive/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  AddNoteForm({
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
      child: Column(
        children: [
          const SizedBox(
            height: 26,
          ),
          CustomTextFiled(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 18,
          ),
          CustomTextFiled(
            hint: 'Content',
            maxLines: 6,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor)),
              )),
        ],
      ),
    );
  }
}
