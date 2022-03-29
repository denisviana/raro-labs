import 'package:injectable/injectable.dart';
import 'package:my_app/core/data/local/my_db.dart';
import 'package:my_app/core/domain/entity/history/history_entity.dart';
import 'package:my_app/core/domain/entity/slot/slot_entity.dart';
import 'package:my_app/core/domain/repositories/main_repository.dart';
import 'package:my_app/core/resource/resource.dart';

@Injectable(as: MainRepository)
class MainRepositoryImplementation implements MainRepository {
  final MyDb _db;

  MainRepositoryImplementation(this._db);

  @override
  Future<Resource<List<HistoryEntity>>> get history => Resource.asFuture(() => _db.history);

  @override
  Future<Resource<List<SlotEntity>>> setSlotAsAvailable({required int slotNumber}) =>
      Resource.asFuture(
        () => _db.setSlotAsAvailable(slotNumber: slotNumber),
      );

  @override
  Future<Resource<List<SlotEntity>>> setSlotAsNotAvailable({required SlotEntity slotEntity}) =>
      Resource.asFuture(
        () => _db.setSlotAsNotAvailable(slotEntity: slotEntity),
      );

  @override
  Future<Resource<List<SlotEntity>>> get slots => Resource.asFuture(() => _db.slots);
}
