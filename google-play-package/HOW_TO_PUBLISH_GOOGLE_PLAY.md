# GUIA COMPLETO: COMO PUBLICAR O "BRAIN DOTS" NA GOOGLE PLAY STORE

Parabéns! Todo o projeto do jogo **Brain Dots: Traço Único** foi estruturado, testado e empacotado nos padrões exigidos pela Google Play Store para 2026.

Este documento é o seu manual definitivo passo a passo para colocar o jogo no ar.

---

## 📁 1. O que está dentro da pasta `google-play-package`

Sua pasta foi organizada em 3 áreas essenciais:

```text
google-play-package/
├── playstore-listing/                  # Tudo o que a página da loja precisa
│   ├── icon-512x512.png                # Ícone oficial em alta definição (512x512)
│   ├── feature-graphic-1024x500.png    # Banner promocional obrigatório da Play Store (1024x500)
│   ├── store-listing.txt               # Textos de ASO (Título, Descrições, Tags, Categoria)
│   ├── privacy-policy.html             # Política de Privacidade pronta para hospedagem
│   └── screenshots/                    # 4 Capturas de tela reais do celular (1080x1920)
│       ├── screenshot_1_nivel11.png    # Gameplay do clássico enigma dos 9 pontos
│       ├── screenshot_2_mandala.png    # Tela de vitória e efeitos visuais
│       ├── screenshot_3_capitulos.png  # Menu com os 4 capítulos e 40 fases
│       └── screenshot_4_anuncio_dicas.png # Sistema de dicas com anúncios recompensados
│
├── android-source/                     # Código nativo do aplicativo Android (API 34)
│   ├── build.gradle / settings.gradle  # Configuração de compilação
│   └── app/
│       ├── build.gradle                # Configurado para Target SDK 34 (Android 14)
│       ├── src/main/AndroidManifest.xml
│       ├── src/main/java/              # MainActivity.java (WebView acelerada e imersiva)
│       ├── src/main/res/               # Ícones de launcher (hdpi, xhdpi, xxhdpi, etc.)
│       └── src/main/assets/www/        # Jogo offline completo incorporado
│
├── levels-system/                      # Sistema de expansão para criar novas fases
│   ├── add_new_level.py                # Script matemático para validar e criar fases 41+
│   ├── levels_data.json                # Banco de dados de todas as fases
│   └── README.md                       # Como gerar 10, 20 ou 50 fases em 1 segundo
│
└── .github/workflows/
    └── build-playstore.yml             # Robô de compilação na nuvem (gera o .AAB grátis)
```

---

## 🚀 2. Como Gerar o Arquivo `.aab` (Android App Bundle)

A Google Play Store não aceita mais arquivos `.apk` para novos apps; é **obrigatório** enviar um `.aab` (Android App Bundle).

Você tem 3 maneiras simples de obter seu arquivo `.aab`:

### Opção A: Pela Nuvem no GitHub Actions (Recomendado - Não precisa instalar nada!)
Você não precisa baixar nem instalar o Android Studio (que pesa mais de 15 GB):
1. Crie um repositório no seu GitHub (pode ser privado ou público).
2. Envie os arquivos desta pasta para o repositório.
3. Como já incluímos o arquivo `.github/workflows/build-playstore.yml`, o GitHub irá compilar o aplicativo automaticamente nos servidores dele!
4. Acesse a aba **Actions** no seu GitHub, clique na execução e baixe o arquivo `.aab` assinado pronto para a Play Store.

