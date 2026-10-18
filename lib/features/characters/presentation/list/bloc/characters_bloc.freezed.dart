// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'characters_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharactersEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CharactersEvent()';
}


}

/// @nodoc
class $CharactersEventCopyWith<$Res>  {
$CharactersEventCopyWith(CharactersEvent _, $Res Function(CharactersEvent) __);
}


/// Adds pattern-matching-related methods to [CharactersEvent].
extension CharactersEventPatterns on CharactersEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CharactersQueryChanged value)?  queryChanged,TResult Function( CharactersNextPageRequested value)?  nextPageRequested,TResult Function( CharactersRefreshRequested value)?  refreshRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CharactersQueryChanged() when queryChanged != null:
return queryChanged(_that);case CharactersNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case CharactersRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CharactersQueryChanged value)  queryChanged,required TResult Function( CharactersNextPageRequested value)  nextPageRequested,required TResult Function( CharactersRefreshRequested value)  refreshRequested,}){
final _that = this;
switch (_that) {
case CharactersQueryChanged():
return queryChanged(_that);case CharactersNextPageRequested():
return nextPageRequested(_that);case CharactersRefreshRequested():
return refreshRequested(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CharactersQueryChanged value)?  queryChanged,TResult? Function( CharactersNextPageRequested value)?  nextPageRequested,TResult? Function( CharactersRefreshRequested value)?  refreshRequested,}){
final _that = this;
switch (_that) {
case CharactersQueryChanged() when queryChanged != null:
return queryChanged(_that);case CharactersNextPageRequested() when nextPageRequested != null:
return nextPageRequested(_that);case CharactersRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String query)?  queryChanged,TResult Function()?  nextPageRequested,TResult Function()?  refreshRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CharactersQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case CharactersNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case CharactersRefreshRequested() when refreshRequested != null:
return refreshRequested();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String query)  queryChanged,required TResult Function()  nextPageRequested,required TResult Function()  refreshRequested,}) {final _that = this;
switch (_that) {
case CharactersQueryChanged():
return queryChanged(_that.query);case CharactersNextPageRequested():
return nextPageRequested();case CharactersRefreshRequested():
return refreshRequested();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String query)?  queryChanged,TResult? Function()?  nextPageRequested,TResult? Function()?  refreshRequested,}) {final _that = this;
switch (_that) {
case CharactersQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case CharactersNextPageRequested() when nextPageRequested != null:
return nextPageRequested();case CharactersRefreshRequested() when refreshRequested != null:
return refreshRequested();case _:
  return null;

}
}

}

/// @nodoc


class CharactersQueryChanged implements CharactersEvent {
  const CharactersQueryChanged(this.query);
  

 final  String query;

/// Create a copy of CharactersEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharactersQueryChangedCopyWith<CharactersQueryChanged> get copyWith => _$CharactersQueryChangedCopyWithImpl<CharactersQueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersQueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query);
}

@override
String toString() {
    return 'CharactersEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $CharactersQueryChangedCopyWith<$Res> implements $CharactersEventCopyWith<$Res> {
  factory $CharactersQueryChangedCopyWith(CharactersQueryChanged value, $Res Function(CharactersQueryChanged) _then) = _$CharactersQueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$CharactersQueryChangedCopyWithImpl<$Res>
    implements $CharactersQueryChangedCopyWith<$Res> {
  _$CharactersQueryChangedCopyWithImpl(this._self, this._then);

  final CharactersQueryChanged _self;
  final $Res Function(CharactersQueryChanged) _then;

/// Create a copy of CharactersEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(CharactersQueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CharactersNextPageRequested implements CharactersEvent {
  const CharactersNextPageRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersNextPageRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CharactersEvent.nextPageRequested()';
}


}




/// @nodoc


class CharactersRefreshRequested implements CharactersEvent {
  const CharactersRefreshRequested();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CharactersEvent.refreshRequested()';
}


}




