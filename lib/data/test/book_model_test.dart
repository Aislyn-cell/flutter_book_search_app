import 'dart:convert';

import 'package:flutter_book_search_app/data/model/book.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

void main() {
  //
  String jsonString = """
{
      "title": "Harry Potter (Welcome to Hogwarts Planner Notebook Collection (Set of 3): (Harry Potter School Planner School, Harry Potter Gift, Harry Potter Station)",
      "link": "https://search.shopping.naver.com/book/catalog/43805245634",
      "image": "https://shopping-phinf.pstatic.net/main_4380524/43805245634.20240616071135.jpg",
      "author": "Insight Editions",
      "discount": "18500",
      "publisher": "Insight Editions",
      "pubdate": "20230606",
      "isbn": "9798886631418",
      "description": ""
}
""";

  test(
    // 테스트 설명
    'Book model convert test',
    // 테스트 함수가 실행될 때 실행되는 함수
    () {
      Map<String, dynamic> map = jsonDecode(jsonString);
      Book book = Book.fromJson(map);

      // 첫 파라미터에 실제값, 오른쪽 파라미터에에 기대값 작성.
      // 다를 시 테스트 터짐
      expect(book.pubdate, "20230606");
      // expect(book.pubdate, "202");
    },
  );
}
