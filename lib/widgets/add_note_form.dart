import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../cubits/add_note_cubit/add_note_cubit.dart';
import '../models/note_model.dart';

import '../constant/constant.dart';
import 'colors_list_view.dart';
import 'custom_text_field.dart';

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
  bool isLoading = true;
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
          const ColorListView(),
          const SizedBox(
            height: 18,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        var currentDate = DateTime.now();
                        var foramtDate = DateFormat.yMEd().format(currentDate);
                        var noteModel = NoteModel(
                            title: title!,
                            subtitle: subTitle!,
                            date: foramtDate,
                            color: Colors.blue.value);
                        BlocProvider.of<AddNoteCubit>(context)
                            .addNote(noteModel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor)),
                    child: state is AddNoteLoading
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          )
                        : const Text(
                            'Add',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
