//
//  AppStrings.h
//  Lucid Dreaming App
//
//  Created by Mahmood1 on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppStrings : UIButton


+(NSArray*)produceEnligthment;

+(NSString*)eventNameWithTag:(int)tag;

+(NSString*)sliderLeftNameWithTag:(int)tag;
+(NSString*)sliderRightNameWithTag:(int)tag;

enum BasicInstructions{
    kBasicInstructionAppUse,
    kBasicInstructionRealityCheck,
    kBasicInstructionDreamRecall,
    kBasicInstructionDreamExit,
    kNumberOfBasicInstructions
};

+(NSArray*)basicInstructionsAppUse;
+(NSArray*)basicInstructionsDreamRecall;
+(NSArray*)basicInstructionsDreamExit;
+(NSArray*)basicInstructionsRealityCheck;

+(NSString*)panelDescriptionForInstructionIndex:(int)basicInstructionEnum;

+(NSArray*)panelInstructionsForIndex:(int)basicInstructionEnum;
+(NSString*)panelDescriptionForSingularityInstructionIndex:(int)singularityInstructionEnum;
+(NSArray*)panelInstructionsForSingularityIndex:(int)singularityInstructionEnum;


enum SingularityInstructions{
    kSingularityHelpIntro,
    kSingularityPurpose,
    kSingularityAppUse,
    kSingularityAnalogDial,
    kSingularityDigitalClock,
    kSingularitySun,
    kSingularitySunriseSunset,
    kSingularityBioClockDial,
    kSingularityBlackSilverArrows,
    kSingularityBlackMarker,
    kSingularityReminderMarkers,
    kSingularityControls,
    kSingularityStartPanel,
    kSingularityDreamsPanel,
    kSingularityAudioPanel,
    kSingularityConfigPanel,    
    kSingularityConsole,
    kSingularity,
    kNumberOfSingularityInstructions
};

+(int)eventCountWithTag:(int)tag;
+(int)incrementEventCountWithTag:(int)tag;

//default values
+(NSString*)sliderLeftNameWithTag:(int)tag;
+(NSString*)sliderRightNameWithTag:(int)tag;
+(float)sliderLeftDefaultValueWithTag:(int)tag;
+(float)sliderRightDefaultValueWithTag:(int)tag;

//history mode
+(NSString*)navBarButtonTitleWithHistoryMode:(int)historyMode;

//history demo and help
+(NSString*)eventDemoDescriptionWithTag:(int)tag;
+(int)changeDefaultDurationForEventWithTag:(int)tag duration:(int)durationSeconds;
+(int)defaultDurationForEventWithTag:(int)tag ;
@end
