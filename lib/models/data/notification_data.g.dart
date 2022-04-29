// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationData> _$notificationDataSerializer =
    new _$NotificationDataSerializer();

class _$NotificationDataSerializer
    implements StructuredSerializer<NotificationData> {
  @override
  final Iterable<Type> types = const [NotificationData, _$NotificationData];
  @override
  final String wireName = 'NotificationData';

  @override
  Iterable<Object> serialize(Serializers serializers, NotificationData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'signal_id',
      serializers.serialize(object.signalId,
          specifiedType: const FullType(String)),
      'symbol',
      serializers.serialize(object.symbol,
          specifiedType: const FullType(String)),
      'buyprice',
      serializers.serialize(object.buyPrice,
          specifiedType: const FullType(String)),
      'buytarget1',
      serializers.serialize(object.buyTarget1,
          specifiedType: const FullType(String)),
      'buytarget2',
      serializers.serialize(object.buyTarget2,
          specifiedType: const FullType(String)),
      'buytarget3',
      serializers.serialize(object.buyTarget3,
          specifiedType: const FullType(String)),
      'sellprice',
      serializers.serialize(object.sellPrice,
          specifiedType: const FullType(String)),
      'selltarget1',
      serializers.serialize(object.sellTarget1,
          specifiedType: const FullType(String)),
      'selltarget2',
      serializers.serialize(object.sellTarget2,
          specifiedType: const FullType(String)),
      'selltarget3',
      serializers.serialize(object.sellTarget3,
          specifiedType: const FullType(String)),
      'stoploss',
      serializers.serialize(object.stopLoss,
          specifiedType: const FullType(String)),
      'signal_time',
      serializers.serialize(object.signalTime,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NotificationData deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'signal_id':
          result.signalId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'symbol':
          result.symbol = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'buyprice':
          result.buyPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'buytarget1':
          result.buyTarget1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'buytarget2':
          result.buyTarget2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'buytarget3':
          result.buyTarget3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'sellprice':
          result.sellPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'selltarget1':
          result.sellTarget1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'selltarget2':
          result.sellTarget2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'selltarget3':
          result.sellTarget3 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'stoploss':
          result.stopLoss = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'signal_time':
          result.signalTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NotificationData extends NotificationData {
  @override
  final int id;
  @override
  final String signalId;
  @override
  final String symbol;
  @override
  final String buyPrice;
  @override
  final String buyTarget1;
  @override
  final String buyTarget2;
  @override
  final String buyTarget3;
  @override
  final String sellPrice;
  @override
  final String sellTarget1;
  @override
  final String sellTarget2;
  @override
  final String sellTarget3;
  @override
  final String stopLoss;
  @override
  final String signalTime;

  factory _$NotificationData(
          [void Function(NotificationDataBuilder) updates]) =>
      (new NotificationDataBuilder()..update(updates)).build();

  _$NotificationData._(
      {this.id,
      this.signalId,
      this.symbol,
      this.buyPrice,
      this.buyTarget1,
      this.buyTarget2,
      this.buyTarget3,
      this.sellPrice,
      this.sellTarget1,
      this.sellTarget2,
      this.sellTarget3,
      this.stopLoss,
      this.signalTime})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('NotificationData', 'id');
    }
    if (signalId == null) {
      throw new BuiltValueNullFieldError('NotificationData', 'signalId');
    }
    if (symbol == null) {
      throw new BuiltValueNullFieldError('NotificationData', 'symbol');
    }
    if (buyPrice == null) {
      throw new BuiltValueNullFieldError('NotificationData', 'buyPrice');
    }
    if (buyTarget1 == null) {
      throw new BuiltValueNullFieldError('NotificationData', 'buyTarget1');
    }
    if (buyTarget2 == null) {
      throw new BuiltValueNullFieldError('NotificationData', 'buyTarget2');
    }
    if (buyTarget3 == null) {
      throw new BuiltValueNullFieldError('NotificationData', 'buyTarget3');
    }
    if (sellPrice == null) {
      throw new BuiltValueNullFieldError('NotificationData', 'sellPrice');
    }
    if (sellTarget1 == null) {
      throw new BuiltValueNullFieldError('NotificationData', 'sellTarget1');
    }
    if (sellTarget2 == null) {
      throw new BuiltValueNullFieldError('NotificationData', 'sellTarget2');
    }
    if (sellTarget3 == null) {
      throw new BuiltValueNullFieldError('NotificationData', 'sellTarget3');
    }
    if (stopLoss == null) {
      throw new BuiltValueNullFieldError('NotificationData', 'stopLoss');
    }
    if (signalTime == null) {
      throw new BuiltValueNullFieldError('NotificationData', 'signalTime');
    }
  }

  @override
  NotificationData rebuild(void Function(NotificationDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationDataBuilder toBuilder() =>
      new NotificationDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationData &&
        id == other.id &&
        signalId == other.signalId &&
        symbol == other.symbol &&
        buyPrice == other.buyPrice &&
        buyTarget1 == other.buyTarget1 &&
        buyTarget2 == other.buyTarget2 &&
        buyTarget3 == other.buyTarget3 &&
        sellPrice == other.sellPrice &&
        sellTarget1 == other.sellTarget1 &&
        sellTarget2 == other.sellTarget2 &&
        sellTarget3 == other.sellTarget3 &&
        stopLoss == other.stopLoss &&
        signalTime == other.signalTime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, id.hashCode),
                                                    signalId.hashCode),
                                                symbol.hashCode),
                                            buyPrice.hashCode),
                                        buyTarget1.hashCode),
                                    buyTarget2.hashCode),
                                buyTarget3.hashCode),
                            sellPrice.hashCode),
                        sellTarget1.hashCode),
                    sellTarget2.hashCode),
                sellTarget3.hashCode),
            stopLoss.hashCode),
        signalTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NotificationData')
          ..add('id', id)
          ..add('signalId', signalId)
          ..add('symbol', symbol)
          ..add('buyPrice', buyPrice)
          ..add('buyTarget1', buyTarget1)
          ..add('buyTarget2', buyTarget2)
          ..add('buyTarget3', buyTarget3)
          ..add('sellPrice', sellPrice)
          ..add('sellTarget1', sellTarget1)
          ..add('sellTarget2', sellTarget2)
          ..add('sellTarget3', sellTarget3)
          ..add('stopLoss', stopLoss)
          ..add('signalTime', signalTime))
        .toString();
  }
}