### Opção B: Via PWABuilder da Microsoft (2 Cliques no Navegador)
Se você hospedar o jogo (por exemplo, no GitHub Pages):
1. Acesse [https://www.pwabuilder.com](https://www.pwabuilder.com).
2. Cole a URL do seu jogo (ele já possui `manifest.json` e `sw.js` 100% configurados).
3. Clique em **Build My PWA** > **Android**.
4. Baixe o pacote pronto para Google Play Store gerado na hora.

### Opção C: Usando o Android Studio Localmente
Se você tiver ou preferir instalar o Android Studio:
1. Abra o Android Studio e selecione **Open**.
2. Abra a pasta `google-play-package/android-source`.
3. Vá no menu superior: **Build > Generate Signed Bundle / APK**.
4. Escolha **Android App Bundle** e clique em **Next** para gerar o arquivo `.aab`.

---

## 🏪 3. Configurando no Google Play Console

### 1. Criar a Conta de Desenvolvedor
- Acesse [https://play.google.com/console](https://play.google.com/console).
- Faça login com sua conta Google e efetue o pagamento da taxa única de US$ 25 (acesso vitalício).

### 2. Criar o Aplicativo
- Clique no botão **Criar app**.
- **Nome do app:** `Brain Dots: Traço Único`
- **Idioma padrão:** Português (Brasil)
- **Tipo de aplicativo:** Jogo (Game)
- **Gratuito ou pago:** Gratuito (Free)
- Aceite as declarações e clique em **Criar app**.

### 3. Ficha Principal da Loja (Store Listing)
No menu lateral esquerdo, vá em **Apresentação na loja > Ficha principal da loja**:
- **Nome do app:** Copie do arquivo `playstore-listing/store-listing.txt`.
- **Breve descrição:** Copie de `store-listing.txt`.
- **Descrição completa:** Copie de `store-listing.txt`.
- **Ícone do app:** Envie `playstore-listing/icon-512x512.png`.
- **Recurso gráfico:** Envie `playstore-listing/feature-graphic-1024x500.png`.
- **Capturas de tela:** Envie as 4 imagens da pasta `playstore-listing/screenshots/`.

### 4. Política de Privacidade
- No menu lateral, acesse **Conteúdo do app > Política de privacidade**.
- Você pode hospedar o arquivo `playstore-listing/privacy-policy.html` gratuitamente no GitHub Pages (basta criar um repositório chamado `brain-dots-privacy` e ativar o Pages) e colar o link gerado.

### 5. Conteúdo do App e Classificação Indicativa
Preencha os questionários guiados da Google Play:
- **Público-alvo e conteúdo:** Livre para todas as idades.
- **Anúncios:** Marque "Sim, meu app contém anúncios" (devido aos anúncios de dicas).
- **Classificação de conteúdo:** Responda o questionário simples (o jogo não tem violência, sexo, armas ou drogas) - ele receberá classificação Livre / PEGI 3.
- **Segurança dos dados:** Siga as instruções descritas no final do arquivo `store-listing.txt`.

---

## 📦 4. Enviando o Arquivo `.aab` e Lançando o Jogo

1. No menu lateral, vá em **Produção** (ou **Teste fechado**, se desejar testar com amigos primeiro).
2. Clique em **Criar novo lançamento**.
3. No campo **Pacotes de apps**, faça o upload do arquivo `.aab` que você gerou.
4. Digite as notas da versão:
   ```text
   Versão de lançamento 1.0.0!
   - 40 fases eulerianas com 4 capítulos temáticos.
   - Enigma original dos 9 pontos incluído.
   - 3 temas visuais (Cyber Neon, Dark e Sunset).
   - Sistema de dicas inteligentes e 100% jogável offline!
   ```
5. Clique em **Salvar** > **Revisar lançamento** > **Iniciar lançamento**.

Pronto! O Google Play costuma revisar o app em poucas horas ou em até 1 a 3 dias úteis. Assim que aprovado, seu jogo estará disponível para o mundo todo na Google Play Store!

---

## 🔄 5. Como Manter o Jogo Sempre Atualizado com Novas Fases

Para manter a promessa de atualizações frequentes no futuro:

1. Acesse a pasta `google-play-package/levels-system`.
2. Para adicionar mais 10 fases inéditas automaticamente:
   ```bash
   python add_new_level.py --generate 10
   ```
3. O script valida a matemática, checa a física de colisões e atualiza todos os arquivos do jogo instantaneamente.
4. No arquivo `android-source/app/build.gradle`, altere:
   - `versionCode 1` para `versionCode 2`
   - `versionName "1.0.0"` para `versionName "1.1.0"`
5. Gere o novo `.aab` e faça o upload da atualização no Google Play Console!
