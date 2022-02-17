

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var menu: [TunaModel] = load("tunaData.json")
    @Published var item: TunaModel?
    
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
func saveJSON<T: Codable>(data: T, filename: String) {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    let jsonData: Data
    do {
        jsonData = try encoder.encode(data)
    }
    catch {
        return
    }
    
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        print("error creating JSON string from data")
        return
    }
        
    if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        let fileURL = dir.appendingPathComponent(filename)
        
        print("fileURL: \(fileURL)")
        
        do{
            try jsonString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        }
        catch {
            return
        }
    }
    else { print("error getting Document Directory") }
}


