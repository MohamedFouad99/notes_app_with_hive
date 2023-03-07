import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:meta/meta.dart';
import 'package:notes_app_with_hive/models/note_model.dart';

import '../../constant/constant.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
  }
}
