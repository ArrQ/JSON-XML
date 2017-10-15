//
//  ViewController.m
//  XML+JSON
//
//  Created by ArrQ on 2017/10/15.
//  Copyright © 2017年 ArrQ. All rights reserved.
//

/* -------- 解析 ：XML 字符串 -------

 a. <info>我是XML字符串</info>
 b. <info name = "我是XML字典"></info>
 c. <info><name>含有多个标签</name></info>
 d. <info><name>含有多个标签</name><name>含有多个标签</name></info>

 
 重点 掌握 :
 
 1.SAX(Simple API for XML) 方式解析 XML
 2.NSXMLParser 的 代理协议方法  5 个
 

*/


#import "ViewController.h"

@interface ViewController ()<NSXMLParserDelegate>
@property(nonatomic,strong) UITextView *textView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _textView = [[UITextView alloc]initWithFrame:CGRectMake(50, 50, 300, 250)];
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.text = @"解析结果：";
    _textView.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:_textView];
    
    UIButton *button_ = [UIButton buttonWithType:UIButtonTypeCustom];
    button_.frame = CGRectMake(100, 380, 100, 40);
    [button_ setTitle:@"XML解析" forState:UIControlStateNormal];
    button_.titleLabel.font = [UIFont systemFontOfSize:14];
    button_.layer.masksToBounds = YES;
    button_.layer.cornerRadius = 5;
    
    button_.layer.borderWidth = 1.f;
    button_.layer.borderColor = [[UIColor colorWithWhite:0.7 alpha:1.0]CGColor];
    [button_ setTitleColor:[UIColor colorWithWhite:0.5 alpha:1.0] forState:UIControlStateNormal];
    [button_ addTarget:self action:@selector(onClickXML:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_];
    

    
    

}

- (void)onClickXML:(UIButton *)senser{
    
//    NSString *xmlStr = @"<info>wo shi xml.</info>";
//    此时 \\  要将"" 转译奥   \"我是XML字典\"
    NSString *xmlStr = @"<info name= \"我是XML字典\"></info>"
;

    NSData *dataStr = [xmlStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSXMLParser *xmlParser = [[NSXMLParser alloc]initWithData:dataStr];
    xmlParser.delegate = self;
    [xmlParser parse];
    
    
}

# pragma mark --- XML delegate ----
// 准备解析
- (void)parserDidStartDocument:(NSXMLParser *)parser{
    _textView.text = [_textView.text stringByAppendingString:@"\n"];

    _textView.text = [_textView.text stringByAppendingString:@"准备解析：--------"];
    _textView.text = [_textView.text stringByAppendingString:@"\n"];

    
}
// 准备解析当前节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    
//    当有节点的时候呢
    
//     b. <info name = "我是XML字典"></info>

    _textView.text = [_textView.text stringByAppendingString:@"准备解析当前节点："];
    _textView.text = [_textView.text stringByAppendingString:elementName];// 当前节点的名字：elementName
    _textView.text = [_textView.text stringByAppendingString:@"\n"];
    _textView.text = [_textView.text stringByAppendingString:[attributeDict objectForKey:@"name"] ];/// 当前节点的属性：name
    _textView.text = [_textView.text stringByAppendingString:@"\n"];

    
    
}
// 获取首尾节点间 内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
//    a. <info>我是XML字符串</info>

//    _textView.text = [_textView.text stringByAppendingString:@"获取内容："];
//
//    _textView.text = [_textView.text stringByAppendingString:string];

    
    
}

// 解析完 当前节点
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    
    
    
}

// 解析结束
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
