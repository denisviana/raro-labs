import '../../../resource/resource.dart';

abstract class BaseFutureResourceUseCase<Param, Result> extends BaseUseCase {
  Future<Resource<Result?>> call(Param params);
}

abstract class BaseFutureUseCase<Param, Result> extends BaseUseCase {
  Future<Result?> call(Param params);
}

abstract class BaseSimpleUseCase<Param, Result> extends BaseUseCase {
  Result call(Param params);
}

abstract class BaseStreamUseCase<Param, Result> extends BaseUseCase {
  Stream<Result> call(Param params);
}

abstract class BaseUseCase {}