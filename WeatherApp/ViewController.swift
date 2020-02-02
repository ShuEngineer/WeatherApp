//
//  ViewController.swift
//  WeatherApp
//
//  Created by 伊藤嵩 on 2020/02/02.
//  Copyright © 2020 Shu Ito. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!

    var weatherDayTimes = [String?]()   //天気情報：日時
    
    var weatherDetails = [String?]()    //天気情報：天気詳細
    
    var weatherInfos = [String?]()      //一列分の天気情報
    
    let cellNum = 40                    //JSON情報の配列数
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tokyo🗼Weather"         // Navigation Barのタイトルを設定
        //view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self    // dataSouceプロパティに自身(WeatherListViewController)を代入
        
        getWeatherInfo()
        
    }
    
    func getWeatherInfo(){
        
        //APPIDに個人のKeyを設定
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?id=524901&q=Tokyo&APPID=9afd2ee30401d11d026bbc1aad91fbdd"
        
        Alamofire.request(urlString, method: .get).responseJSON{ response in
            guard let object = response.result.value else{
                return
            }
            
            let json = JSON(object)
            //json.forEach{ (_, json) in
            json.forEach{ (key, json) in
                //print(key)
                //print(json)
                
                for i in 0...self.cellNum {
                    let weatherInfoLib1: String? = json[i]["dt_txt"].string
                    let weatherInfoLib2: String? = json[i]["weather"][0]["description"].string
                    if weatherInfoLib1 == nil && weatherInfoLib2 == nil{
                        return
                    }
                    self.weatherDayTimes.append(weatherInfoLib1)
                    self.weatherDetails.append(weatherInfoLib2)
                    self.weatherInfos.append("\(self.weatherDayTimes[i]!) : \(self.weatherDetails[i]!)")
                }
                
            }
            //print(self.weatherInfos.count)
            self.tableView.reloadData()
        }
    }
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 40
        return self.weatherInfos.count
    }
    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        //print(self.weatherInfos)
        cell.textLabel?.text = self.weatherInfos[indexPath.row]
        //cell.textLabel?.text = self.weatherInfos[0]
        //cell.textLabel!.text = "test"
        
        return cell
    }
    
    // 各セルを選択した時に実行されるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

