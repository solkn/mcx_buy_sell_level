// GENERATED CODE - DO NOT MODIFY BY HAND

part of profile_data;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProfileData> _$profileDataSerializer = new _$ProfileDataSerializer();

class _$ProfileDataSerializer implements StructuredSerializer<ProfileData> {
  @override
  final Iterable<Type> types = const [ProfileData, _$ProfileData];
  @override
  final String wireName = 'ProfileData';

  @override
  Iterable<Object> serialize(Serializers serializers, ProfileData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'mobile_no',
      serializers.serialize(object.phoneNumber,
          specifiedType: const FullType(String)),
      'dayleft',
      serializers.serialize(object.daysLeft,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ProfileData deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'mobile_no':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dayleft':
          result.daysLeft = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ProfileData extends ProfileData {
  @override
  final String name;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final int daysLeft;

  factory _$ProfileData([void Function(ProfileDataBuilder) updates]) =>
      (new ProfileDataBuilder()..update(updates)).build();

  _$ProfileData._({this.name, this.email, this.phoneNumber, this.daysLeft})
      : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('ProfileData', 'name');
    }
    if (email == null) {
      throw new BuiltValueNullFieldError('ProfileData', 'email');
    }
    if (phoneNumber == null) {
      throw new BuiltValueNullFieldError('ProfileData', 'phoneNumber');
    }
    if (daysLeft == null) {
      throw new BuiltValueNullFieldError('ProfileData', 'daysLeft');
    }
  }

  @override
  ProfileData rebuild(void Function(ProfileDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileDataBuilder toBuilder() => new ProfileDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProfileData &&
        name == other.name &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        daysLeft == other.daysLeft;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), email.hashCode), phoneNumber.hashCode),
        daysLeft.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ProfileData')
          ..add('name', name)
          ..add('email', email)
          ..add('phoneNumber', phoneNumber)
          ..add('daysLeft', daysLeft))
        .toString();
  }
}

class ProfileDataBuilder implements Builder<ProfileData, ProfileDataBuilder> {
  _$ProfileData _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  int _daysLeft;
  int get daysLeft => _$this._daysLeft;
  set daysLeft(int daysLeft) => _$this._daysLeft = daysLeft;

  ProfileDataBuilder();

  ProfileDataBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _email = _$v.email;
      _phoneNumber = _$v.phoneNumber;
      _daysLeft = _$v.daysLeft;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProfileData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ProfileData;
  }

  @override
  void update(void Function(ProfileDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ProfileData build() {
    final _$result = _$v ??
        new _$ProfileData._(
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            daysLeft: daysLeft);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
