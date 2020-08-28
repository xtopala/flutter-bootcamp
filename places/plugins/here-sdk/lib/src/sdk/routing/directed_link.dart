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

import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/travel_direction.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;



/// @nodoc

class DirectedLink {
  /// @nodoc
  TravelDirection internaltravelDirection;

  /// @nodoc
  int internalpvid;

  /// @nodoc
  String internalsegmentid;

  DirectedLink._(this.internaltravelDirection, this.internalpvid, this.internalsegmentid);
  DirectedLink._copy(DirectedLink _other) : this._(_other.internaltravelDirection, _other.internalpvid, _other.internalsegmentid);

  /// @nodoc
  DirectedLink.internalwithTravelDirectionAndPvid(TravelDirection travelDirection, int pvid) : this._copy(_withTravelDirectionAndPvid(travelDirection, pvid));


  /// @nodoc
  DirectedLink.internalwithSegmentid(String segmentid) : this._copy(_withSegmentid(segmentid));


  /// @nodoc
  static DirectedLink _withTravelDirectionAndPvid(TravelDirection travelDirection, int pvid) {
    final _withTravelDirectionAndPvid_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Uint64), Pointer<Void> Function(int, int, int)>('here_sdk_sdk_routing_DirectedLink_make__TravelDirection_ULong');
    final _travelDirection_handle = sdk_routing_TravelDirection_toFfi(travelDirection);
    final _pvid_handle = (pvid);
    final __result_handle = _withTravelDirectionAndPvid_ffi(__lib.LibraryContext.isolateId, _travelDirection_handle, _pvid_handle);
    sdk_routing_TravelDirection_releaseFfiHandle(_travelDirection_handle);
    (_pvid_handle);
    try {
      return sdk_routing_DirectedLink_fromFfi(__result_handle);
    } finally {
      sdk_routing_DirectedLink_releaseFfiHandle(__result_handle);
    }
  }


  /// @nodoc
  static DirectedLink _withSegmentid(String segmentid) {
    final _withSegmentid_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_DirectedLink_make__String');
    final _segmentid_handle = String_toFfi(segmentid);
    final __result_handle = _withSegmentid_ffi(__lib.LibraryContext.isolateId, _segmentid_handle);
    String_releaseFfiHandle(_segmentid_handle);
    try {
      return sdk_routing_DirectedLink_fromFfi(__result_handle);
    } finally {
      sdk_routing_DirectedLink_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! DirectedLink) return false;
    DirectedLink _other = other;
    return internaltravelDirection == _other.internaltravelDirection &&
        internalpvid == _other.internalpvid &&
        internalsegmentid == _other.internalsegmentid;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internaltravelDirection.hashCode;
    result = 31 * result + internalpvid.hashCode;
    result = 31 * result + internalsegmentid.hashCode;
    return result;
  }
}

// DirectedLink "private" section, not exported.

final _sdk_routing_DirectedLink_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_create_handle');
final _sdk_routing_DirectedLink_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_release_handle');
final _sdk_routing_DirectedLink_get_field_travelDirection = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_get_field_travelDirection');
final _sdk_routing_DirectedLink_get_field_pvid = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_get_field_pvid');
final _sdk_routing_DirectedLink_get_field_segmentid = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_get_field_segmentid');

Pointer<Void> sdk_routing_DirectedLink_toFfi(DirectedLink value) {
  final _travelDirection_handle = sdk_routing_TravelDirection_toFfi_nullable(value.internaltravelDirection);
  final _pvid_handle = ULong_toFfi_nullable(value.internalpvid);
  final _segmentid_handle = String_toFfi_nullable(value.internalsegmentid);
  final _result = _sdk_routing_DirectedLink_create_handle(_travelDirection_handle, _pvid_handle, _segmentid_handle);
  sdk_routing_TravelDirection_releaseFfiHandle_nullable(_travelDirection_handle);
  ULong_releaseFfiHandle_nullable(_pvid_handle);
  String_releaseFfiHandle_nullable(_segmentid_handle);
  return _result;
}

DirectedLink sdk_routing_DirectedLink_fromFfi(Pointer<Void> handle) {
  final _travelDirection_handle = _sdk_routing_DirectedLink_get_field_travelDirection(handle);
  final _pvid_handle = _sdk_routing_DirectedLink_get_field_pvid(handle);
  final _segmentid_handle = _sdk_routing_DirectedLink_get_field_segmentid(handle);
  try {
    return DirectedLink._(
      sdk_routing_TravelDirection_fromFfi_nullable(_travelDirection_handle), 
    
      ULong_fromFfi_nullable(_pvid_handle), 
    
      String_fromFfi_nullable(_segmentid_handle)
    );
  } finally {
    sdk_routing_TravelDirection_releaseFfiHandle_nullable(_travelDirection_handle);
    ULong_releaseFfiHandle_nullable(_pvid_handle);
    String_releaseFfiHandle_nullable(_segmentid_handle);
  }
}

void sdk_routing_DirectedLink_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_DirectedLink_release_handle(handle);

// Nullable DirectedLink

final _sdk_routing_DirectedLink_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_create_handle_nullable');
final _sdk_routing_DirectedLink_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_release_handle_nullable');
final _sdk_routing_DirectedLink_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DirectedLink_get_value_nullable');

Pointer<Void> sdk_routing_DirectedLink_toFfi_nullable(DirectedLink value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_DirectedLink_toFfi(value);
  final result = _sdk_routing_DirectedLink_create_handle_nullable(_handle);
  sdk_routing_DirectedLink_releaseFfiHandle(_handle);
  return result;
}

DirectedLink sdk_routing_DirectedLink_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_DirectedLink_get_value_nullable(handle);
  final result = sdk_routing_DirectedLink_fromFfi(_handle);
  sdk_routing_DirectedLink_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_DirectedLink_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_DirectedLink_release_handle_nullable(handle);

// End of DirectedLink "private" section.

