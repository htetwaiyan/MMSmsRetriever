#import "MmsmsretrieverPlugin.h"
#import <mmsmsretriever/mmsmsretriever-Swift.h>

@implementation MmsmsretrieverPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMmsmsretrieverPlugin registerWithRegistrar:registrar];
}
@end
