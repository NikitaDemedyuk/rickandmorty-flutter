// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaginatedResponseDto<T> {

 PageInfoDto get info; List<T> get results;
/// Create a copy of PaginatedResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaginatedResponseDtoCopyWith<T, PaginatedResponseDto<T>> get copyWith => _$PaginatedResponseDtoCopyWithImpl<T, PaginatedResponseDto<T>>(this as PaginatedResponseDto<T>, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PaginatedResponseDto<T>;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaginatedResponseDto<T>&&(identical(other.info, _this.info) || other.info == _this.info)&&const DeepCollectionEquality().equals(other.results, _this.results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PaginatedResponseDto<T>;
  return Object.hash(runtimeType,_this.info,const DeepCollectionEquality().hash(_this.results));
}

@override
String toString() {
  final _this = this as PaginatedResponseDto<T>;
  return 'PaginatedResponseDto<$T>(info: ${_this.info}, results: ${_this.results})';
}


}

/// @nodoc
abstract mixin class $PaginatedResponseDtoCopyWith<T,$Res>  {
  factory $PaginatedResponseDtoCopyWith(PaginatedResponseDto<T> value, $Res Function(PaginatedResponseDto<T>) _then) = _$PaginatedResponseDtoCopyWithImpl;
@useResult
$Res call({
 PageInfoDto info, List<T> results
});


$PageInfoDtoCopyWith<$Res> get info;

}
/// @nodoc
class _$PaginatedResponseDtoCopyWithImpl<T,$Res>
    implements $PaginatedResponseDtoCopyWith<T, $Res> {
  _$PaginatedResponseDtoCopyWithImpl(this._self, this._then);

  final PaginatedResponseDto<T> _self;
  final $Res Function(PaginatedResponseDto<T>) _then;

/// Create a copy of PaginatedResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? info = null,Object? results = null,}) {
  return _then(PaginatedResponseDto(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as PageInfoDto,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}
/// Create a copy of PaginatedResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageInfoDtoCopyWith<$Res> get info {
  
  return $PageInfoDtoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaginatedResponseDto].
extension PaginatedResponseDtoPatterns<T> on PaginatedResponseDto<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaginatedResponseDto<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaginatedResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaginatedResponseDto<T> value)  $default,){
final _that = this;
switch (_that) {
case _PaginatedResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaginatedResponseDto<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PaginatedResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PageInfoDto info,  List<T> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaginatedResponseDto() when $default != null:
return $default(_that.info,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PageInfoDto info,  List<T> results)  $default,) {final _that = this;
switch (_that) {
case _PaginatedResponseDto():
return $default(_that.info,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PageInfoDto info,  List<T> results)?  $default,) {final _that = this;
switch (_that) {
case _PaginatedResponseDto() when $default != null:
return $default(_that.info,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false,genericArgumentFactories: true)

class _PaginatedResponseDto<T> implements PaginatedResponseDto<T> {
  const _PaginatedResponseDto({required this.info, required  List<T> results}): _results = results;
  factory _PaginatedResponseDto.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$PaginatedResponseDtoFromJson(json,fromJsonT);

@override final  PageInfoDto info;
 final  List<T> _results;
@override List<T> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of PaginatedResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaginatedResponseDtoCopyWith<T, _PaginatedResponseDto<T>> get copyWith => __$PaginatedResponseDtoCopyWithImpl<T, _PaginatedResponseDto<T>>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaginatedResponseDto<T>&&(identical(other.info, info) || other.info == info)&&const DeepCollectionEquality().equals(other.results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,info,const DeepCollectionEquality().hash(_results));
}

@override
String toString() {
    return 'PaginatedResponseDto<$T>(info: $info, results: $results)';
}


}

/// @nodoc
abstract mixin class _$PaginatedResponseDtoCopyWith<T,$Res> implements $PaginatedResponseDtoCopyWith<T, $Res> {
  factory _$PaginatedResponseDtoCopyWith(_PaginatedResponseDto<T> value, $Res Function(_PaginatedResponseDto<T>) _then) = __$PaginatedResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 PageInfoDto info, List<T> results
});


@override $PageInfoDtoCopyWith<$Res> get info;

}
/// @nodoc
class __$PaginatedResponseDtoCopyWithImpl<T,$Res>
    implements _$PaginatedResponseDtoCopyWith<T, $Res> {
  __$PaginatedResponseDtoCopyWithImpl(this._self, this._then);

  final _PaginatedResponseDto<T> _self;
  final $Res Function(_PaginatedResponseDto<T>) _then;

/// Create a copy of PaginatedResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? info = null,Object? results = null,}) {
  return _then(_PaginatedResponseDto<T>(
info: null == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as PageInfoDto,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}

/// Create a copy of PaginatedResponseDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageInfoDtoCopyWith<$Res> get info {
  
  return $PageInfoDtoCopyWith<$Res>(_self.info, (value) {
    return _then(_self.copyWith(info: value));
  });
}
}


/// @nodoc
mixin _$PageInfoDto {

 String? get next;
/// Create a copy of PageInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PageInfoDtoCopyWith<PageInfoDto> get copyWith => _$PageInfoDtoCopyWithImpl<PageInfoDto>(this as PageInfoDto, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PageInfoDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PageInfoDto&&(identical(other.next, _this.next) || other.next == _this.next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PageInfoDto;
  return Object.hash(runtimeType,_this.next);
}

@override
String toString() {
  final _this = this as PageInfoDto;
  return 'PageInfoDto(next: ${_this.next})';
}


}

