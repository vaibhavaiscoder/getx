import 'package:get/get.dart';

class Provider extends GetConnect {
  final String _baseUrl = 'https://reqres.in';

  Future<dynamic> getUserList() async {
    final response = await get("$_baseUrl/api/users");
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body['data'];
    }
  }

  Future<dynamic> getSingleUser() async {
    final response = await get("$_baseUrl/api/users/2");
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body['data'];
    }
  }

  Future<dynamic> createUser(String name, String job) async {
    final response = await post("$_baseUrl/api/users", {
      'name': name,
      'job': job,
    });
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> updateUser(String name, String job) async {
    final response = await put("$_baseUrl/api/users/2", {
      'name': name,
      'job': job,
    });
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> deleteUser() async {
    final response = await delete("$_baseUrl/api/users/2");
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

  Future<dynamic> changeLanguageWithApi(text) async {
    final response = await post("https://nlp-translation.p.rapidapi.com/v1/jsontranslate", {
      'text': text,
      'source': 'en',
      'target': 'mr',
    }, headers: {
      "content-type": "application/x-www-form-urlencoded",
      "X-RapidAPI-Key": "your api key",
      "X-RapidAPI-Host": "translate-plus.p.rapidapi.com"
    });

    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body;
    }
  }

}
