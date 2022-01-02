#import "GithubLoginPlugin.h"
#if __has_include(<github_login/github_login-Swift.h>)
#import <github_login/github_login-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "github_login-Swift.h"
#endif

@implementation GithubLoginPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGithubLoginPlugin registerWithRegistrar:registrar];
}
@end
