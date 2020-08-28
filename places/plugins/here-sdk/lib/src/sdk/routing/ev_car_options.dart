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
import 'package:here_sdk/src/sdk/routing/avoidance_options.dart';
import 'package:here_sdk/src/sdk/routing/ev_consumption_model.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// All the options to specify how a route for an electric car should be calculated.
/// @nodoc

class EvCarOptions {
  /// Specifies the common route calculation options.
  /// @nodoc
  RouteOptions internalrouteOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  /// @nodoc
  RouteTextOptions internaltextOptions;

  /// Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  /// @nodoc
  AvoidanceOptions internalavoidanceOptions;

  /// Vehicle specific parameters, which are then used to calculate energy consumption
  /// for the vehicle on a given route.
  /// @nodoc
  EvConsumptionModel internalconsumptionModel;

  EvCarOptions(this.internalrouteOptions, this.internaltextOptions, this.internalavoidanceOptions, this.internalconsumptionModel);
  EvCarOptions.withDefaults()
    : internalrouteOptions = RouteOptions.withDefaults(), internaltextOptions = RouteTextOptions.withDefaults(), internalavoidanceOptions = AvoidanceOptions.withDefaults(), internalconsumptionModel = EvConsumptionModel.withDefaults();
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EvCarOptions) return false;
    EvCarOptions _other = other;
    return internalrouteOptions == _other.internalrouteOptions &&
        internaltextOptions == _other.internaltextOptions &&
        internalavoidanceOptions == _other.internalavoidanceOptions &&
        internalconsumptionModel == _other.internalconsumptionModel;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalrouteOptions.hashCode;
    result = 31 * result + internaltextOptions.hashCode;
    result = 31 * result + internalavoidanceOptions.hashCode;
    result = 31 * result + internalconsumptionModel.hashCode;
    return result;
  }
}

// EvCarOptions "private" section, not exported.

final _sdk_routing_EvCarOptions_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_EvCarOptions_create_handle');
final _sdk_routing_EvCarOptions_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvCarOptions_release_handle');
final _sdk_routing_EvCarOptions_get_field_routeOptions = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvCarOptions_get_field_routeOptions');
final _sdk_routing_EvCarOptions_get_field_textOptions = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvCarOptions_get_field_textOptions');
final _sdk_routing_EvCarOptions_get_field_avoidanceOptions = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvCarOptions_get_field_avoidanceOptions');
final _sdk_routing_EvCarOptions_get_field_consumptionModel = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvCarOptions_get_field_consumptionModel');

Pointer<Void> sdk_routing_EvCarOptions_toFfi(EvCarOptions value) {
  final _routeOptions_handle = sdk_routing_RouteOptions_toFfi(value.internalrouteOptions);
  final _textOptions_handle = sdk_routing_RouteTextOptions_toFfi(value.internaltextOptions);
  final _avoidanceOptions_handle = sdk_routing_AvoidanceOptions_toFfi(value.internalavoidanceOptions);
  final _consumptionModel_handle = sdk_routing_EvConsumptionModel_toFfi(value.internalconsumptionModel);
  final _result = _sdk_routing_EvCarOptions_create_handle(_routeOptions_handle, _textOptions_handle, _avoidanceOptions_handle, _consumptionModel_handle);
  sdk_routing_RouteOptions_releaseFfiHandle(_routeOptions_handle);
  sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
  sdk_routing_AvoidanceOptions_releaseFfiHandle(_avoidanceOptions_handle);
  sdk_routing_EvConsumptionModel_releaseFfiHandle(_consumptionModel_handle);
  return _result;
}

EvCarOptions sdk_routing_EvCarOptions_fromFfi(Pointer<Void> handle) {
  final _routeOptions_handle = _sdk_routing_EvCarOptions_get_field_routeOptions(handle);
  final _textOptions_handle = _sdk_routing_EvCarOptions_get_field_textOptions(handle);
  final _avoidanceOptions_handle = _sdk_routing_EvCarOptions_get_field_avoidanceOptions(handle);
  final _consumptionModel_handle = _sdk_routing_EvCarOptions_get_field_consumptionModel(handle);
  try {
    return EvCarOptions(
      sdk_routing_RouteOptions_fromFfi(_routeOptions_handle), 
    
      sdk_routing_RouteTextOptions_fromFfi(_textOptions_handle), 
    
      sdk_routing_AvoidanceOptions_fromFfi(_avoidanceOptions_handle), 
    
      sdk_routing_EvConsumptionModel_fromFfi(_consumptionModel_handle)
    );
  } finally {
    sdk_routing_RouteOptions_releaseFfiHandle(_routeOptions_handle);
    sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
    sdk_routing_AvoidanceOptions_releaseFfiHandle(_avoidanceOptions_handle);
    sdk_routing_EvConsumptionModel_releaseFfiHandle(_consumptionModel_handle);
  }
}

void sdk_routing_EvCarOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_EvCarOptions_release_handle(handle);

// Nullable EvCarOptions

final _sdk_routing_EvCarOptions_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvCarOptions_create_handle_nullable');
final _sdk_routing_EvCarOptions_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvCarOptions_release_handle_nullable');
final _sdk_routing_EvCarOptions_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvCarOptions_get_value_nullable');

Pointer<Void> sdk_routing_EvCarOptions_toFfi_nullable(EvCarOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_EvCarOptions_toFfi(value);
  final result = _sdk_routing_EvCarOptions_create_handle_nullable(_handle);
  sdk_routing_EvCarOptions_releaseFfiHandle(_handle);
  return result;
}

EvCarOptions sdk_routing_EvCarOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_EvCarOptions_get_value_nullable(handle);
  final result = sdk_routing_EvCarOptions_fromFfi(_handle);
  sdk_routing_EvCarOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_EvCarOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_EvCarOptions_release_handle_nullable(handle);

// End of EvCarOptions "private" section.

