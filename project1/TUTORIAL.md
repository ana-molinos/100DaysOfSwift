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

## Dia 18 — Wrap up

O Dia 18 é dedicado à revisão do que foi aprendido e aos três desafios do projeto. O curso não entrega as respostas — o objetivo é que você escreva o código por conta própria. Como diz o Paul Hudson: "não há aprendizado sem esforço". Tente resolver cada desafio antes de ler as dicas.

---

### Subtópico 1 — Wrap up (Revisão e desafios)

Antes de avançar, confirme que o app está funcionando corretamente: a lista exibe os arquivos `nssl*`, tocar em um item abre o `DetailViewController` com a imagem correta, o botão "Voltar" funciona, e a navigation bar some e volta ao tocar na tela do detalhe.

O curso lista tudo que foi coberto neste projeto: table views, image views, bundles, `FileManager`, typecasting, view controllers, Auto Layout, `UIImage`, e mais. Se algum desses conceitos ainda parecer nebuloso, é normal — o aprendizado acontece por repetição, e você vai encontrar todos eles de novo nos próximos projetos.

---

**Desafio 1 — Exibir as imagens em ordem alfabética**

As imagens podem ou não estar ordenadas dependendo do sistema de arquivos — o comportamento do `FileManager` não é garantido. O desafio é garantir que estejam sempre em ordem.

Você já viu que arrays têm um método `sort()`. A questão aqui não é qual método usar, mas *onde* chamá-lo. Você poderia ordená-las a cada iteração do loop, mas isso é trabalho desnecessário. Pense: qual é o momento mais eficiente para ordenar — depois que todas as imagens já foram carregadas no array?

---

**Desafio 2 — Mostrar "Picture X of Y" no título do detalhe**

Em vez de mostrar apenas o nome do arquivo como título, o desafio é exibir algo como "Picture 3 of 10" — onde 3 é a posição da imagem na lista e 10 é o total.

Para isso, o `DetailViewController` precisa receber duas informações extras além do nome da imagem. O padrão já é conhecido: criar propriedades no destino e preenchê-las antes do `pushViewController`.

O curso sugere:

```swift
var selectedPictureNumber = 0
var totalPictures = 0
```

No `ViewController`, dentro do `didSelectRowAt`, você já passa `pictures[indexPath.row]` para `selectedImage`. Use o mesmo `indexPath.row` para `selectedPictureNumber` — mas lembre-se que arrays começam em 0 e o usuário espera contar a partir de 1.

No `viewDidLoad()` do `DetailViewController`, monte o título com interpolação de string. Você já usou isso antes:

```swift
title = "Este valor é \(minhaVariavel)"
```

Como ficaria para combinar `selectedPictureNumber` e `totalPictures` numa string?

---

**Desafio 3 — Aumentar o tamanho da fonte nas células**

O curso original resolve isso no Interface Builder — selecionando o label da célula e ajustando o tamanho da fonte nos atributos. Em view code, fazemos isso diretamente no `cellForRowAt`, onde a célula é configurada.

A `UITableViewCell` com estilo `Basic` tem uma propriedade `textLabel` com um objeto `UILabel` dentro. Um `UILabel` tem uma propriedade `font` do tipo `UIFont`. Explore o que `UIFont` oferece para definir uma fonte com tamanho customizado — experimente valores diferentes e veja o que fica bom visualmente.

---

**Uma nota sobre as dicas**

O curso é explícito: tente os desafios por pelo menos 30 minutos antes de olhar as dicas. Cada tentativa errada é aprendizado — você vai lembrar muito mais do caminho correto por ter percorrido os errados primeiro. As dicas acima existem para desbloqueá-la se travar, não para substituir o esforço.

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
*Conteúdo dos dias 16, 17 e 18 revisado com base no conteúdo real do site.*
