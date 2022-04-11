import SwiftUI
import Combine
class AuthenticationViewModel: ObservableObject {
  @Published var customerName: String = ""
  @Published var username: String = ""
  @Published var phoneNumber: String = ""
  @Published var passwordAgain: String = ""
  @Published var inlineErrorForPassword: String = ""
  @Published var isValid = false
  @Published var isValid1 = false
  @Published var isValid2 = false
  @Published var isLoggedIn = false

  private var cancelables = Set<AnyCancellable>()
  init() {
      isUsernameValidPublisher
      .receive(on: RunLoop.main)
      .assign(to: \.isValid1, on: self)
      .store(in: &cancelables)
      isPhoneValidPublisher
      .receive(on: RunLoop.main)
      .assign(to: \.isValid2, on: self)
      .store(in: &cancelables)}
  private var isUsernameValidPublisher: AnyPublisher<Bool, Never> {
    $customerName
      .debounce(for: 0.8, scheduler: RunLoop.main)
      .removeDuplicates()
      .map { $0.count >= 2 }
      .eraseToAnyPublisher()}
    private var isPhoneValidPublisher: AnyPublisher<Bool, Never> {
      $phoneNumber
        .debounce(for: 0.8, scheduler: RunLoop.main)
        .removeDuplicates()
        .map { $0.count >= 9 }
        .eraseToAnyPublisher()}
    
    func isValidForm() -> Bool
    {if(isValidPhone)(phoneNumber: phoneNumber)
        {return true}
      else
        {return false } }
    
    func isValidPhone(phoneNumber: String) -> Bool {
            let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: phoneNumber) }
    
}
