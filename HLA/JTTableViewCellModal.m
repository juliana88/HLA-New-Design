/*
 * This file is part of the JTRevealSidebar package.
 * (c) James Tang <mystcolor@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "JTTableViewCellModal.h"

@implementation JTTableViewCellModal
@synthesize title;

- (void)dealloc {
    
}

+ (id)modalWithTitle:(NSString *)title {
    JTTableViewCellModal *modal = [[[self class] alloc] init];
    modal.title = title;
    return modal;
}

@end

@implementation NSString (JTTableViewCellModal)
- (NSString *)title {
    return self;
}
@end


#pragma mark -

@implementation JTTableViewCellModalSimpleType
@synthesize type;
+ (id)modalWithTitle:(NSString *)title type:(NSInteger)type {
    JTTableViewCellModalSimpleType *modal = [[self class] modalWithTitle:title];
    modal.type = type;
    return modal;
}
@end


#pragma mark -

@implementation JTTableViewCellModalLoadingIndicator

+ (id)modal {
    JTTableViewCellModalLoadingIndicator *modal = [[[self class] alloc] init];
    return modal;
}

@end


#pragma mark -

@implementation JTTableViewCellModalCustom
@synthesize info;

- (void)dealloc {
    
    
}

+ (id)modalWithInfo:(NSDictionary *)info {
    JTTableViewCellModalCustom *modal = [[[self class] alloc] init];
    modal.info = info;
    return modal;
}

@end
