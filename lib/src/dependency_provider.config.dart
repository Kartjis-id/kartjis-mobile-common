// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kartjis_mobile_common/src/network/http/_http.dart' as _i6;
import 'package:kartjis_mobile_common/src/network/interceptor/_interceptor.dart'
    as _i8;
import 'package:kartjis_mobile_common/src/network/interceptor/interceptors/connection_checker_interceptor.dart'
    as _i3;
import 'package:kartjis_mobile_common/src/network/network/connection_checker.dart'
    as _i4;
import 'package:kartjis_mobile_common/src/network/network/network.dart' as _i5;
import 'package:kartjis_mobile_common/src/network/raw_http/raw_http_client.dart'
    as _i7;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt initMobileApFrontendCommonDependencies(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.ConnectionCheckerInterceptor>(
      () => _i3.ConnectionCheckerInterceptor(gh<_i4.ConnectionChecker>()));
  gh.lazySingleton<_i5.Network>(() => const _i5.Network());
  gh.lazySingleton<_i6.HttpClient>(() => _i6.HttpClient(
        client: gh<_i6.Client>(),
        rawClient: gh<_i7.RawHttpClient>(),
        network: gh<_i5.Network>(),
        config: gh<_i6.HttpConfig>(),
        interceptorChainFactory: gh<_i8.InterceptorChainFactory>(),
      ));
  return getIt;
}
