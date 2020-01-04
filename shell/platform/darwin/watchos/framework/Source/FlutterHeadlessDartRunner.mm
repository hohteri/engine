// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#define FML_USED_ON_EMBEDDER

#import "flutter/shell/platform/darwin/watchos/framework/Source/FlutterEngine_Internal.h"

#import "flutter/shell/platform/darwin/watchos/framework/Headers/FlutterHeadlessDartRunner.h"

#include <memory>

#include "flutter/fml/make_copyable.h"
#include "flutter/fml/message_loop.h"
#include "flutter/shell/common/engine.h"
#include "flutter/shell/common/rasterizer.h"
#include "flutter/shell/common/run_configuration.h"
#include "flutter/shell/common/shell.h"
#include "flutter/shell/common/switches.h"
#include "flutter/shell/common/thread_host.h"
#include "flutter/shell/platform/darwin/common/command_line.h"
#include "flutter/shell/platform/darwin/watchos/framework/Headers/FlutterPlugin.h"
#include "flutter/shell/platform/darwin/watchos/framework/Source/FlutterDartProject_Internal.h"
#include "flutter/shell/platform/darwin/watchos/framework/Source/platform_message_response_darwin.h"
#include "flutter/shell/platform/darwin/watchos/platform_view_ios.h"

@implementation FlutterHeadlessDartRunner {
}

- (instancetype)initWithName:(NSString*)labelPrefix project:(FlutterDartProject*)projectOrNil {
  return [self initWithName:labelPrefix project:projectOrNil allowHeadlessExecution:YES];
}

- (instancetype)initWithName:(NSString*)labelPrefix
                     project:(FlutterDartProject*)projectOrNil
      allowHeadlessExecution:(BOOL)allowHeadlessExecution {
  NSAssert(allowHeadlessExecution == YES,
           @"Cannot initialize a FlutterHeadlessDartRunner without headless execution.");
  return [super initWithName:labelPrefix
                     project:projectOrNil
      allowHeadlessExecution:allowHeadlessExecution];
}
- (instancetype)init {
  return [self initWithName:@"io.flutter.headless" project:nil];
}
@end