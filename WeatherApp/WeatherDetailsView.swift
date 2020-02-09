//
//  WeatherDetailsView.swift
//  WeatherApp
//
//  Created by 伊藤嵩 on 2020/02/02.
//  Copyright © 2020 Shu Ito. All rights reserved.
//

import UIKit

class WeatherDetailsView: UIViewController {
    
    var weather: String?       //遷移元から天気データを取得
    var weatherMain: String?   //天気情報のメイングループ
    var temp: Double?          //遷移元から気温
    
    var tempStr: String?
    
    @IBOutlet weak var weatherImages: UIImageView!  //天気情報のimage
    @IBOutlet weak var weatherLabel: UILabel!       //天気情報のラベル
    
    @IBOutlet weak var weatherTemp: UILabel!        //天気情報：気温ラベル
    
    @IBOutlet weak var tokyoCity: UILabel!          //東京の街
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.weatherLabel!.text = self.weather!
        
        weatherLabel.adjustsFontSizeToFitWidth = true
        tokyoCity.text = "🗼🏢🏢🚶‍♂️🚶‍♀️🏢🏢🌳"
        tokyoCity.backgroundColor = UIColor.cyan
        tokyoCity.adjustsFontSizeToFitWidth = true
        weatherImages.backgroundColor = UIColor.cyan
        
        getWeatherImage()

        self.weatherTemp!.text = "Temperature : \(getWeatherTemp(self.temp!)) ℃"
        
    }
    
    func getWeatherImage(){
        
        switch weatherMain! {
        case "Thunderstorm":
            let image:UIImage = UIImage(named: "11d.png")!
            self.weatherImages.image = image
            
        case "Drizzle", "Rain":
            let image:UIImage = UIImage(named: "09d.png")!
            self.weatherImages.image = image
        
        case "Snow":
            let image:UIImage = UIImage(named: "13d.png")!
            self.weatherImages.image = image
        
        case "Mist", "Smoke", "Haze", "Dust", "Fog", "Sand", "Ash", "Squall", "Tornado":
            let image:UIImage = UIImage(named: "50d.png")!
            self.weatherImages.image = image

        case "Clear":
            let image: UIImage = UIImage(named: "01d.png")!
            self.weatherImages.image = image
        
        case "Clouds":
            let image:UIImage = UIImage(named: "04d.png")!
            self.weatherImages.image = image

        default:
            print("Error:画像取得失敗")
        }
        
        
        
    }
    
    func getWeatherTemp(_ temp: Double) -> String{
        
        var tempResult : Double
        let absoluteTemperature = 273.15
        var tempResultStr : String
        
        tempResult = (round((temp - absoluteTemperature)*10)/10)
        tempResultStr = String(tempResult)
        return tempResultStr
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
