import 'package:todo_workshop/core/helpers/cache_helper.dart';
import 'package:todo_workshop/core/helpers/dio_helper.dart';
import 'package:todo_workshop/core/network/api_constants.dart';
import 'package:todo_workshop/features/auth/data/models/login_response.dart';
import 'package:todo_workshop/features/todo/data/models/Notes/notes_model.dart';

class ApiService {
  DioHelper dioHelper = DioHelper();
  Future<LoginResponse> login(String email, String password) async {
    try {
      final response = await dioHelper
          .post(ApiConstants.login, {'email': email, 'password': password});

      if (response.statusCode == 200) {
        print('Login Success');
        print(response.data);
        CacheHelper.cacheToken(response.data['token']);
      } else {
        print('Login Failed');
        print(response.data);
      }
      return LoginResponse.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  Future<AllNotes> get() async {
    try {
      final response = await dioHelper.get(ApiConstants.getNotes);
      print(response.data);
      return AllNotes.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      throw e;
    }
  }

  Future<Note> post(String title, String subtitle) async {
    try {
      final response = await dioHelper
          .post(ApiConstants.addNote, {'title': title, 'subtitle': subtitle});
      print(response.data);
      return Note.fromJson(response.data);
    } catch (e) {
      print('ErrorSER: $e');
      throw e;
    }
  }

  Future delete(String id) async {
    try {
      final response = await dioHelper.delete('${ApiConstants.deleteNote}/$id');
      print(response.data);
    } catch (e) {
      print('ErrorDD: $e');
      throw e;
    }
  }

  Future edit(String id, String title, String subtitle) async {
    try {
      final response = await dioHelper.patch('${ApiConstants.deleteNote}/$id',
          {'title': title, 'subtitle': subtitle});
      print("[[${response.data}]]s;;s");
    } catch (e) {
      print('ErrorAPI: $e');
      throw e;
    }
  }
}
