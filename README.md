## Analysis of ice cream products to meet potential demand through review analysis
## レビュー解析による消費者の潜在需要を満たすアイスクリーム製品の分析

### Ⅰ Overview/概要
The overall theme is to analyze what makes "salable" ice cream.  
Ice cream is talked about in terms of various factors such as richness, flavor, and mouthfeel. In this, analyze from reviews what perspectives are actually consumers evaluate.  
It clarifies the positioning of existing brands based on consumers' evaluation perspectives.  
In addition, it examines the context of the reviews to find potential demand that is not being met by existing brands.

Target: 5 brands of vanilla ice cream (narrowing down to the most standard brands to avoid complicating this analysis)  
Data: A total of 950 online reviews  
Analysis method: Principal component analysis, natural language processing (morphological analysis, co-occurrence network)  

「売れる」アイスクリームの分析が全体のテーマ
濃厚さ、風味、口あたりといった様々な要素から語られるアイスクリームだが、実際に消費者がどのような観点で評価しているかをレビューから分析する。  
消費者の評価観点に基づいた、既存ブランドのポジショニングを明らかにする。  
合わせてレビューの文脈を考察し、既存ブランドでは満たされていない潜在需要を探る。

分析対象：バニラアイス5ブランド（分析の複雑化を避けるため王道に絞る）  
データ：オンラインレビュー 計950件  
分析手法：主成分分析、自然言語処理（形態素解析・共起ネットワーク）


### Ⅱ Flow of analysis/分析の流れ
1. Creating a list of frequently occurring words by morphological analysis of reviews  
　　Analyze consumers' perspectives in evaluating ice cream.
2. Principal component analysis using the identified perspectives as variables  
　　Create a positioning map for each brand based on how many times the perspective words (sweet, rich, etc.) appear in the reviews of each brand  
3. Create a co-occurrence network for reviews  
　　Consider the contexts in which the evaluation perspectives are used, in order to dig deeper into the potential demand of consumers. 

1.レビューの形態素解析による頻出単語リストの作成  
　　 アイスクリームを評価する上での消費者の観点を分析  
2.明らかになった観点を変数にした主成分分析の実行  
　　 観点となる単語（甘い・濃厚など）が各ブランドのレビューにどのくらい出現しているかを基に、各ブランドのポジショニングマップを作成  
3.レビューに対する共起ネットワークの作成  
　　 消費者の潜在需要を深掘りするために評価観点がどのような文脈で使用されているか考察 
  
### Ⅲ Others/その他
Requirement:R 4.0.0  
Author:KANDA Shinsuke
