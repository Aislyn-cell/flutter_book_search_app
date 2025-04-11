import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_book_search_app/ui/pages/detail/widgets/detail_view_model.dart';
import 'package:flutter_book_search_app/ui/pages/detail/widgets/detail_page.dart'
    as detail_page;

class HomeBottomSheet extends StatelessWidget {
  // 2. 생성자에 추가
  const HomeBottomSheet(this.book, {super.key});

  // 1. 홈페이지에서 전달해줄 수 있게 추가
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 50,
      ),
      child: Row(
        children: [
          // 3. 데이터 씌우기
          Image.network(
            book.image,
            fit: BoxFit.fitHeight,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                height: 150,
                width: 100,
                child: Center(child: Text('이미지 없음')),
              );
            },
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  book.author, // 'author'가 String이라고 가정
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  book.description, // 'description'을 부제목/설명으로 가정
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    // Book 객체를 DetailPage로 전달
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => detail_page.DetailPage(
                            book: book), // DetailPage로 Book 객체 전달
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50, // UX 고려한 높이
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: const Text(
                      '자세히 보기',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