/// @nodoc
abstract mixin class $PageInfoDtoCopyWith<$Res>  {
  factory $PageInfoDtoCopyWith(PageInfoDto value, $Res Function(PageInfoDto) _then) = _$PageInfoDtoCopyWithImpl;
@useResult
$Res call({
 String? next
});




}
/// @nodoc
class _$PageInfoDtoCopyWithImpl<$Res>
    implements $PageInfoDtoCopyWith<$Res> {
  _$PageInfoDtoCopyWithImpl(this._self, this._then);

  final PageInfoDto _self;
  final $Res Function(PageInfoDto) _then;

/// Create a copy of PageInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? next = freezed,}) {
  return _then(PageInfoDto(
next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PageInfoDto].
extension PageInfoDtoPatterns on PageInfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PageInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PageInfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PageInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _PageInfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PageInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _PageInfoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? next)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PageInfoDto() when $default != null:
return $default(_that.next);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? next)  $default,) {final _that = this;
switch (_that) {
case _PageInfoDto():
return $default(_that.next);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? next)?  $default,) {final _that = this;
switch (_that) {
case _PageInfoDto() when $default != null:
return $default(_that.next);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _PageInfoDto implements PageInfoDto {
  const _PageInfoDto({required this.next});
  factory _PageInfoDto.fromJson(Map<String, dynamic> json) => _$PageInfoDtoFromJson(json);

@override final  String? next;

/// Create a copy of PageInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageInfoDtoCopyWith<_PageInfoDto> get copyWith => __$PageInfoDtoCopyWithImpl<_PageInfoDto>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PageInfoDto&&(identical(other.next, next) || other.next == next));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,next);
}

@override
String toString() {
    return 'PageInfoDto(next: $next)';
}


}

/// @nodoc
abstract mixin class _$PageInfoDtoCopyWith<$Res> implements $PageInfoDtoCopyWith<$Res> {
  factory _$PageInfoDtoCopyWith(_PageInfoDto value, $Res Function(_PageInfoDto) _then) = __$PageInfoDtoCopyWithImpl;
@override @useResult
$Res call({
 String? next
});




}
/// @nodoc
class __$PageInfoDtoCopyWithImpl<$Res>
    implements _$PageInfoDtoCopyWith<$Res> {
  __$PageInfoDtoCopyWithImpl(this._self, this._then);

  final _PageInfoDto _self;
  final $Res Function(_PageInfoDto) _then;

/// Create a copy of PageInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? next = freezed,}) {
  return _then(_PageInfoDto(
next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
