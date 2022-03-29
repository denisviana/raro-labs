import 'package:injectable/injectable.dart';
import 'package:my_app/core/domain/entity/slot/slot_entity.dart';
import 'package:my_app/core/domain/repositories/main_repository.dart';
import 'package:my_app/core/domain/use_cases/base/base_use_case.dart';
import 'package:my_app/core/resource/resource.dart';

@injectable
class SetSlotAsAvailableUseCase extends BaseFutureResourceUseCase<int, List<SlotEntity>> {
  final MainRepository _repository;

  SetSlotAsAvailableUseCase(this._repository);

  @override
  Future<Resource<List<SlotEntity>?>> call(int params) =>
      _repository.setSlotAsAvailable(slotNumber: params);
}
