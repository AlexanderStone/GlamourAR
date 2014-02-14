//
//  AppStrings.m
//  Lucid Dreaming App
//
//  Created by Mahmood1 on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppStrings.h"

#import "AppColors.h"


#define kBarMax 10

@implementation AppStrings




+(NSString*)eventNameWithTag:(int)tag
{
    
    NSString* returnValue = nil;
    switch (tag) {
            
        case kFood:
        {
            returnValue=   NSLocalizedString(@"Food", @"");
            break;
        }
        case kMeal:
        {
            returnValue=    NSLocalizedString(@"Meal", @"");
            break;
        }
        case kSnack:
        {
            returnValue=    NSLocalizedString(@"Snack", @"");
            break;
        }
        case kCoffee:
        {
            returnValue=    NSLocalizedString(@"Coffee", @"");
            break;
        }
        case kWine:
        {
            returnValue=    NSLocalizedString(@"Alcohol", @"");
            break;
        }
        case kSleep:
        {
            returnValue=    NSLocalizedString(@"Sleep", @"");
            break;
        }
        case kBedtime:
        {
            returnValue=    NSLocalizedString(@"Bed time", @"");
            break;
        }
        case kRiseTime:
        {
            returnValue=    NSLocalizedString(@"Rise time", @"");
            break;
        }
        case kNoDream:
        {
            returnValue=    NSLocalizedString(@"Insomnia", @"");
            break;
        }
        case kDream:
        {
            returnValue=    NSLocalizedString(@"Dream", @"");
            break;
        }
        case kExercise:
        {
            returnValue=    NSLocalizedString(@"Exercise", @"");
            break;
        }
        case kCardio:
        {
            returnValue=    NSLocalizedString(@"Fitness", @"");
            break;
        }
        case kStrength:
        {
            returnValue=    NSLocalizedString(@"Strength", @"");
            break;
        }
        case kYingYang:
        {
            returnValue=    NSLocalizedString(@"Meditation", @"");
            break;
        }
        case kScale:
        {
            returnValue=    NSLocalizedString(@"Measurement", @"");
            break;
        }
        case kWork:
        {
            returnValue=    NSLocalizedString(@"Work", @"");
            break;
        }
        case kWorking:
        {
            returnValue=    NSLocalizedString(@"Work", @"");
            break;
        }
        case kWeb:
        {
            returnValue=    NSLocalizedString(@"Procrastination", @"");
            break;
        }
        case kTaskComplete:
        {
            returnValue=    NSLocalizedString(@"Task Complete", @"");
            break;
        }
        case kCommute:
        {
            returnValue=    NSLocalizedString(@"Commute", @"");
            break;
        }
        case kMood:
        {
            returnValue=    NSLocalizedString(@"Mood", @"");
            break;
        }   
        case kPositive:
        {
            returnValue=    NSLocalizedString(@"Positive Mood", @"");
            break;
        }
        case kNegative:
        {
            returnValue=    NSLocalizedString(@"Negative Mood", @"");
            break;
        }
        case kRomance:
        {
            returnValue=    NSLocalizedString(@"Good Times", @"");
            break;
        }
        case kFriendship:
        {
            returnValue=    NSLocalizedString(@"Social Event", @"");
            break;
        }   
        case kNumberOfAppEvents:
           
        default:
             returnValue=    NSLocalizedString(@"", @"");
            break;
    }
    return    returnValue;
}

//+(NSString*)eventNameWithTag:(int)tag
//{
//    
//    NSString* returnValue = nil;
//    switch (tag) {
//            
//        case kFood:
//        {
//            break;
//        }
//        case kMeal:
//        {
//            break;
//        }
//        case kSnack:
//        {
//            break;
//        }
//        case kCoffee:
//        {
//            break;
//        }
//        case kWine:
//        {
//            break;
//        }
//        case kSleep:
//        {
//            break;
//        }
//        case kBedtime:
//        {
//            break;
//        }
//        case kRiseTime:
//        {
//            break;
//        }
//        case kNoDream:
//        {
//            break;
//        }
//        case kDream:
//        {
//            break;
//        }
//        case kExercise:
//        {
//            break;
//        }
//        case kCardio:
//        {
//            break;
//        }
//        case kStrength:
//        {
//            break;
//        }
//        case kYingYang:
//        {
//            break;
//        }
//        case kScale:
//        {
//            break;
//        }
//        case kWork:
//        {
//            break;
//        }
//        case kWorking:
//        {
//            break;
//        }
//        case kWeb:
//        {
//            break;
//        }
//        case kTaskComplete:
//        {
//            break;
//        }
//        case kCommute:
//        {
//            break;
//        }
//        case kMood:
//        {
//            break;
//        }   
//        case kPositive:
//        {
//            break;
//        }
//        case kNegative:
//        {
//            break;
//        }
//        case kRomance:
//        {
//            break;
//        }
//        case kFriendship:
//        {
//            break;
//        }   
//        case kNumberOfAppEvents:
//        default:
//            break;
//    }
//    return    returnValue;
//}

+(NSArray*)StringsArrayForSequence:(int)sequenceIndex
{
    
    switch (sequenceIndex) {
        case 0:
            return @"This is a clock";
             return @"You check reality with this";
             return @"When the clock is stable, you are awake";
              return @"When the clock is changing, you are dreaming";
            break;
            
        default:
            break;
    }
    
}

+(NSArray*)produceEnligthment
{
    return [NSArray arrayWithObjects:
            @"Cycle is Repeating",
            @"Don't Panic",
            @"You are Alive",
            @"You are Aware",
            @"Stay Aware",
            @"Think",
            @"Feel",
            @"Experience",
            @"Time",
            @"You Perceive Time",
            @"Time Is",
            @"Time is Ticking",
            @"Time Is",
            @"Time is Ticking",
            @"Time Is",
            @"Time is Ticking",
            @"Universe Is",
            @"Universe is Spinning",
            @"Universe Is",
            @"Universe is Spinning",
            @"Universe Is",
            @"Universe is Spinning",
            @"You Are",
            @"You are Aware",
            @"You Are",
            @"You are Aware",
            @"You Are",
            @"You are Aware",
            @"Don't Panic",
            @"You are Aware",
            @"You are Learning",
            @"You are Expanding",
            @"You are Conscious",
            @"You Are",
            @"You will Understand",  
            @"You Understand",         
            @"You Understood",
            @"Feel",
            @"Universe",
            @"I",
            @"Am",
            @"Aware",
            @"I Move",
            @"I am Aware",
            @"I Move in Time",
            @"I Am Aware",
            @"Motion Is Aware",
            @"Motion in Time is Aware",
            @"Light Is",     
            @"Light is Shining",
            @"Light Is",     
            @"Light is Shining",
            @"Light Is",     
            @"Light is Shining",     
            @"Light Is",     
            @"Light is Aware",
            @"You Are Enlightened",
            @"Don't Panic",
            /*
             @"You and I",
             @"I and You",
             @"Are Aware",
             */
            @"We Are Aware",
            @"Cycle Is",
            @"Are Aware",
            
            nil];
    
}


