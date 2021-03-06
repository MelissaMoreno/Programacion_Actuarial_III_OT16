# Clase del 25/Agosto/2016
#Crear vectores con la funci�n vector
 x <- vector(mode="numeric", length = 5L)
 x

#Crear vectores con la funci�n c
x <- c(0.5,0.6)
x
class(x)

x <- c(TRUE, FALSE, T, F)
x
class(x)

x <- 10:0
x
class(x)

x <- c(1+2i,5,3+9i,-4-5i)
x
class(x)

x <- c("a", "b", "c", "d", "e")
x
class(x)


#Mezcla de objetos en unvector

y <- c(1.7,"a")
y
class(y)

y<- c(TRUE,2)
y
class(y)

y <- c ("a", TRUE)
y
class(y)

y <- c(TRUE, 10L, 8.5, 1+1i, "a")
y
class(y)

#Orden de coacci�n/coerci�n explicita
#1 character
#2 complex
#3 numeric
#4 integer
#5 logical


#Coerci�n explicita

z <- 0:6
class(z)
as.numeric(z)
as.logical(z)
as.character(z)

z <- c(1+2.i, 3+4i, 8, 0+3i, 0)
as.logical(z)

z <- c("Programaci�n","Actuarial","III")
as.numeric(z)
as.logical(z)
as.complex(z)

#Lista- almacena cada objeto con su propia clase, ocupa m�s espacio


#LISTAS (es como un vector, pero de vectores y c/u tiene su propia clase)
x<- list(1,"a",TRUE,1+4i)
x
class(x)


#MATRICES

 m <- matrix(nrow = 2, ncol = 3)
 m

dim(m) 

attributes(m)

#Cambio de dimensiones de 2x3 a 3x2
dim(m) <- c(3,2)
m

#Crear una matriz con datos
m <- matrix(1:6,3,2)
m

m <- matrix(1:6,3,2,T)
m

m <- matrix(1:6,2,2,T)
m

m <- matrix(1:6,3,3,T)
m

 class(m)
 str(m)
 
 dim(m) <- c(2,5) #Esto va a producir error
 
 x <- c(1,2,3)
 y <- c("a","b","c")
 z <- c(x,y)
 z
 
 m1 <- rbind(m,x)
 m1
 
 m2 <- cbind(m,x)
 m2
 
 m3 <- rbind(m1,y)
 m3
 
 m4 <- cbind(m2,y)
 m4
 
 
 
 #Factores
 
 x <- factor(c("si","no","si","si","no","si","no"))
 x
 table(x) #Cuenta el n�mero de "no" y "si" que aparecen
 unclass(x) #Ense�a la forma en que lo almacena, conforme a su nivel
 
 x <- factor(c("si","no","si","si","no","si","no"), levels = c("si","no"))
 x
 unclass(x)
 
 x <- factor(c("azul","azul", "rojo","azul","amarillo","verde","azul"))
 x
 table(x)
 
 
 #NA Valor vacio, no se proporciono
 #NaN no es un n�mero, valor que no esta definido, operacion matem�tica indefinida (1/0)

 #Valores Faltantes
 x <- c(1,2,NA,10,3)
 is.na(x)
 is.nan(x)
 
 x <- c(1,2,NaN,10,3)
 is.na(x)
 is.nan(x)
 
 
 #Data Frames
 x<- data.frame(Erick = 1:4, Lori = c(T,T,F,F))
 row.names(x) <- c("Primero","segundo","tercero","cuarto")  
 # row.names Cambia los nombres de las filas
  x
 nrow(x)
 ncol(x)
 
 attributes(x)
 
 names(x) <- c("Judy","Mely")
 x
 
 #Los nombres no son exclusivos de los data frames
 x <- 1:3
 names(x) #NULL
 names(x) <- c("Hugo","Paco","Luis")
  x
  
x <- list(a=1:10,b=100:91,c=51:60)  
 x
 names(x) <- c("Seq1","SEQ2","sEq3")
 x
  
 m <- matrix(1:4,2,2)
 
 m
 
 attributes(m)
 dimnames(m) <- list(c("fil1","fil2"), c("col1","col2"))
 m
 
 m <- matrix(nrow=5,ncol=6)
 m
 dimnames(m) <- list((1:5),c("A","B","C","D","E","F"))
 m
 
 #clase 01/09/2016
 
 #Lectura de datos
getwd()
setwd("~/GitHub/Programacion_Actuarial_III")
data <- read.csv("Datos_S&P.csv")
data <- read.table("Datos_S&P.csv",T,",", nrows = 100)

clases <- sapply(data, class)
#Aplica la funci�n class columna por columna

data <- read.table("Datos_S&P.csv",T,",", colClasses = clases)
data
 clases


 #Clase 05/09/2016
 
 #dump dput son recuperables
 
 #Uso de dput y dget
 y <- data.frame(a=1,b="a")
 dput(y)
 dput(y,file = "y.R")
 
 nueva.y <- dget("y.R")
 y
 nueva.y


x <- "Programaci�n Actuarial III"
y <- data.frame(a=1,b="a")
dump(c("x","y"),file = "data.R")

