import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'notification_data.g.dart';

abstract class NotificationData
    implements Built<NotificationData, NotificationDataBuilder> {
  NotificationData._();

  factory NotificationData([updates(NotificationDataBuilder b)]) =
  _$NotificationData;

  @BuiltValueField(wireName: 'id')
  int get id;
  @BuiltValueField(wireName: 'signal_id')
  String get signalId;
  @BuiltValueField(wireName: 'symbol')
  String get symbol;
  @BuiltValueField(wireName: 'buyprice')
  String get buyPrice;
  @BuiltValueField(wireName: 'buytarget1')
  String get buyTarget1;
  @BuiltValueField(wireName: 'buytarget2')
  String get buyTarget2;
  @BuiltValueField(wireName: 'buytarget3')
  String get buyTarget3;
  @BuiltValueField(wireName: 'sellprice')
  String get sellPrice;
  @BuiltValueField(wireName: 'selltarget1')
  String get sellTarget1;
  @BuiltValueField(wireName: 'selltarget2')
  String get sellTarget2;
  @BuiltValueField(wireName: 'selltarget3')
  String get sellTarget3;
  @BuiltValueField(wireName: 'stoploss')
  String get stopLoss;
  @BuiltValueField(wireName: 'signal_time')
  String get signalTime;
  String toJson() {
    return json
        .encode(serializers.serializeWith(NotificationData.serializer, this));
  }

  static NotificationData fromDynamic(dynamic json) {
    return serializers.deserializeWith(
        NotificationData.serializer, json);
  }

  static Serializer<NotificationData> get serializer =>
      _$notificationDataSerializer;
}
