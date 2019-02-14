//
//  AnalyticsEvent.m
//  DraftControl
//
//  Created by Stephen Lind on 9/30/13.
//  Copyright (c) 2013 Stephen Lind. All rights reserved.
//

#import "AnalyticsEvent.h"

static NSString *const kEventActionKey = @"eventAction";
static NSString *const kEventCategory = @"eventCategory";
static NSString *const kEventLabelKey = @"eventLabel";
static NSString *const kEventValue = @"eventValue";

@implementation AnalyticsEvent

+ (AnalyticsEvent*)analyticsEventWithDictionary:(NSDictionary*)dict {
    AnalyticsEvent *analyticsEvent = AnalyticsEvent.new;
    
    analyticsEvent.action = [dict objectForKey:kEventActionKey];
    analyticsEvent.category = [dict objectForKey:kEventCategory];
    analyticsEvent.value = [dict objectForKey:kEventValue];
    analyticsEvent.label = [dict objectForKey:kEventLabelKey];
    
    return analyticsEvent;
}

- (NSDictionary*)dictionaryRepresentation {
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:
                                   @{
                                     kEventCategory:self.category,
                                     kEventActionKey:self.action,
                                     }];
    if (self.label != nil) {
        result[kEventLabelKey] = self.label;
    }
    if (self.value != nil) {
        result[kEventValue] = self.value;
    };
    return result.copy;
}

@end
