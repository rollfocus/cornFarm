//
//  LLDefine.h
//  shiwulian
//
//  Created by lin zoup on 2/26/16.
//  Copyright © 2016 shiwulian. All rights reserved.
//

#ifndef LLDefine_h
#define LLDefine_h

#import "LLColor.h"

//状态栏
#define LL_Status_Height 20

//导航条
#define LL_Nag_Height 44
#define LL_Nag_Icon_Size 20


//工具栏
#define LL_Tool_Height 48
#define LL_Tool_Icon_Size 30

//屏幕
#define LL_Screen_Bounds [[UIScreen mainScreen] bounds]
#define LL_Screen_Width LL_Screen_Bounds.size.width
#define LL_Screen_Height LL_Screen_Bounds.size.height

//视图
#define LL_Content_Y (LL_Status_Height+LL_Nag_Height)
#define LL_Content_Height (LL_Screen_Height-LL_Status_Height-LL_Nag_Height-LL_Nag_Height)

//缩放比
#define LL_Scale_iPhone6p_414 (LL_Screen_Bounds.size.width/414.0f)
#define LL_Scale_iPhone6_375 (LL_Screen_Bounds.size.width/375.0f)
#define LL_Scale_iPhone5s_320 (LL_Screen_Bounds.size.width/320.0f)

#define LL_Screen_Scale [[UIScreen mainScreen] scale]



// 定义颜色值
#define LL_Green [LLColor greenColor]
#define LL_Green_Bg [LLColor bgGreenColor]
#define LL_White [LLColor whiteColor]
#define LL_Light_White [LLColor lightWhiteColor]
#define LL_Black [LLColor blackColor]
#define LL_Gray [LLColor grayColor]
#define LL_Gray_Tab [LLColor grayTabColor]


#endif /* LLDefine_h */