rm(x,y)
 
x
y

source("data.R")
x
y


z <- airquality
dput(z)
dput(z,file = "airquality")
z


con <- url ("http://www.fcfm.buap.mx/","r")
x <- readLines(con,7)
x


#Subconjuntos
#Creamos un vector
x <- c("a","b","c","c","d","e")
#Veamos el vector
x
#Extraemos elementos con []
x[1]
x[2]
#Tambi�n podemos extraer una secuancia de elementos
x [1:4]
#Es posible extraer los elementos que cumplen restricci�n
x [x>"b"]
#De manera equivalente se puede obtener un vector l�gico
u <- x == "c"
u
x [u]


#Creamos una lista
x <- list(foo=1:4, bar=0.6)
#Extraemos el primer elemento de la lista,
#este elemento es una lista que contiene una secuencia

x [1] #Lo extrae como una lista (clase del conjunto)

#Extraemos nuevamente el primer elemento de la lista,
#ahora el elemento de la secuencia en si 

x [[1]] #Lo extrae como un vector (clase del elemento)

#Extraemos un elemento por nombre
x$bar

x[["bar"]]

x["bar"]


#07/Sep/2016

x$foo[2] #Extrae el segundo elemento de la primera secuencia

#Creamos una lista de 3 elementos
x <- list(foo=1:4, bar=0.6, baz ="Hola")
#Extraemos el primer y tercer elemento de la lista
x[c(1,3)]


x[[c(1,3)]] #Muestra el tercer elemento del primer objeto


x <- list(foo=1:4, bar=0.6, baz ="Hola")
name <- "foo"
x[[name]]

x$name

x$foo


#Se pueden extraer elementos de los elementos extraidos
x <- list(a=list(10,12,14), b=list(3.14,2.81))
x [[c(1,3)]] 

x [[1]][[3]]

#Un corchete lo extrae como lista y con doble como vector

x[[c(2,1)]]


#Extracci�n de datos de matrices
x <- matrix(1:6,2,3)
x
x[1,2]
x[2,1]
x[1,]
x[,2]



x <- matrix(1:6,2,3)
x
#El resultado es un vector
x[1,2]
#Con drop=FALSE, se ,mantiene la dimensi�n y el resultado ser� una matriz
x[1,2, drop=FALSE]

x <- matrix(1:6,2,3)
x
#si dejamos solamente el espacio, el resultado ser� un vector
x [1,]
#Si usamos drop=FALSE, el resultado ser� una matriz
x[1,,drop=FALSE]


x <- list(aardvark = 1:5)
x$a #Extracci�n con $ no pide coincidencia exacta
x[["a"]] #Extracci�n con [[]]  pide coincidencia exacta
x[["a", exact=FALSE]] #Extracci�n con [[]]  pide coincidencia exacta pero con exact=FALSE ya no
#Solo funciona con doble corchete porque es el que tiebe estos atributos



airquality$Ozone

airquality[["O"]]

#Valores Faltantes
airquality[1:6,] #Extrae las primeras 6 filas, toda la fila, del data frame y sigue siendo uno.
completos <- complete.cases(airquality)
completos #Resulta un vector l�gico son 153 que es el n�mero de registros y muestra como TRUE los 
#completos y como false los incompletos

completos <- complete.cases(airquality)
airquality[completos,] #Extrae todas las filas con datos completos
airquality[completos,][1:6,] #Extrae las primeras 6 filas con datos completos

airquality[1:6,][completos,]




#Operaciones vectorizadas

x <- 1:4; y <- 6:9
x+y  #Suma cada elemento con otro elemento (1er con 1er...)
x>2 #Dice cuales si son mayores que dos de los elementos de x
x>=2 #Dice cuales si son mayores o iguales que dos de los elementos de x
y==8 #Dice cuales si son iguales que 8 de los elementos de y (evaluaci�n l�gica de = debe ser ==)
x*y #Multiplica cada elemento con otro elemento (1er con 1er...)
x/y #Divide cada elemento con otro elemento (1er con 1er...)



#Operaciones con matrices
x <- matrix(1:4,2,2); y <- matrix(rep(10,4),2,2) #Repite 10 cuatro veces rep(10,4)
x*y #Multiplica cada elemento con otro elemento (1er con 1er...)
x/y #Divide cada elemento con otro elemento (1er con 1er...)
x%*%y #Multiplicaci�n de matrices (Si x es mxn y y es nxp resulta mxp)



# 08/Sep/2016

#If-else  if(<condicion>){algunas instrucciones}else{m�s instrucciones}

if (x>3) {y <- 10} else {y <- 0}
y <- if(x>3) {10} else {0}

for(i in 1:10) {print(i)}  #for each

x <- c("a","b","c","d")
for(i in 1:4){print(x[i])} 


for(i in seq_along(x)){print(x[i])} 

for(letra in x){print(letra)} 

for(i in 1:4)print(x[i]) 


x<- matrix(1:6,2,3)

for(i in seq_len(nrow(x))){for (j in seq_len(ncol(x))){print(x[i,j])}}


