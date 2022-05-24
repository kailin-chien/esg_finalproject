---
title: "碳排放管理對於企業股價之影響"
author: "Names _____"
date: "5/17/2022"
output: html_document
---
<style>
  body { background-color: #A9CAAB; }
  pre, pre:not([class]) { background-color: gainsboro; }
</style>
      
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE, warning = FALSE, message = FALSE)
library(tidyverse)
library(readxl)
library(caret)
library(tidyverse)
library(rpart)
library(rpart.plot)
library(rsample) 
library(randomForest)
library(modelr)
library(corrplot)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(DT)
    
esg_df<- read_excel("data/ACWI-ESG-Results_1.xlsx")
esg_uni_df <-read_excel("data/ACWI-ESG-Universal-Results_1.xlsx")
    
# override the default setting of ggplot
theme_set(theme_minimal())
```
    
## 研究方法
    
利用MSCI ACWI Europe ESG Leaders Index 中的個股與其碳排管理指標，進行單因子迴歸分析，以探討「碳排管理是否能帶來超額報酬」之課題。由於產業間業務性質差異甚大，因此也會將個股按照產業區分，以達到產業中立之目的。
    
## 研究動機
    
分析師報告中證實MSCI ACWI ESG Leaders Index的確在2020年疫情爆發之後較MSCI ACWI Index取得相對好的報酬。近期歐盟祭出2050年碳中和目標與一系列政策，企業因此面臨低碳轉型風險，因此我們希望將樣本池鎖定歐盟企業，且著重於ESG中的碳排放管理指標，期許能夠針對這個課題得出一些新發現。


