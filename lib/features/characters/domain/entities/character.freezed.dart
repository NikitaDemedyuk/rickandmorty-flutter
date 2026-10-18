// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Character {

 int get id; String get name; String get imageUrl; CharacterStatus get status; String get species;/// `null` when the API doesn't know it; the UI shows a placeholder.
 String? get originName;/// `null` when the API doesn't know it; the UI shows a placeholder.
 String? get locationName;
/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterCopyWith<Character> get copyWith => _$CharacterCopyWithImpl<Character>(this as Character, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Character;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Character&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.imageUrl, _this.imageUrl) || other.imageUrl == _this.imageUrl)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.species, _this.species) || other.species == _this.species)&&(identical(other.originName, _this.originName) || other.originName == _this.originName)&&(identical(other.locationName, _this.locationName) || other.locationName == _this.locationName));
}


@override
int get hashCode {
  final _this = this as Character;
  return Object.hash(runtimeType,_this.id,_this.name,_this.imageUrl,_this.status,_this.species,_this.originName,_this.locationName);
}

@override
String toString() {
  final _this = this as Character;
  return 'Character(id: ${_this.id}, name: ${_this.name}, imageUrl: ${_this.imageUrl}, status: ${_this.status}, species: ${_this.species}, originName: ${_this.originName}, locationName: ${_this.locationName})';
}


}

/// @nodoc
abstract mixin class $CharacterCopyWith<$Res>  {
  factory $CharacterCopyWith(Character value, $Res Function(Character) _then) = _$CharacterCopyWithImpl;
@useResult
$Res call({
 int id, String name, String imageUrl, CharacterStatus status, String species, String? originName, String? locationName
});




}
/// @nodoc
class _$CharacterCopyWithImpl<$Res>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._self, this._then);

  final Character _self;
  final $Res Function(Character) _then;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? status = null,Object? species = null,Object? originName = freezed,Object? locationName = freezed,}) {
  return _then(Character(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CharacterStatus,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,originName: freezed == originName ? _self.originName : originName // ignore: cast_nullable_to_non_nullable
as String?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Character].
extension CharacterPatterns on Character {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Character value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Character() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Character value)  $default,){
final _that = this;
switch (_that) {
case _Character():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Character value)?  $default,){
final _that = this;
switch (_that) {
case _Character() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String imageUrl,  CharacterStatus status,  String species,  String? originName,  String? locationName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Character() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.status,_that.species,_that.originName,_that.locationName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String imageUrl,  CharacterStatus status,  String species,  String? originName,  String? locationName)  $default,) {final _that = this;
switch (_that) {
case _Character():
return $default(_that.id,_that.name,_that.imageUrl,_that.status,_that.species,_that.originName,_that.locationName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String imageUrl,  CharacterStatus status,  String species,  String? originName,  String? locationName)?  $default,) {final _that = this;
switch (_that) {
case _Character() when $default != null:
return $default(_that.id,_that.name,_that.imageUrl,_that.status,_that.species,_that.originName,_that.locationName);case _:
  return null;

}
}

}

/// @nodoc


class _Character implements Character {
  const _Character({required this.id, required this.name, required this.imageUrl, required this.status, required this.species, required this.originName, required this.locationName});
  

@override final  int id;
@override final  String name;
@override final  String imageUrl;
@override final  CharacterStatus status;
@override final  String species;
/// `null` when the API doesn't know it; the UI shows a placeholder.
@override final  String? originName;
/// `null` when the API doesn't know it; the UI shows a placeholder.
@override final  String? locationName;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterCopyWith<_Character> get copyWith => __$CharacterCopyWithImpl<_Character>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Character&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.originName, originName) || other.originName == originName)&&(identical(other.locationName, locationName) || other.locationName == locationName));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,imageUrl,status,species,originName,locationName);
}

@override
String toString() {
    return 'Character(id: $id, name: $name, imageUrl: $imageUrl, status: $status, species: $species, originName: $originName, locationName: $locationName)';
}


}

/// @nodoc
abstract mixin class _$CharacterCopyWith<$Res> implements $CharacterCopyWith<$Res> {
  factory _$CharacterCopyWith(_Character value, $Res Function(_Character) _then) = __$CharacterCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String imageUrl, CharacterStatus status, String species, String? originName, String? locationName
});




}
/// @nodoc
class __$CharacterCopyWithImpl<$Res>
    implements _$CharacterCopyWith<$Res> {
  __$CharacterCopyWithImpl(this._self, this._then);

  final _Character _self;
  final $Res Function(_Character) _then;

/// Create a copy of Character
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? imageUrl = null,Object? status = null,Object? species = null,Object? originName = freezed,Object? locationName = freezed,}) {
  return _then(_Character(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CharacterStatus,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,originName: freezed == originName ? _self.originName : originName // ignore: cast_nullable_to_non_nullable
as String?,locationName: freezed == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
