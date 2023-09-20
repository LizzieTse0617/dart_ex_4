import 'package:test/test.dart';
import 'package:random_user_fetcher/main.dart'; 

void main() {
  group('Random User Data Fetching', () {
    test('Fetching random users', () async {
      final users = await fetchRandomUsers();
      expect(users, hasLength(greaterThanOrEqualTo(8))); 
    });

  });
}