class NotificationDataBuilder
    implements Builder<NotificationData, NotificationDataBuilder> {
  _$NotificationData _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _signalId;
  String get signalId => _$this._signalId;
  set signalId(String signalId) => _$this._signalId = signalId;

  String _symbol;
  String get symbol => _$this._symbol;
  set symbol(String symbol) => _$this._symbol = symbol;

  String _buyPrice;
  String get buyPrice => _$this._buyPrice;
  set buyPrice(String buyPrice) => _$this._buyPrice = buyPrice;

  String _buyTarget1;
  String get buyTarget1 => _$this._buyTarget1;
  set buyTarget1(String buyTarget1) => _$this._buyTarget1 = buyTarget1;

  String _buyTarget2;
  String get buyTarget2 => _$this._buyTarget2;
  set buyTarget2(String buyTarget2) => _$this._buyTarget2 = buyTarget2;

  String _buyTarget3;
  String get buyTarget3 => _$this._buyTarget3;
  set buyTarget3(String buyTarget3) => _$this._buyTarget3 = buyTarget3;

  String _sellPrice;
  String get sellPrice => _$this._sellPrice;
  set sellPrice(String sellPrice) => _$this._sellPrice = sellPrice;

  String _sellTarget1;
  String get sellTarget1 => _$this._sellTarget1;
  set sellTarget1(String sellTarget1) => _$this._sellTarget1 = sellTarget1;

  String _sellTarget2;
  String get sellTarget2 => _$this._sellTarget2;
  set sellTarget2(String sellTarget2) => _$this._sellTarget2 = sellTarget2;

  String _sellTarget3;
  String get sellTarget3 => _$this._sellTarget3;
  set sellTarget3(String sellTarget3) => _$this._sellTarget3 = sellTarget3;

  String _stopLoss;
  String get stopLoss => _$this._stopLoss;
  set stopLoss(String stopLoss) => _$this._stopLoss = stopLoss;

  String _signalTime;
  String get signalTime => _$this._signalTime;
  set signalTime(String signalTime) => _$this._signalTime = signalTime;

  NotificationDataBuilder();

  NotificationDataBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _signalId = _$v.signalId;
      _symbol = _$v.symbol;
      _buyPrice = _$v.buyPrice;
      _buyTarget1 = _$v.buyTarget1;
      _buyTarget2 = _$v.buyTarget2;
      _buyTarget3 = _$v.buyTarget3;
      _sellPrice = _$v.sellPrice;
      _sellTarget1 = _$v.sellTarget1;
      _sellTarget2 = _$v.sellTarget2;
      _sellTarget3 = _$v.sellTarget3;
      _stopLoss = _$v.stopLoss;
      _signalTime = _$v.signalTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationData other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NotificationData;
  }

  @override
  void update(void Function(NotificationDataBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NotificationData build() {
    final _$result = _$v ??
        new _$NotificationData._(
            id: id,
            signalId: signalId,
            symbol: symbol,
            buyPrice: buyPrice,
            buyTarget1: buyTarget1,
            buyTarget2: buyTarget2,
            buyTarget3: buyTarget3,
            sellPrice: sellPrice,
            sellTarget1: sellTarget1,
            sellTarget2: sellTarget2,
            sellTarget3: sellTarget3,
            stopLoss: stopLoss,
            signalTime: signalTime);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
