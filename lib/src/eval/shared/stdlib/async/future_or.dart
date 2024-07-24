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
    } else {
      if ($value is $Instance) {
        _object = $value as $Instance;
      }
      _future = null;
    }
  }

  @override
  final FutureOr<T> $value;

  @override
  FutureOr<T> get $reified => $value is Future
      ? ($value as Future)
          .then((value) => value is $Value ? value.$value : value)
      : $value is $Value
          ? ($value as $Value).$reified
          : $value;

  $Instance? _object;

  late final $Instance? _future;

  static const $type = BridgeTypeRef(AsyncTypes.futureOr);

  @override
  $Value? $getProperty(Runtime runtime, String identifier) {
    if (_future != null) {
      return _future!.$getProperty(runtime, identifier);
    } else {
      _setObject(runtime);
      return _object!.$getProperty(runtime, identifier);
    }
  }

  @override
  void $setProperty(Runtime runtime, String identifier, $Value value) {
    if (_future != null) {
      _future!.$setProperty(runtime, identifier, value);
    } else {
      _setObject(runtime);
      _object!.$setProperty(runtime, identifier, value);
    }
  }

  @override
  int $getRuntimeType(Runtime runtime) => $value is Future
      ? runtime.lookupType(CoreTypes.future)
      : ($value is $Value
          ? ($value as $Value).$getRuntimeType(runtime)
          : runtime.wrap($value).$getRuntimeType(runtime));

  void _setObject(Runtime runtime) {
    final wrapped = runtime.wrap($value);
    if (wrapped is $Instance) {
      _object = wrapped;
    }
  }
}