/// @nodoc
mixin _$CharactersState {

/// Trimmed search text; empty means no filter.
 String get query;/// Its `error` is always a [Failure]; read it through [failure].
 PagingState<int, Character> get paging;
/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharactersStateCopyWith<CharactersState> get copyWith => _$CharactersStateCopyWithImpl<CharactersState>(this as CharactersState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CharactersState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersState&&(identical(other.query, _this.query) || other.query == _this.query)&&(identical(other.paging, _this.paging) || other.paging == _this.paging));
}


@override
int get hashCode {
  final _this = this as CharactersState;
  return Object.hash(runtimeType,_this.query,_this.paging);
}

@override
String toString() {
  final _this = this as CharactersState;
  return 'CharactersState(query: ${_this.query}, paging: ${_this.paging})';
}


}

/// @nodoc
abstract mixin class $CharactersStateCopyWith<$Res>  {
  factory $CharactersStateCopyWith(CharactersState value, $Res Function(CharactersState) _then) = _$CharactersStateCopyWithImpl;
@useResult
$Res call({
 String query, PagingState<int, Character> paging
});




}
/// @nodoc
class _$CharactersStateCopyWithImpl<$Res>
    implements $CharactersStateCopyWith<$Res> {
  _$CharactersStateCopyWithImpl(this._self, this._then);

  final CharactersState _self;
  final $Res Function(CharactersState) _then;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? paging = null,}) {
  return _then(CharactersState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,paging: null == paging ? _self.paging : paging // ignore: cast_nullable_to_non_nullable
as PagingState<int, Character>,
  ));
}

}


/// Adds pattern-matching-related methods to [CharactersState].
extension CharactersStatePatterns on CharactersState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharactersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharactersState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharactersState value)  $default,){
final _that = this;
switch (_that) {
case _CharactersState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharactersState value)?  $default,){
final _that = this;
switch (_that) {
case _CharactersState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  PagingState<int, Character> paging)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharactersState() when $default != null:
return $default(_that.query,_that.paging);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  PagingState<int, Character> paging)  $default,) {final _that = this;
switch (_that) {
case _CharactersState():
return $default(_that.query,_that.paging);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  PagingState<int, Character> paging)?  $default,) {final _that = this;
switch (_that) {
case _CharactersState() when $default != null:
return $default(_that.query,_that.paging);case _:
  return null;

}
}

}

/// @nodoc


class _CharactersState implements CharactersState {
  const _CharactersState({required this.query, required this.paging});
  

/// Trimmed search text; empty means no filter.
@override final  String query;
/// Its `error` is always a [Failure]; read it through [failure].
@override final  PagingState<int, Character> paging;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharactersStateCopyWith<_CharactersState> get copyWith => __$CharactersStateCopyWithImpl<_CharactersState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharactersState&&(identical(other.query, query) || other.query == query)&&(identical(other.paging, paging) || other.paging == paging));
}


@override
int get hashCode {
    return Object.hash(runtimeType,query,paging);
}

@override
String toString() {
    return 'CharactersState(query: $query, paging: $paging)';
}


}

/// @nodoc
abstract mixin class _$CharactersStateCopyWith<$Res> implements $CharactersStateCopyWith<$Res> {
  factory _$CharactersStateCopyWith(_CharactersState value, $Res Function(_CharactersState) _then) = __$CharactersStateCopyWithImpl;
@override @useResult
$Res call({
 String query, PagingState<int, Character> paging
});




}
/// @nodoc
class __$CharactersStateCopyWithImpl<$Res>
    implements _$CharactersStateCopyWith<$Res> {
  __$CharactersStateCopyWithImpl(this._self, this._then);

  final _CharactersState _self;
  final $Res Function(_CharactersState) _then;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? paging = null,}) {
  return _then(_CharactersState(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,paging: null == paging ? _self.paging : paging // ignore: cast_nullable_to_non_nullable
as PagingState<int, Character>,
  ));
}


}

// dart format on