+(NSArray*)basicInstructionsAppUse
{
   return [NSArray arrayWithObjects:
    NSLocalizedString(@"1. Plug in the power cord", @""),
    NSLocalizedString(@"2. Put the device next to your pillow", @""),
    NSLocalizedString(@"3. Go to bed as usual", @""),
    NSLocalizedString(@"4. Start the app", @""),
    NSLocalizedString(@"5. Tap screen to cancel reminder", @""),
    NSLocalizedString(@"6. Stop the app in the morning", @""),           
           nil];
}

+(NSArray*)basicInstructionsDreamRecall
{
    return [NSArray arrayWithObjects:
            NSLocalizedString(@"1. Perform a reality check upon awakening", @""),
            NSLocalizedString(@"2. Examine your memories for dreams", @""),
            NSLocalizedString(@"3. Use device as light source", @""),
            NSLocalizedString(@"4. Write down the dream on paper", @""),
            NSLocalizedString(@"5. Drink some water", @""),
            NSLocalizedString(@"6. Repeat upon next awakening", @""),
            
            nil];
}

+(NSArray*)basicInstructionsDreamExit
{
    return [NSArray arrayWithObjects:
            NSLocalizedString(@"1. Do not move or open your eyes", @""),
            NSLocalizedString(@"2. Recall your intent to reenter a dream", @""),
            NSLocalizedString(@"3. Visualize your last dream memory", @""),
            NSLocalizedString(@"4. Keep the scene in mind for 2 minutes", @""),
            NSLocalizedString(@"5. Move your fingers in the dream", @""),
            NSLocalizedString(@"6. Perform a reality check", @""),
            
            nil];
}

+(NSArray*)basicInstructionsRealityCheck
{
    return [NSArray arrayWithObjects:
            NSLocalizedString(@"1. Look at the clock above", @""),
            NSLocalizedString(@"2. Does the time sequence make sense?", @""),
            NSLocalizedString(@"3. Look at the clock again", @""),
            NSLocalizedString(@"4. Compare the results", @""),
            NSLocalizedString(@"5. Repeat once more", @""),
            NSLocalizedString(@"6. Clock irregular or unstable = dream", @""),
            
            nil];
}
+(NSString*)panelDescriptionForInstructionIndex:(int)basicInstructionEnum{
    
    switch (basicInstructionEnum) {
        case kBasicInstructionAppUse:
           return NSLocalizedString(@"Instructions: Beginner App Use", @"");
            break;
        case kBasicInstructionRealityCheck:
           return NSLocalizedString(@"Lucid Dreaming Basics: Reality Check", @"");
            break;
        case kBasicInstructionDreamRecall:
           return NSLocalizedString(@"Lucid Dreaming Basics: Dream Recall", @"");
            break;
        case kBasicInstructionDreamExit:
           return  NSLocalizedString(@"Dream Re-Entry after dream awakening", @"");
            break;
            
        default:
            return @"";
            break;
    }
    
}
+(NSArray*)panelInstructionsForIndex:(int)basicInstructionEnum
{
    switch (basicInstructionEnum) {
        case kBasicInstructionAppUse:
           return  [AppStrings basicInstructionsAppUse];
            break;
        case kBasicInstructionRealityCheck:
            return  [AppStrings basicInstructionsRealityCheck];            break;
        case kBasicInstructionDreamRecall:
            return  [AppStrings basicInstructionsDreamRecall];
            break;
        case kBasicInstructionDreamExit:
            return  [AppStrings basicInstructionsDreamExit];
            break;
            
        default:
             return  nil;
            break;
    }
}




