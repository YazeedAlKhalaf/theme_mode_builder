import 'package:flutter/foundation.dart';

/// [CustomBaseViewModel] is an extension of [ChangeNotifier].
/// This allows for the ease of adding shared stuff between
/// other `ViewModel`s extending [CustomBaseViewModel].
abstract class CustomBaseViewModel extends ChangeNotifier {}
