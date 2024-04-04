// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kartjis_mobile_common/network.dart' as _i3;
import 'package:kartjis_mobile_common/src/network/http/_http.dart' as _i11;
import 'package:kartjis_mobile_common/src/network/interceptor/_interceptor.dart'
    as _i13;
import 'package:kartjis_mobile_common/src/network/interceptor/interceptors/connection_checker_interceptor.dart'
    as _i8;
import 'package:kartjis_mobile_common/src/network/interceptor/interceptors/failed_request_handler_interceptor.dart'
    as _i10;
import 'package:kartjis_mobile_common/src/network/network/connection_checker.dart'
    as _i9;
import 'package:kartjis_mobile_common/src/network/network/failed_request_handlers/_failed_request_handlers.dart'
    as _i6;
import 'package:kartjis_mobile_common/src/network/network/failed_request_handlers/connection_issue_handler.dart'
    as _i4;
import 'package:kartjis_mobile_common/src/network/network/network.dart' as _i7;
import 'package:kartjis_mobile_common/src/network/network_dependency_provider.dart'
    as _i14;
import 'package:kartjis_mobile_common/src/network/raw_http/raw_http_client.dart'
    as _i12;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> initKartjisMobileCommonDependencies(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkDependencyProvider = _$NetworkDependencyProvider();
  gh.lazySingleton<_i3.Client>(() => networkDependencyProvider.provideClient);
  gh.singleton<_i4.ConnectionIssueHandler>(() => _i4.ConnectionIssueHandler());
  gh.singleton<_i5.Connectivity>(
      () => networkDependencyProvider.provideConnectivity);
  gh.singleton<_i3.FailedRequestHandlerRegistry>(() => networkDependencyProvider
      .provideFailedRequestHandlerRegistry(gh<_i6.ConnectionIssueHandler>()));
  gh.lazySingleton<_i7.Network>(() => const _i7.Network());
  gh.lazySingleton<_i3.RawHttpClient>(
      () => networkDependencyProvider.provideDio);
  await gh.singletonAsync<_i3.ConnectionChecker>(
    () => networkDependencyProvider
        .provideConnectionChecker(gh<_i5.Connectivity>()),
    preResolve: true,
  );
  gh.singleton<_i8.ConnectionCheckerInterceptor>(
      () => _i8.ConnectionCheckerInterceptor(gh<_i9.ConnectionChecker>()));
  gh.singleton<_i10.FailedRequestHandlerInterceptor>(() =>
      _i10.FailedRequestHandlerInterceptor(
          gh<_i10.FailedRequestHandlerRegistry>()));
  gh.lazySingleton<_i11.HttpClient>(() => _i11.HttpClient(
        client: gh<_i11.Client>(),
        rawClient: gh<_i12.RawHttpClient>(),
        network: gh<_i7.Network>(),
        config: gh<_i11.HttpConfig>(),
        interceptorChainFactory: gh<_i13.InterceptorChainFactory>(),
      ));
  return getIt;
}

class _$NetworkDependencyProvider extends _i14.NetworkDependencyProvider {}