+(NSArray*)panelInstructionsForSingularityIndex:(int)singularityInstructionEnum
{
    switch (singularityInstructionEnum) {
        case kSingularityHelpIntro:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. Tap the ? button to dismiss help", @""),
                    NSLocalizedString(@"2. Swipe right for next slide", @""),
                    NSLocalizedString(@"3. Each interface component is explained", @""),
                    NSLocalizedString(@"4. Dismiss help to restore interface", @""),
                    NSLocalizedString(@"5. Read full help on the help tab", @""),
                    NSLocalizedString(@"6. www.LucidDreamingApp.com", @""),
                    nil];
            break;
        case kSingularityPurpose:
            return [NSArray arrayWithObjects:
                             NSLocalizedString(@"1. This app helps you dream consciously", @""),
                             NSLocalizedString(@"2. The interface is hypnotic", @""),
                             NSLocalizedString(@"3. Lucid Dreaming is not debated", @""),
                             NSLocalizedString(@"4. Lucid Dreaming is not rationalized", @""),
                             NSLocalizedString(@"5. Lucid Dreaming is understood by you", @""),
                             NSLocalizedString(@"6. Lucid Dreaming is done by you", @""),
                             nil];
            break;
        case kSingularityAppUse:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. Plug in the power cord", @""),
                    NSLocalizedString(@"2. Put the device next to your pillow", @""),
                    NSLocalizedString(@"3. Align black marker with bedtime", @""),
                    NSLocalizedString(@"4. Start the app, go to sleep", @""),
                    NSLocalizedString(@"5. Double tap screen to cancel reminder", @""),
                    NSLocalizedString(@"6. Stop the app in the morning", @""),           
                    nil];
            break;
            
        case kSingularityAnalogDial:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. 0 is Midnight", @""),
                    NSLocalizedString(@"2. 12 is Noon", @""),
                    NSLocalizedString(@"3. Each tick is 30 minutes", @""),
                    NSLocalizedString(@"4. All markers use this dial", @""),
                    NSLocalizedString(@"5. All arrows use this dial", @""),
                    NSLocalizedString(@"6. Use the dial to estimate time", @""),
                    nil];
            break;
            
        case kSingularityDigitalClock:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. Digital Clocks are unstable in dreams", @""),
                    NSLocalizedString(@"2. Light switches do not work as expected", @""),
                    NSLocalizedString(@"3. Typed text changes unpredictably", @""),
                    NSLocalizedString(@"4. Trust your state, but verify it", @""),
                    NSLocalizedString(@"5. Check reality upon each awakening", @""),
                    NSLocalizedString(@"6. Check after a \"failed\" induction attempt", @""),
                    nil];
            break;
            
            
        case kSingularitySun:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. The center button is the Sun", @""),
                    NSLocalizedString(@"2. The arrow shows analog time", @""),
                    NSLocalizedString(@"3. The arrow follows sleep cycles", @""),
                    NSLocalizedString(@"4. It shows remaining daylight hours", @""),
                    NSLocalizedString(@"5. Use it to predict sunrise and sunset", @""),
                    NSLocalizedString(@"6. Use it to predict next dream time", @""),
                    nil];
            break;
            case kSingularitySunriseSunset:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. These are local sunrise and sunset times", @""),
                    NSLocalizedString(@"2. Above is day, below is night", @""),
                    NSLocalizedString(@"3. Sunrise and sunset times change", @""),
                    NSLocalizedString(@"4. GPS is required to calculate", @""),
                    NSLocalizedString(@"5. Sunset influences biological clock", @""),
                    NSLocalizedString(@"6. Biological clock controls sleep/wake cycle", @""),
                    nil];
            break;
        case kSingularityBlackSilverArrows:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. Black arrow is last bedtime", @""),
                    NSLocalizedString(@"2. Silver arrow is last rise time", @""),
                    NSLocalizedString(@"3. Shows hours of wakefulness each day", @""),
                    NSLocalizedString(@"4. Shows sleep duration each day", @""),
                    NSLocalizedString(@"5. Helps estimate number of sleep cycles", @""),
                    NSLocalizedString(@"6. Consistent sleep duration is good", @""),
                    nil];
            break;
        case kSingularityBioClockDial:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. Biological clock dial", @""),
                    NSLocalizedString(@"2. Each segment is 90 minutes", @""),
                    NSLocalizedString(@"3. Each segment is a sleep cycle", @""),
                    NSLocalizedString(@"4. Dial is aligned with sunset", @""),
                    NSLocalizedString(@"5. White lines indicate light sleep", @""),
                    NSLocalizedString(@"6. See website for more info", @""),
                    nil];
            break;
        case kSingularityBlackMarker:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. Bedtime marker is black", @""),
                    NSLocalizedString(@"2. Rotate the dial and align it with bedtime", @""),
                    NSLocalizedString(@"3. This helps predict dream times", @""),
                    NSLocalizedString(@"4. This helps pick wake up time", @""),
                    NSLocalizedString(@"5. Consistent bedtime = dreaming at known times", @""),
                    NSLocalizedString(@"6. Consistent dreaming = easier recall", @""),
                    nil];
            break;
        case kSingularityReminderMarkers:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. Each marker is a reminder", @""),
                    NSLocalizedString(@"2. It is played during dreaming", @""),
                    NSLocalizedString(@"3. CUSTOM mode uses 3 reminders", @""),
                    NSLocalizedString(@"4. Gentle and DEILD mode use 1st", @""),
                    NSLocalizedString(@"5. Experiment with colors and intensity", @""),
                    NSLocalizedString(@"6. Tap a marker to select it", @""),
                    nil];
            break;
        case kSingularityControls:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. Each switch shows a panel", @""),
                    NSLocalizedString(@"2. Left: dream reporting panel (mark dreams)", @""),
                    NSLocalizedString(@"3. Left Inner: reminder config panel", @""),
                    NSLocalizedString(@"4. Right Inner: start panel(enables app start)", @""),
                    NSLocalizedString(@"5. Right: audio panel (test reminders)", @""),
                    NSLocalizedString(@"6. Try them. ", @""),
                    nil];
            break;
        case kSingularityStartPanel:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. Bottom inner switch brings up the Start Panel", @""),
                    NSLocalizedString(@"2. Start Panel activates Start/Restart button", @""),
                    NSLocalizedString(@"3. Switch LED is orange when off", @""),
                    NSLocalizedString(@"4. Switch LED is green when running", @""),
                    NSLocalizedString(@"5. This prevents accidental restarts", @""),
                    NSLocalizedString(@"6. Try the switch", @""),
                    nil];
            break;
        case kSingularityDreamsPanel:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. Dream Panel creates dream journal entries", @""),
                    NSLocalizedString(@"2. Use it to report dreams upon awakening", @""),
                    NSLocalizedString(@"3. Precise time of the event is recorded", @""),
                    NSLocalizedString(@"4. Dreams are displayed on the History tab", @""),
                    NSLocalizedString(@"5. Write dreams on paper after awakening", @""),
                    NSLocalizedString(@"6. Edit dream journal entries later", @""),
                    nil];
            break;
        case kSingularityAudioPanel:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. Select a reminder marker", @""),
                    NSLocalizedString(@"2. Open the audio panel", @""),
                    NSLocalizedString(@"3. Play reminder to test", @""),
                    NSLocalizedString(@"4. Double tap to stop", @""),
                    NSLocalizedString(@"5. You can mute the app", @""),
                    NSLocalizedString(@"6. Swipe gestures show/hide side panels", @""),
                    nil];
            break;
        case kSingularityConfigPanel:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. Select a reminder marker to program", @""),
                    NSLocalizedString(@"2. You can program light, vibration and sound", @""),
                    NSLocalizedString(@"3. Turn on/off with center connector", @""),
                    NSLocalizedString(@"4. Connectors are red for off (tap them)", @""),
                    NSLocalizedString(@"5. Connectors are green for on (tap them)", @""),
                    NSLocalizedString(@"6. Round buttons select audio,light, etc", @""),
                   
                    nil];
            break;
        case kSingularityConsole:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"1. Scroll down to see console", @""),
                    NSLocalizedString(@"2. Console displays status messages", @""),
                    NSLocalizedString(@"3. All messages are logged", @""),
                    NSLocalizedString(@"4. ", @""),
                    NSLocalizedString(@"5. ", @""),
                    NSLocalizedString(@"6. ", @""),
                    nil];
            break;
            
        case kSingularity:
            return [NSArray arrayWithObjects:
                    NSLocalizedString(@"", @""),
                    NSLocalizedString(@"", @""),
                    NSLocalizedString(@"", @""),
                    NSLocalizedString(@"", @""),
                    NSLocalizedString(@"", @""),
                    NSLocalizedString(@"", @""),
                    nil];

            
            break;
        
        default:
            return  nil;
            break;
    }
}

