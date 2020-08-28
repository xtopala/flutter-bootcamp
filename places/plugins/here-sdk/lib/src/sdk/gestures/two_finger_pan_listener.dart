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
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/gestures/gesture_state.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Abstract class for handling two finger pan gestures.
///
/// Two finger pan gesture occurs when two fingers are on the screen
/// and both of them are moving vertically.
abstract class TwoFingerPanListener {
  TwoFingerPanListener() {}

  factory TwoFingerPanListener.fromLambdas({
    @required void Function(GestureState, Point2D, Point2D, double) lambda_onTwoFingerPan
  }) => TwoFingerPanListener$Lambdas(
    lambda_onTwoFingerPan
  );

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release() {}

  /// Called when the two finger pan gesture occurs.
  /// [state] Determines in which state the gesture is.
  /// [origin] Position halfway between two touch points relative to the MapView in pixels.
  /// [translation] Translation offset since the last position in pixels.
  /// [velocity] Velocity of panning in pixels per millisecond.
  onTwoFingerPan(GestureState state, Point2D origin, Point2D translation, double velocity);
}


// TwoFingerPanListener "private" section, not exported.

final _sdk_gestures_TwoFingerPanListener_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TwoFingerPanListener_copy_handle');
final _sdk_gestures_TwoFingerPanListener_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TwoFingerPanListener_release_handle');
final _sdk_gestures_TwoFingerPanListener_create_proxy = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Pointer, Pointer),
    Pointer<Void> Function(int, int, Pointer, Pointer)
  >('here_sdk_sdk_gestures_TwoFingerPanListener_create_proxy');
final _sdk_gestures_TwoFingerPanListener_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_gestures_TwoFingerPanListener_get_raw_pointer');
final _sdk_gestures_TwoFingerPanListener_get_type_id = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TwoFingerPanListener_get_type_id');


class TwoFingerPanListener$Lambdas implements TwoFingerPanListener {
  void Function(GestureState, Point2D, Point2D, double) lambda_onTwoFingerPan;

  TwoFingerPanListener$Lambdas(
    void Function(GestureState, Point2D, Point2D, double) lambda_onTwoFingerPan
  ) {
    this.lambda_onTwoFingerPan = lambda_onTwoFingerPan;

  }

  @override
  void release() {}

  @override
  onTwoFingerPan(GestureState state, Point2D origin, Point2D translation, double velocity) =>
    lambda_onTwoFingerPan(state, origin, translation, velocity);
}

class TwoFingerPanListener$Impl implements TwoFingerPanListener {
  @protected
  Pointer<Void> handle;
  TwoFingerPanListener$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_gestures_TwoFingerPanListener_get_raw_pointer(handle));
    _sdk_gestures_TwoFingerPanListener_release_handle(handle);
    handle = null;
  }

  @override
  onTwoFingerPan(GestureState state, Point2D origin, Point2D translation, double velocity) {
    final _onTwoFingerPan_ffi = __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>, Pointer<Void>, Double), void Function(Pointer<Void>, int, int, Pointer<Void>, Pointer<Void>, double)>('here_sdk_sdk_gestures_TwoFingerPanListener_onTwoFingerPan__GestureState_Point2D_Point2D_Double');
    final _state_handle = sdk_gestures_GestureState_toFfi(state);
    final _origin_handle = sdk_core_Point2D_toFfi(origin);
    final _translation_handle = sdk_core_Point2D_toFfi(translation);
    final _velocity_handle = (velocity);
    final _handle = this.handle;
    final __result_handle = _onTwoFingerPan_ffi(_handle, __lib.LibraryContext.isolateId, _state_handle, _origin_handle, _translation_handle, _velocity_handle);
    sdk_gestures_GestureState_releaseFfiHandle(_state_handle);
    sdk_core_Point2D_releaseFfiHandle(_origin_handle);
    sdk_core_Point2D_releaseFfiHandle(_translation_handle);
    (_velocity_handle);
    try {
      return (__result_handle);
    } finally {
      (__result_handle);
    }
  }


}

int _TwoFingerPanListener_onTwoFingerPan_static(int _token, int state, Pointer<Void> origin, Pointer<Void> translation, double velocity) {

  try {
    (__lib.instanceCache[_token] as TwoFingerPanListener).onTwoFingerPan(sdk_gestures_GestureState_fromFfi(state), sdk_core_Point2D_fromFfi(origin), sdk_core_Point2D_fromFfi(translation), (velocity));
  } finally {
    sdk_gestures_GestureState_releaseFfiHandle(state);
    sdk_core_Point2D_releaseFfiHandle(origin);
    sdk_core_Point2D_releaseFfiHandle(translation);
    (velocity);
  }
  return 0;
}


Pointer<Void> sdk_gestures_TwoFingerPanListener_toFfi(TwoFingerPanListener value) {
  if (value is TwoFingerPanListener$Impl) return _sdk_gestures_TwoFingerPanListener_copy_handle(value.handle);

  final result = _sdk_gestures_TwoFingerPanListener_create_proxy(
    __lib.cacheObject(value),
    __lib.LibraryContext.isolateId,
    __lib.uncacheObjectFfi,
    Pointer.fromFunction<Uint8 Function(Uint64, Uint32, Pointer<Void>, Pointer<Void>, Double)>(_TwoFingerPanListener_onTwoFingerPan_static, __lib.unknownError)
  );
  __lib.reverseCache[_sdk_gestures_TwoFingerPanListener_get_raw_pointer(result)] = value;

  return result;
}

TwoFingerPanListener sdk_gestures_TwoFingerPanListener_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_gestures_TwoFingerPanListener_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as TwoFingerPanListener;
  if (instance != null) return instance;

  final _type_id_handle = _sdk_gestures_TwoFingerPanListener_get_type_id(handle);
  final factoryConstructor = __lib.typeRepository[String_fromFfi(_type_id_handle)];
  String_releaseFfiHandle(_type_id_handle);

  final _copied_handle = _sdk_gestures_TwoFingerPanListener_copy_handle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copied_handle)
    : TwoFingerPanListener$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_gestures_TwoFingerPanListener_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_gestures_TwoFingerPanListener_release_handle(handle);

Pointer<Void> sdk_gestures_TwoFingerPanListener_toFfi_nullable(TwoFingerPanListener value) =>
  value != null ? sdk_gestures_TwoFingerPanListener_toFfi(value) : Pointer<Void>.fromAddress(0);

TwoFingerPanListener sdk_gestures_TwoFingerPanListener_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_gestures_TwoFingerPanListener_fromFfi(handle) : null;

void sdk_gestures_TwoFingerPanListener_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_gestures_TwoFingerPanListener_release_handle(handle);

// End of TwoFingerPanListener "private" section.

