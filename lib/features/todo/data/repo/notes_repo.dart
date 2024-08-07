import 'package:todo_workshop/core/network/api_service.dart';
import 'package:todo_workshop/features/todo/data/models/Notes/notes_model.dart';

class NotesRepo {
  ApiService apiService = ApiService();
  Future<AllNotes> getNotes() async {
    try {
      final response = await apiService.get();
      return response;
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }
}
