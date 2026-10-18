// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharacterDetailsState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CharacterDetailsState()';
}


}

/// @nodoc
class $CharacterDetailsStateCopyWith<$Res>  {
$CharacterDetailsStateCopyWith(CharacterDetailsState _, $Res Function(CharacterDetailsState) __);
}


/// Adds pattern-matching-related methods to [CharacterDetailsState].
extension CharacterDetailsStatePatterns on CharacterDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CharacterDetailsInitial value)?  initial,TResult Function( CharacterDetailsLoading value)?  loading,TResult Function( CharacterDetailsLoaded value)?  loaded,TResult Function( CharacterDetailsFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CharacterDetailsInitial() when initial != null:
return initial(_that);case CharacterDetailsLoading() when loading != null:
return loading(_that);case CharacterDetailsLoaded() when loaded != null:
return loaded(_that);case CharacterDetailsFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CharacterDetailsInitial value)  initial,required TResult Function( CharacterDetailsLoading value)  loading,required TResult Function( CharacterDetailsLoaded value)  loaded,required TResult Function( CharacterDetailsFailure value)  failure,}){
final _that = this;
switch (_that) {
case CharacterDetailsInitial():
return initial(_that);case CharacterDetailsLoading():
return loading(_that);case CharacterDetailsLoaded():
return loaded(_that);case CharacterDetailsFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CharacterDetailsInitial value)?  initial,TResult? Function( CharacterDetailsLoading value)?  loading,TResult? Function( CharacterDetailsLoaded value)?  loaded,TResult? Function( CharacterDetailsFailure value)?  failure,}){
final _that = this;
switch (_that) {
case CharacterDetailsInitial() when initial != null:
return initial(_that);case CharacterDetailsLoading() when loading != null:
return loading(_that);case CharacterDetailsLoaded() when loaded != null:
return loaded(_that);case CharacterDetailsFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Character character)?  loaded,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CharacterDetailsInitial() when initial != null:
return initial();case CharacterDetailsLoading() when loading != null:
return loading();case CharacterDetailsLoaded() when loaded != null:
return loaded(_that.character);case CharacterDetailsFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Character character)  loaded,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case CharacterDetailsInitial():
return initial();case CharacterDetailsLoading():
return loading();case CharacterDetailsLoaded():
return loaded(_that.character);case CharacterDetailsFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Character character)?  loaded,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case CharacterDetailsInitial() when initial != null:
return initial();case CharacterDetailsLoading() when loading != null:
return loading();case CharacterDetailsLoaded() when loaded != null:
return loaded(_that.character);case CharacterDetailsFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class CharacterDetailsInitial implements CharacterDetailsState {
  const CharacterDetailsInitial();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterDetailsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CharacterDetailsState.initial()';
}


}




/// @nodoc


class CharacterDetailsLoading implements CharacterDetailsState {
  const CharacterDetailsLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CharacterDetailsState.loading()';
}


}




/// @nodoc


class CharacterDetailsLoaded implements CharacterDetailsState {
  const CharacterDetailsLoaded(this.character);
  

 final  Character character;

/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterDetailsLoadedCopyWith<CharacterDetailsLoaded> get copyWith => _$CharacterDetailsLoadedCopyWithImpl<CharacterDetailsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterDetailsLoaded&&(identical(other.character, character) || other.character == character));
}


@override
int get hashCode {
    return Object.hash(runtimeType,character);
}

@override
String toString() {
    return 'CharacterDetailsState.loaded(character: $character)';
}


}

/// @nodoc
abstract mixin class $CharacterDetailsLoadedCopyWith<$Res> implements $CharacterDetailsStateCopyWith<$Res> {
  factory $CharacterDetailsLoadedCopyWith(CharacterDetailsLoaded value, $Res Function(CharacterDetailsLoaded) _then) = _$CharacterDetailsLoadedCopyWithImpl;
@useResult
$Res call({
 Character character
});


$CharacterCopyWith<$Res> get character;

}
/// @nodoc
class _$CharacterDetailsLoadedCopyWithImpl<$Res>
    implements $CharacterDetailsLoadedCopyWith<$Res> {
  _$CharacterDetailsLoadedCopyWithImpl(this._self, this._then);

  final CharacterDetailsLoaded _self;
  final $Res Function(CharacterDetailsLoaded) _then;

/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? character = null,}) {
  return _then(CharacterDetailsLoaded(
null == character ? _self.character : character // ignore: cast_nullable_to_non_nullable
as Character,
  ));
}

/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CharacterCopyWith<$Res> get character {
  
  return $CharacterCopyWith<$Res>(_self.character, (value) {
    return _then(_self.copyWith(character: value));
  });
}
}

/// @nodoc


class CharacterDetailsFailure implements CharacterDetailsState {
  const CharacterDetailsFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterDetailsFailureCopyWith<CharacterDetailsFailure> get copyWith => _$CharacterDetailsFailureCopyWithImpl<CharacterDetailsFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterDetailsFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'CharacterDetailsState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $CharacterDetailsFailureCopyWith<$Res> implements $CharacterDetailsStateCopyWith<$Res> {
  factory $CharacterDetailsFailureCopyWith(CharacterDetailsFailure value, $Res Function(CharacterDetailsFailure) _then) = _$CharacterDetailsFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$CharacterDetailsFailureCopyWithImpl<$Res>
    implements $CharacterDetailsFailureCopyWith<$Res> {
  _$CharacterDetailsFailureCopyWithImpl(this._self, this._then);

  final CharacterDetailsFailure _self;
  final $Res Function(CharacterDetailsFailure) _then;

/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(CharacterDetailsFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
