// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../core/data/helpers/secure_local_storage.dart' as _i6;
import '../core/data/local/app_preferences.dart' as _i8;
import '../core/data/local/app_preferences_implementation.dart' as _i9;
import '../core/data/local/my_db.dart' as _i5;
import '../core/data/network/dio_client.dart' as _i14;
import '../core/data/repositories/main_repository_implementation.dart' as _i11;
import '../core/domain/repositories/main_repository.dart' as _i10;
import '../core/domain/use_cases/main/get_history_use_case.dart' as _i15;
import '../core/domain/use_cases/main/get_slots_use_case.dart' as _i16;
import '../core/domain/use_cases/main/set_slot_as_available_use_case.dart'
    as _i12;
import '../core/domain/use_cases/main/set_slot_as_not_available_use_case.dart'
    as _i13;
import 'modules/device_module.dart' as _i19;
import 'modules/local_module.dart' as _i18;
import 'modules/remote_module.dart'
    as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  Future<_i1.GetIt> init(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final remoteModule = _$RemoteModule();
    final localModule = _$LocalModule();
    final deviceModule = _$DeviceModule();
    gh.factory<_i3.Dio>(() => remoteModule.provideDio());
    gh.singleton<_i4.FlutterSecureStorage>(localModule.storage);
    gh.singleton<_i5.MyDb>(remoteModule.provideMyDb());
    gh.singleton<_i6.SecureLocalStorage>(
        _i6.SecureLocalStorage(get<_i4.FlutterSecureStorage>()));
    await gh.factoryAsync<_i7.SharedPreferences>(() => localModule.prefs,
        preResolve: true);
    gh.factory<String>(() => deviceModule.language, instanceName: 'language');
    gh.factory<_i8.AppPreferences>(
        () => _i9.AppPreferencesImplementation(get<_i7.SharedPreferences>()));
    gh.singleton<_i3.InterceptorsWrapper>(remoteModule.provideInterceptor(
        get<_i3.Dio>(),
        get<String>(instanceName: 'language'),
        get<_i4.FlutterSecureStorage>()));
    gh.factory<_i10.MainRepository>(
        () => _i11.MainRepositoryImplementation(get<_i5.MyDb>()));
    gh.factory<_i12.SetSlotAsAvailableUseCase>(
        () => _i12.SetSlotAsAvailableUseCase(get<_i10.MainRepository>()));
    gh.factory<_i13.SetSlotAsNotAvailableUseCase>(
        () => _i13.SetSlotAsNotAvailableUseCase(get<_i10.MainRepository>()));
    gh.factory<_i14.DioClient>(() => remoteModule.provideApi(
        get<_i3.Dio>(), get<_i3.InterceptorsWrapper>()));
    gh.factory<_i15.GetHistoryUseCase>(
        () => _i15.GetHistoryUseCase(get<_i10.MainRepository>()));
    gh.factory<_i16.GetSlotsUseCase>(
        () => _i16.GetSlotsUseCase(get<_i10.MainRepository>()));
    return this;
  }
}

class _$RemoteModule extends _i17.RemoteModule {}

class _$LocalModule extends _i18.LocalModule {}

class _$DeviceModule extends _i19.DeviceModule {}
