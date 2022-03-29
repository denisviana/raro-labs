import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/core/data/enum/status.dart';
import 'package:my_app/core/data/local/my_db.dart';
import 'package:my_app/core/data/repositories/main_repository_implementation.dart';
import 'package:my_app/core/domain/entity/history/history_entity.dart';
import 'package:my_app/core/domain/entity/slot/slot_entity.dart';
import 'package:my_app/core/resource/app_exception.dart';

class MyDbMock extends Mock implements MyDb {}

void main() {
  final mockDb = MyDbMock();
  late final MainRepositoryImplementation mainRepository;

  setUpAll(() {
    mainRepository = MainRepositoryImplementation(mockDb);
  });

  group('slots', () {
    test('should return a status success and a list of SlotEntity when the request is successful',
        () async {
      //arrange
      when(() => mockDb.slots).thenAnswer((_) async => <SlotEntity>[]);
      //act
      final response = await mainRepository.slots;
      //assert
      expect(response.status, Status.success);
      expect(response.data, isNotNull);
      expect(response.data, isA<List<SlotEntity>>());
    });
    test('should return a status failed and a AppException when the request is failed', () async {
      //arrange
      when(() => mockDb.slots).thenThrow(
        PlatformException(code: 'code'),
      );
      //act
      final response = await mainRepository.slots;
      //assert
      expect(response.status, Status.failed);
      expect(response.error, isNotNull);
      expect(response.error, isA<AppException>());
    });
  });

  group('history', () {
    test(
        'should return a status success and a list of HistoryEntity when the request is successful',
        () async {
      //arrange
      when(() => mockDb.history).thenAnswer((_) async => <HistoryEntity>[]);
      //act
      final response = await mainRepository.history;
      //assert
      expect(response.status, Status.success);
      expect(response.data, isNotNull);
      expect(response.data, isA<List<HistoryEntity>>());
    });
    test('should return a status failed and a AppException when the request is failed', () async {
      //arrange
      when(() => mockDb.history).thenThrow(
        PlatformException(code: 'code'),
      );
      //act
      final response = await mainRepository.history;
      //assert
      expect(response.status, Status.failed);
      expect(response.error, isNotNull);
      expect(response.error, isA<AppException>());
    });
  });
}
