import 'package:injectable/injectable.dart';
import 'package:my_app/core/domain/entity/slot/slot_entity.dart';
import 'package:my_app/core/domain/repositories/main_repository.dart';
import 'package:my_app/core/domain/use_cases/base/base_use_case.dart';
import 'package:my_app/core/resource/resource.dart';

@injectable
class GetSlotsUseCase extends BaseFutureResourceUseCase<void, List<SlotEntity>> {
  final MainRepository _mainRepository;

  GetSlotsUseCase(this._mainRepository);

  @override
  Future<Resource<List<SlotEntity>?>> call([void params]) => _mainRepository.slots;
}
