rm(list = ls())
# specify path weher your quantlets are stored
sRootPath = "C:/Users/Christoph/Documents/Gitlab/SFE-ToDo/"
# define a pattern for the folder names containing quantlets
sProject = "QID"

listofQl = list.dirs(sRootPath, full.names = FALSE)
listofQl = listofQl[grepl(sProject, listofQl)]

require(yaml)
Metainfos = as.list(rep(NA, length(listofQl)))
Keywordstoreplace = as.list(rep(NA, length(listofQl)))
for(iCounter in 1:length(listofQl)){
  
  # reset name of quantlet
  sNameQuantlet = listofQl[iCounter]
  
  # set working directory
  setwd(paste(sRootPath, sNameQuantlet, sep =""))
  
  
  if(file.exists("Metainfo.txt")){
    Meta               = readChar("Metainfo.txt", file.info("Metainfo.txt")$size)
    Metainfos[[iCounter]] = try(yaml.load(Meta), silent = FALSE)
    keywordspage       = readLines("http://quantnet.wiwi.hu-berlin.de/index.php?p=searchResults&w=allkeywords&sort=f")
    mypattern          = 'title=([^<]*)>'
    datalines          = grep(mypattern, keywordspage, value = TRUE)
    getexpr            = function(s, g) y = substring(s, g, g + attr(g, 'match.length') - 1)
    gg                 = gregexpr(mypattern, datalines)
    matches            = mapply(getexpr, datalines, gg)
    matches            = sub("title=\"", "", matches)
    matches            = sub("\">", "", matches)
    result             = gsub(mypattern,'\\1',matches)
    names(result)      = NULL
    if("Keywords" %in% names(Metainfos[[iCounter]])){ 
    keywords           = unlist(strsplit(Metainfos[[iCounter]]$Keywords, ", "))
    lkeywords          = keywords %in% result
    if(!all(lkeywords)){
      Keywordstoreplace[[iCounter]]$Name = sNameQuantlet  
      Keywordstoreplace[[iCounter]]$keywords =   keywords[!lkeywords]
    }
    }
    
  }
}

# display metainfos and name of quantlets
Metas = as.matrix(Metainfos)
colnames(Metas) = c("Meta Infos")

# create list of quantlets
Quantlets = as.matrix(listofQl)
colnames(Quantlets) = c("Quantlets")

# show metainfos parsed by yaml or errors created for each quantlet
OverView = cbind(Metas, Quantlets)
View(OverView)

