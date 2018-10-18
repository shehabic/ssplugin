#import "SspluginPlugin.h"
#import <ssplugin/ssplugin-Swift.h>

@implementation SspluginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSspluginPlugin registerWithRegistrar:registrar];
}
@end
