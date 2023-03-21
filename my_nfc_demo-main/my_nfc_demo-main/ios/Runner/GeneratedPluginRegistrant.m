//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<flutter_nfc_kit/FlutterNfcKitPlugin.h>)
#import <flutter_nfc_kit/FlutterNfcKitPlugin.h>
#else
@import flutter_nfc_kit;
#endif

#if __has_include(<flutter_nfc_reader/FlutterNfcReaderPlugin.h>)
#import <flutter_nfc_reader/FlutterNfcReaderPlugin.h>
#else
@import flutter_nfc_reader;
#endif

#if __has_include(<nfc_manager/NfcManagerPlugin.h>)
#import <nfc_manager/NfcManagerPlugin.h>
#else
@import nfc_manager;
#endif

#if __has_include(<url_launcher_ios/FLTURLLauncherPlugin.h>)
#import <url_launcher_ios/FLTURLLauncherPlugin.h>
#else
@import url_launcher_ios;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlutterNfcKitPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterNfcKitPlugin"]];
  [FlutterNfcReaderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterNfcReaderPlugin"]];
  [NfcManagerPlugin registerWithRegistrar:[registry registrarForPlugin:@"NfcManagerPlugin"]];
  [FLTURLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTURLLauncherPlugin"]];
}

@end
