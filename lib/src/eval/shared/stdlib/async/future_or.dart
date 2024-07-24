// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:dart_eval/stdlib/core.dart';

/// Wrapper for [Future]
class $FutureOr<T> implements $Instance {
  static const $declaration = BridgeClassDef(
    BridgeClassType(
      BridgeTypeRef(AsyncTypes.futureOr),
      isAbstract: true,
      $implements: [
        BridgeTypeRef(CoreTypes.future),
      ],
      generics: {
        'T': BridgeGenericParam(),
      },
    ),
    constructors: {},
    methods: {},
    getters: {},
    setters: {},
    fields: {},
    wrap: true,
  );

  $FutureOr.wrap(this.$value) {
    if ($value is Future) {
      _future = $Future.wrap($value as Future);
      _object = null;
    } else if ($value is Object) {
      _object = $Object($value as Object);
      _future = null;
    } else {
      _object = null;
      _future = null;
    }
  }

  @override
  final FutureOr<T> $value;

  @override
  FutureOr get $reified => $value is Future
      ? ($value as Future)
          .then((value) => value is $Value ? value.$reified : value)
      : $value is $Value
          ? ($value as $Value).$reified
          : $value;

  late final $Instance? _object;

  late final $Instance? _future;

  static const $type = BridgeTypeRef(CoreTypes.future);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    try {
      return _object!.$getProperty(runtime, identifier);
    } catch (_) {
      return _future!.$getProperty(runtime, identifier);
    }
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    try {
      return _object!.$setProperty(runtime, identifier, value);
    } catch (_) {
      return _future!.$setProperty(runtime, identifier, value);
    }
  }

  @override
  int $getRuntimeType(Runtime runtime) => runtime.lookupType(CoreTypes.future);
}
