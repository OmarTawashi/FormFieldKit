# FormFieldKit

A lightweight, type-safe, and SwiftUI-friendly form validation framework. Designed to streamline form logic in MVVM architectures and scale across small and large Swift projects.

---

## 🚀 Features

- ✅ Generic `FormField<T>` with built-in error tracking
- ✅ Chainable, reusable `Validator<T>` rules
- ✅ SwiftUI-ready bindings: `.text`, `.errorText`, `.hasError`
- ✅ Fully testable and unit-tested
- ✅ Supports `String`, `Int`, `Double`, and more via extensions

---

## 📦 Installation

### ✅ Swift Package Manager (SPM)

Add this package to your project:

1. In Xcode: `File > Add Packages`
2. Paste URL:  
https://github.com/your-username/FormFieldKit.git
3. Select the latest version and import it:

```swift
import FormFieldKit

🛠 Usage
1. Declare a Field in Your ViewModel
@Published var name = FormField<String>(
    title: "Name",
    placeholder: "Enter your name",
    validators: [
        .nonEmpty("Name"),
        .minLength(3, field: "Name")
    ]
)
2. Use in SwiftUI with MFormTextField
MFormTextField(text: $viewModel.name.text)
    .setTitleText(viewModel.name.title ?? "")
    .setPlaceHolderText(viewModel.name.placeholder ?? "")
    .setError(
        errorText: $viewModel.name.errorText,
        error: $viewModel.name.hasError
    )
3. Validate on Submit
func submit() {
    if name.validate() {
        print("✅ Name is valid: \\(name.value ?? "")")
    } else {
        print("❌ Validation failed")
    }
}
Or validate many fields:
validateFields([name, email, calories])

🧪 Built-in Validators
For String
.nonEmpty("Field")
.isNumber("Field")
.minLength(3, field: "Field")

You can add your own:
Validator<String> { value in
    value?.contains("@") == true ? nil : "Must contain @"
}



