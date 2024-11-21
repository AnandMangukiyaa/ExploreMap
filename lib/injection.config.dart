// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_assignment1/application/application_life_cycle/application_life_cycle_cubit.dart'
    as _i989;
import 'package:flutter_assignment1/application/location/location_cubit.dart'
    as _i118;
import 'package:flutter_assignment1/application/permission/permission_cubit.dart'
    as _i984;
import 'package:flutter_assignment1/domain/location/i_location_service.dart'
    as _i934;
import 'package:flutter_assignment1/domain/permission/i_permission_service.dart'
    as _i433;
import 'package:flutter_assignment1/infrastructure/location/geolocator_location_service.dart'
    as _i10;
import 'package:flutter_assignment1/infrastructure/permission/permission_service.dart'
    as _i184;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i989.ApplicationLifeCycleCubit>(
        () => _i989.ApplicationLifeCycleCubit());
    gh.factory<_i934.ILocationService>(() => _i10.GeolocatorLocationService());
    gh.lazySingleton<_i433.IPermissionService>(() => _i184.PermissionService());
    gh.lazySingleton<_i984.PermissionCubit>(() => _i984.PermissionCubit(
          gh<_i433.IPermissionService>(),
          gh<_i989.ApplicationLifeCycleCubit>(),
        ));
    gh.lazySingleton<_i118.LocationCubit>(() => _i118.LocationCubit(
          gh<_i934.ILocationService>(),
          gh<_i984.PermissionCubit>(),
          gh<_i989.ApplicationLifeCycleCubit>(),
        ));
    return this;
  }
}
