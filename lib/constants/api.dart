import 'package:flutter/foundation.dart';
import '../.env.dart';

const partographServerAPI = !kReleaseMode ? Config.DEV_URL : Config.PROD_URL;
