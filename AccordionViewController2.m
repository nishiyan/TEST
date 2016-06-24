//
//  ViewController.m
//  Accordion&WebView
//
//  Created by Ryosuke Nishida on 2016/06/20.
//  Copyright © 2016年 Ryosuke Nishida. All rights reserved.
//

#import "AccordionViewController2.h"

static int forTouchCount1 = 0;
static int forTouchCount2 = 0;
static int forTouchCount3 = 0;

static NSString *CellIdentifier = @"Cell";


@interface AccordionViewController2 ()<UITableViewDelegate, UITableViewDataSource>{
    NSMutableArray *topItems;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
/**
 テーブルに表示する情報
 */
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *dataSource2;
@property (nonatomic, strong) NSMutableArray *dataSource3;


@end

@implementation AccordionViewController2


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    // デリゲートメソッドをこのクラスで実装する
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // テーブルに表示したいデータソースをセット
    self.dataSource = [NSMutableArray arrayWithObjects:@">\tParent1",nil];
    self.dataSource2 = [NSMutableArray arrayWithObjects:@">\tParent2",nil];
    self.dataSource3 = [NSMutableArray arrayWithObjects:@">\tParent3",nil];
    
}


/**
 テーブルに表示するデータ件数を返します。（必須）
 
 @return NSInteger ：データ件数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger dataCount;
    
    // テーブルに表示するデータ件数
    switch (section) {
        case 0:
            dataCount = self.dataSource.count;
            break;
        case 1:
            dataCount = self.dataSource2.count;
            break;
        case 2:
            dataCount = self.dataSource3.count;
            break;
        default:
            break;
    }
    return dataCount;
}

/**
 テーブルに表示するセクションの件数を返します。（オプション）
 
 @return NSInteger ：セクションの数
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row == 0){
        
        switch (indexPath.section){
            case 0://indexPath.section:上から数えてどのセクションか   indexPath.row:そのセクションの何行目か
                forTouchCount1++;
                if(forTouchCount1%2 == 1){
                    self.dataSource = [NSMutableArray arrayWithObjects:@"<\tParent1",@"\t\tChild1-1",@"\t\tChild1-2",@"\t\tChild1-3",@"\t\tChild1-4",nil];
                    self.dataSource2 = [NSMutableArray arrayWithObjects:@">\tParent2",nil];
                    self.dataSource3 = [NSMutableArray arrayWithObjects:@">\tParent3",nil];
                }
                else if(forTouchCount1%2 == 0){
                    self.dataSource = [NSMutableArray arrayWithObjects:@">\tParent1",nil];
                    self.dataSource2 = [NSMutableArray arrayWithObjects:@">\tParent2",nil];
                    self.dataSource3 = [NSMutableArray arrayWithObjects:@">\tParent3",nil];
                }
                break;
            case 1:
                forTouchCount2++;
                if(forTouchCount2%2 == 1){
                    self.dataSource = [NSMutableArray arrayWithObjects:@">\tParent1",nil];
                    self.dataSource2 = [NSMutableArray arrayWithObjects:@"<\tParent2",@"\t\tChild2-1",@"\t\tChild2-2",nil];
                    self.dataSource3 = [NSMutableArray arrayWithObjects:@">\tParent3",nil];
                }
                else if(forTouchCount2%2 == 0){
                    self.dataSource = [NSMutableArray arrayWithObjects:@">\tParent1",nil];
                    self.dataSource2 = [NSMutableArray arrayWithObjects:@">\tParent2",nil];
                    self.dataSource3 = [NSMutableArray arrayWithObjects:@">\tParent3",nil];
                }
                break;
            case 2:
                forTouchCount3++;
                if(forTouchCount3%2 == 1){
                    self.dataSource = [NSMutableArray arrayWithObjects:@">\tParent1",nil];
                    self.dataSource2 = [NSMutableArray arrayWithObjects:@">\tParent2",nil];
                    self.dataSource3 = [NSMutableArray arrayWithObjects:@"<\tParent3",@"\t\tChild3-1",@"\t\tChild3-2",@"\t\tChild3-3",nil];
                }
                else if(forTouchCount3%2 == 0){
                    self.dataSource = [NSMutableArray arrayWithObjects:@">\tParent1",nil];
                    self.dataSource2 = [NSMutableArray arrayWithObjects:@">\tParent2",nil];
                    self.dataSource3 = [NSMutableArray arrayWithObjects:@">\tParent3",nil];
                }
                break;
            
            default:
                break;
        }
        
        [self.tableView reloadData];
        
        
    }
    
}

/**
 テーブルに表示するセルを返します。（必須）
 
 @return UITableViewCell : テーブルセル
 */

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 再利用できるセルがあれば再利用する
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        // 再利用できない場合は新規で作成
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = self.dataSource[indexPath.row];
            break;
        case 1:
            cell.textLabel.text = self.dataSource2[indexPath.row];
            break;
        case 2:
            cell.textLabel.text = self.dataSource3[indexPath.row];
            break;
        default:
            break;
    }
    
    return cell;
}

- (IBAction)backToMain1:(id)sender {
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


