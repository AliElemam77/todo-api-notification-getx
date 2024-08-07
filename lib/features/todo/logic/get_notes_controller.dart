import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_workshop/core/network/api_service.dart';
import 'package:todo_workshop/features/todo/data/repo/notes_repo.dart';

class NoteController extends GetxController {
  TextEditingController title = TextEditingController();
  TextEditingController subtitle = TextEditingController();
  NotesRepo notesRepo = NotesRepo();
  ApiService apiService = ApiService();
  @override
  void onInit() {
    getNotes();
    super.onInit();
  }

  RxList notes = [].obs;
  var isLoading = true.obs;

  void getNotes() async {
    try {
      isLoading(true);
      final response = await notesRepo.getNotes();
      notes.value = response.notes!;
      print('we ${notes.length} notes');
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  void delete(String id) async {
    try {
      await apiService.delete(id);
      print('Note Deleted : $id');
      getNotes();
    } catch (e) {
      print('Error: $e');
    }
  }

  void addNote() async {
    try {
      final response = await apiService.post(
          title.text.toString(), subtitle.text.toString());
      print('Note Added: ${response.title}');
      title.clear();
      subtitle.clear();
      getNotes();
    } catch (e) {
      print('Error: $e');
    }
  }

  void editNote(String id) async {
    try {
      await apiService.edit(
          id, title.text.toString(), subtitle.text.toString());
      print('Note Edited: $id');
      title.clear();
      subtitle.clear();
      getNotes();
    } catch (e) {
      print('ErrorEE: $e');
    }
  }
}
