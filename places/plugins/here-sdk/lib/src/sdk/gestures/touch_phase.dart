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


import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Enum that represents the touch phase.
/// @nodoc
enum TouchPhase {
    /// Touch started.
    begin,
    /// Touch moved.
    move,
    /// Touch did not change.
    stationary,
    /// Touch ended.
    end,
    /// Touch canceled.
    cancel
}

// TouchPhase "private" section, not exported.

int sdk_gestures_TouchPhase_toFfi(TouchPhase value) {
  switch (value) {
  case TouchPhase.begin:
    return 0;
  break;
  case TouchPhase.move:
    return 1;
  break;
  case TouchPhase.stationary:
    return 2;
  break;
  case TouchPhase.end:
    return 3;
  break;
  case TouchPhase.cancel:
    return 4;
  break;
  default:
    throw StateError("Invalid enum value $value for TouchPhase enum.");
  }
}

TouchPhase sdk_gestures_TouchPhase_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return TouchPhase.begin;
  break;
  case 1:
    return TouchPhase.move;
  break;
  case 2:
    return TouchPhase.stationary;
  break;
  case 3:
    return TouchPhase.end;
  break;
  case 4:
    return TouchPhase.cancel;
  break;
  default:
    throw StateError("Invalid numeric value $handle for TouchPhase enum.");
  }
}

void sdk_gestures_TouchPhase_releaseFfiHandle(int handle) {}

final _sdk_gestures_TouchPhase_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_gestures_TouchPhase_create_handle_nullable');
final _sdk_gestures_TouchPhase_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TouchPhase_release_handle_nullable');
final _sdk_gestures_TouchPhase_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TouchPhase_get_value_nullable');

Pointer<Void> sdk_gestures_TouchPhase_toFfi_nullable(TouchPhase value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_gestures_TouchPhase_toFfi(value);
  final result = _sdk_gestures_TouchPhase_create_handle_nullable(_handle);
  sdk_gestures_TouchPhase_releaseFfiHandle(_handle);
  return result;
}

TouchPhase sdk_gestures_TouchPhase_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_gestures_TouchPhase_get_value_nullable(handle);
  final result = sdk_gestures_TouchPhase_fromFfi(_handle);
  sdk_gestures_TouchPhase_releaseFfiHandle(_handle);
  return result;
}

void sdk_gestures_TouchPhase_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_gestures_TouchPhase_release_handle_nullable(handle);

// End of TouchPhase "private" section.

