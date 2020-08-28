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
import 'package:here_sdk/src/generic_types__conversion.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Parameters specific for the electric vehicle, which are then used to calculate
/// energy consumption on a given route.
/// @nodoc

class EvConsumptionModel {
  /// Rate of energy consumed per meter rise in elevation (in Wh/m, i.e., Watt-hours per meter).
  /// @nodoc
  double internalascentConsumptionInWatthoursPerMeter;

  /// Rate of energy recovered per meter fall in elevation (in Wh/m, i.e., Watt-hours per meter).
  /// @nodoc
  double internaldescentRecoveryInWatthoursPerMeter;

  /// Free flow speed table describes energy consumption when travelling at constant speed.
  /// It defines a function curve specifying consumption rate at a given free flow speed
  /// on a flat stretch of road.
  /// Map keys represent speed values that are non-negative integers in units of (km/h).
  /// Map values represent consumption values that are non-negative floating point values
  /// in units of (Wh/m).
  /// The function is linearly interpolated between each successive pair of data points.
  /// @nodoc
  Map<int, double> internalfreeFlowSpeedTable;

  /// Traffic speed table describes energy consumption when travelling under heavy traffic
  /// conditions, i.e. when the vehicle is expected to often change the travel speed.
  /// It defines a function curve specifying consumption rate at a given speed under traffic
  /// conditions on a flat stretch of road.
  /// Map keys represent speed values that are non-negative integers in units of (km/h).
  /// Map values represent consumption values that are non-negative floating point values
  /// in units of (Wh/m).
  /// The function is linearly interpolated between each successive pair of data points.
  /// If [EvConsumptionModel.trafficSpeedTable] is empty then only
  /// [EvConsumptionModel.freeFlowSpeedTable] is used for calculating speed-related
  /// energy consumption.
  /// @nodoc
  Map<int, double> internaltrafficSpeedTable;

  /// Rate of energy (in Wh/s) consumed by the vehicle's auxiliary systems
  /// (e.g., air conditioning, lights) per second of travel.
  /// @nodoc
  double internalauxiliaryConsumptionInWatthoursPerSecond;

  EvConsumptionModel(this.internalascentConsumptionInWatthoursPerMeter, this.internaldescentRecoveryInWatthoursPerMeter, this.internalfreeFlowSpeedTable, this.internaltrafficSpeedTable, this.internalauxiliaryConsumptionInWatthoursPerSecond);
  EvConsumptionModel.withDefaults()
    : internalascentConsumptionInWatthoursPerMeter = 0.0, internaldescentRecoveryInWatthoursPerMeter = 0.0, internalfreeFlowSpeedTable = {}, internaltrafficSpeedTable = {}, internalauxiliaryConsumptionInWatthoursPerSecond = 0.0;
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EvConsumptionModel) return false;
    EvConsumptionModel _other = other;
    return internalascentConsumptionInWatthoursPerMeter == _other.internalascentConsumptionInWatthoursPerMeter &&
        internaldescentRecoveryInWatthoursPerMeter == _other.internaldescentRecoveryInWatthoursPerMeter &&
        DeepCollectionEquality().equals(internalfreeFlowSpeedTable, _other.internalfreeFlowSpeedTable) &&
        DeepCollectionEquality().equals(internaltrafficSpeedTable, _other.internaltrafficSpeedTable) &&
        internalauxiliaryConsumptionInWatthoursPerSecond == _other.internalauxiliaryConsumptionInWatthoursPerSecond;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalascentConsumptionInWatthoursPerMeter.hashCode;
    result = 31 * result + internaldescentRecoveryInWatthoursPerMeter.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(internalfreeFlowSpeedTable);
    result = 31 * result + DeepCollectionEquality().hash(internaltrafficSpeedTable);
    result = 31 * result + internalauxiliaryConsumptionInWatthoursPerSecond.hashCode;
    return result;
  }
}

// EvConsumptionModel "private" section, not exported.

final _sdk_routing_EvConsumptionModel_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Pointer<Void>, Pointer<Void>, Double),
    Pointer<Void> Function(double, double, Pointer<Void>, Pointer<Void>, double)
  >('here_sdk_sdk_routing_EvConsumptionModel_create_handle');
final _sdk_routing_EvConsumptionModel_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvConsumptionModel_release_handle');
final _sdk_routing_EvConsumptionModel_get_field_ascentConsumptionInWatthoursPerMeter = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvConsumptionModel_get_field_ascentConsumptionInWatthoursPerMeter');
final _sdk_routing_EvConsumptionModel_get_field_descentRecoveryInWatthoursPerMeter = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvConsumptionModel_get_field_descentRecoveryInWatthoursPerMeter');
final _sdk_routing_EvConsumptionModel_get_field_freeFlowSpeedTable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvConsumptionModel_get_field_freeFlowSpeedTable');
final _sdk_routing_EvConsumptionModel_get_field_trafficSpeedTable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvConsumptionModel_get_field_trafficSpeedTable');
final _sdk_routing_EvConsumptionModel_get_field_auxiliaryConsumptionInWatthoursPerSecond = __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvConsumptionModel_get_field_auxiliaryConsumptionInWatthoursPerSecond');

