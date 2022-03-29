import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/core/data/enum/status.dart';
import 'package:my_app/core/domain/entity/history/history_entity.dart';
import 'package:my_app/core/domain/repositories/main_repository.dart';
import 'package:my_app/core/domain/use_cases/main/get_history_use_case.dart';
import 'package:my_app/core/resource/app_exception.dart';
import 'package:my_app/core/resource/resource.dart';

class MainRepositoryMock extends Mock implements MainRepository {}

void main() {
  late final GetHistoryUseCase getHistoryUseCase;
  final mainRepository = MainRepositoryMock();

  setUpAll(() {
    getHistoryUseCase = GetHistoryUseCase(mainRepository);
  });

  test('should return a status success and a list of HistoryEntity when the request is successful',
      () async {
    //arrange
    when(() => mainRepository.history)
        .thenAnswer((_) async => Resource.success(data: <HistoryEntity>[]));
    //act
    final response = await getHistoryUseCase();
    //assert
    expect(response, isA<Resource>());
    expect(response.status, Status.success);
    expect(response.data, isNotNull);
    expect(response.data, isA<List<HistoryEntity>>());
  });
  test('should return a status failed and a AppException when the request is failed', () async {
    //arrange
    when(() => mainRepository.history)
        .thenAnswer((_) async => Resource.failed(error: AppException()));
    //act
    final response = await getHistoryUseCase();
    //assert
    expect(response, isA<Resource>());
    expect(response.status, Status.failed);
    expect(response.error, isNotNull);
    expect(response.error, isA<AppException>());
  });
}
