import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_book_search_app/data/repository/book_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'BookRepository search test',
    // 통신은 비동기니까 테스트 할 함수에 async 달아주기!
    () async {
      BookRepository bookRepository = BookRepository();
      List<Book>? results = await bookRepository.search('harry');
      expect(results?.isNotEmpty ?? false, true);
      // 출력도 한번 해보기!
      if (results != null) {
        for (var book in results) {
          print(book.title);
        }
      }
    },
  );
}
