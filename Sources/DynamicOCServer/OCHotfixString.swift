//
//  OCHotfixString.swift
//  COpenSSL
//
//  Created by Hart on 2020/4/17.
//

import Foundation
import PerfectLib

class OCHotfixString: NSObject
{
    static var hot_class = "ViewController";
    static var hot_selector = "viewDidLoad";
    static var hot_args = "";
    static var hot_isClass = "0";//1 is true
    static var hot_hotcode = """
                 [super viewDidLoad];
                 self.title = @"DynamicOC";
                 CGRect frame = CGRectMake(10, 64, 200, 48);
                 UILabel *btnView = [[UILabel alloc] initWithFrame:frame];
                 btnView.text = @"New View";
                 btnView.textAlignment = 1;
                 btnView.backgroundColor = UIColor.greenColor;
                 [self.view addSubview:btnView];
    """;

    public static func packString2() -> String {
        let dict = ["class":hot_class,
                    "selector": hot_selector,
                    "args": hot_args,
                    "isClass": hot_isClass,
                    "hotcode": hot_hotcode];
        let data = try? JSONSerialization.data(withJSONObject: dict, options: [])
        let str = String(data: data!, encoding: String.Encoding.utf8)
        return str!
    }
    
    public static func packString() -> String {
        let dict = ["class":hot_class,
            "selector": hot_selector,
            "args": hot_args,
            "isClass": hot_isClass,
            "hotcode": hot_hotcode];
        let encoded = try! dict.jsonEncodedString()
        return encoded
    }
}

