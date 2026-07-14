# Projeto 1 — Storm Viewer (View Code)
### Tutorial adaptado do 100 Days of Swift para desenvolvimento sem Interface Builder

---

## O que vamos construir

Um app chamado **Storm Viewer**: uma lista de fotos de tempestades que, ao tocar em cada item, abre a imagem em tela cheia. Todo o layout será construído **inteiramente em código** — sem Storyboards e sem Interface Builder.

---

## Dia 16 — Configuração inicial

O Dia 16 cobre três subtópicos: configuração do projeto, carregamento de imagens com `FileManager`, e construção da interface com `UITableViewController`. Como estamos usando view code, algumas etapas diferem do tutorial original (que usa Interface Builder e Storyboards).

---

### Subtópico 1 — Setting up (Configuração)

No curso original, esse subtópico orienta a criar o projeto no Xcode com um template "Single View App" e importar as fotos de tempestades. Você já fez isso — o projeto está criado e as imagens `nssl*.jpg` estão na pasta `images/` dentro do bundle.

A diferença crucial em relação ao curso original é a configuração da janela. O tutorial usa `Main.storyboard` para definir a tela inicial. Em view code, fazemos isso no `SceneDelegate`:

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    let window = UIWindow(windowScene: windowScene)
    let vc = ViewController()
    let nav = UINavigationController(rootViewController: vc)
    window.rootViewController = nav
    window.makeKeyAndVisible()
    self.window = window
}
```

Isso já está implementado no seu projeto. Leia o `SceneDelegate.swift` para conferir.

---

### Subtópico 2 — Listing images with FileManager

Um app iOS é, por baixo dos panos, um diretório no disco — chamado **bundle** — que contém o executável compilado, imagens, fontes e outros recursos. O `Bundle.main.resourcePath` aponta para esse diretório.

O `FileManager` é a API que nos permite listar o conteúdo desse diretório. O fluxo é:

1. Pegar o caminho do bundle
2. Listar todos os arquivos nele
3. Filtrar os que começam com `"nssl"`
4. Guardá-los num array

```swift
let fm = FileManager.default
let path = Bundle.main.resourcePath!
let items = try! fm.contentsOfDirectory(atPath: path)

for item in items {
    if item.hasPrefix("nssl") {
        pictures.append(item)
    }
}
```

**Por que `try!`?** O método `contentsOfDirectory` pode lançar um erro — por exemplo, se o caminho não existir. Usamos `try!` aqui porque o `resourcePath` do bundle sempre existe enquanto o app está rodando. Se isso falhar, algo muito errado aconteceu com o próprio app, e faz sentido travar. Em código de produção com caminhos externos (documentos do usuário, por exemplo), use `do/catch` ou `try?`.

**Por que `var pictures = [String]()`?** O array precisa ser uma propriedade da classe — não uma variável local dentro de `viewDidLoad()` — para que persista enquanto a tela existir. Variáveis locais são destruídas quando o método termina.

Isso já está implementado. Para verificar que funcionou, o curso sugere adicionar `print(pictures)` no final do `viewDidLoad()` e conferir o console do Xcode.

---

### Subtópico 3 — Designing our interface

No curso original, esse subtópico usa o Interface Builder para substituir o `UIViewController` por um `UITableViewController`, configurar o identificador da célula e embalar tudo num `UINavigationController`. Em view code, fazemos tudo isso por código.

**Herdar de `UITableViewController`**

Em vez de `UIViewController`, o `ViewController` herda de `UITableViewController`. Isso já está feito — a diferença é que o `UITableViewController` já tem uma `UITableView` embutida, e implementa uma série de comportamentos padrão que só precisamos sobrescrever onde quisermos customizar.

**Registrar a célula**

No Interface Builder, você configura o identificador e o estilo da célula visualmente. Em view code, registre a célula no `viewDidLoad()`:

```swift
tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Picture")
```

**Implementar os dois métodos obrigatórios da table view**

Para mostrar dados, você precisa sobrescrever dois métodos:

O primeiro diz quantas linhas a tabela deve ter:

```swift
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pictures.count
}
```

O segundo configura o conteúdo de cada célula. O iOS **recicla células** para economizar memória — quando uma linha sai da tela, ela vai para uma fila de reutilização e pode ser reaproveitada para uma nova linha que entra. O `dequeueReusableCell` faz exatamente isso: pega uma célula reciclada ou cria uma nova se a fila estiver vazia.

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
    cell.textLabel?.text = pictures[indexPath.row]
    return cell
}
```

