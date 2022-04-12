import Foundation
import FirebaseFirestore
class FirebaseViewModel: ObservableObject {
@Published var checkOutFields = [CheckOutFields]()
private var  db = Firestore.firestore()
    
func getAllData()
    { db.collection("checkOutFields").addSnapshotListener { (querySnapshot, error) in
              guard let documents = querySnapshot?.documents else {
                  print("No documents")
                  return }

              self.checkOutFields = documents.map { (queryDocumentSnapshot) -> CheckOutFields in
                  let data = queryDocumentSnapshot.data()
                  let name = data["name"] as? String ?? ""
                  let phoneNum = data["phoneNum"] as? String ?? ""

                  return CheckOutFields(name: name, phoneNum: phoneNum)}}}

func addNewData(checkOutField: String)
    {do {_ = try db.collection("checkOutFields").addDocument(data: ["name": checkOutField, "phoneNum":checkOutField])  }
             catch {print(error.localizedDescription) }}
    
}

import Foundation
import FirebaseFirestore
struct CheckOutFields: Codable, Identifiable {

  var id: String = UUID().uuidString
var name: String?
    var phoneNum: String?

}
