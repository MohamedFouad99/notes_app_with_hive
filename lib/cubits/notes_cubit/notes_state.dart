// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notes_cubit.dart';

@immutable
abstract class NotesState {}

class NotesInitial extends NotesState {}

class AddNoteLoading extends NotesState {}

class AddNoteSuccess extends NotesState {
  final List<NoteModel> notes;
  AddNoteSuccess({
    required this.notes,
  });
}

class AddNoteFailure extends NotesState {
  final String errorMessage;

  AddNoteFailure(this.errorMessage);
}
