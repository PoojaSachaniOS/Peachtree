// This file is generated and will be overwritten automatically.

#import <Foundation/Foundation.h>

NS_SWIFT_NAME(EventsServerOptions)
__attribute__((visibility ("default")))
@interface MBXEventsServerOptions : NSObject

// This class provides custom init which should be called
- (nonnull instancetype)init NS_UNAVAILABLE;

// This class provides custom init which should be called
+ (nonnull instancetype)new NS_UNAVAILABLE;

- (nonnull instancetype)initWithToken:(nonnull NSString *)token
                    userAgentFragment:(nonnull NSString *)userAgentFragment;

@property (nonatomic, readonly, nonnull, copy) NSString *token;
@property (nonatomic, readonly, nonnull, copy) NSString *userAgentFragment;

- (BOOL)isEqualToEventsServerOptions:(nonnull MBXEventsServerOptions *)other;

@end
