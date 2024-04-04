dat<-federalistPapers
str(dat)
x<-data.frame()
for(i in 1:length(dat)){
  tmpF<-dat[[i]]$meta
  tmpP<-tmpF$number
  tmpA<-tmpF$author
  tmpJ<-tmpF$journal
  tmpD<-tmpF$date
  tmp<-data.frame(pageNumber=tmpP,author=tmpA,journel=tmpJ,date=tmpD)
  x<-rbind(tmp,x)
}#data frame for part 1
y<-data.frame()
for(i in 1:length(dat)){
  tmpF<-dat[[i]]$meta
  tmpP<-tmpF$number
  tmpA<-tmpF$author
  tmpJ<-tmpF$journal
  tmpD<-tmpF$date
  tmp<-data.frame(pageNumber=tmpP,author=tmpA,journel=tmpJ,date=tmpD,
                  dayOfWeek=wday(tmpD,label = TRUE))
  y<-rbind(tmp,y)
}#same data frame except it has a column for which day of the week
z<-data.frame(y$author,y$dayOfWeek)
zz<-table(z)#table that says how many times on each day of the week
# that an author or author group wrote a page
Hamilton<-subset(y,author=='HAMILTON')
Madison<-subset(y,author=='MADISON')
Jay<-subset(y,author=='JAY')
Hamilton_and_Madison<-subset(y,author=='HAMILTON AND MADISON')
Hamilton_or_Madison<-subset(y,author=='HAMILTON OR MADISON')
M<-matrix(data=NA,nrow=29,ncol=5)
D<-data.frame()
author<-rbind(Hamilton$date,Madison$date,Jay$date,Hamilton_and_Madison$date
              ,Hamilton_or_Madison$date,D) 
#data frame with all of authors and dates
