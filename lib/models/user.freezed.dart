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
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get old => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get matchingGender => throw _privateConstructorUsedError;
  List<String> get favoritedRestaurants =>
      throw _privateConstructorUsedError; //id
  List<String> get matchedUsers => throw _privateConstructorUsedError;

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
      {String uid,
      String name,
      String old,
      String comment,
      String gender,
      String matchingGender,
      List<String> favoritedRestaurants,
      List<String> matchedUsers});
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
    Object? uid = null,
    Object? name = null,
    Object? old = null,
    Object? comment = null,
    Object? gender = null,
    Object? matchingGender = null,
    Object? favoritedRestaurants = null,
    Object? matchedUsers = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
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
      favoritedRestaurants: null == favoritedRestaurants
          ? _value.favoritedRestaurants
          : favoritedRestaurants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      matchedUsers: null == matchedUsers
          ? _value.matchedUsers
          : matchedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      {String uid,
      String name,
      String old,
      String comment,
      String gender,
      String matchingGender,
      List<String> favoritedRestaurants,
      List<String> matchedUsers});
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
    Object? uid = null,
    Object? name = null,
    Object? old = null,
    Object? comment = null,
    Object? gender = null,
    Object? matchingGender = null,
    Object? favoritedRestaurants = null,
    Object? matchedUsers = null,
  }) {
    return _then(_$_UserData(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
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
      favoritedRestaurants: null == favoritedRestaurants
          ? _value._favoritedRestaurants
          : favoritedRestaurants // ignore: cast_nullable_to_non_nullable
              as List<String>,
      matchedUsers: null == matchedUsers
          ? _value._matchedUsers
          : matchedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserData with DiagnosticableTreeMixin implements _UserData {
  const _$_UserData(
      {required this.uid,
      required this.name,
      required this.old,
      required this.comment,
      required this.gender,
      required this.matchingGender,
      final List<String> favoritedRestaurants = const [],
      final List<String> matchedUsers = const []})
      : _favoritedRestaurants = favoritedRestaurants,
        _matchedUsers = matchedUsers;

  factory _$_UserData.fromJson(Map<String, dynamic> json) =>
      _$$_UserDataFromJson(json);

  @override
  final String uid;
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
  final List<String> _favoritedRestaurants;
  @override
  @JsonKey()
  List<String> get favoritedRestaurants {
    if (_favoritedRestaurants is EqualUnmodifiableListView)
      return _favoritedRestaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritedRestaurants);
  }

//id
  final List<String> _matchedUsers;
//id
  @override
  @JsonKey()
  List<String> get matchedUsers {
    if (_matchedUsers is EqualUnmodifiableListView) return _matchedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchedUsers);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserData(uid: $uid, name: $name, old: $old, comment: $comment, gender: $gender, matchingGender: $matchingGender, favoritedRestaurants: $favoritedRestaurants, matchedUsers: $matchedUsers)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserData'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('old', old))
      ..add(DiagnosticsProperty('comment', comment))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('matchingGender', matchingGender))
      ..add(DiagnosticsProperty('favoritedRestaurants', favoritedRestaurants))
      ..add(DiagnosticsProperty('matchedUsers', matchedUsers));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserData &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.old, old) || other.old == old) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.matchingGender, matchingGender) ||
                other.matchingGender == matchingGender) &&
            const DeepCollectionEquality()
                .equals(other._favoritedRestaurants, _favoritedRestaurants) &&
            const DeepCollectionEquality()
                .equals(other._matchedUsers, _matchedUsers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      name,
      old,
      comment,
      gender,
      matchingGender,
      const DeepCollectionEquality().hash(_favoritedRestaurants),
      const DeepCollectionEquality().hash(_matchedUsers));

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
      {required final String uid,
      required final String name,
      required final String old,
      required final String comment,
      required final String gender,
      required final String matchingGender,
      final List<String> favoritedRestaurants,
      final List<String> matchedUsers}) = _$_UserData;

  factory _UserData.fromJson(Map<String, dynamic> json) = _$_UserData.fromJson;

  @override
  String get uid;
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
  List<String> get favoritedRestaurants;
  @override //id
  List<String> get matchedUsers;
  @override
  @JsonKey(ignore: true)
  _$$_UserDataCopyWith<_$_UserData> get copyWith =>
      throw _privateConstructorUsedError;
}
