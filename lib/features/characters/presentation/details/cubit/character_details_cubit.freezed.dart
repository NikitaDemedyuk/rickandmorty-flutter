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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CharacterDetailsInitial value)?  initial,TResult Function( CharacterDetailsLoadInProgress value)?  loadInProgress,TResult Function( CharacterDetailsLoadSuccess value)?  loadSuccess,TResult Function( CharacterDetailsLoadFailure value)?  loadFailure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CharacterDetailsInitial() when initial != null:
return initial(_that);case CharacterDetailsLoadInProgress() when loadInProgress != null:
return loadInProgress(_that);case CharacterDetailsLoadSuccess() when loadSuccess != null:
return loadSuccess(_that);case CharacterDetailsLoadFailure() when loadFailure != null:
return loadFailure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CharacterDetailsInitial value)  initial,required TResult Function( CharacterDetailsLoadInProgress value)  loadInProgress,required TResult Function( CharacterDetailsLoadSuccess value)  loadSuccess,required TResult Function( CharacterDetailsLoadFailure value)  loadFailure,}){
final _that = this;
switch (_that) {
case CharacterDetailsInitial():
return initial(_that);case CharacterDetailsLoadInProgress():
return loadInProgress(_that);case CharacterDetailsLoadSuccess():
return loadSuccess(_that);case CharacterDetailsLoadFailure():
return loadFailure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CharacterDetailsInitial value)?  initial,TResult? Function( CharacterDetailsLoadInProgress value)?  loadInProgress,TResult? Function( CharacterDetailsLoadSuccess value)?  loadSuccess,TResult? Function( CharacterDetailsLoadFailure value)?  loadFailure,}){
final _that = this;
switch (_that) {
case CharacterDetailsInitial() when initial != null:
return initial(_that);case CharacterDetailsLoadInProgress() when loadInProgress != null:
return loadInProgress(_that);case CharacterDetailsLoadSuccess() when loadSuccess != null:
return loadSuccess(_that);case CharacterDetailsLoadFailure() when loadFailure != null:
return loadFailure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loadInProgress,TResult Function( Character character)?  loadSuccess,TResult Function( Failure failure)?  loadFailure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CharacterDetailsInitial() when initial != null:
return initial();case CharacterDetailsLoadInProgress() when loadInProgress != null:
return loadInProgress();case CharacterDetailsLoadSuccess() when loadSuccess != null:
return loadSuccess(_that.character);case CharacterDetailsLoadFailure() when loadFailure != null:
return loadFailure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loadInProgress,required TResult Function( Character character)  loadSuccess,required TResult Function( Failure failure)  loadFailure,}) {final _that = this;
switch (_that) {
case CharacterDetailsInitial():
return initial();case CharacterDetailsLoadInProgress():
return loadInProgress();case CharacterDetailsLoadSuccess():
return loadSuccess(_that.character);case CharacterDetailsLoadFailure():
return loadFailure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loadInProgress,TResult? Function( Character character)?  loadSuccess,TResult? Function( Failure failure)?  loadFailure,}) {final _that = this;
switch (_that) {
case CharacterDetailsInitial() when initial != null:
return initial();case CharacterDetailsLoadInProgress() when loadInProgress != null:
return loadInProgress();case CharacterDetailsLoadSuccess() when loadSuccess != null:
return loadSuccess(_that.character);case CharacterDetailsLoadFailure() when loadFailure != null:
return loadFailure(_that.failure);case _:
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


class CharacterDetailsLoadInProgress implements CharacterDetailsState {
  const CharacterDetailsLoadInProgress();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterDetailsLoadInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CharacterDetailsState.loadInProgress()';
}


}




/// @nodoc


class CharacterDetailsLoadSuccess implements CharacterDetailsState {
  const CharacterDetailsLoadSuccess(this.character);
  

 final  Character character;

/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterDetailsLoadSuccessCopyWith<CharacterDetailsLoadSuccess> get copyWith => _$CharacterDetailsLoadSuccessCopyWithImpl<CharacterDetailsLoadSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterDetailsLoadSuccess&&(identical(other.character, character) || other.character == character));
}


@override
int get hashCode {
    return Object.hash(runtimeType,character);
}

@override
String toString() {
    return 'CharacterDetailsState.loadSuccess(character: $character)';
}


}

/// @nodoc
abstract mixin class $CharacterDetailsLoadSuccessCopyWith<$Res> implements $CharacterDetailsStateCopyWith<$Res> {
  factory $CharacterDetailsLoadSuccessCopyWith(CharacterDetailsLoadSuccess value, $Res Function(CharacterDetailsLoadSuccess) _then) = _$CharacterDetailsLoadSuccessCopyWithImpl;
@useResult
$Res call({
 Character character
});


$CharacterCopyWith<$Res> get character;

}
/// @nodoc
class _$CharacterDetailsLoadSuccessCopyWithImpl<$Res>
    implements $CharacterDetailsLoadSuccessCopyWith<$Res> {
  _$CharacterDetailsLoadSuccessCopyWithImpl(this._self, this._then);

  final CharacterDetailsLoadSuccess _self;
  final $Res Function(CharacterDetailsLoadSuccess) _then;

/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? character = null,}) {
  return _then(CharacterDetailsLoadSuccess(
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


class CharacterDetailsLoadFailure implements CharacterDetailsState {
  const CharacterDetailsLoadFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterDetailsLoadFailureCopyWith<CharacterDetailsLoadFailure> get copyWith => _$CharacterDetailsLoadFailureCopyWithImpl<CharacterDetailsLoadFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterDetailsLoadFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,failure);
}

@override
String toString() {
    return 'CharacterDetailsState.loadFailure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $CharacterDetailsLoadFailureCopyWith<$Res> implements $CharacterDetailsStateCopyWith<$Res> {
  factory $CharacterDetailsLoadFailureCopyWith(CharacterDetailsLoadFailure value, $Res Function(CharacterDetailsLoadFailure) _then) = _$CharacterDetailsLoadFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$CharacterDetailsLoadFailureCopyWithImpl<$Res>
    implements $CharacterDetailsLoadFailureCopyWith<$Res> {
  _$CharacterDetailsLoadFailureCopyWithImpl(this._self, this._then);

  final CharacterDetailsLoadFailure _self;
  final $Res Function(CharacterDetailsLoadFailure) _then;

/// Create a copy of CharacterDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(CharacterDetailsLoadFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
