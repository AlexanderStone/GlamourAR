//
//  AppColors.h
//  Lucid Dreaming App
//
//  Created by Mahmood1 on 11/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


enum AppButtons{
    kFood,
    kMeal,
    kSnack,
    kCoffee,
    kWine,
    kSleep,
    kBedtime,
    kRiseTime,
    kNoDream,
    kDream,
    kExercise,
    kCardio,
    kStrength,
    kYingYang,
    kScale,
    kWork,
    kWorking,
    kWeb,
    kTaskComplete,
    kCommute,
    kMood,    
    kPositive,
    kNegative,
    kRomance,
    kFriendship,    
    kNumberOfAppEvents
};



enum AppButtonTags{
    kRedButtonImage,
    kPurpleButtonImage,
    kCyanButtonImage,
    kOrangeButtonImage,
    kGreenButtonImage,
    kBlueButtonImage,
    kGrayButtonImage,
    kSilverButtonImage,
    kBlackButtonImage,
    kSliderRedButtonImage,
    kSliderPurpleButtonImage,
    kSliderCyanButtonImage,
    kSliderOrangeButtonImage,
    kSliderGreenButtonImage,
    kSliderBlueButtonImage,
    kSliderGrayButtonImage,
    kSliderSilverButtonImage,
    kSliderBlackButtonImage,
    kSliderSunriseButtonImage,
    kNumberOfAppButtons
};
enum AppArrowTags{
    kRedRoundArrow,
    kOrangeRoundArrow,
    kGreenRoundArrow,
    kBlueRoundArrow,
    kSilverRoundArrow,
    kBlackRoundArrow,
   
    kNumberOfAppArrows
};

enum AppMarkerTags{
    kRedRoundMarker,
    kOrangeRoundMarker,
    kGreenRoundMarker,
    kBlueRoundMarker,
    kCyanRoundMarker,
    kPurpleRoundMarker,
    kSilverRoundMarker,
    kBlackRoundMarker,
    kSunriseRoundMarker,
    kNumberOfAppMarker
};

enum AppLightReminders{
    
    kLightReminderTimeInBed,
    kLightReminderSilver,
    kLightReminderSingularity,
    kLightReminderPureLight,
    kLightReminderBlue,
    kLightReminderOrange,
    kLightReminderSunrise,
    kLightReminderRed,
    kLightReminderSunset,
    kLightReminderSunriseParadox,
    
    //    kLightReminderSunriseParadox,
    kLightReminderRiseTime,
    kLightReminderBlank,
    kNumberOfLightReminders
};
//enum AppLightReminders{
//    kLightReminderTimeInBed,
//    kLightReminderSunrise,
//    kLightReminderSunriseParadox,
//    kLightReminderOrange,
//    kLightReminderBlue,
//    kLightReminderRed,
//    kLightReminderSunset,
//    kLightReminderSilver,
//    kLightReminderPureLight,
//    kLightReminderSingularity,
////    kLightReminderSunriseParadox,
//    kLightReminderRiseTime,
//    kLightReminderBlank,
//    kNumberOfLightReminders
//};
//original
//enum AppLightReminders{
//     kLightReminderTimeInBed,
//    kLightReminderSunrise,
//    //       kLightReminderGreen,
//    
//    kLightReminderSunriseParadox,
//    kLightReminderOrange,
//    kLightReminderBlue,
//    kLightReminderRed,
//    kLightReminderSunset,
//    kLightReminderSilver,
//    kLightReminderPureLight,
//    kLightReminderSingularity,
//   
//    kLightReminderRiseTime,
//    kNumberOfLightReminders
//};


enum PersonalityTypes
{
    kINTJ,
    kINTP,
    kINFP,
    kISFP,
    kISTP,
    kESTP,
    kESFP,
    kENFP,
    kENTP,
    kENTJ,
    kENFJ,
    kESFJ,
    kESTJ,
    kISTJ,
    kISFJ,
    kINFJ,
    kNumberOfPersonalities
};




@interface AppColors : NSObject
+(UIColor*)navBarColor;
+(UIColor*)tableViewBackgroundColor;
+(UIColor*)tableViewCellBackgroundColor;

+(UIColor*)toolBarColor;
+(UIColor*)lightFontColor;
+(UIColor*)darkFontColor;
+(UIColor*)transparentColor;

+(UIImage*)buttonImage:(int)tag;
+(UIImage*)arrowImage:(int)tag;
+(UIImage*)markerImage:(int)tag;

+(UIImage*)getButtonIcon:(int)tag;
+(NSArray*)reminderImagesForAnimation;

+(NSString*)reminderNameForTag:(int)tag;
+(UIImage*)reminderImageWithTag:(int)tag;

+(UIImage*)reminderButtonForTag:(int)tag;
+(UIImage*)reminderDialMarkerForTag:(int)tag;

+(NSString*)artistNameForReminderTag:(int)tag;
+(NSString*)trackNameForReminderTag:(int)tag;
+(NSURL*)urlForTrackWithReminderTag:(int)tag;

+(NSString*)personalityStringForTag:(int)tag;

//day detailed view
+(UIImage*)eventMarkerButtonImageWithTag:(int)eventTypeTag;

+(UIImage*)mainMenuButtonImageWithTag:(int)eventTypeTag;
//for history purposes
+(UIImage*)eventSliderImageWithTag:(int)eventTypeTag;

+(UIImage*)eventIconWithTag:(int)eventTypeTag;

enum BackgroundImages{
    kRadiantImage,
    kReportingImage,
    kDetailImage,
    kNightModeImage,
  kNumberOfBackgroundImages  
};
+(UIImage*)backgroundImageWithTag:(int)tag;
    


@end
