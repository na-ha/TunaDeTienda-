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
                  return CheckOutFields(name: name)}}}

func addNewData(name: String)
    {do {_ = try db.collection("checkOutFields").addDocument(data: ["name": name])  }
             catch {print(error.localizedDescription) }}
    
}
