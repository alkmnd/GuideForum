//
//  DataManager.swift
//  GuideForum
//
//  Created by 1234 on 25.05.2023.
//

import Foundation

class DataManager: ObservableObject {
    
    @Published var userCredentials: UserCredentials = UserCredentials(name: "", email: "", password: "")
    @Published var isLoggedIn = false
    @Published var token = ""
    @Published var userID: String? = nil
    @Published var posts: [Post] = []
    @Published var users: [User] = []
    
    private func createPostRequest(urlString: String, parameters: [String: Any]) -> URLRequest? {
            guard let url = URL(string: urlString) else {
                print("Invalid URL")
                return nil
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch let error {
                print(error.localizedDescription)
                return nil
            }
            return request
        }
        
        private func createGetRequest(urlString: String) -> URLRequest? {
            guard let url = URL(string: urlString) else {
                print("Invalid URL")
                return nil
            }

            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            return request
        }

        private func sendRequest(_ request: URLRequest, onSuccess: @escaping (_ data: Data) -> Void) {
            let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                guard let data = data, error == nil else {
                    print("Error occurred: \(String(describing: error))")
                    return
                }

                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    DispatchQueue.main.async {
                        onSuccess(data)
                    }
                } else {
                    print("Error: \(String(describing: response))")
                }
            }

            task.resume()
        }
    func registerUser() {
            guard let request = createPostRequest(urlString: "http://localhost:8080/users/register", parameters: ["name": userCredentials.name, "email": userCredentials.email, "password": userCredentials.password]) else {
                return
            }
            sendRequest(request) { [weak self] _ in
                self?.isLoggedIn = true
                self?.loginUser()
            }
        }

        func loginUser() {
            guard let request = createPostRequest(urlString: "http://localhost:8080/users/login", parameters: ["email": userCredentials.email, "password": userCredentials.password]) else {
                return
            }
            sendRequest(request) { [weak self] data in
                do {
                    let tokenResponse = try JSONDecoder().decode(TokenResponse.self, from: data)
                    DispatchQueue.main.async {
                        print("JOPAA", tokenResponse.value)
                        self?.token = tokenResponse.value
                        self?.isLoggedIn = true
                    }
                } catch {
                    print("Error decoding token: \(error)")
                }
            }
        }
    
    func createPost(postCreate: PostCreate) {
        guard let request = createPostRequest(urlString: "http://localhost:8080/posts/create", parameters: ["title": postCreate.title, "description": postCreate.description, "content": postCreate.content]) else {
            return
        }
        sendRequest(request) { _ in
                   print("Game room successfully created.")
               }
    }
    
    func getPosts() {
        guard let request = createGetRequest(urlString: "http://localhost:8080/posts/list-all") else {
            return
        }
        sendRequest(request) { [weak self] data in
                    do {
                        let postList = try JSONDecoder().decode([Post].self, from: data)
                        DispatchQueue.main.async {
                            self?.posts = postList
                        }
                    } catch {
                        print("Error decoding Posts: \(error)")
                    }
                }
    }
    
    func getUsers() {
        guard let request = createGetRequest(urlString: "http://localhost:8080/users/list-all") else {
            return
        }
        sendRequest(request) { [weak self] data in
                    do {
                        let userList = try JSONDecoder().decode([User].self, from: data)
                        DispatchQueue.main.async {
                            self?.users = userList
                        }
                    } catch {
                        print("Error decoding Users: \(error)")
                    }
                }
    }
}