+(NSString*)panelDescriptionForSingularityInstructionIndex:(int)singularityInstructionEnum
{
    switch (singularityInstructionEnum) {
        case kSingularityHelpIntro:
            return   NSLocalizedString(@"How to use Help", @"");
            break;
            
        case kSingularityPurpose:
            return   NSLocalizedString(@"App Purpose", @"");
            break;
            
        case kSingularityAppUse:
             return   NSLocalizedString(@"Device setup", @"");
            break;
            
        case kSingularityAnalogDial:
            return   NSLocalizedString(@"Analog Dial", @"");
            break;
        case kSingularityDigitalClock:
            return   NSLocalizedString(@"Reality Check", @"");
            break;

            break;
        case kSingularitySun:
            return   NSLocalizedString(@"Solar Arrow", @"");
            break;
        case kSingularitySunriseSunset:
             return   NSLocalizedString(@"Sunrise and Sunset", @"");
            break;
        case kSingularityBlackSilverArrows:
            return   NSLocalizedString(@"Bed and Wake Time", @"");            break;
        case kSingularityBioClockDial:
            //fix this
             return   NSLocalizedString(@"Biological Clock", @"");            break;
        case kSingularityBlackMarker:
            
             return   NSLocalizedString(@"Bedtime Marker", @"");
            break;
        case kSingularityReminderMarkers:
            return   NSLocalizedString(@"Reminder Markers", @"");;
            break;
        case kSingularityControls:
            return   NSLocalizedString(@"Control Switches", @"");;
            break;
        case kSingularityStartPanel:
            return   NSLocalizedString(@"Start Panel", @"");            break;
        case kSingularityDreamsPanel:
             return   NSLocalizedString(@"Dreams Panel", @"");
            break;
        case kSingularityAudioPanel:
             return   NSLocalizedString(@"Audio Panel", @"");            break;
        case kSingularityConfigPanel:
            return   NSLocalizedString(@"Config Panel", @"");
            break;
        case kSingularityConsole:
             return   NSLocalizedString(@"Console", @"");
            break;
            
            
        case kSingularity:
            return   NSLocalizedString(@"Singularity", @"");
            break;
            
        default:
            break;
    }
    
    
    
}


+(int)eventCountWithTag:(int)tag
{
    
   int returnValue = 0;
   NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
                                   
      switch (tag) {
            
        case kFood:
        {
            returnValue = [userDefaults  integerForKey:@"kFood"];
            break;
        }
        case kMeal:
        {
            returnValue = [userDefaults  integerForKey:@"kMeal"];
            break;
        }
        case kSnack:
        {
             returnValue = [userDefaults  integerForKey:@"kSnack"];
            break;
        }
        case kCoffee:
        {
             returnValue = [userDefaults  integerForKey:@"kCoffee"];
            break;
        }
        case kWine:
        {
             returnValue = [userDefaults  integerForKey:@"kWine"];
            break;
        }
        case kSleep:
        {
             returnValue = [userDefaults  integerForKey:@"kSleep"];
            break;
        }
        case kBedtime:
        {
             returnValue = [userDefaults  integerForKey:@"kBedtime"];
            break;
        }
        case kRiseTime:
        {
             returnValue = [userDefaults  integerForKey:@"kRiseTime"];
            break;
        }
        case kNoDream:
        {
             returnValue = [userDefaults  integerForKey:@"kNoDream"];
            break;
        }
        case kDream:
        {
             returnValue = [userDefaults  integerForKey:@"kDream"];
            break;
        }
        case kExercise:
        {
             returnValue = [userDefaults  integerForKey:@"kExercise"];
            break;
        }
        case kCardio:
        {
             returnValue = [userDefaults  integerForKey:@"kCardio"];
            break;
        }
        case kStrength:
        {
             returnValue = [userDefaults  integerForKey:@"kStrength"];
            break;
        }
        case kYingYang:
        {
             returnValue = [userDefaults  integerForKey:@"kYingYang"];
            break;
        }
        case kScale:
        {
             returnValue = [userDefaults  integerForKey:@"kScale"];
            break;
        }
        case kWork:
        {
             returnValue = [userDefaults  integerForKey:@"kWork"];
            break;
        }
        case kWorking:
        {
             returnValue = [userDefaults  integerForKey:@"kWorking"];
            break;
        }
        case kWeb:
        {
             returnValue = [userDefaults  integerForKey:@"kWeb"];
            break;
        }
        case kTaskComplete:
        {
             returnValue = [userDefaults  integerForKey:@"kTaskComplete"];
            break;
        }
        case kCommute:
        {
             returnValue = [userDefaults  integerForKey:@"kCommute"];
            break;
        }
        case kMood:
        {
             returnValue = [userDefaults  integerForKey:@"kMood"];
            break;
        }   
        case kPositive:
        {
             returnValue = [userDefaults  integerForKey:@"kPositive"];
            break;
        }
        case kNegative:
        {
             returnValue = [userDefaults  integerForKey:@"kNegative"];
            break;
        }
        case kRomance:
        {
             returnValue = [userDefaults  integerForKey:@"kRomance"];
            break;
        }
        case kFriendship:
        {
             returnValue = [userDefaults  integerForKey:@"kFriendship"];
            break;
        }   
        case kNumberOfAppEvents:
        default:
            break;
    }
    return    returnValue;
}


