//
//  ItemTableViewCell.h
//  FLJDemos
//
//  Created by chenlvmao on 16/3/10.
//  Copyright © 2016年 870828. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *noLabel;
@property (weak, nonatomic) IBOutlet UIImageView *stateImage;

@end
