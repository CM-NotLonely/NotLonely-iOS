//
//  Property.h
//  NotLonely
//
//  Created by tesths on 10/16/15.
//  Copyright (c) 2015 tesths. All rights reserved.
//

#ifndef NotLonely_Property_h
#define NotLonely_Property_h

#define GetWidth frame.size.width
#define GetHeight frame.size.height

#define ScreenHeight                    MAX([[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height)
#define ScreenWidth                     MIN([[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height)
#define Screen35in                      (ScreenHeight==480)
#define Screen40in                      (ScreenHeight==568)
#define Screen47in                      (ScreenHeight==667)
#define Screen55in                      (ScreenHeight==736)
#define iPad                            (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define iPadPro                         ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) && (ScreenHeight==1366))

#endif
