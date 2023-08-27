// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  String get name => throw _privateConstructorUsedError;
  String get old => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get matchingGender => throw _privateConstructorUsedError;
  List<Restaurant> get favoriteRestaurantsList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {String name,
      String old,
      String comment,
      String gender,
      String matchingGender,
      List<Restaurant> favoriteRestaurantsList});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? old = null,
    Object? comment = null,
    Object? gender = null,
    Object? matchingGender = null,
    Object? favoriteRestaurantsList = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      old: null == old
          ? _value.old
          : old // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      matchingGender: null == matchingGender
          ? _value.matchingGender
          : matchingGender // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteRestaurantsList: null == favoriteRestaurantsList
          ? _value.favoriteRestaurantsList
          : favoriteRestaurantsList // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$$_UserDataCopyWith(
          _$_UserData value, $Res Function(_$_UserData) then) =
      __$$_UserDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String old,
      String comment,
      String gender,
      String matchingGender,
      List<Restaurant> favoriteRestaurantsList});
}

/// @nodoc
class __$$_UserDataCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$_UserData>
    implements _$$_UserDataCopyWith<$Res> {
  __$$_UserDataCopyWithImpl(
      _$_UserData _value, $Res Function(_$_UserData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? old = null,
    Object? comment = null,
    Object? gender = null,
    Object? matchingGender = null,
    Object? favoriteRestaurantsList = null,
  }) {
    return _then(_$_UserData(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      old: null == old
          ? _value.old
          : old // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      matchingGender: null == matchingGender
          ? _value.matchingGender
          : matchingGender // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteRestaurantsList: null == favoriteRestaurantsList
          ? _value._favoriteRestaurantsList
          : favoriteRestaurantsList // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserData with DiagnosticableTreeMixin implements _UserData {
  const _$_UserData(
      {required this.name,
      required this.old,
      required this.comment,
      required this.gender,
      required this.matchingGender,
      required final List<Restaurant> favoriteRestaurantsList})
      : _favoriteRestaurantsList = favoriteRestaurantsList;

  factory _$_UserData.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataFromJson(json);

  @override
  final String name;
  @override
  final String old;
  @override
  final String comment;
  @override
  final String gender;
  @override
  final String matchingGender;
  final List<Restaurant> _favoriteRestaurantsList;
  @override
  List<Restaurant> get favoriteRestaurantsList {
    if (_favoriteRestaurantsList is EqualUnmodifiableListView)
      return _favoriteRestaurantsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteRestaurantsList);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserData(name: $name, old: $old, comment: $comment, gender: $gender, matchingGender: $matchingGender, favoriteRestaurantsList: $favoriteRestaurantsList)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserData'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('old', old))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('matchingGender', matchingGender))
      ..add(DiagnosticsProperty(
          'favoriteRestaurantsList', favoriteRestaurantsList));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.old, old) || other.old == old) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.matchingGender, matchingGender) ||
                other.matchingGender == matchingGender) &&
            const DeepCollectionEquality().equals(
                other._favoriteRestaurantsList, _favoriteRestaurantsList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      old,
      comment,
      gender,
      matchingGender,
      const DeepCollectionEquality().hash(_favoriteRestaurantsList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      __$$_UserDataCopyWithImpl<_$_UserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDataToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {required final String name,
      required final String old,
      required final String comment,
      required final String gender,
      required final String matchingGender,
      required final List<Restaurant> favoriteRestaurantsList}) = _$_UserData;

  factory _UserData.fromJson(Map<String, dynamic> json) = _$_UserData.fromJson;

  @override
  String get name;
  @override
  String get old;
  @override
  String get comment;
  @override
  String get gender;
  @override
  String get matchingGender;
  @override
  List<Restaurant> get favoriteRestaurantsList;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      throw _privateConstructorUsedError;
}
