
import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/core/data/local/my_db_implementation.dart';
import 'package:my_app/core/domain/entity/history/history_entity.dart';
import 'package:my_app/core/domain/entity/slot/slot_entity.dart';

void main() {

  late MyDbImplementation myDbImplementation;

  setUp((){
    myDbImplementation = MyDbImplementation();
  });

  test('should return a list of SlotEntity', () async {
    //arrange
    //act
    final result = await myDbImplementation.slots;
    //assert
    expect(result, isA<List<SlotEntity>>());
  });

  test('should return a list of HistoryEntity', () async {
    //arrange
    //act
    final result = await myDbImplementation.history;
    //assert
    expect(result, isA<List<HistoryEntity>>());
  });
}