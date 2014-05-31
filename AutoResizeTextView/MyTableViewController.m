//
//  MyTableViewController.m
//  AutoResizeTextView
//
//  Created by bbpan on 5/26/14.
//
//

#import "MyTableViewController.h"
#import "AutoResizeTableViewCell.h"
#import "NSLayoutConstraint+StandardOffsets.h"

static NSString *const CellIdentifier = @"TextViewCell";

@interface MyTableViewController ()
@property (nonatomic, strong) AutoResizeTableViewCell *prototypeCell;
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Listen to font size change notification.
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(preferredFontSizeChanged:)
                                                 name:UIContentSizeCategoryDidChangeNotification
                                               object:nil];
}

- (void)dealloc {
    // Remove font size change listener.
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIContentSizeCategoryDidChangeNotification
                                                  object:nil];
}

- (void)preferredFontSizeChanged:(NSNotification *)notification {
    [self.tableView reloadData];
}

- (AutoResizeTableViewCell *)prototypeCell {
    if (!_prototypeCell) {
        _prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    return _prototypeCell;
}

- (void)configCell:(AutoResizeTableViewCell *)autoResizeTableViewCell atIndexPath:(NSIndexPath *)indexPath {
    autoResizeTableViewCell.textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}


#pragma mark - UITableViewDelegate


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITextView *textView = self.prototypeCell.textView;
    [self configCell:self.prototypeCell atIndexPath:indexPath];
    CGSize fitSize = [textView sizeThatFits:CGSizeMake(textView.bounds.size.width, FLT_MAX)];

    // Height for the text + top and bottom constraint + a little extra room
    return fitSize.height + 2.0 * [NSLayoutConstraint standardConstantToSuperview] + 1.0;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AutoResizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    [self configCell:cell atIndexPath:indexPath];
    return cell;
}

@end
