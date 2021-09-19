###準備編

library(dplyr)
library(tidyr)
library(stringr)
library(stringi)
library(RMeCab)
library(ggplot2)
library(ggthemes)
library(wordcloud)
library(tm)
library(lda)





##レビューサイトから星とコメントのみをスクレイピング
library(rvest)
# ハーゲンダッツ
haagen_rink = read_html("https://xxxxxxxxxxxxxxxxxxxxxx")
haagen_star = html_nodes(haagen_rink,".latest-0 , p , .latest-1")%>% html_text()%>% iconv(from = "UTF-8",to = "Shift-JIS")

# 爽
so_rink = read_html("https://xxxxxxxxxxxxxxxxxxxxxx")
so_star = html_nodes(so_rink,".latest-0 , p , .latest-1") %>% html_text()%>% iconv(from = "UTF-8",to = "Shift-JIS")

# MOW
mow_rink = read_html("https://xxxxxxxxxxxxxxxxxxxxxx")
mow_star = html_nodes(mow_rink,".latest-0 , p , .latest-1")%>% html_text()%>% iconv(from = "UTF-8",to = "Shift-JIS")

# 牧場しぼり
bokujo_rink = read_html("https://xxxxxxxxxxxxxxxxxxxxxx")
bokujo_star = html_nodes(bokujo_rink,".latest-0 , p , .latest-1")%>% html_text()%>% iconv(from = "UTF-8",to = "Shift-JIS")

# スーパーカップ
supercup_rink = read_html("https://xxxxxxxxxxxxxxxxxxxxxx")
supercup_star = html_nodes(supercup_rink,".latest-0 , p , .latest-1") %>% html_text()%>% iconv(from = "UTF-8",to = "Shift-JIS")




## 余計な文字列の削除→データフレーム化→余計な行の削除
haagen_star2 = haagen_star[-which(haagen_star %in% "退会済ユーザーです")]
haagenDF = data.frame(matrix(haagen_star2[5:354],ncol=2,byrow =TRUE),stringsAsFactors = FALSE)
haagenDF2 = haagenDF[-(171:175),]

so_star2 = so_star[-which(so_star %in% "退会済ユーザーです")]
soDF = data.frame(matrix(so_star2[4:415],ncol=2,byrow =TRUE),stringsAsFactors = FALSE)
soDF2 = soDF[-(201:206),]

mow_star2 = mow_star[-which(mow_star %in% "退会済ユーザーです")]
mowDF = data.frame(matrix(mow_star2[4:425],ncol=2,byrow =TRUE),stringsAsFactors = FALSE)
mowDF2 = mowDF[-211,]

bokujo_star2 = bokujo_star[-which(bokujo_star %in% "退会済ユーザーです")]
bokujoDF = data.frame(matrix(bokujo_star2[4:185],ncol=2,byrow =TRUE),stringsAsFactors = FALSE)
bokujoDF2 = bokujoDF[-91,]

supercup_star2 = supercup_star[-which(supercup_star %in% "退会済ユーザーです")]
supercupDF = data.frame(matrix(supercup_star2[4:565],ncol=2,byrow =TRUE),stringsAsFactors = FALSE)
supercupDF2 = supercupDF[-281,]


##5ブランド連結データフレームの作成
masterDF = rbind(haagenDF2,soDF2,mowDF2,bokujoDF2,supercupDF2)
