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
import 'package:here_sdk/src/sdk/mapview/map_context.dart';
import 'package:here_sdk/src/sdk/mapview/raster_data_source.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// @nodoc
abstract class RasterDataSourceFactory {

  /// Destroys the underlying native object.
  ///
  /// Call this to free memory when you no longer need this instance.
  /// Note that setting the instance to null will not destroy the underlying native object.
  void release();


  /// @nodoc
  static RasterDataSource internalcreate(MapContext context) => RasterDataSourceFactory$Impl.internalcreate(context);
}


// RasterDataSourceFactory "private" section, not exported.

final _sdk_mapview_RasterDataSourceFactory_copy_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RasterDataSourceFactory_copy_handle');
final _sdk_mapview_RasterDataSourceFactory_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RasterDataSourceFactory_release_handle');
final _sdk_mapview_RasterDataSourceFactory_get_raw_pointer = __lib.nativeLibrary.lookupFunction<
      Pointer<Void> Function(Pointer<Void>),
      Pointer<Void> Function(Pointer<Void>)
    >('here_sdk_sdk_mapview_RasterDataSourceFactory_get_raw_pointer');


class RasterDataSourceFactory$Impl implements RasterDataSourceFactory {
  @protected
  Pointer<Void> handle;

  RasterDataSourceFactory$Impl(this.handle);

  @override
  void release() {
    if (handle == null) return;
    __lib.reverseCache.remove(_sdk_mapview_RasterDataSourceFactory_get_raw_pointer(handle));
    _sdk_mapview_RasterDataSourceFactory_release_handle(handle);
    handle = null;
  }

  static RasterDataSource internalcreate(MapContext context) {
    final _create_ffi = __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_RasterDataSourceFactory_create__MapContext');
    final _context_handle = sdk_mapview_MapContext_toFfi(context);
    final __result_handle = _create_ffi(__lib.LibraryContext.isolateId, _context_handle);
    sdk_mapview_MapContext_releaseFfiHandle(_context_handle);
    try {
      return sdk_mapview_RasterDataSource_fromFfi_nullable(__result_handle);
    } finally {
      sdk_mapview_RasterDataSource_releaseFfiHandle_nullable(__result_handle);
    }
  }


}

Pointer<Void> sdk_mapview_RasterDataSourceFactory_toFfi(RasterDataSourceFactory value) =>
  _sdk_mapview_RasterDataSourceFactory_copy_handle((value as RasterDataSourceFactory$Impl).handle);

RasterDataSourceFactory sdk_mapview_RasterDataSourceFactory_fromFfi(Pointer<Void> handle) {
  final raw_handle = _sdk_mapview_RasterDataSourceFactory_get_raw_pointer(handle);
  final instance = __lib.reverseCache[raw_handle] as RasterDataSourceFactory;
  if (instance != null) return instance;

  final _copied_handle = _sdk_mapview_RasterDataSourceFactory_copy_handle(handle);
  final result = RasterDataSourceFactory$Impl(_copied_handle);
  __lib.reverseCache[raw_handle] = result;
  return result;
}

void sdk_mapview_RasterDataSourceFactory_releaseFfiHandle(Pointer<Void> handle) =>
  _sdk_mapview_RasterDataSourceFactory_release_handle(handle);

Pointer<Void> sdk_mapview_RasterDataSourceFactory_toFfi_nullable(RasterDataSourceFactory value) =>
  value != null ? sdk_mapview_RasterDataSourceFactory_toFfi(value) : Pointer<Void>.fromAddress(0);

RasterDataSourceFactory sdk_mapview_RasterDataSourceFactory_fromFfi_nullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdk_mapview_RasterDataSourceFactory_fromFfi(handle) : null;

void sdk_mapview_RasterDataSourceFactory_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_mapview_RasterDataSourceFactory_release_handle(handle);

// End of RasterDataSourceFactory "private" section.

