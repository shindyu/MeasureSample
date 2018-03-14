import UIKit

class FirstViewController: UIViewController {
    let textView = UITextView()
    let button = UIButton()
    var handler: (([String]) -> ())?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(textView)
        view.addSubview(button)

        textView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textView.widthAnchor.constraint(equalToConstant: 200.0),
            textView.heightAnchor.constraint(equalToConstant: 100.0),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10.0)
        ])

        view.backgroundColor = .white
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.cgColor
        textView.text = "商品詳細テキスト商品詳細テキスト商品詳細テキスト商品詳細テキスト商品詳細テキスト商品詳細テキスト商品詳細テキスト商品詳細テキスト商品詳細テキスト"
        button.setTitle("show AR", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(showARScreen), for: .touchUpInside)
    }

    @objc private func showARScreen() {
        handler = { measureResults in
            self.textView.text?.append(measureResults.joined(separator: " x "))
            self.textView.text?.append("\n")
        }
        textView.text = nil
        let vc = UINavigationController(rootViewController: ARViewController(handler: handler!))
        self.present(vc, animated: true, completion: nil)
    }
}
