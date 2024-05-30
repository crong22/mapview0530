//
//  MapViewController.swift
//  mapview0530
//
//  Created by 여누 on 5/30/24.
//

import UIKit
import MapKit

var list = ["선 택","스타벅스 신논현역점", "스타벅스 강남교보타워R점"]
var gpslist = [[37.504458, 127.023963],[37.505308,127.023681],[37.503723, 127.024097]]
class MapViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var checkLabel: UILabel!
    
    @IBOutlet var mapView: MKMapView!
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.borderStyle = .none
        nameField.textColor = .clear
        nameField.tintColor = .clear
        nameField.inputView = picker
        
        checkLabel.text = "선 택"
        checkLabel.font = .systemFont(ofSize: 17)
        checkLabel.textAlignment = .center
        checkLabel.textColor = .black
        
        nameLabel.text = "신논현역"
        nameLabel.font = .systemFont(ofSize: 17)
        nameLabel.textColor = .black
        nameLabel.textAlignment = .center
     
        //37.504458, 127.023963 신논현
        
        let center = CLLocationCoordinate2D(latitude: gpslist[0][0], longitude: gpslist[0][1])
        //지도에서 나타나는 중심에서의 거리
        mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = "신논현역"
        mapView.addAnnotation(annotation)
        
        ///
//        mapView.delegate = self
//        textField.delegate = self
//        
        picker.delegate = self
        picker.dataSource = self
        
    }


}
extension MapViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    // Picker section? 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Picker의 목록에 들어가는 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }

    // Picker 목록 이름
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    // Picker 한 행 선택
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameLabel.text = list[row]
        
        let annotation = MKPointAnnotation()
         
        if row == 1 {
            print("1번클릭")
            print(gpslist)
            let center = CLLocationCoordinate2D(latitude: gpslist[row][0], longitude: gpslist[row][1])
            //지도에서 나타나는 중심에서의 거리
            mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
            
            
            annotation.coordinate = center
            annotation.title = "스타벅스 신논현역점"
            mapView.addAnnotation(annotation)

            print(gpslist)
        }else if row == 2 {
            print("1번클릭")
            print(gpslist)
            let center = CLLocationCoordinate2D(latitude: gpslist[row][0], longitude: gpslist[row][1])
            //지도에서 나타나는 중심에서의 거리
            mapView.region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
            
            
            annotation.coordinate = center
            annotation.title = "스타벅스 신논현역점"
            
            print("삭제전")
            print(gpslist)
            mapView.removeAnnotation(annotation)
            print("삭제후")
            let center2 = CLLocationCoordinate2D(latitude: gpslist[row][0], longitude: gpslist[row][1])
            //지도에서 나타나는 중심에서의 거리
            mapView.region = MKCoordinateRegion(center: center2, latitudinalMeters: 500, longitudinalMeters: 500)
            annotation.coordinate = center2
            annotation.title = "스타벅스 강남교보타워R점"
            mapView.addAnnotation(annotation)

        }

        
        print("select", component, row)
    }
}
