// Mocks generated by Mockito 5.3.2 from annotations
// in food_order_ui/test/core/platform/network/network_info_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:data_connection_checker_tv/data_connection_checker.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'network_info_test.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDuration_0 extends _i1.SmartFake implements Duration {
  _FakeDuration_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddressCheckResult_1 extends _i1.SmartFake
    implements _i2.AddressCheckResult {
  _FakeAddressCheckResult_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [FakeDataConnectionChecker].
///
/// See the documentation for Mockito's code generation for more information.
class MockFakeDataConnectionChecker extends _i1.Mock
    implements _i3.FakeDataConnectionChecker {
  MockFakeDataConnectionChecker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i2.AddressCheckOptions> get addresses => (super.noSuchMethod(
        Invocation.getter(#addresses),
        returnValue: <_i2.AddressCheckOptions>[],
      ) as List<_i2.AddressCheckOptions>);
  @override
  set addresses(List<_i2.AddressCheckOptions>? _addresses) =>
      super.noSuchMethod(
        Invocation.setter(
          #addresses,
          _addresses,
        ),
        returnValueForMissingStub: null,
      );
  @override
  Duration get checkInterval => (super.noSuchMethod(
        Invocation.getter(#checkInterval),
        returnValue: _FakeDuration_0(
          this,
          Invocation.getter(#checkInterval),
        ),
      ) as Duration);
  @override
  set checkInterval(Duration? _checkInterval) => super.noSuchMethod(
        Invocation.setter(
          #checkInterval,
          _checkInterval,
        ),
        returnValueForMissingStub: null,
      );
  @override
  List<_i2.AddressCheckResult> get lastTryResults => (super.noSuchMethod(
        Invocation.getter(#lastTryResults),
        returnValue: <_i2.AddressCheckResult>[],
      ) as List<_i2.AddressCheckResult>);
  @override
  _i4.Future<bool> get hasConnection => (super.noSuchMethod(
        Invocation.getter(#hasConnection),
        returnValue: _i4.Future<bool>.value(false),
      ) as _i4.Future<bool>);
  @override
  _i4.Future<_i2.DataConnectionStatus> get connectionStatus =>
      (super.noSuchMethod(
        Invocation.getter(#connectionStatus),
        returnValue: _i4.Future<_i2.DataConnectionStatus>.value(
            _i2.DataConnectionStatus.disconnected),
      ) as _i4.Future<_i2.DataConnectionStatus>);
  @override
  _i4.Stream<_i2.DataConnectionStatus> get onStatusChange =>
      (super.noSuchMethod(
        Invocation.getter(#onStatusChange),
        returnValue: _i4.Stream<_i2.DataConnectionStatus>.empty(),
      ) as _i4.Stream<_i2.DataConnectionStatus>);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  bool get isActivelyChecking => (super.noSuchMethod(
        Invocation.getter(#isActivelyChecking),
        returnValue: false,
      ) as bool);
  @override
  _i4.Future<_i2.AddressCheckResult> isHostReachable(
          _i2.AddressCheckOptions? options) =>
      (super.noSuchMethod(
        Invocation.method(
          #isHostReachable,
          [options],
        ),
        returnValue:
            _i4.Future<_i2.AddressCheckResult>.value(_FakeAddressCheckResult_1(
          this,
          Invocation.method(
            #isHostReachable,
            [options],
          ),
        )),
      ) as _i4.Future<_i2.AddressCheckResult>);
}
