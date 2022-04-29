library profile_data;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'profile_data.g.dart';

abstract class ProfileData implements Built<ProfileData, ProfileDataBuilder> {
  ProfileData._();

  factory ProfileData([updates(ProfileDataBuilder b)]) = _$ProfileData;

  String get name;
  String get email;
  @BuiltValueField(wireName: 'mobile_no')
  String get phoneNumber;
  @BuiltValueField(wireName: 'dayleft')
  int get daysLeft;

  String toJson() {
    return json.encode(serializers.serializeWith(ProfileData.serializer, this));
  }

  static ProfileData fromJson(String jsonString) {
    return serializers.deserializeWith(
        ProfileData.serializer, json.decode(jsonString));
  }

  static ProfileData fromDynamic(dynamic json) {
    return serializers.deserializeWith(
        ProfileData.serializer, json);
  }

  static Serializer<ProfileData> get serializer => _$profileDataSerializer;
}
