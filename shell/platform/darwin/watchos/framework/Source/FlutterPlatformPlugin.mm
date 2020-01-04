// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "flutter/shell/platform/darwin/watchos/framework/Source/FlutterPlatformPlugin.h"
#include "flutter/fml/logging.h"

//#include <AudioToolbox/AudioToolbox.h>
#include <Foundation/Foundation.h>
//#include <UIKit/UIApplication.h>
#include <WatchKit/WatchKit.h>

namespace {

}  // namespaces

namespace flutter {

}  // namespace flutter

using namespace flutter;

@implementation FlutterPlatformPlugin {
  fml::WeakPtr<FlutterEngine> _engine;
}

- (instancetype)init {
  @throw([NSException exceptionWithName:@"FlutterPlatformPlugin must initWithEngine"
                                 reason:nil
                               userInfo:nil]);
}

- (instancetype)initWithEngine:(fml::WeakPtr<FlutterEngine>)engine {
  FML_DCHECK(engine) << "engine must be set";
  self = [super init];

  if (self) {
    _engine = engine;
  }

  return self;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  NSString* method = call.method;
  id args = call.arguments;
  if ([method isEqualToString:@"SystemSound.play"]) {
    [self playSystemSound:args];
    result(nil);
  } else if ([method isEqualToString:@"HapticFeedback.vibrate"]) {
    [self vibrateHapticFeedback:args];
    result(nil);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

- (void)playSystemSound:(NSString*)soundType {
  if ([soundType isEqualToString:@"SystemSoundType.click"]) {
    // All feedback types are specific to Android and are treated as equal on
    // iOS.
      [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeClick];
  }
}

- (void)vibrateHapticFeedback:(NSString*)feedbackType {
  if (!feedbackType) {
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeClick];
    return;
  }
}

@end
