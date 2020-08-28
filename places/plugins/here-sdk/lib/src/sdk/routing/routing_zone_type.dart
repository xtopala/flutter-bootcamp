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

/// Identifies the different types of road pricing zones for the calculation of routes.
enum RoutingZoneType {
    /// A zone where a vignette is required to use affiliated roads.
    vignette,
    /// A zone of roads where a congestion pricing system applies.
    congestionPricing,
    /// A zone of roads with a specific administrative class specified by
    /// official transport regulations (often country specific).
    adminClass,
    /// A zone defined by environmental criteria. These types of zones
    /// include zones such as Low Emission Zones (LEZ), German Umweltzones or Italian
    /// (E)ZTLs.
    environmental
}

// RoutingZoneType "private" section, not exported.

int sdk_routing_RoutingZoneType_toFfi(RoutingZoneType value) {
  switch (value) {
  case RoutingZoneType.vignette:
    return 0;
  break;
  case RoutingZoneType.congestionPricing:
    return 1;
  break;
  case RoutingZoneType.adminClass:
    return 2;
  break;
  case RoutingZoneType.environmental:
    return 3;
  break;
  default:
    throw StateError("Invalid enum value $value for RoutingZoneType enum.");
  }
}

RoutingZoneType sdk_routing_RoutingZoneType_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return RoutingZoneType.vignette;
  break;
  case 1:
    return RoutingZoneType.congestionPricing;
  break;
  case 2:
    return RoutingZoneType.adminClass;
  break;
  case 3:
    return RoutingZoneType.environmental;
  break;
  default:
    throw StateError("Invalid numeric value $handle for RoutingZoneType enum.");
  }
}

void sdk_routing_RoutingZoneType_releaseFfiHandle(int handle) {}

final _sdk_routing_RoutingZoneType_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_RoutingZoneType_create_handle_nullable');
final _sdk_routing_RoutingZoneType_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingZoneType_release_handle_nullable');
final _sdk_routing_RoutingZoneType_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingZoneType_get_value_nullable');

Pointer<Void> sdk_routing_RoutingZoneType_toFfi_nullable(RoutingZoneType value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_RoutingZoneType_toFfi(value);
  final result = _sdk_routing_RoutingZoneType_create_handle_nullable(_handle);
  sdk_routing_RoutingZoneType_releaseFfiHandle(_handle);
  return result;
}

RoutingZoneType sdk_routing_RoutingZoneType_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_RoutingZoneType_get_value_nullable(handle);
  final result = sdk_routing_RoutingZoneType_fromFfi(_handle);
  sdk_routing_RoutingZoneType_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_RoutingZoneType_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_RoutingZoneType_release_handle_nullable(handle);

// End of RoutingZoneType "private" section.

