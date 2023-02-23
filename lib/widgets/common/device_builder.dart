import 'package:flutter/material.dart';
/// get device platform
import 'dart:io' show Platform;
// get if app is running on the World Wide Web
import 'package:flutter/foundation.dart' show kIsWeb;


/// Builds a page according to users device: 
/// phone: builds [mobile]
/// tablet: builds [tablet]
/// desktop: builds [desktop]
/// web: builds [web]
/// 
/// not all device widget are required, but at least one must be provided. 
/// if device is not supported, an [ErrorWidget] will be built.
class DeviceBuilder extends Builder {
  DeviceBuilder({
    this.mobile,
    this.tablet,
    this.desktop,
    this.web,
  }) : 
  assert(mobile != null || tablet != null || desktop != null || web != null),
  super(
    builder: (context) {
      try {
        if ((Platform.isAndroid || Platform.isIOS) && mobile != null) {
          return mobile;
        } else if ((Platform.isWindows || Platform.isLinux || Platform.isMacOS) 
                  && desktop != null) {
          return desktop;
        }
        throw UnsupportedError('Platform._operatingSystem');
      } on UnsupportedError catch (e) {
        if(e.message == 'Platform._operatingSystem') {
          if (kIsWeb && web != null) {
            return web;
          } else if (tablet != null){
            return tablet;
          } else if (desktop != null && mobile != null) {
            return MediaQuery.of(context).size.width > 600 ? 
              desktop : 
              mobile;
          } 
        }
        rethrow;
      } catch (e) {
        rethrow;
      }
    }
  );

  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? web;
}
