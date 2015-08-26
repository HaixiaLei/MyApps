//
//  AppRequest.h
//  ShuaYiShua
//
//  Created by Sywine on 8/26/15.
//  Copyright (c) 2015 Sywine. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,APIMethod){
    APIMethodNone = 0,
    APIMethodChangePassword,
    APIMethodVersionNumber,
    APIMethodLogin,
    APIMethodHome,
    APIMethodLotteryInfomationList,
    APIMethodLotteryInfomationDetail,
    APIMethodLotteryList,
    APIMethodMenuAndRule,
    APIMethodJiangQi,
    APIMethodKeZhuiHaoJiangQi,
    APIMethodTouZhu,
    APIMethodTouZhuZhuiHao,
    APIMethodPlayInfomation,
    APIMethodHowToSaving,
    APIMethodAnswer,
    APIMethodBalance,
    APIMethodMessageList,
    APIMethodMessageContent,
    APIMethodDeleteMessageContent,
    APIMethodNoticeList,
    APIMethodNoticeContent,
    APIMethodGouCaiChaXun,
    APIMethodZhuiHaoChaXun,
    APIMethodChongTiChaXun,
    APIMethodZiJinMiMaYanZheng,
    APIMethodTiKuangKeYongYinHangKaXinXi,
    APIMethodQueRenTiKuangXinXi,
    APIMethodZuiZhongTiKuangXinXi,
    APIMethodLogout,
};

@interface AppRequest : NSMutableURLRequest

@property (nonatomic, assign)APIMethod method;

@end
