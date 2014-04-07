//
//  AppearancePreferencesViewController.m
//  iTerm
//
//  Created by George Nachman on 4/6/14.
//
//

#import "AppearancePreferencesViewController.h"
#import "PreferencePanel.h"

@implementation AppearancePreferencesViewController {
    // This is actually the tab style. See TAB_STYLE_XXX defines.
    IBOutlet NSPopUpButton *_windowStyle;

    // Tab position within window. See TAB_POSITION_XXX defines.
    IBOutlet NSPopUpButton *_tabPosition;
    
    // Hide tab bar when there is only one session
    IBOutlet NSButton *_hideTab;

    // Highlight tab labels on activity
    IBOutlet NSButton *_highlightTabLabels;

    // Remove tab number from tabs.
    IBOutlet NSButton *_hideTabNumber;
    
    // Remove close button from tabs.
    IBOutlet NSButton *_hideTabCloseButton;

    // Hide activity indicator.
    IBOutlet NSButton *_hideActivityIndicator;

    // Delay before showing tabs in fullscreen mode.
    IBOutlet NSSlider *_fsTabDelay;

    // Show per-pane title bar with split panes.
    IBOutlet NSButton *_showPaneTitles;

    // Hide menu bar in non-lion fullscreen.
    IBOutlet NSButton *_hideMenuBarInFullscreen;

    // Show window number in title bar.
    IBOutlet NSButton *_windowNumber;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void)awakeFromNib {
    PreferenceInfo *info;
    
    info = [self defineControl:_windowStyle
                           key:kPreferenceKeyWindowStyle
                          type:kPreferenceInfoTypePopup];
    info.onChange = ^() { [self postRefreshNotification]; };
    
    info = [self defineControl:_tabPosition
                           key:kPreferenceKeyTabPosition
                          type:kPreferenceInfoTypePopup];
    info.onChange = ^() { [self postRefreshNotification]; };
    
    info = [self defineControl:_hideTab
                           key:kPreferenceKeyHideTabBar
                          type:kPreferenceInfoTypeCheckbox];
    info.onChange = ^() { [self postRefreshNotification]; };
    
    info = [self defineControl:_highlightTabLabels
                           key:kPreferenceKeyHighlightTabLabels
                          type:kPreferenceInfoTypeCheckbox];
    info.onChange = ^() { [self postRefreshNotification]; };
    
    info = [self defineControl:_hideTabNumber
                           key:kPreferenceKeyHideTabNumber
                          type:kPreferenceInfoTypeCheckbox];
    info.onChange = ^() { [self postRefreshNotification]; };
    
    info = [self defineControl:_hideTabCloseButton
                           key:kPreferenceKeyHideTabCloseButton
                          type:kPreferenceInfoTypeCheckbox];
    info.onChange = ^() { [self postRefreshNotification]; };

    info = [self defineControl:_hideActivityIndicator
                           key:kPreferenceKeyHideTabActivityIndicator
                          type:kPreferenceInfoTypeCheckbox];
    info.onChange = ^() { [self postRefreshNotification]; };

    info = [self defineControl:_fsTabDelay
                           key:kPreferenceKeyTimeToHoldCmdToShowTabsInFullScreen
                          type:kPreferenceInfoTypeSlider];

    info = [self defineControl:_showPaneTitles
                           key:kPreferenceKeyShowPaneTitles
                          type:kPreferenceInfoTypeCheckbox];
    info.onChange = ^() { [self postRefreshNotification]; };

    info = [self defineControl:_hideMenuBarInFullscreen
                           key:kPreferenceKeyHideMenuBarInFullscreen
                          type:kPreferenceInfoTypeCheckbox];
    info.onChange = ^() { [self postRefreshNotification]; };

    info = [self defineControl:_windowNumber
                           key:kPreferenceKeyShowWindowNumber
                          type:kPreferenceInfoTypeCheckbox];
    info.onChange = ^() { [self postUpdateLabelsNotification]; };
}

- (void)postUpdateLabelsNotification {
    [[NSNotificationCenter defaultCenter] postNotificationName:kUpdateLabelsNotification
                                                        object:nil
                                                      userInfo:nil];
}

@end