**Por que `cell.textLabel?`?** O `textLabel` é opcional porque uma célula customizada pode não ter label algum. O `?` garante que o código só executa se o label existir — sem precisar de `if let`.

**Títulos grandes na barra de navegação**

Adicione ao final do `viewDidLoad()`:

```swift
title = "Storm Viewer"
navigationController?.navigationBar.prefersLargeTitles = true
```

`prefersLargeTitles` ativa o modo de título expandido em toda a stack de navegação. Telas filhas podem desativá-lo individualmente — como faremos no `DetailViewController` no Dia 17.

---

## Dia 17 — Navegando para o detalhe

O Dia 17 tem três subtópicos: criar a tela de detalhe, carregar a imagem com `UIImage`, e ajustes finais de polimento. No curso original, tudo isso usa Interface Builder e Storyboards — aqui faremos tudo em código.

---

### Subtópico 1 — Building a detail screen (Construindo a tela de detalhe)

No curso original, esse subtópico orienta a criar um novo arquivo `DetailViewController.swift` e depois usar o Interface Builder para arrastar uma `UIImageView` e conectá-la ao código via `@IBOutlet`. Em view code, não precisamos de `@IBOutlet` — criamos e configuramos a `UIImageView` diretamente no código.

Crie um novo arquivo `DetailViewController.swift` com File > New > File > Swift File. A estrutura base será:

```swift
class DetailViewController: UIViewController {
    var imageView: UIImageView!
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(imageView)
    }
}
```

**Por que `var selectedImage: String?`?** Esse é o padrão de passagem de dados entre view controllers: você cria a propriedade, e a tela anterior vai preenchê-la antes de apresentar o detalhe. A propriedade começa como `nil` e recebe o valor logo antes de a tela aparecer.

**Por que `UIImageView!` com `!`?** O `imageView` não existe no momento em que o objeto é criado — ele só é atribuído dentro do `viewDidLoad()`. O `!` (implicitly unwrapped optional) diz ao Swift: "eu sei que isso vai ser `nil` por um instante, mas garanto que terá um valor antes de ser usado." O curso chama atenção para esse padrão porque é exatamente o que `@IBOutlet` gera automaticamente nos Storyboards.

**`contentMode` e `autoresizingMask`:** o `contentMode` controla como a imagem preenche a view — `.scaleAspectFit` mantém a proporção com espaço nas bordas, enquanto `.scaleAspectFill` preenche tudo mas pode cortar partes. O `autoresizingMask` garante que a `imageView` se ajuste quando o tamanho da tela muda (rotação do dispositivo, por exemplo).

---

### Subtópico 2 — Loading images with UIImage (Carregando imagens)

Com a tela de detalhe criada, o próximo passo é fazer a navegação funcionar: quando o usuário toca em uma célula da lista, o `DetailViewController` deve abrir exibindo a imagem correta.

**Três mini-passos:**

**1. Passar o nome da imagem para o detalhe.** A propriedade `selectedImage` já existe no `DetailViewController`. Agora carregue a imagem dentro do `viewDidLoad()`, após a configuração da `imageView`:

```swift
if let imageToLoad = selectedImage {
    imageView.image = UIImage(named: imageToLoad)
}
```

O `UIImage(named:)` busca a imagem dentro do bundle do app pelo nome do arquivo. Usamos `if let` para desembrulhar o optional `selectedImage` com segurança — se por algum motivo estiver `nil`, nada acontece.

