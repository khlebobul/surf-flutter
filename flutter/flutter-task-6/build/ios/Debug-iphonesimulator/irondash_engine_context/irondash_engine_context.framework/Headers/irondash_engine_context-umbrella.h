#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "EngineContextPlugin.h"

FOUNDATION_EXPORT double irondash_engine_contextVersionNumber;
FOUNDATION_EXPORT const unsigned char irondash_engine_contextVersionString[];

