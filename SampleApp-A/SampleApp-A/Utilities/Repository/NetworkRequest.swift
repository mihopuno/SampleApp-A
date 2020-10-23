//
//  NetworkRequest.swift
//  SampleApp-A
//
//  Created by Mac Mini 2 on 10/23/20.
//

import Foundation

typealias Completion<T> = (Swift.Result<(T), ErrorModel>) -> Void
typealias Parameters = Dictionary<String, Any>
typealias HTTPHeaders = Dictionary<String, String>

enum HTTPMethod : String {
    
    case GET = "get"
    case POST = "post"
    case PUT = "put"
    case DELETE = "delete"
}

class NetworkRequest {
    
    private var sessionConfiguration : URLSessionConfiguration
    private var urlSession : URLSession
    private let semaphore : DispatchSemaphore
    private let queue : DispatchQueue
    public static let shared = NetworkRequest()
    
    init() {
        self.queue = DispatchQueue.global(qos: .background)
        self.semaphore = DispatchSemaphore.init(value: 1)
        self.sessionConfiguration = URLSessionConfiguration.default
        self.urlSession = URLSession(configuration: sessionConfiguration)
    }
    
    /// # Generic #
    /// T: Represents Codable Model
    /// - parameter type: SZEndpoint<T> contains url, httpMethod, paramaters,, encoding, headers, and headers.
    public func request<T: Codable>(type: AppEndpoint<T>, handler: @escaping Completion<T>) {
        guard let url = type.url else {
            handler(.failure(ErrorModel(nil, "Invalid url")))
            return
        }
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: type.timeout)
        request.httpMethod = type.httpMethod.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        self.queue.async {
            self.semaphore.wait()
            self.urlSession.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode
                    if let error = error {
                        handler(.failure(ErrorModel(error, statusCode)))
                        return
                    }
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    guard let data = data else { return }
                    do {
                        let decoded = try jsonDecoder.decode(T.self, from: data)
                        handler(.success(decoded))
                    } catch (let error) {
                        handler(.failure(ErrorModel(error, statusCode)))
                    }
                    self.semaphore.signal()
                }
            }.resume()
        }
    }
}

extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}
