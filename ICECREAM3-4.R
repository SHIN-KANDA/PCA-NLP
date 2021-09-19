##12観点を使う文脈調査編

##Ngram(n=2)の作成
#降順にした後、12の観点を含む共起のみを抽出

ngram = NgramDF("master.csv",type = 1, N = 2,pos = c("名詞","形容詞","動詞"),)
ngram2 = ngram[order(ngram$Freq,decreasing = T),]
ngram3 = ngram2[(ngram2$Ngram1 == "味"|ngram2$Ngram1 == "濃厚"|ngram2$Ngram1 == "甘い"|
                  ngram2$Ngram1 == "ミルク"|ngram2$Ngram1 == "ボリューム"|ngram2$Ngram1 == "量"|
                  ngram2$Ngram1 == "味わい"|ngram2$Ngram1 == "後味"|ngram2$Ngram1 == "値段"|
                  ngram2$Ngram1 == "コク"|ngram2$Ngram1 == "氷"|ngram2$Ngram1 == "なめらか"|
                   ngram2$Ngram2 == "味"|ngram2$Ngram2 == "濃厚"|ngram2$Ngram2 == "甘い"|
                   ngram2$Ngram2 == "ミルク"|ngram2$Ngram2 == "ボリューム"|ngram2$Ngram2 == "量"|
                   ngram2$Ngram2 == "味わい"|ngram2$Ngram2 == "後味"|ngram2$Ngram2 == "値段"|
                   ngram2$Ngram2 == "コク"|ngram2$Ngram2 == "氷"|ngram2$Ngram2 == "なめらか"),]


##出現頻度10以上のものについて共起ネットワークの作成
library(igraph)
ngram4 = filter(ngram3,ngram3$Freq>=10)
wng = graph.data.frame(ngram4)
aaa = V(wng)
tkplot(wng,vertex.label=aaa$name,layout=layout.fruchterman.reingold,vertex.size=1,edge.color = "Pink",
       vertex.shape = "circle",vertex.label.color = "black",vertex.frame.color = "black",vertex.size = 15)

