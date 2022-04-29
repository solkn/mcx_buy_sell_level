//flutter pub run build_runner build --delete-conflicting-outputs
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'data/profile_data.dart';
import 'data/notification_data.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  ProfileData,
  NotificationData,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
