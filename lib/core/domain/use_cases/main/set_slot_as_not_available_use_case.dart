import 'package:my_app/core/domain/entity/slot/slot_entity.dart';
import 'package:my_app/core/domain/repositories/main_repository.dart';
import 'package:my_app/core/domain/use_cases/base/base_use_case.dart';
import 'package:my_app/core/resource/resource.dart';

class SetSlotAsNotAvailableUseCase extends BaseFutureResourceUseCase<SlotEntity, List<SlotEntity>> {
  final MainRepository _repository;

  SetSlotAsNotAvailableUseCase(this._repository);

  @override
  Future<Resource<List<SlotEntity>?>> call(SlotEntity params) =>
      _repository.setSlotAsNotAvailable(slotEntity: params);
}
