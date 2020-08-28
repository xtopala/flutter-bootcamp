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
import 'package:here_sdk/src/sdk/search/web_source.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Contains information about editorial article and a link to it.
/// @nodoc

class WebEditorial {
  /// Content of the editorial.
  /// @nodoc
  String internaldescription;

  /// Information about language in which edtitorial was written.
  /// @nodoc
  String internallanguage;

  /// Detailed information about editorial article.
  /// @nodoc
  WebSource internalsource;

  WebEditorial(this.internaldescription, this.internallanguage, this.internalsource);
  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! WebEditorial) return false;
    WebEditorial _other = other;
    return internaldescription == _other.internaldescription &&
        internallanguage == _other.internallanguage &&
        internalsource == _other.internalsource;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internaldescription.hashCode;
    result = 31 * result + internallanguage.hashCode;
    result = 31 * result + internalsource.hashCode;
    return result;
  }
}

// WebEditorial "private" section, not exported.

final _sdk_search_WebEditorial_create_handle = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_create_handle');
final _sdk_search_WebEditorial_release_handle = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_release_handle');
final _sdk_search_WebEditorial_get_field_description = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_get_field_description');
final _sdk_search_WebEditorial_get_field_language = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_get_field_language');
final _sdk_search_WebEditorial_get_field_source = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_get_field_source');

Pointer<Void> sdk_search_WebEditorial_toFfi(WebEditorial value) {
  final _description_handle = String_toFfi(value.internaldescription);
  final _language_handle = String_toFfi(value.internallanguage);
  final _source_handle = sdk_search_WebSource_toFfi(value.internalsource);
  final _result = _sdk_search_WebEditorial_create_handle(_description_handle, _language_handle, _source_handle);
  String_releaseFfiHandle(_description_handle);
  String_releaseFfiHandle(_language_handle);
  sdk_search_WebSource_releaseFfiHandle(_source_handle);
  return _result;
}

WebEditorial sdk_search_WebEditorial_fromFfi(Pointer<Void> handle) {
  final _description_handle = _sdk_search_WebEditorial_get_field_description(handle);
  final _language_handle = _sdk_search_WebEditorial_get_field_language(handle);
  final _source_handle = _sdk_search_WebEditorial_get_field_source(handle);
  try {
    return WebEditorial(
      String_fromFfi(_description_handle), 
    
      String_fromFfi(_language_handle), 
    
      sdk_search_WebSource_fromFfi(_source_handle)
    );
  } finally {
    String_releaseFfiHandle(_description_handle);
    String_releaseFfiHandle(_language_handle);
    sdk_search_WebSource_releaseFfiHandle(_source_handle);
  }
}

void sdk_search_WebEditorial_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_WebEditorial_release_handle(handle);

// Nullable WebEditorial

final _sdk_search_WebEditorial_create_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_create_handle_nullable');
final _sdk_search_WebEditorial_release_handle_nullable = __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_release_handle_nullable');
final _sdk_search_WebEditorial_get_value_nullable = __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_get_value_nullable');

Pointer<Void> sdk_search_WebEditorial_toFfi_nullable(WebEditorial value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_WebEditorial_toFfi(value);
  final result = _sdk_search_WebEditorial_create_handle_nullable(_handle);
  sdk_search_WebEditorial_releaseFfiHandle(_handle);
  return result;
}

WebEditorial sdk_search_WebEditorial_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_WebEditorial_get_value_nullable(handle);
  final result = sdk_search_WebEditorial_fromFfi(_handle);
  sdk_search_WebEditorial_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_WebEditorial_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_WebEditorial_release_handle_nullable(handle);

// End of WebEditorial "private" section.

