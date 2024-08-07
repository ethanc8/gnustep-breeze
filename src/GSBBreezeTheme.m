#import <AppKit/AppKit.h>
#import "GSBBreezeTheme.h"
#import <GSINI/INIReader.h>

@implementation GSBBreezeTheme {
    NSDictionary* kdeglobals;
    NSDictionary* systemColorNameToKDEMap;
    NSDictionary* extraNormalColorNameToKDEMap;
    NSColorList* colorList;
}
- (instancetype) initWithBundle: (NSBundle *)bundle {
    NSLog(@"-[GSBBreezeTheme initWithBundle: %@] begin", bundle);
    [super initWithBundle: bundle];
    NSLog(@"-[GSBBreezeTheme initWithBundle: %@] super initialized", bundle);
    // NSNotificationCenter* center = [NSNotificationCenter defaultCenter];
    // [center addObserver: self
    //            selector: @selector(GSThemeWillActivateNotification_response)
    //                name: GSThemeWillActivateNotification
    //              object: nil];
    systemColorNameToKDEMap = @{
        @"alternateRowBackgroundColor": @{@"category": @"Colors:View", @"key": @"BackgroundAlternate"},
        @"alternateSelectedControlColor": @{@"category": @"Colors:Selection", @"key": @"BackgroundAlternate"},
        @"alternateSelectedControlTextColor": @{@"category": @"Colors:View", @"key": @"ForegroundNormal"},
        @"controlBackgroundColor": @{@"category": @"Colors:View", @"key": @"BackgroundNormal"},
        @"controlColor": @{@"category": @"Colors:View", @"key": @"BackgroundNormal"},
        @"controlDarkShadowColor": @{@"category": @"Colors:View", @"key": @"ForegroundNormal"},
        @"controlHighlightColor": @{@"category": @"Colors:View", @"key": @"DecorationFocus"},
        @"controlLightHighlightColor": @{@"category": @"Colors:View", @"key": @"DecorationFocus"},
        @"controlShadowColor": @{@"category": @"Colors:View", @"key": @"ForegroundNormal"},
        @"controlTextColor": @{@"category": @"Colors:View", @"key": @"ForegroundNormal"},
        @"disabledControlTextColor": @{@"category": @"Colors:View", @"key": @"ForegroundInactive"},
        @"gridColor": @{@"category": @"Colors:View", @"key": @"ForegroundNormal"},
        @"headerColor": @{@"category": @"Colors:Header", @"key": @"BackgroundNormal"},
        @"headerTextColor": @{@"category": @"Colors:Header", @"key": @"ForegroundNormal"},
        @"highlightColor": @{@"category": @"Colors:Selection", @"key": @"BackgroundNormal"},
        @"keyboardFocusIndicatorColor": @{@"category": @"Colors:View", @"key": @"DecorationFocus"},
        @"knobColor": @{@"category": @"Colors:View", @"key": @"BackgroundNormal"},
        @"rowBackgroundColor": @{@"category": @"Colors:View", @"key": @"BackgroundNormal"},
        @"scrollBarColor": @{@"category": @"Colors:View", @"key": @"BackgroundNormal"},
        @"secondarySelectedControlColor": @{@"category": @"Colors:Selection", @"key": @"BackgroundNormal"},
        @"selectedControlColor": @{@"category": @"Colors:Selection", @"key": @"BackgroundNormal"},
        @"selectedControlTextColor": @{@"category": @"Colors:Selection", @"key": @"ForegroundNormal"},
        @"selectedKnobColor": @{@"category": @"Colors:View", @"key": @"BackgroundNormal"},
        @"selectedMenuItemColor": @{@"category": @"Colors:Selection", @"key": @"BackgroundNormal"},
        @"selectedMenuItemTextColor": @{@"category": @"Colors:Selection", @"key": @"ForegroundNormal"},
        @"selectedTextBackgroundColor": @{@"category": @"Colors:Selection", @"key": @"BackgroundNormal"},
        @"selectedTextColor": @{@"category": @"Colors:Selection", @"key": @"ForegroundNormal"},
        @"shadowColor": @{@"category": @"Colors:View", @"key": @"ForegroundNormal"},
        @"textBackgroundColor": @{@"category": @"Colors:View", @"key": @"BackgroundNormal"},
        @"textColor": @{@"category": @"Colors:View", @"key": @"ForegroundNormal"},
        @"toolTipColor": @{@"category": @"Colors:Tooltip", @"key": @"BackgroundNormal"},
        @"toolTipTextColor": @{@"category": @"Colors:Tooltip", @"key": @"ForegroundNormal"},
        @"windowBackgroundColor": @{@"category": @"Colors:Window", @"key": @"BackgroundColor"},
        @"windowFrameColor": @{@"category": @"WM", @"key": @"activeBackground"},
        @"windowFrameTextColor": @{@"category": @"WM", @"key": @"activeForeground"},
    };
    extraNormalColorNameToKDEMap = @{
        @"toolbarBackgroundColor": @{@"category": @"Colors:Header", @"key": @"BackgroundNormal"},
        @"toolbarBorderColor": @{@"category": @"Colors:View", @"key": @"ForegroundNormal"},
        @"menuBackgroundColor": @{@"category": @"Colors:Header", @"key": @"BackgroundNormal"},
        @"menuItemBackgroundColor": @{@"category": @"Colors:Header", @"key": @"BackgroundNormal"},
        @"menuBorderColor": @{@"category": @"Colors:Header", @"key": @"BackgroundNormal"},
        @"menuBarBackgroundColor": @{@"category": @"Colors:Header", @"key": @"BackgroundNormal"},
        @"menuBarBorderColor": @{@"category": @"Colors:Header", @"key": @"BackgroundNormal"},
        @"menuSeparatorColor": @{@"category": @"Colors:Header", @"key": @"BackgroundNormal"},
        @"GSMenuBar": @{@"category": @"Colors:Header", @"key": @"BackgroundNormal"},
        @"GSMenuBarTitle": @{@"category": @"Colors:Header", @"key": @"BackgroundNormal"},
        @"tableHeaderTextColor": @{@"category": @"Colors:View", @"key": @"ForegroundNormal"},
        @"keyWindowFrameTextColor": @{@"category": @"Colors:Header", @"key": @"ForegroundNormal"},
        @"normalWindowFrameTextColor": @{@"category": @"Colors:Header", @"key": @"ForegroundNormal"},
        @"mainWindowFrameTextColor": @{@"category": @"Colors:Header", @"key": @"ForegroundNormal"},
        @"windowBorderColor": @{@"category": @"Colors:Header", @"key": @"ForegroundNormal"},
        @"browserHeaderTextColor": @{@"category": @"Colors:View", @"key": @"ForegroundNormal"},
        @"NSScrollView": @{@"category": @"Colors:View", @"key": @"BackgroundNormal"},
        @"highlightedTableRowBackgroundColor": @{@"category": @"Colors:Selection", @"key": @"BackgroundNormal"},
        @"highlightedTableRowTextColor": @{@"category": @"Colors:Selection", @"key": @"ForegroundNormal"},
    };
    NSLog(@"-[GSBBreezeTheme initWithBundle: %@] variables initialized", bundle);
    NSLog(@"%@", systemColorNameToKDEMap);
    NSDictionary* environment = [[NSProcessInfo processInfo] environment];
    kdeglobals = INIDictionaryForINIAtPath([environment[@"HOME"] stringByAppendingString: @"/.config/kdeglobals"]);
    NSLog(@"-[GSBBreezeTheme initWithBundle: %@] end", bundle);
    return self;
}

