// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CharacterDto {

 int get id; String get name; String get status; String get species; LocationRefDto get origin; LocationRefDto get location; String get image;
/// Create a copy of CharacterDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharacterDtoCopyWith<CharacterDto> get copyWith => _$CharacterDtoCopyWithImpl<CharacterDto>(this as CharacterDto, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CharacterDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharacterDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.species, _this.species) || other.species == _this.species)&&(identical(other.origin, _this.origin) || other.origin == _this.origin)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.image, _this.image) || other.image == _this.image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CharacterDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.status,_this.species,_this.origin,_this.location,_this.image);
}

@override
String toString() {
  final _this = this as CharacterDto;
  return 'CharacterDto(id: ${_this.id}, name: ${_this.name}, status: ${_this.status}, species: ${_this.species}, origin: ${_this.origin}, location: ${_this.location}, image: ${_this.image})';
}


}

/// @nodoc
abstract mixin class $CharacterDtoCopyWith<$Res>  {
  factory $CharacterDtoCopyWith(CharacterDto value, $Res Function(CharacterDto) _then) = _$CharacterDtoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String status, String species, LocationRefDto origin, LocationRefDto location, String image
});


$LocationRefDtoCopyWith<$Res> get origin;$LocationRefDtoCopyWith<$Res> get location;

}
/// @nodoc
class _$CharacterDtoCopyWithImpl<$Res>
    implements $CharacterDtoCopyWith<$Res> {
  _$CharacterDtoCopyWithImpl(this._self, this._then);

  final CharacterDto _self;
  final $Res Function(CharacterDto) _then;

/// Create a copy of CharacterDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? species = null,Object? origin = null,Object? location = null,Object? image = null,}) {
  return _then(CharacterDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as LocationRefDto,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationRefDto,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CharacterDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationRefDtoCopyWith<$Res> get origin {
  
  return $LocationRefDtoCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of CharacterDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationRefDtoCopyWith<$Res> get location {
  
  return $LocationRefDtoCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [CharacterDto].
extension CharacterDtoPatterns on CharacterDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CharacterDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CharacterDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CharacterDto value)  $default,){
final _that = this;
switch (_that) {
case _CharacterDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CharacterDto value)?  $default,){
final _that = this;
switch (_that) {
case _CharacterDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String status,  String species,  LocationRefDto origin,  LocationRefDto location,  String image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CharacterDto() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.origin,_that.location,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String status,  String species,  LocationRefDto origin,  LocationRefDto location,  String image)  $default,) {final _that = this;
switch (_that) {
case _CharacterDto():
return $default(_that.id,_that.name,_that.status,_that.species,_that.origin,_that.location,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String status,  String species,  LocationRefDto origin,  LocationRefDto location,  String image)?  $default,) {final _that = this;
switch (_that) {
case _CharacterDto() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.species,_that.origin,_that.location,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _CharacterDto implements CharacterDto {
  const _CharacterDto({required this.id, required this.name, required this.status, required this.species, required this.origin, required this.location, required this.image});
  factory _CharacterDto.fromJson(Map<String, dynamic> json) => _$CharacterDtoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String status;
@override final  String species;
@override final  LocationRefDto origin;
@override final  LocationRefDto location;
@override final  String image;

/// Create a copy of CharacterDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharacterDtoCopyWith<_CharacterDto> get copyWith => __$CharacterDtoCopyWithImpl<_CharacterDto>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharacterDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.species, species) || other.species == species)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.location, location) || other.location == location)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,status,species,origin,location,image);
}

@override
String toString() {
    return 'CharacterDto(id: $id, name: $name, status: $status, species: $species, origin: $origin, location: $location, image: $image)';
}


}

/// @nodoc
abstract mixin class _$CharacterDtoCopyWith<$Res> implements $CharacterDtoCopyWith<$Res> {
  factory _$CharacterDtoCopyWith(_CharacterDto value, $Res Function(_CharacterDto) _then) = __$CharacterDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String status, String species, LocationRefDto origin, LocationRefDto location, String image
});


@override $LocationRefDtoCopyWith<$Res> get origin;@override $LocationRefDtoCopyWith<$Res> get location;

}
/// @nodoc
class __$CharacterDtoCopyWithImpl<$Res>
    implements _$CharacterDtoCopyWith<$Res> {
  __$CharacterDtoCopyWithImpl(this._self, this._then);

  final _CharacterDto _self;
  final $Res Function(_CharacterDto) _then;

/// Create a copy of CharacterDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? species = null,Object? origin = null,Object? location = null,Object? image = null,}) {
  return _then(_CharacterDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as LocationRefDto,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LocationRefDto,image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CharacterDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationRefDtoCopyWith<$Res> get origin {
  
  return $LocationRefDtoCopyWith<$Res>(_self.origin, (value) {
    return _then(_self.copyWith(origin: value));
  });
}/// Create a copy of CharacterDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationRefDtoCopyWith<$Res> get location {
  
  return $LocationRefDtoCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// @nodoc
mixin _$LocationRefDto {

 String get name;
/// Create a copy of LocationRefDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationRefDtoCopyWith<LocationRefDto> get copyWith => _$LocationRefDtoCopyWithImpl<LocationRefDto>(this as LocationRefDto, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as LocationRefDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocationRefDto&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LocationRefDto;
  return Object.hash(runtimeType,_this.name);
}

@override
String toString() {
  final _this = this as LocationRefDto;
  return 'LocationRefDto(name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $LocationRefDtoCopyWith<$Res>  {
  factory $LocationRefDtoCopyWith(LocationRefDto value, $Res Function(LocationRefDto) _then) = _$LocationRefDtoCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$LocationRefDtoCopyWithImpl<$Res>
    implements $LocationRefDtoCopyWith<$Res> {
  _$LocationRefDtoCopyWithImpl(this._self, this._then);

  final LocationRefDto _self;
  final $Res Function(LocationRefDto) _then;

/// Create a copy of LocationRefDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(LocationRefDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LocationRefDto].
extension LocationRefDtoPatterns on LocationRefDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocationRefDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocationRefDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocationRefDto value)  $default,){
final _that = this;
switch (_that) {
case _LocationRefDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocationRefDto value)?  $default,){
final _that = this;
switch (_that) {
case _LocationRefDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocationRefDto() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _LocationRefDto():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _LocationRefDto() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _LocationRefDto implements LocationRefDto {
  const _LocationRefDto({required this.name});
  factory _LocationRefDto.fromJson(Map<String, dynamic> json) => _$LocationRefDtoFromJson(json);

@override final  String name;

/// Create a copy of LocationRefDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationRefDtoCopyWith<_LocationRefDto> get copyWith => __$LocationRefDtoCopyWithImpl<_LocationRefDto>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocationRefDto&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name);
}

@override
String toString() {
    return 'LocationRefDto(name: $name)';
}


}

/// @nodoc
abstract mixin class _$LocationRefDtoCopyWith<$Res> implements $LocationRefDtoCopyWith<$Res> {
  factory _$LocationRefDtoCopyWith(_LocationRefDto value, $Res Function(_LocationRefDto) _then) = __$LocationRefDtoCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$LocationRefDtoCopyWithImpl<$Res>
    implements _$LocationRefDtoCopyWith<$Res> {
  __$LocationRefDtoCopyWithImpl(this._self, this._then);

  final _LocationRefDto _self;
  final $Res Function(_LocationRefDto) _then;

/// Create a copy of LocationRefDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_LocationRefDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
