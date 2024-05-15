import Foundation
import CryptoKit

//MARK: - Homework #15 Starred One

let timeStamp = 1
let publicKey = "a26a0394ccbca1febc741c76648d60c6"
let privateKey = "c763c5acf6611fdf7917b85363299e900401f07f"
let rawString = "\(String(timeStamp))\(privateKey)\(publicKey)"


func MD5() -> String {
    let res = Insecure.MD5.hash(data: Data(rawString.utf8))
    return res.map {
        String(format: "%02hhx", $0)
    }.joined()
}

print(MD5())

func getData(urlRequest: String) {
    let urlRequest = URL(string: urlRequest)
    guard let url = urlRequest else {return}
    
    URLSession.shared.dataTask(with: url) {data, response, error in
        if error != nil {
            print("Error: \((error?.localizedDescription)!)")
            return
            
        }
        if let response = response as? HTTPURLResponse, response.statusCode == 200 {
            print(response)
            print("\n")
            guard let data = data else {return}
            let dataAsString = String(data: data, encoding: .utf8)
            
            // result Data
            guard let resultData = dataAsString else {return}
            print(resultData)
        } else {
            print("Status code: \((response as? HTTPURLResponse)!.statusCode)")
        }
        
    }.resume()
}

let url = "http://gateway.marvel.com/v1/public/comics?ts=\(timeStamp)&apikey=\(publicKey)&hash=\(MD5())"

getData(urlRequest: url)
