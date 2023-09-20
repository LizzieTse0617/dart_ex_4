import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  try {
    final List<Map<String, dynamic>> users = await fetchRandomUsers();
    for (final user in users) {
      final String uid = user['uid'].toString();
      final String firstName = user['first_name'];
      final String lastName = user['last_name'];
      final String userString = 'UID: $uid, Name: $firstName $lastName';
      print(userString);
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<List<Map<String, dynamic>>> fetchRandomUsers() async {
  final response = await http.get(Uri.parse('https://random-data-api.com/api/users/random_user?size=12'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    if (data is List) {
      return data.cast<Map<String, dynamic>>();
    } else {
      throw 'Invalid data format';
    }
  } else {
    throw 'HTTP request failed with status ${response.statusCode}';
  }
}