+(int)incrementEventCountWithTag:(int)tag
{
    
    int returnValue = 0;
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    switch (tag) {
            
        case kFood:
        {
            returnValue = [userDefaults  integerForKey:@"kFood"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kFood"];
            break;
        }
        case kMeal:
        {
            returnValue = [userDefaults  integerForKey:@"kMeal"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kMeal"];
            break;
        }
        case kSnack:
        {
            returnValue = [userDefaults  integerForKey:@"kSnack"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kSnack"];
            break;
        }
        case kCoffee:
        {
            returnValue = [userDefaults  integerForKey:@"kCoffee"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kCoffee"];
            break;
        }
        case kWine:
        {
            returnValue = [userDefaults  integerForKey:@"kWine"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kWine"];
            break;
        }
        case kSleep:
        {
            returnValue = [userDefaults  integerForKey:@"kSleep"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kSleep"];
            break;
        }
        case kBedtime:
        {
            returnValue = [userDefaults  integerForKey:@"kBedtime"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kBedtime"];            break;
        }
        case kRiseTime:
        {
            returnValue = [userDefaults  integerForKey:@"kRiseTime"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kRiseTime"];
            break;
        }
        case kNoDream:
        {
            returnValue = [userDefaults  integerForKey:@"kNoDream"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kNoDream"];
            break;
        }
        case kDream:
        {
            returnValue = [userDefaults  integerForKey:@"kDream"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kDream"];
            break;
        }
        case kExercise:
        {
            returnValue = [userDefaults  integerForKey:@"kExercise"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kExercise"];
            break;
        }
        case kCardio:
        {
            returnValue = [userDefaults  integerForKey:@"kCardio"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kCardio"];
            break;
        }
        case kStrength:
        {
            returnValue = [userDefaults  integerForKey:@"kStrength"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kStrength"];
            break;
        }
        case kYingYang:
        {
            returnValue = [userDefaults  integerForKey:@"kYingYang"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kYingYang"];
            break;
        }
        case kScale:
        {
            returnValue = [userDefaults  integerForKey:@"kScale"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kScale"];
            break;
        }
        case kWork:
        {
            returnValue = [userDefaults  integerForKey:@"kWork"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kWork"];
            break;
        }
        case kWorking:
        {
            returnValue = [userDefaults  integerForKey:@"kWorking"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kWorking"];
            break;
        }
        case kWeb:
        {
            returnValue = [userDefaults  integerForKey:@"kWeb"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kWeb"];
            break;
        }
        case kTaskComplete:
        {
            returnValue = [userDefaults  integerForKey:@"kTaskComplete"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kTaskComplete"];
            break;
        }
        case kCommute:
        {
            returnValue = [userDefaults  integerForKey:@"kCommute"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kCommute"];
            break;
        }
        case kMood:
        {
            returnValue = [userDefaults  integerForKey:@"kMood"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kMood"];
            break;
        }   
        case kPositive:
        {
            returnValue = [userDefaults  integerForKey:@"kPositive"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kPositive"];
            break;
        }
        case kNegative:
        {
            returnValue = [userDefaults  integerForKey:@"kNegative"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kNegative"];
            break;
        }
        case kRomance:
        {
            returnValue = [userDefaults  integerForKey:@"kRomance"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kRomance"];
            break;
        }
        case kFriendship:
        {
            returnValue = [userDefaults  integerForKey:@"kFriendship"];
            returnValue = returnValue+1;
            [userDefaults setInteger:returnValue forKey:@"kFriendship"];
            break;
        }   
        case kNumberOfAppEvents:
        default:
            break;
    }
    return    returnValue;
}

+(int)changeDefaultDurationForEventWithTag:(int)tag duration:(int)durationSeconds

{
    
    int returnValue = 0;
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    switch (tag) {
            
        case kFood:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kFoodDuration"];
            break;
        }
        case kMeal:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kMealDuration"];
            break;
        }
        case kSnack:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kSnackDuration"];
            break;
        }
        case kCoffee:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kCoffeeDuration"];
            break;
        }
        case kWine:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kWineDuration"];
            break;
        }
        case kSleep:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kSleepDuration"];
            break;
        }
        case kBedtime:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kBedtimeDuration"];            break;
        }
        case kRiseTime:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kRiseTimeDuration"];
            break;
        }
        case kNoDream:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kNoDreamDuration"];
            break;
        }
        case kDream:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kDreamDuration"];
            break;
        }
        case kExercise:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kExerciseDuration"];
            break;
        }
        case kCardio:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kCardioDuration"];
            break;
        }
        case kStrength:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kStrengthDuration"];
            break;
        }
        case kYingYang:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kYingYangDuration"];
            break;
        }
        case kScale:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kScaleDuration"];
            break;
        }
        case kWork:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kWorkDuration"];
            break;
        }
        case kWorking:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kWorkingDuration"];
            break;
        }
        case kWeb:
        {

            [userDefaults setInteger:returnValue forKey:@"kWebDuration"];
            break;
        }
        case kTaskComplete:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kTaskCompleteDuration"];
            break;
        }
        case kCommute:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kCommuteDuration"];
            break;
        }
        case kMood:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kMoodDuration"];
            break;
        }   
        case kPositive:
        {
            [userDefaults setInteger:durationSeconds forKey:@"kPositiveDuration"];
            break;
        }
        case kNegative:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kNegativeDuration"];
            break;
        }
        case kRomance:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kRomanceDuration"];
            break;
        }
        case kFriendship:
        {

            [userDefaults setInteger:durationSeconds forKey:@"kFriendshipDuration"];
            break;
        }   
        case kNumberOfAppEvents:
        default:
            break;
    }
    return    returnValue;
}


+(int)defaultDurationForEventWithTag:(int)tag 

{
    
    int returnValue = 0;
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    switch (tag) {
            
        case kFood:
        {
            
            returnValue = [userDefaults integerForKey:@"kFoodDuration"];
            break;
        }
        case kMeal:
        {
            
            returnValue = [userDefaults integerForKey:@"kMealDuration"];
            break;
        }
        case kSnack:
        {
            
           returnValue = [userDefaults integerForKey:@"kSnackDuration"];
            break;
        }
        case kCoffee:
        {
            
           returnValue = [userDefaults integerForKey:@"kCoffeeDuration"];
            break;
        }
        case kWine:
        {
            
           returnValue = [userDefaults integerForKey:@"kWineDuration"];
            break;
        }
        case kSleep:
        {
            
            returnValue = [userDefaults integerForKey:@"kSleepDuration"];
            break;
        }
        case kBedtime:
        {
            
            returnValue = [userDefaults integerForKey:@"kBedtimeDuration"];            break;
        }
        case kRiseTime:
        {
            
            returnValue = [userDefaults integerForKey:@"kRiseTimeDuration"];
            break;
        }
        case kNoDream:
        {
            
           returnValue = [userDefaults integerForKey:@"kNoDreamDuration"];
            break;
        }
        case kDream:
        {
            
            returnValue = [userDefaults integerForKey:@"kDreamDuration"];
            break;
        }
        case kExercise:
        {
            
            returnValue = [userDefaults integerForKey:@"kExerciseDuration"];
            break;
        }
        case kCardio:
        {
            
           returnValue = [userDefaults integerForKey:@"kCardioDuration"];
            break;
        }
        case kStrength:
        {
            
            returnValue = [userDefaults integerForKey:@"kStrengthDuration"];
            break;
        }
        case kYingYang:
        {
            
           returnValue = [userDefaults integerForKey:@"kYingYangDuration"];
            break;
        }
        case kScale:
        {
            
            returnValue = [userDefaults integerForKey:@"kScaleDuration"];
            break;
        }
        case kWork:
        {
            
           returnValue = [userDefaults integerForKey:@"kWorkDuration"];
            break;
        }
        case kWorking:
        {
            
            returnValue = [userDefaults integerForKey:@"kWorkingDuration"];
            break;
        }
        case kWeb:
        {
            
            returnValue = [userDefaults integerForKey:@"kWebDuration"];
            break;
        }
        case kTaskComplete:
        {
            
            returnValue = [userDefaults integerForKey:@"kTaskCompleteDuration"];
            break;
        }
        case kCommute:
        {
            
           returnValue = [userDefaults integerForKey:@"kCommuteDuration"];
            break;
        }
        case kMood:
        {
            
           returnValue = [userDefaults integerForKey:@"kMoodDuration"];
            break;
        }   
        case kPositive:
        {
            returnValue = [userDefaults integerForKey:@"kPositiveDuration"];
            break;
        }
        case kNegative:
        {
            
            returnValue = [userDefaults integerForKey:@"kNegativeDuration"];
            break;
        }
        case kRomance:
        {
            
           returnValue = [userDefaults integerForKey:@"kRomanceDuration"];
            break;
        }
        case kFriendship:
        {
            
            returnValue = [userDefaults integerForKey:@"kFriendshipDuration"];
            break;
        }   
        case kNumberOfAppEvents:
        default:
            break;
    }
    return    returnValue;
}



+(NSString*)sliderLeftNameWithTag:(int)tag
{
    
    NSString* returnValue = nil;
    switch (tag) {
            
        case kFood:
        {
            returnValue=   NSLocalizedString(@"Portion Size", @"");
            break;
        }
        case kMeal:
        {
            returnValue=    NSLocalizedString(@"Portion Size", @"");
            break;
        }
        case kSnack:
        {
            returnValue=    NSLocalizedString(@"Portion Size", @"");
            break;
        }
        case kCoffee:
        {
            returnValue=    NSLocalizedString(@"Amount", @"");
            break;
        }
        case kWine:
        {
            returnValue=    NSLocalizedString(@"Amount", @"");
            break;
        }
        case kSleep:
        {
            returnValue=    NSLocalizedString(@"Quality", @"");
            break;
        }
        case kBedtime:
        {
            returnValue=    NSLocalizedString(@"Tiredness", @"");
            break;
        }
        case kRiseTime:
        {
            returnValue=    NSLocalizedString(@"Grogginess", @"");
            break;
        }
        case kNoDream:
        {
            returnValue=    NSLocalizedString(@"Grogginess", @"");
            break;
        }
        case kDream:
        {
            returnValue=    NSLocalizedString(@"Clarity", @"");
            break;
        }
        case kExercise:
        {
            returnValue=    NSLocalizedString(@"Motivation In", @"");
            break;
        }
        case kCardio:
        {
            returnValue=    NSLocalizedString(@"Motivation In", @"");
            break;
        }
        case kStrength:
        {
            returnValue=    NSLocalizedString(@"Intensity", @"");
            break;
        }
        case kYingYang:
        {
            returnValue=    NSLocalizedString(@"Clarity", @"");
            break;
        }
        case kScale:
        {
            returnValue=    NSLocalizedString(@"Wellness", @"");
            break;
        }
        case kWork:
        {
            returnValue=    NSLocalizedString(@"Attitude", @"");
            break;
        }
        case kWorking:
        {
            returnValue=    NSLocalizedString(@"Attitude", @"");
            break;
        }
        case kWeb:
        {
            returnValue=    NSLocalizedString(@"Procrastination", @"");
            break;
        }
        case kTaskComplete:
        {
            returnValue=    NSLocalizedString(@"Accomplishment", @"");
            break;
        }
        case kCommute:
        {
            returnValue=    NSLocalizedString(@"Traffic", @"");
            break;
        }
        case kMood:
        {
            returnValue=    NSLocalizedString(@"Intensity", @"");
            break;
        }   
        case kPositive:
        {
            returnValue=    NSLocalizedString(@"Intensity", @"");
            break;
        }
        case kNegative:
        {
            returnValue=    NSLocalizedString(@"Intensity", @"");
            break;
        }
        case kRomance:
        {
            returnValue=    NSLocalizedString(@"Feeling", @"");
            break;
        }
        case kFriendship:
        {
            returnValue=    NSLocalizedString(@"Openness", @"");
            break;
        }   
        case kNumberOfAppEvents:
            
        default:
            returnValue=    NSLocalizedString(@"", @"");
            break;
    }
    return    returnValue;
}
+(NSString*)sliderRightNameWithTag:(int)tag{
    
    NSString* returnValue = nil;
    switch (tag) {
            
        case kFood:
        {
            returnValue=   NSLocalizedString(@"Taste", @"");
            break;
        }
        case kMeal:
        {
            returnValue=    NSLocalizedString(@"Taste", @"");
            break;
        }
        case kSnack:
        {
            returnValue=    NSLocalizedString(@"Sugar", @"");
            break;
        }
        case kCoffee:
        {
            returnValue=    NSLocalizedString(@"Energy", @"");
            break;
        }
        case kWine:
        {
            returnValue=    NSLocalizedString(@"Intoxication", @"");
            break;
        }
        case kSleep:
        {
            returnValue=    NSLocalizedString(@"Depth", @"");
            break;
        }
        case kBedtime:
        {
            returnValue=    NSLocalizedString(@"Anxiety", @"");
            break;
        }
        case kRiseTime:
        {
            returnValue=    NSLocalizedString(@"Resfulness", @"");
            break;
        }
        case kNoDream:
        {
            returnValue=    NSLocalizedString(@"Wakefulness", @"");
            break;
        }
        case kDream:
        {
            returnValue=    NSLocalizedString(@"Control", @"");
            break;
        }
        case kExercise:
        {
            returnValue=    NSLocalizedString(@"Motivation Out", @"");
            break;
        }
        case kCardio:
        {
            returnValue=    NSLocalizedString(@"Motivation Out", @"");
            break;
        }
        case kStrength:
        {
            returnValue=    NSLocalizedString(@"Satisfaction", @"");
            break;
        }
        case kYingYang:
        {
            returnValue=    NSLocalizedString(@"Depth", @"");
            break;
        }
        case kScale:
        {
            returnValue=    NSLocalizedString(@"Optimism", @"");
            break;
        }
        case kWork:
        {
            returnValue=    NSLocalizedString(@"Stress", @"");
            break;
        }
        case kWorking:
        {
            returnValue=    NSLocalizedString(@"Stress", @"");
            break;
        }
        case kWeb:
        {
            returnValue=    NSLocalizedString(@"Depth", @"");
            break;
        }
        case kTaskComplete:
        {
            returnValue=    NSLocalizedString(@"Difficulty", @"");
            break;
        }
        case kCommute:
        {
            returnValue=    NSLocalizedString(@"Stress", @"");
            break;
        }
        case kMood:
        {
            returnValue=    NSLocalizedString(@"Outlook", @"");
            break;
        }   
        case kPositive:
        {
            returnValue=    NSLocalizedString(@"Outlook", @"");
            break;
        }
        case kNegative:
        {
            returnValue=    NSLocalizedString(@"Outlook", @"");
            break;
        }
        case kRomance:
        {
            returnValue=    NSLocalizedString(@"Emotion", @"");
            break;
        }
        case kFriendship:
        {
            returnValue=    NSLocalizedString(@"Size", @"");
            break;
        }   
        case kNumberOfAppEvents:
            
        default:
            returnValue=    NSLocalizedString(@"", @"");
            break;
    }
    return    returnValue;
}

+(float)sliderLeftDefaultValueWithTag:(int)tag
{
    
    float returnValue = 0.5;
    switch (tag) {
            
        case kFood:
        {
           
            break;
        }
        case kMeal:
        {
           
            break;
        }
        case kSnack:
        {
            returnValue=    0.25;
            break;
        }
        case kCoffee:
        {
            returnValue=    0.25;
            break;
        }
        case kWine:
        {
           returnValue=    0.25;
            break;
        }
        case kSleep:
        {
           returnValue=    0.33;
            break;
        }
        case kBedtime:
        {
            returnValue=    0.33;
            break;
        }
        case kRiseTime:
        {
            returnValue=    0.25;
            break;
        }
        case kNoDream:
        {
           
            break;
        }
        case kDream:
        {
            
            break;
        }
        case kExercise:
        {
          
            break;
        }
        case kCardio:
        {
           
            break;
        }
        case kStrength:
        {
           
            break;
        }
        case kYingYang:
        {
            returnValue=  0.33;
            break;
        }
        case kScale:
        {
           
            break;
        }
        case kWork:
        {
           
            break;
        }
        case kWorking:
        {
           
            break;
        }
        case kWeb:
        {
            
            break;
        }
        case kTaskComplete:
        {
           
            break;
        }
        case kCommute:
        {
            
            break;
        }
        case kMood:
        {
            
            break;
        }   
        case kPositive:
        {
            
            break;
        }
        case kNegative:
        {
           
            break;
        }
        case kRomance:
        {
            
            break;
        }
        case kFriendship:
        {
            
            break;
        }   
        case kNumberOfAppEvents:
            
        default:            
            break;
    }
      return    returnValue*kBarMax;
}

+(float)sliderRightDefaultValueWithTag:(int)tag{
    
    float returnValue = 0.0;
    switch (tag) {
            
        case kFood:
        {
            returnValue=  0.5;
            break;
        }
        case kMeal:
        {
             returnValue=  0.5;
            break;
        }
        case kSnack:
        {
              returnValue=  0.2;
            break;
        }
        case kCoffee:
        {
            
            break;
        }
        case kWine:
        {
             returnValue=  0.2;
            break;
        }
        case kSleep:
        {
             returnValue=  0.5;
            break;
        }
        case kBedtime:
        {
            
            break;
        }
        case kRiseTime:
        {
            returnValue=  0.5;
            break;
        }
        case kNoDream:
        {
            
            break;
        }
        case kDream:
        {
            
            break;
        }
        case kExercise:
        {
            returnValue=  0.5;
            break;
        }
        case kCardio:
        {
             returnValue=  0.5;
            break;
        }
        case kStrength:
        {
            returnValue=  0.5;
            break;
        }
        case kYingYang:
        {
             returnValue=  0.0;
            break;
        }
        case kScale:
        {
            returnValue=  0.5;
            break;
        }
        case kWork:
        {
            
            break;
        }
        case kWorking:
        {
            
            break;
        }
        case kWeb:
        {
            returnValue=  0.5;
            break;
        }
        case kTaskComplete:
        {
            returnValue=  0.5;
            break;
        }
        case kCommute:
        {
             returnValue=  0.5;
            break;
        }
        case kMood:
        {
             returnValue=  0.5;
            break;
        }   
        case kPositive:
        {
            returnValue=  0.7;
            break;
        }
        case kNegative:
        {
             returnValue=  0.2;
            break;
        }
        case kRomance:
        {
            returnValue=  0.5;
            break;
        }
        case kFriendship:
        {
            returnValue=  0.5;
            break;
        }   
        case kNumberOfAppEvents:
            
        default:
           
            break;
    }
    return    returnValue*kBarMax;
}


+(NSString*)eventDemoDescriptionWithTag:(int)tag
{
    
    NSString* returnValue = nil;
    switch (tag) {
            
        case kFood:
        {
            returnValue=   NSLocalizedString(@"This is a sample food entry.\n Here you may describe what you ate and how it tasted. After a while, check how your food choices affect your productivity later in the day. Do they make you lose energy or be super productive?", @"");
            break;
        }
        case kMeal:
        {
            returnValue=    NSLocalizedString(@"This is a sample major meal entry.\n Here you may describe what you ate and how it tasted. After a while, check how your food choices affect your productivity later in the day. Do they make you lose energy or be super productive?", @"");
            break;
        }
        case kSnack:
        {
            returnValue =   NSLocalizedString(@"This is a sample snack entry.\n Here you may describe what you ate why you ate it. Did you snack because snacks are available? Because you are bored? Because you are anxious? Because it is in your diet?  After a while, check how your snacking choices affect your productivity later in the day. Do they make you lose energy or be super productive?", @"");
            break;
        }
        case kCoffee:
        {
            returnValue =    NSLocalizedString(@"This is a sample coffee entry. Why did you drink coffee? Did you feel loss of energy or anticipate needing more energy later? Or is coffee just available and it is your habit? Too much caffeine may make you anxious later in the day and push your bedtime to abnormal hours.", @"");
            break;
        }
        case kWine:
        {
            returnValue=    NSLocalizedString(@"This is a sample Alcohol entry. Are you having a few drinks with friends or are trying to calm yourself down for the night or soothe anxiety? Alcohol suppresses healthy Rapid Eye Movement sleep, causing you to dream less in the first half of the night and more intensely in the second half. Alcohol, combined with insufficient sleep may cause your brain to miss the restful REM sleep entirely, adversely affecting your performance in the upcoming day", @"");
            break;
        }
        case kSleep:
        {
            returnValue=    NSLocalizedString(@"This is a sample sleep entry", @"");
            break;
        }
        case kBedtime:
        {
            returnValue=    NSLocalizedString(@"This is a sample bedtime entry. Mark your bedtimes on a few days to get a feeling of how much your bedtime changes over the course of the week. All cells of your body work with a delicate biological clock to repair and multiply when the sun is out. Too much fluctuation in the bedtime adversely affects your biological clock and confuses your cells.", @"");
            break;
        }
        case kRiseTime:
        {
            returnValue=    NSLocalizedString(@"This is a sample rise time entry. Your body has a certain preferred wake up time, and mark your risetimes over several days will help you get a feeling of when this preferred wake up time is. After a while, you will be able to adjust your sleep length and align your risetime with preferred risetime for maximum sleep qualtiy and efficiency. ", @"");
            break;
        }
        case kNoDream:
        {
            returnValue=    NSLocalizedString(@"This is a sample insomnia entry. Use it to keep track of when you cannot fall asleep or have woken up and cannot fall back asleep", @"");
            break;
        }
        case kDream:
        {
            returnValue=   NSLocalizedString(@"This is a sample dream entry. Dreams are an important gauge of your mental performance and may provide valuable insights into real life problems... or not", @"");
            break;
        }
        case kExercise:
        {
            returnValue=    NSLocalizedString(@"This is a sample excercise entry. Use these to keep track of your workouts and find the optimal time for your workouts", @"");
            break;
        }
        case kCardio:
        {
            returnValue=    NSLocalizedString(@"This is a sample cardio exercise entry. By keeping track of your motivation and the duration of your exerciese, you will be able to find an optimum time during the day when your body is most ready and willing to perform cardio work for extended periods of time", @"");
            break;
        }
        case kStrength:
        {
            returnValue=    NSLocalizedString(@"This is a sample strength workout entry. By keeping track of your motivation and the duration of your exerciese, you will be able to find an optimum time during the day when your body is most capable of doing heavy exercise to build muscle mass", @"");
            break;
        }
        case kYingYang:
        {
            returnValue=    NSLocalizedString(@"This is a sample meditation/reflection entry. By keeping track of the number and depth of such exercises, you will be able to find the best time during the day when you can enjoy deep meditative experiences.", @"");
            break;
        }
        case kScale:
        {
            returnValue=    NSLocalizedString(@"This is a sample measurement entry. Use this to keep track of your weight, body tone or aches and pains. Over time, you will notice how things appear and disappear. By examining your lifestyle in the previous few days, you may be able to find what works and what doesnt work for your body", @"");
            break;
        }
        case kWork:
        {
            returnValue=    NSLocalizedString(@"This is a sample work entry. Use these to keep track of your work performance, motivation and successes", @"");
            break;
        }
        case kWorking:
        {
            returnValue=    NSLocalizedString(@"This is a sample at work entry. Use this to keep track of your motivation, stress and time that it takes you to accomplish tasks. Over several days, you will notice what helps you accomplish tasks and what doesn't", @"");
            break;
        }
        case kWeb:
        {
            returnValue=    NSLocalizedString(@"This is a sample procrastination entry. Use it to keep track of activities that distract or tempt you. Over time you will be able to notice if there's a pattern to your procrastination. Maybe you prefer working at different hours or require a more quiet and less stressful environment to get things done?", @"");
            break;
        }
        case kTaskComplete:
        {
            returnValue=    NSLocalizedString(@"This is a sample task complete/success entry. Use these to keep track of your professional and educational successes. By examining the pattern of activity that lead to this success, you will be able to identify factors that contribute to your performance.", @"");
            break;
        }
        case kCommute:
        {
            returnValue=    NSLocalizedString(@"This is a sample commute entry. Use it to keep track of your commute stress and duration. Maybe arriviting at/leaving work at a certain time of the day/week helps you save time and patience on your commute? ", @"");
            break;
        }
        case kMood:
        {
            returnValue=    NSLocalizedString(@"These are social and mood entries. Use these to keep track of how you are feeling about your life and performance. Negative moods may severely impact your motivation to do the things that you enjoy.", @"");
            break;
        }   
        case kPositive:
        {
            returnValue=    NSLocalizedString(@"This is a sample positive mood entry. Use it to keep track of when and why you are feeling great. Positive moods affect your outlook on the world and make difficult tasks manageable.", @"");
            break;
        }
        case kNegative:
        {
            returnValue=    NSLocalizedString(@"This is a sample negative mood entry. Use it to keep track of when and why you are feeling sad. By anticipating negative moods, you will be more prepared to react and counter them before they sabotage your performance for the day. ", @"");
            break;
        }
        case kRomance:
        {
            returnValue=    NSLocalizedString(@"This is a sample love entry. Use it to keep track of romantic events of things that really lifted your mood for the day. Whether it is a great cliffhanger in a TV series, a witty joke that you heard or doing something really well, record it to keep track of what makes you happy!", @"");
            break;
        }
        case kFriendship:
        {
            returnValue=    NSLocalizedString(@"This is a sample social event entry. Use it to record social interactions that you deem important. Over time, you will notice how your moods and productivity is affected by who you spend your time with and what you do together.", @"");
            break;
        }   
        case kNumberOfAppEvents:
            
        default:
            returnValue=    NSLocalizedString(@"", @"");
            break;
    }
    return    returnValue;
}


@end