**2. Detectar o toque na célula.** No `ViewController`, implemente `tableView(_:didSelectRowAt:)`:

```swift
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = DetailViewController()
    vc.selectedImage = pictures[indexPath.row]
    navigationController?.pushViewController(vc, animated: true)
}
```

Esse método é chamado automaticamente pelo iOS quando o usuário toca em qualquer linha da tabela. O `indexPath.row` indica qual linha foi tocada.

**3. Empilhar o detalhe no navigation controller.** O `pushViewController` desliza a tela de detalhe sobre a lista, e o botão "Voltar" aparece automaticamente. O navigation controller mantém uma pilha de telas — `push` adiciona, voltar remove.

> **Diferença em relação ao Storyboard:** no curso original, o `didSelectRowAt` usa `storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController` para carregar a tela a partir do Storyboard. Em view code, simplesmente instanciamos com `DetailViewController()` — muito mais direto.

---

### Subtópico 3 — Final tweaks: hidesBarsOnTap and large titles (Ajustes finais)

Com a navegação funcionando, o curso sugere quatro melhorias de polimento. Em view code, todas são feitas identicamente ao original — nenhuma depende do Interface Builder.

**1. Esconder a navigation bar ao tocar na imagem**

Quando o usuário está vendo uma foto, a navigation bar pode atrapalhar. `hidesBarsOnTap` faz a barra desaparecer com um toque e reaparecer com outro. O cuidado é ativá-la só quando o detalhe está visível — caso contrário ela afetaria os toques na lista também.

Adicione esses dois métodos ao `DetailViewController`, logo após o `viewDidLoad()`:

```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnTap = true
}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.hidesBarsOnTap = false
}
```

`viewWillAppear` é chamado toda vez que a tela está prestes a aparecer, e `viewWillDisappear` quando está prestes a sumir. Usar esses dois juntos garante que a propriedade seja ligada e desligada no momento certo.

**2. Accessory indicator nas células (seta de disclosure)**

No curso original, isso é feito pelo Interface Builder. Em view code, configure isso diretamente no `cellForRowAt`:

```swift
cell.accessoryType = .disclosureIndicator
```

Essa seta cinza sinaliza ao usuário que tocar na linha vai abrir mais detalhes — é uma convenção visual amplamente usada no iOS (veja o app de Configurações).

**3. Título no detalhe**

Dentro do `viewDidLoad()` do `DetailViewController`, adicione:

```swift
title = selectedImage
```

O `title` é lido automaticamente pela navigation bar. Não precisa desembrulhar o optional porque tanto `title` quanto `selectedImage` são `String?` — a atribuição de um optional para outro é válida.

**4. Desativar títulos grandes no detalhe**

O `prefersLargeTitles = true` que ativamos no `ViewController` se propaga para todas as telas filhas. Para desativar só no detalhe, adicione ao `viewDidLoad()` do `DetailViewController`:

```swift
navigationItem.largeTitleDisplayMode = .never
```

Apple recomenda títulos grandes apenas na primeira tela do app — telas de conteúdo devem usar o estilo compacto padrão.

---

## Dia 18 — Desafios e revisão

> **Nota:** Não consegui acessar os subtópicos do Dia 18. Compartilhe o link dos subtópicos para refinamento.

### Subtópico 1 — Revisão do projeto

Antes de encarar os desafios, certifique-se de que o app funciona corretamente:

1. A lista exibe os 10 arquivos `nssl*` corretamente?
2. Ao tocar em um item, o `DetailViewController` abre com a imagem correta?
3. O botão "Voltar" funciona e retorna à lista?
4. A imagem é exibida com proporção correta em diferentes tamanhos de tela?

Se tudo estiver funcionando, você está pronto para os desafios.

---

### Subtópico 2 — Desafio 1: Ordenar as imagens alfabeticamente

Atualmente as imagens aparecem na ordem em que o `FileManager` as retorna, que pode variar. O desafio é ordenar a lista de forma previsível.