- (NSColor*) colorNamed: (NSString*)colorName
                  state: (GSThemeControlState)elementState {
    if(colorName) {
        NSLog(@"colorNamed: %@ state: %u", colorName, elementState);
    }
    // These cause very weird segfaults when I run [systemColorNameToKDEMap objectForKey: colorName]
    if([colorName isEqual: @"menuBorderColor"] || [colorName isEqual: @"menuBackgroundColor"] || [colorName isEqual: @"NSScrollView"] || [colorName isEqual: @"NSMenuItem"] || [colorName isEqual: @"menuItemBackgroundColor"] || [colorName isEqual: @"GSMenuBar"] || [colorName isEqual: @"NSScrollView"] || [colorName isEqual: @"GSScrollerVerticalKnob"]) {
        return [NSColor redColor];
        NSDictionary* colorMapping = extraNormalColorNameToKDEMap[colorName];
        if(!colorMapping) {
            return [super colorNamed: colorName state: elementState];
        }
        NSLog(@"returning color with mapping %@", colorMapping);
        NSString* colorString = kdeglobals[colorMapping[@"category"]][colorMapping[@"key"]];
        NSLog(@"returning color %@", colorString);
        NSArray<NSString*>* colorStringRGB = [colorString componentsSeparatedByString: @","];
        return [NSColor colorWithRed: colorStringRGB[0].doubleValue / 256
                               green: colorStringRGB[1].doubleValue / 256
                                blue: colorStringRGB[2].doubleValue / 256
                               alpha: 1.0];
    }
    if([systemColorNameToKDEMap objectForKey: colorName]) {
        NSDictionary* colorMapping = systemColorNameToKDEMap[colorName];
        NSString* colorString = kdeglobals[colorMapping[@"category"]][colorMapping[@"key"]];
        NSLog(@"returning color %@", colorString);
        NSArray<NSString*>* colorStringRGB = [colorString componentsSeparatedByString: @","];
        return [NSColor colorWithRed: colorStringRGB[0].doubleValue / 256
                               green: colorStringRGB[1].doubleValue / 256
                                blue: colorStringRGB[2].doubleValue / 256
                               alpha: 1.0];
    } else if([extraNormalColorNameToKDEMap objectForKey: colorName]) {
        NSDictionary* colorMapping = extraNormalColorNameToKDEMap[colorName];
        NSString* colorString = kdeglobals[colorMapping[@"category"]][colorMapping[@"key"]];
        NSLog(@"returning color %@", colorString);
        NSArray<NSString*>* colorStringRGB = [colorString componentsSeparatedByString: @","];
        return [NSColor colorWithRed: colorStringRGB[0].doubleValue / 256
                               green: colorStringRGB[1].doubleValue / 256
                                blue: colorStringRGB[2].doubleValue / 256
                               alpha: 1.0];
    }
    return [super colorNamed: colorName state: elementState];
}

- (NSColorList*) colors {
    NSLog(@"-[GSBBreezeTheme colors] called");
    NSLog(@"%@", systemColorNameToKDEMap);
    if(colorList) {
        return colorList;
    }
    colorList = [[NSColorList alloc] initWithName: @"System"];
    
    int i = 0;
    for(NSString* colorName in systemColorNameToKDEMap) {
        [colorList insertColor: [self colorNamed: colorName state: GSThemeNormalState]
                           key: colorName
                       atIndex: i];
        i++;
    }

    return colorList;
}

@end
