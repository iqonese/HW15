import Foundation

//MARK: - Homework #15
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

let baseURL: String = "https://emojihub.yurace.pro/api/all/category/animals-and-nature"



var sample: () = getData(urlRequest: baseURL)
