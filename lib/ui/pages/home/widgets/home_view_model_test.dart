import 'package:flutter_book_search_app/ui/pages/home/home_view_model.dart';
// Removed incorrect import statement
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_test/flutter_test.dart';

// 테스트 시는 ProviderContainer 가 관리
// HomeViewModel 을 생성자로 생성하면 HomeViewModel 이 관리하는 상태에 접근할 수가 없음!!!
ProviderContainer createContainer() {
  final container = ProviderContainer();
  // 테스트가 끝나면 container를 폐기(dispose)
  addTearDown(container.dispose);
  return container;
}

void main() {
  //
  test(
    'HomeViewModel test',
    () async {
      final container = createContainer();
      HomeState homeState = container.read(homeViewModelProvider);
      // 초기값 확인
      expect(homeState.books, null);
      // 검색!
      await container.read(homeViewModelProvider.notifier).search('harry');

      // 검색 후 상태 업데이트 되는지 확인
      HomeState homeStateAfterSearch = container.read(homeViewModelProvider);
      expect(homeStateAfterSearch.books != null, true);
      expect(homeStateAfterSearch.books!.isNotEmpty, true);
      // 출력도 한번 해보기
      for (var book in homeStateAfterSearch.books!) {
        print(book.title);
      }
    },
  );
}
