import UIKit

func contar(_ funcao: @escaping () -> Void) -> () -> Void {
    var ct = 0
    return {
        ct = ct + 1
        print("conta é \(ct)")
        funcao()
    }
}

func algumacoisa() {
print("AAA")
}

let contando = contar(algumacoisa)
contando()
contando()
contando()

var variavelFora = 0

func add(pegarFuncao funcCapturada: (Int) -> Void) {
    funcCapturada(100)
}

func outraFuncao(_ newValue: Int) {
    variavelFora = newValue
}

var salvarnovo = 100

add(pegarFuncao: outraFuncao)

add { cem in
    salvarnovo += cem
   print(salvarnovo)
}

//func doSomething(using closure: () -> Void) {
//  closure()
//}

func doSomething(using closure: @escaping () -> Void) {
  DispatchQueue.main.async {
    closure()
  }
}

doSomething {
    // quando o dipach terminar ele vai rodar o que esta aqui dentro
}

doSomething(using: fazendo)

func fazendo() {
    //vai fazer alguma coisa
}

func makeRequest(_ funcao: @escaping (Result<(Data, URLResponse), Error>) -> Void) {
    
  URLSession.shared.dataTask(with: URL(string: "https://donnywals.com")!) { data, response, error in
    if let error = error {
        funcao(.failure(error))
    } else if let data = data, let response = response {
        funcao(.success((data, response)))
    }

    assertionFailure("We should either have an error or data + response.")
  }
}
