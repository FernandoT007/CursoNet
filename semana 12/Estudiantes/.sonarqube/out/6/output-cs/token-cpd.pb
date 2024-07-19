Í
‚D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Domain\Matriculas\MatriculaErrors.cs
	namespace 	
Estudiantes
 
. 
Domain 
. 

Matriculas '
;' (
public 
static 
class 
MatriculaErrors #
{ 
public 
static 
Error 
NotFound "
=# $
new% (
(( )
$str 
, 
$str		 -
)

 
;

 
} õ
|D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Domain\Matriculas\Matricula.cs
	namespace 	
Estudiantes
 
. 
Domain 
. 

Matriculas '
;' (
public 
sealed 
class 
	Matricula 
: 
Entity  &
{ 
private 
	Matricula 
( 
Guid		 
id		 
,		 
Guid

 
estudianteId

 
,

 
Guid 
cursoId 
, 
Guid 
	docenteId 
, 
DateTime 
fechaMatricula 
) 	
:
 
base 
( 
id 
) 
{ 
EstudianteId 
= 
estudianteId #
;# $
CursoId 
= 
cursoId 
; 
FechaMatricula 
= 
fechaMatricula '
;' (
	DocenteId 
= 
	docenteId 
; 
} 
public 

Guid 
EstudianteId 
{ 
get "
;" #
private$ +
set, /
;/ 0
}1 2
public 

Guid 
CursoId 
{ 
get 
; 
private &
set' *
;* +
}, -
public 

Guid 
	DocenteId 
{ 
get 
;  
private! (
set) ,
;, -
}. /
public 


Estudiante 
? 

Estudiante !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 

DateTime 
FechaMatricula "
{# $
get% (
;( )
private* 1
set2 5
;5 6
}7 8
public 

static 
Result 
< 
	Matricula "
>" #
Create$ *
(* +
Guid 
estudianteId 
, 
Guid 
cursoId 
, 
Guid 
	docenteId 
, 
DateTime   
fechaMatricula   
)!! 
{"" 
var## 
	matricula## 
=## 
new## 
	Matricula## %
(##% &
Guid$$ 
.$$ 
NewGuid$$ 
($$ 
)$$ 
,$$ 
estudianteId%%
 
,%% 
cursoId&&
 
,&& 
	docenteId''
 
,'' 
fechaMatricula((
 
))) 	
;))	 

return++ 
	matricula++ 
;++ 
},, 
}-- Ñ
„D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Domain\Estudiantes\EstudianteErrors.cs
	namespace 	
Estudiantes
 
