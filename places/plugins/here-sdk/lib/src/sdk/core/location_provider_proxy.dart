// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/location_listener.dart';
import 'package:here_sdk/src/sdk/core/location_provider.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Do not use this class.
///
/// Internal use only. It will be removed in the future.
/// Users should use [LocationProvider] instead.
@Deprecated("Will be removed in v4.5.0, use LocationProvider instead.")
abstract class LocationProviderProxy implements LocationProvider {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();

}


// LocationProviderProxy "private" section, not exported.

final _sdk_core_LocationProviderProxy_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationProviderProxy_copy_handle');
final _sdk_core_LocationProviderProxy_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationProviderProxy_release_handle');
final _sdk_core_LocationProviderProxy_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_core_LocationProviderProxy_get_raw_pointer');
final _sdk_core_LocationProviderProxy_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationProviderProxy_get_type_id');

class LocationProviderProxy$Impl implements LocationProviderProxy {
  @protected
  Pointer<Void> handle;

  LocationProviderProxy$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_core_LocationProviderProxy_get_raw_pointer(handle));
    _sdk_core_LocationProviderProxy_release_handle(handle);
    handle = null;
  }

  @override
  start() {
    final _start_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_core_LocationProvider_start');
    final _handle = this.handle;
    final __result_handle = _start_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  stop() {
    final _stop_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_core_LocationProvider_stop');
    final _handle = this.handle;
    final __result_handle = _stop_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }

  @override
  LocationListener get listener {
    final _get_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_core_LocationProvider_listener_get');
    final _handle = this.handle;
    final __result_handle = _get_ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_core_LocationListener_fromFfi_nullable(__result_handle);
    } finally {
      sdk_core_LocationListener_releaseFfiHandle_nullable(__result_handle);
    }
  }

  @override
  set listener(LocationListener value) {
    final _set_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_LocationProvider_listener_set__LocationListener');
    final _value_handle = sdk_core_LocationListener_toFfi_nullable(value);
    final _handle = this.handle;
    final __result_handle = _set_ffi(_handle, __lib.LibraryContext.isolateId, _value_handle);
    sdk_core_LocationListener_releaseFfiHandle_nullable(_value_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }



}

Pointer<Void> sdk_core_LocationProviderProxy_toFfi(LocationProviderProxy value) =>
  _sdk_core_LocationProviderProxy_copy_handle((value as LocationProviderProxy$Impl).handle);

LocationProviderProxy sdk_core_LocationProviderProxy_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_core_LocationProviderProxy_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as LocationProviderProxy;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_core_LocationProviderProxy_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_core_LocationProviderProxy_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : LocationProviderProxy$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_core_LocationProviderProxy_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_core_LocationProviderProxy_release_handle(handle);

Pointer<Void> sdk_core_LocationProviderProxy_toFfi_nullable(LocationProviderProxy value) =>
  value != null ? sdk_core_LocationProviderProxy_toFfi(value) : Pointer<Void>.fromAddress(0);

LocationProviderProxy sdk_core_LocationProviderProxy_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_core_LocationProviderProxy_fromFfi(handle) : null;

void sdk_core_LocationProviderProxy_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_LocationProviderProxy_release_handle(handle);

// End of LocationProviderProxy "private" section.

