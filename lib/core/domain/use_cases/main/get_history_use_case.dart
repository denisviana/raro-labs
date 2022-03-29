import 'package:injectable/injectable.dart';
import 'package:my_app/core/domain/entity/history/history_entity.dart';
import 'package:my_app/core/domain/repositories/main_repository.dart';
import 'package:my_app/core/domain/use_cases/base/base_use_case.dart';
import 'package:my_app/core/resource/resource.dart';

@injectable
class GetHistoryUseCase extends BaseFutureResourceUseCase<void, List<HistoryEntity>> {
  final MainRepository _mainRepository;

  GetHistoryUseCase(this._mainRepository);

  @override
  Future<Resource<List<HistoryEntity>?>> call([void params]) => _mainRepository.history;
}
