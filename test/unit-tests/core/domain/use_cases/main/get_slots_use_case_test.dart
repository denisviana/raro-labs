import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/core/data/enum/status.dart';
import 'package:my_app/core/domain/entity/slot/slot_entity.dart';
import 'package:my_app/core/domain/repositories/main_repository.dart';
import 'package:my_app/core/domain/use_cases/main/get_slots_use_case.dart';
import 'package:my_app/core/resource/app_exception.dart';
import 'package:my_app/core/resource/resource.dart';

class MainRepositoryMock extends Mock implements MainRepository {}

void main() {
  late final GetSlotsUseCase getSlotsUseCase;
  final mainRepository = MainRepositoryMock();

  setUpAll(() {
    getSlotsUseCase = GetSlotsUseCase(mainRepository);
  });

  test('should return a status success and a list of SlotEntity when the request is successful',
      () async {
    //arrange
    when(() => mainRepository.slots)
        .thenAnswer((_) async => Resource.success(data: <SlotEntity>[]));
    //act
    final response = await getSlotsUseCase();
    //assert
    expect(response, isA<Resource>());
    expect(response.status, Status.success);
    expect(response.data, isNotNull);
    expect(response.data, isA<List<SlotEntity>>());
  });
  test('should return a status failed and a AppException when the request is failed', () async {
    //arrange
    when(() => mainRepository.slots)
        .thenAnswer((_) async => Resource.failed(error: AppException()));
    //act
    final response = await getSlotsUseCase();
    //assert
    expect(response, isA<Resource>());
    expect(response.status, Status.failed);
    expect(response.error, isNotNull);
    expect(response.error, isA<AppException>());
  });
}