**Pista de sintaxe:**

```swift
pictures.sort()
```

Adicione essa linha no `viewDidLoad()` do `ViewController`, logo após o loop que preenche o array `pictures`. O método `sort()` modifica o array in-place em ordem crescente. Como os nomes dos arquivos são strings, a ordenação será alfabética automaticamente.

**Por que isso importa?** Consistência. O usuário espera ver uma ordem previsível, não dependente do sistema de arquivos.

---

### Subtópico 3 — Desafio 2: Mostrar a posição da imagem como subtítulo

Quando o usuário está visualizando uma imagem, é útil saber que está na "imagem 3 de 10", por exemplo. Esse número deve aparecer na barra de navegação do `DetailViewController`.

**Pista de sintaxe:**

Para isso funcionar, o `DetailViewController` precisa receber não só o nome da imagem, mas também a posição dela na lista. Você precisará adicionar uma segunda propriedade:

```swift
var selectedImageNumber: Int = 0
var totalImages: Int = 0
```

E no `ViewController`, ao navegar:

```swift
vc.selectedImageNumber = indexPath.row + 1
vc.totalImages = pictures.count
```

No `viewDidLoad()` do `DetailViewController`, monte o título:

```swift
title = "Imagem \(selectedImageNumber) de \(totalImages)"
```

---

### Subtópico 4 — Desafio 3: Compartilhar imagens com `UIActivityViewController`

O `UIActivityViewController` é o painel de compartilhamento nativo do iOS — o mesmo que aparece quando você compartilha uma foto no Photos. Com poucas linhas, você pode adicioná-lo ao seu app.

O fluxo é: o usuário toca em um botão de compartilhar → o painel aparece com opções (AirDrop, salvar na galeria, enviar por mensagem, etc.).

**Pista de sintaxe:**

Primeiro, adicione um botão na barra de navegação do `DetailViewController`. Isso deve ser feito no `viewDidLoad()`:

```swift
navigationItem.rightBarButtonItem = UIBarButtonItem(
    barButtonSystemItem: .action,
    target: self,
    action: #selector(shareTapped)
)
```

`.action` é o ícone padrão de compartilhamento (a caixa com seta para cima). O `target: self` e `action: #selector(shareTapped)` definem que o método `shareTapped` neste mesmo objeto será chamado quando o botão for tocado.

Agora implemente o método:

```swift
@objc func shareTapped() {
    guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
        print("Nenhuma imagem encontrada")
        return
    }

    let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
}
```

**O que é `@objc`?** O sistema de ação/alvo do UIKit é baseado no Objective-C. O `@objc` expõe o método Swift para esse sistema. Sempre que usar `#selector`, o método referenciado precisa de `@objc`.

**O que é `popoverPresentationController?.barButtonItem`?** No iPad, `UIActivityViewController` aparece como um popover (uma janela flutuante). Você precisa dizer de onde esse popover deve surgir — neste caso, do botão de compartilhar. No iPhone essa linha não tem efeito, mas é necessária para o iPad funcionar corretamente.

---

## Referência rápida — o que implementamos

| Arquivo | Responsabilidade |
|---|---|
| `SceneDelegate.swift` | Configura a janela e o `UINavigationController` sem Storyboard |
| `ViewController.swift` | Lista de imagens com `UITableViewController` |
| `DetailViewController.swift` | Exibe a imagem em tela cheia + botão de compartilhar |

---

## Próximos passos

Após completar os desafios do Dia 18, o projeto está concluído. Os próximos projetos do curso introduzirão:
- Múltiplas telas e `UITabBarController`
- Layouts com Auto Layout e constraints em código
- Comunicação entre view controllers com protocolos (delegate pattern)

---

*Tutorial gerado para o curso 100 Days of Swift — Projeto 1, adaptado para View Code sem Interface Builder.*
*Dias 16 e 17 revisados com o conteúdo real do curso. Dia 18 será refinado após execução de `./fetch_lesson.sh 18 1`.*