. 
Domain 
. 
Estudiantes (
;( )
public 
static 
class 
EstudianteErrors $
{ 
public 
static 
Error 
NotFound "
=# $
new% (
(( )
$str 
, 
$str		 -
)

 
;

 
} ¤
‡D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Domain\Matriculas\IMatriculaRepository.cs
	namespace 	
Estudiantes
 
. 
Domain 
. 

Matriculas '
;' (
public 
	interface  
IMatriculaRepository %
{ 
Task 
< 	
	Matricula	 
? 
> 
GetByIdAsync !
(! "
Guid" &
id' )
,) *
CancellationToken+ <
cancellationToken= N
=O P
defaultQ X
)X Y
;Y Z
void 
Add	 
( 
	Matricula 
	Matricula  
)  !
;! "
} «
‰D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Domain\Estudiantes\IEstudianteRepository.cs
	namespace 	
Estudiantes
 
. 
Domain 
. 
Estudiantes (
;( )
public 
	interface !
IEstudianteRepository &
{ 
Task 
< 	

Estudiante	 
? 
> 
GetByIdAsync "
(" #
Guid# '
id( *
,* +
CancellationToken, =
cancellationToken> O
=P Q
defaultR Y
)Y Z
;Z [
void 
Add	 
( 

Estudiante 

Estudiante "
)" #
;# $
} Ñ
~D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Domain\Estudiantes\Estudiante.cs
	namespace 	
Estudiantes
 
. 
Domain 
. 
Estudiantes (
;( )
public 
sealed 
class 

Estudiante 
:  
Entity! '
{ 
public 


Estudiante 
( 
Guid 
	usuarioId 
, 
Guid		 
id		 
)

 	
:

	 

base

 
(

 
id

 
)

 
{ 
	UsuarioId 
= 
	usuarioId 
; 
} 
public 

Guid 
	UsuarioId 
{ 
get 
;  
private! (
set) ,
;, -
}. /
public 

static 
Result 
< 

Estudiante #
># $
Create% +
(+ ,
Guid 
	usuarioId 
) 
{ 
var 

estudiante 
= 
new 

Estudiante '
(' (
Guid 
. 
NewGuid 
( 
) 
, 
	usuarioId
 
) 	
;	 

return 

estudiante 
; 
} 
} Ý(
{D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Domain\Abstractions\Result.cs
	namespace 	
Estudiantes
 
. 
Domain 
. 
Abstractions )
;) *
public 
class 
Result 
{ 
	protected 
internal 
Result 
( 
bool "
	isSuccess# ,
,, -
Error. 3
error4 9
)9 :
{ 
if		 

(		 
	isSuccess		 
&&		 
error		 
!=		 !
Error		" '
.		' (
None		( ,
)		, -
{

 	
throw 
new %
InvalidOperationException /
(/ 0
)0 1
;1 2
} 	
if 

( 
! 
	isSuccess 
&& 
error  
==! #
Error$ )
.) *
None* .
). /
{ 	
throw 
new %
InvalidOperationException /
(/ 0
)0 1
;1 2
} 	
	IsSuccess 
= 
	isSuccess 
; 
Error 
= 
error 
; 
} 
public 

bool 
	IsSuccess 
{ 
get 
;  
}! "
public 

bool 
	IsFailure 
=> 
! 
	IsSuccess '
;' (
public 

Error 
Error 
{ 
get 
; 
} 
public 

static 
Result 
Success  
(  !
)! "
=># %
new& )
() *
true* .
,. /
Error0 5
.5 6
None6 :
): ;
;; <
public 

static 
Result 
Failure  
(  !
Error! &
error' ,
), -
=>. 0
new1 4
(4 5
false5 :
,: ;
error< A
)A B
;B C
public 

static 
Result 
< 
TValue 
>  
Success! (
<( )
TValue) /
>/ 0
(0 1
TValue1 7
value8 =
)= >
=>   
new   
(   
value   
,   
true   
,   
Error   
.   
None   #
)  # $
;  $ %
public"" 

static"" 
Result"" 
<"" 
TValue"" 
>""  
Failure""! (
<""( )
TValue"") /
>""/ 0
(""0 1
Error""1 6
error""7 <
)""< =
=>## 
new## 
(## 
default## 
,## 
false## 
,## 
error## 
)##  
;##  !
public%% 

static%% 
Result%% 
<%% 
TValue%% 
>%%  
Create%%! '
<%%' (
TValue%%( .
>%%. /
(%%/ 0
TValue%%0 6
?%%6 7
value%%8 =
)%%= >
=>&& 
value&& 
is&& 
not&& 
null&& 
?'' 
Success'' 
('' 
value'' 
)'' 
:(( 
Failure(( 
<(( 
TValue(( 
>(( 
((( 
Error(( 
.(( 
	NullValue(( '
)((' (
;((( )
}** 
public,, 
class,, 
Result,, 
<,, 
Tvalue,, 
>,, 
:,, 
Result,, $
{-- 
private.. 
readonly.. 
Tvalue.. 
?.. 
_value.. #
;..# $
	protected00 
internal00 
Result00 
(00 
Tvalue00 $
?00$ %
value00& +
,00+ ,
bool00- 1
	isSuccess002 ;
,00; <
Error00= B
error00C H
)00H I
:11 
base11 

(11
 
	isSuccess11 
,11 
error11 
)11 
{22 
_value33 
=33 
value33 
;33 
}44 
[66 
NotNull66 
]66 
public77 

Tvalue77 
Value77 
=>77 
	IsSuccess77 $
?88 
_value88 
!88 
:99 
throw99 
new99 %
InvalidOperationException99 *
(99* +
$str99+ \
)99\ ]
;99] ^
public;; 

static;; 
implicit;; 
operator;; #
Result;;$ *
<;;* +
Tvalue;;+ 1
>;;1 2
(;;2 3
Tvalue;;3 9
value;;: ?
);;? @
=>;;A C
Create;;D J
(;;J K
value;;K P
);;P Q
;;;Q R
}== Ö
€D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Domain\Abstractions\IUnitOfWork.cs
	namespace 	
Estudiantes
 
. 
Domain 
. 
Abstractions )
;) *
public 
	interface 
IUnitOfWork 
{ 
Task 
< 	
int	 
> 
SaveChangesAsync 
( 
CancellationToken 0
cancellationToken1 B
=C D
defaultE L
)L M
;M N
} ¸
zD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Domain\Abstractions\Error.cs
	namespace 	
Estudiantes
 
. 
Domain 
. 
Abstractions )
;) *
public 
record 
Error 
( 
string 
Code  
,  !
string" (
Name) -
)- .
{ 
public 

static 
Error 
None 
= 
new "
(" #
string$ *
.* +
Empty+ 0
,0 1
string2 8
.8 9
Empty9 >
)? @
;@ A
public 

static 
Error 
	NullValue !
=" #
new$ '
(' (
$str( 9
,9 :
$str: W
)W X
;X Y
} ²
{D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Domain\Abstractions\Entity.cs
	namespace 	
Estudiantes
 
. 
Domain 
. 
Abstractions )
;) *
public 
abstract 
class 
Entity 
{ 
	protected 
Entity 
( 
) 
{ 
} 
	protected 
Entity 
( 
Guid 
id 
) 
{ 
Id 

= 
id 
; 
}		 
public

 

Guid

 
Id

 
{

 
get

 
;

 
init

 
;

 
}

  !
} 