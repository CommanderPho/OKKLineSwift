//
//  ViewController.swift
//  OKKLineSwift-macOS-Demo
//
//  Copyright © 2016年 Herb - https://github.com/Herb-Sun/OKKLineSwift
//
//
import Cocoa
import SnapKit
import Just
import OKKLineSwift_macOS

class ViewController: NSViewController {
    
    var klineView: OKKLineView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        klineView = OKKLineView()
        view.addSubview(klineView)
        klineView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        fetchData()
    }
    
    @objc
    func fetchData() {
        let param = ["unit" : "86400",
                     "pair" : "btc_jpy",
                     "limit" : "300",
                     "market" : "coincheck",
                     "v2" : "true"]
        Just.get("https://coincheck.com/api/charts/candle_rates", params: param, asyncCompletionHandler: { (result) -> Void in
            
            print(result)
            DispatchQueue.main.async(execute: {
                
                if result.ok {
                    let datas = result.json as! [[Double]]
                    
                    var dataArray : [OKKLineModel] = []
                    for data in datas {
                        
                        let model = OKKLineModel(date: data[0], open: data[1], close: data[4], high: data[2], low: data[3], volume: data[5])
                        dataArray.append(model)
                    }
                    
                    //                    for model in OKConfiguration.shared.klineModels {
                    //                        print(model.propertyDescription())
                    //                    }
                    self.klineView.drawKLineView(klineModels: dataArray)
                }
                
                
            })
            
        })
    }
}

