###消費者の目の付け所偏


##CSV化と出現頻度
write.csv(masterDF, file = "master.csv")
master_freq = RMeCabFreq("master.csv")
master_freq2 = master_freq[-c(1063:1114,1468,1663,146,52),]  #名詞のうち記号とアイスなど当然のワードを削除


##使える名詞と形容詞だけ抽出&多い順にソート
master_F2 = subset(master_freq2, Info1 %in% c("名詞","形容詞"))
master_F3 = subset(master_F2, !Info2 %in% c("接尾","非自立","数"))
master_F4 = master_F3[order(master_F3$Freq,decreasing = T),]
master_F4 %>% head()



##グラフ
master_F4 %>%
  filter(Freq >=100) %>%
  mutate(Term = reorder(Term,Freq)) %>%
  ggplot(aes(Term,Freq)) +
  geom_col(fill = "lightgreen") +
  coord_flip() +
  ggtitle("レビューにおける頻出語")+
  ylab("出現回数")+
  xlab("単語")

