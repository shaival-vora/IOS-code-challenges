/*
 Hello! Thank you for taking the time to complete our
 coding challenge. There are 3 challenges, each on a
 separate page. The clue derived from each page will
 provide instructions for the next challenge.

 We recommend turning "Editor > Show Rendered Markup"
 on for a classier experience.

 When you are done, please rename this playground to
 "first-last Ramp Challenge.playground" and submit it to
 ios-submissions@ramp.com.

 Good Luck!

 - The Ramp Mobile Team

 */

// = = = = = = = = = = = = = = = = = = = = = = = =

//: #### Challenge 1
//: The prompt below is encoded in a simple format.
//: Decode it to get the prompt for Challenge 2.

import Foundation

let prompt = """
R3JlYXQgam9iISAKCk5leHQgd2UndmUgaG9zdGVkIGEgSlNPTiBmaWxlIGF0IGF0IHRoaXMgdXJsOiBodHRwczovL2FwaS5qc29uYmluLmlvL3YzL2IvNjQ2YmVkMzI4ZTRhYTYyMjVlYTIyYTc5LiBZb3VyIGpvYiBpcyB0byB3cml0ZSBhIHNjcmlwdCB0bwpkb3dubG9hZCB0aGUgY29udGVudHMgb2YgdGhlIFVSTCAoaGludDogVGhlIFgtQUNDRVNTLUtFWSBpcyAkMmIkMTAkS2UxaXdpZUZPNy83cXNTS1UuR1lVLm9ZWFpNVzFFZUhyd2Q0eHg5eWxib0ppazVtc3RaazYpCnNvcnQgdGhlIGRhdGEgYnkgZWFjaCBlbGVtZW50cyAnYmFyJyBrZXkKZmlsdGVyIG91dCBlbGVtZW50cyB3aGVyZSAnYmF6JyBpcyBub3QgZGl2aXNpYmxlIGJ5IDMKY29uY2F0ZW5hdGUgZWFjaCBlbGVtZW50cyAnZm9vJyB2YWx1ZQoKRG8gZWFjaCBvZiB0aGVzZSBzdGVwcyB0byByZXZlYWwgdGhlIGluc3RydWN0aW9ucyBmb3IgdGhlIGZpbmFsIHBhcnQuIFJlbWVtYmVyIHRvIHNob3cgeW91ciB3b3JrIQ==
"""

// Show your work here! When you are done move on to Challenge 2

if let decodedData = Data(base64Encoded: prompt),
   let decodedString = String(data: decodedData,
                              encoding: .utf8) {
    print(decodedString)
}

/*
 Output from task 1
 Great job!

 Next we've hosted a JSON file at at this url: https://api.jsonbin.io/v3/b/646bed328e4aa6225ea22a79. Your job is to write a script to
 download the contents of the URL (hint: The X-ACCESS-KEY is $2b$10$Ke1iwieFO7/7qsSKU.GYU.oYXZMW1EeHrwd4xx9ylboJik5mstZk6)
 sort the data by each elements 'bar' key
 filter out elements where 'baz' is not divisible by 3
 concatenate each elements 'foo' value

 Do each of these steps to reveal the instructions for the final part. Remember to show your work!
 */

//: [Challenge 2](@next)
 
let jsonURL: String = "https://api.jsonbin.io/v3/b/646bed328e4aa6225ea22a79"
let xAccessKey = "$2b$10$Ke1iwieFO7/7qsSKU.GYU.oYXZMW1EeHrwd4xx9ylboJik5mstZk6"

 

// Function to download JSON data from the given URL
func downloadJSON(url: String, accessKey: String, completion: @escaping (Data?, Error?) -> Void) {
    let jsonURL = URL(string: url)!
    var request = URLRequest(url: jsonURL)
    request.addValue(accessKey, forHTTPHeaderField: "X-ACCESS-KEY")

    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        completion(data, error)
    }

    task.resume()
}

// Function to perform the specified tasks on the JSON data
func processJSON(data: Data) {
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        
        if let jsonDict = jsonObject as? [String: Any],
           let record = jsonDict["record"] as? [String: Any],
           let results = record["data"] as? [[String: Any]] {
            print(results)
            let sortedArray = results.sorted { ($0["bar"] as? Int ?? 0) < ($1["bar"] as? Int ?? 0) }

                 // Step 2: Filter out elements where 'baz' is not divisible by 3
                 let filteredArray = sortedArray.filter { ($0["baz"] as? Int ?? 0) % 3 == 0 }

                 // Step 3: Concatenate each element's 'foo' value
                 let concatenatedString = filteredArray.map { ($0["foo"] as? String ?? "") }.joined()

                 print(concatenatedString)
        } else {
            print("Parasing error")
        }
    } catch {
        print("Error parsing JSON: \(error)")
    }
}

// Download JSON data and process it
downloadJSON(url: jsonURL, accessKey: xAccessKey) { (data, error) in
    if let error = error {
        print("Error downloading JSON: \(error)")
    } else if let data = data {
        processJSON(data: data)
    }
}

/*
 Challenge 3 Nice Work! For the final challenge, update ContentView.body to display a smiley face using only native SwiftUI views (no Sf Symbols or emojis). Be creative and have fun! Don't forget to submit a screenshot of your view with the completed playground.
 */