Pointer<Void> sdk_routing_EvConsumptionModel_toFfi(EvConsumptionModel value) {
  final _ascentConsumptionInWatthoursPerMeter_handle = (value.internalascentConsumptionInWatthoursPerMeter);
  final _descentRecoveryInWatthoursPerMeter_handle = (value.internaldescentRecoveryInWatthoursPerMeter);
  final _freeFlowSpeedTable_handle = heresdk_routing_bindings_MapOf_Int_to_Double_toFfi(value.internalfreeFlowSpeedTable);
  final _trafficSpeedTable_handle = heresdk_routing_bindings_MapOf_Int_to_Double_toFfi(value.internaltrafficSpeedTable);
  final _auxiliaryConsumptionInWatthoursPerSecond_handle = (value.internalauxiliaryConsumptionInWatthoursPerSecond);
  final _result = _sdk_routing_EvConsumptionModel_create_handle(_ascentConsumptionInWatthoursPerMeter_handle, _descentRecoveryInWatthoursPerMeter_handle, _freeFlowSpeedTable_handle, _trafficSpeedTable_handle, _auxiliaryConsumptionInWatthoursPerSecond_handle);
  (_ascentConsumptionInWatthoursPerMeter_handle);
  (_descentRecoveryInWatthoursPerMeter_handle);
  heresdk_routing_bindings_MapOf_Int_to_Double_releaseFfiHandle(_freeFlowSpeedTable_handle);
  heresdk_routing_bindings_MapOf_Int_to_Double_releaseFfiHandle(_trafficSpeedTable_handle);
  (_auxiliaryConsumptionInWatthoursPerSecond_handle);
  return _result;
}

EvConsumptionModel sdk_routing_EvConsumptionModel_fromFfi(Pointer<Void> handle) {
  final _ascentConsumptionInWatthoursPerMeter_handle = _sdk_routing_EvConsumptionModel_get_field_ascentConsumptionInWatthoursPerMeter(handle);
  final _descentRecoveryInWatthoursPerMeter_handle = _sdk_routing_EvConsumptionModel_get_field_descentRecoveryInWatthoursPerMeter(handle);
  final _freeFlowSpeedTable_handle = _sdk_routing_EvConsumptionModel_get_field_freeFlowSpeedTable(handle);
  final _trafficSpeedTable_handle = _sdk_routing_EvConsumptionModel_get_field_trafficSpeedTable(handle);
  final _auxiliaryConsumptionInWatthoursPerSecond_handle = _sdk_routing_EvConsumptionModel_get_field_auxiliaryConsumptionInWatthoursPerSecond(handle);
  try {
    return EvConsumptionModel(
      (_ascentConsumptionInWatthoursPerMeter_handle), 
    
      (_descentRecoveryInWatthoursPerMeter_handle), 
    
      heresdk_routing_bindings_MapOf_Int_to_Double_fromFfi(_freeFlowSpeedTable_handle), 
    
      heresdk_routing_bindings_MapOf_Int_to_Double_fromFfi(_trafficSpeedTable_handle), 
    
      (_auxiliaryConsumptionInWatthoursPerSecond_handle)
    );
  } finally {
    (_ascentConsumptionInWatthoursPerMeter_handle);
    (_descentRecoveryInWatthoursPerMeter_handle);
    heresdk_routing_bindings_MapOf_Int_to_Double_releaseFfiHandle(_freeFlowSpeedTable_handle);
    heresdk_routing_bindings_MapOf_Int_to_Double_releaseFfiHandle(_trafficSpeedTable_handle);
    (_auxiliaryConsumptionInWatthoursPerSecond_handle);
  }
}

void sdk_routing_EvConsumptionModel_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_EvConsumptionModel_release_handle(handle);

// Nullable EvConsumptionModel

final _sdk_routing_EvConsumptionModel_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvConsumptionModel_create_handle_nullable');
final _sdk_routing_EvConsumptionModel_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvConsumptionModel_release_handle_nullable');
final _sdk_routing_EvConsumptionModel_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EvConsumptionModel_get_value_nullable');

Pointer<Void> sdk_routing_EvConsumptionModel_toFfi_nullable(EvConsumptionModel value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_EvConsumptionModel_toFfi(value);
  final result = _sdk_routing_EvConsumptionModel_create_handle_nullable(_handle);
  sdk_routing_EvConsumptionModel_releaseFfiHandle(_handle);
  return result;
}

EvConsumptionModel sdk_routing_EvConsumptionModel_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_EvConsumptionModel_get_value_nullable(handle);
  final result = sdk_routing_EvConsumptionModel_fromFfi(_handle);
  sdk_routing_EvConsumptionModel_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_EvConsumptionModel_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_EvConsumptionModel_release_handle_nullable(handle);

// End of EvConsumptionModel "private" section.

