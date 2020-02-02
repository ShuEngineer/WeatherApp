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
    
    @IBOutlet weak var weatherLabel: UILabel!       //天気情報のラベル
    
    @IBOutlet weak var weatherImages: UIImageView!  //天気情報のimage
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.weatherLabel!.text = self.weather!
        weatherLabel.adjustsFontSizeToFitWidth = true
        getWeatherImage()
        
        // Do any additional setup after loading the view.
    }
    
    func getWeatherImage(){
        
        switch weatherMain! {
        case "Thunderstorm":
            let image:UIImage = UIImage(named: "11d.png")!
            let imageView = UIImageView(image: image)
            self.weatherImages.addSubview(imageView)
            
        case "Drizzle", "Rain":
            let image:UIImage = UIImage(named: "09d.png")!
            let imageView = UIImageView(image: image)
            self.weatherImages.addSubview(imageView)
        
        case "Snow":
            let image:UIImage = UIImage(named: "13d.png")!
            let imageView = UIImageView(image: image)
            self.weatherImages.addSubview(imageView)
        
        case "Mist", "Smoke", "Haze", "Dust", "Fog", "Sand", "Ash", "Squall", "Tornado":
            let image:UIImage = UIImage(named: "50d.png")!
            let imageView = UIImageView(image: image)
            self.weatherImages.addSubview(imageView)

        case "Clear":
            let image: UIImage = UIImage(named: "01d.png")!
            let imageView: UIImageView = UIImageView(image: image)
            self.weatherImages.addSubview(imageView)
        
        case "Clouds":
            let image:UIImage = UIImage(named: "04d.png")!
            let imageView = UIImageView(image: image)
            self.weatherImages.addSubview(imageView)

        default:
            print("Error:画像取得失敗")
        }
        
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
