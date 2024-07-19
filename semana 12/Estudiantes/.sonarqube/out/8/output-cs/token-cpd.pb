Æ
ÉD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Services\ICacheService.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Services" *
;* +
public 
	interface 
ICacheService 
{ 
Task 
< 	
T	 

?
 
> 
GetCacheValueAsync 
<  
T  !
>! "
(" #
string# )
key* -
)- .
;. /
Task 
SetCacheValueAsync	 
< 
T 
> 
( 
string %
key& )
,) *
T+ ,
value- 2
,2 3
TimeSpan4 <
?< =
expirationTime> L
=M N
nullO S
)S T
;T U
} ˘
ÜD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Services\IUsuariosService.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Services" *
;* +
public 
	interface 
IUsuariosService !
{ 
Task 	
<	 

bool
 
> 
UsuarioExistsAsync "
(" #
Guid# '
	usuarioId( 1
,1 2
CancellationToken3 D
cancellationTokenE V
)V W
;W X
} ˘
ÜD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Services\IDocentesService.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Services" *
;* +
public 
	interface 
IDocentesService !
{ 
Task 
< 	
bool	 
> 
DocenteExistsAsync !
(! "
Guid" &
	docenteId' 0
,0 1
CancellationToken2 C
cancellationTokenD U
)U V
;V W
} Ò
ÑD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Services\ICursosService.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Services" *
;* +
public 
	interface 
ICursosService 
{ 
Task 
< 	
bool	 
> 
CursoExistsAsync 
(  
Guid  $
cursoId% ,
,, -
CancellationToken. ?
cancellationToken@ Q
)Q R
;R S
} ‹
ñD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Matriculas\GetMatricula\MatriculaResponse.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "

Matriculas" ,
., -
GetMatricula- 9
;9 :
public 
sealed 
record 
MatriculaResponse &
( 
Guid 
Id	 
, 
Guid 
EstudianteId	 
, 
Guid 
CursoId	 
, 
Guid 
	DocenteId	 
, 
DateTime		 
FechaMatricula		 
) 
; ˝
ùD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Matriculas\GetMatricula\GetMatriculaQueryHandler.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "

Matriculas" ,
., -
GetMatricula- 9
;9 :
internal 
sealed	 
class $
GetMatriculaQueryHandler .
:/ 0
IQueryHandler1 >
<> ?
GetMatriculaQuery? P
,P Q
MatriculaResponseR c
>c d
{ 
private		 
readonly		  
IMatriculaRepository		 ) 
_matriculaRepository		* >
;		> ?
public 
$
GetMatriculaQueryHandler #
(# $ 
IMatriculaRepository$ 8
matriculaRepository9 L
)L M
{  
_matriculaRepository 
= 
matriculaRepository 2
;2 3
} 
public 

async 
Task 
< 
Result 
< 
MatriculaResponse .
>. /
>/ 0
Handle1 7
(7 8
GetMatriculaQuery8 I
requestJ Q
,Q R
CancellationTokenS d
cancellationTokene v
)v w
{ 
var 
matriculaResult 
= 
await # 
_matriculaRepository$ 8
.8 9
GetByIdAsync9 E
(E F
requestF M
.M N
MatriculaIdN Y
,Y Z
cancellationToken[ l
)l m
;m n
if 

( 
matriculaResult 
== 
null #
)# $
{ 	
return 
Result 
. 
Failure !
<! "
MatriculaResponse" 3
>3 4
(4 5
MatriculaErrors5 D
.D E
NotFoundE M
)M N
;N O
} 	
return 
Result 
. 
Success 
( 
new !
MatriculaResponse" 3
(3 4
matriculaResult 
. 
Id 
,  
matriculaResult 
. 
EstudianteId )
,) *
matriculaResult 
. 
CursoId $
,$ %
matriculaResult 
. 
	DocenteId &
,& '
matriculaResult 
. 
FechaMatricula +
)	 

)
 
; 
} 
}   ﬂ
ñD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Matriculas\GetMatricula\GetMatriculaQuery.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "

Matriculas" ,
., -
GetMatricula- 9
;9 :
public 
sealed 
record 
GetMatriculaQuery &
(& '
Guid' +
MatriculaId, 7
)7 8
:9 :
IQuery; A
<A B
MatriculaResponseB S
>S T
;T U¡

•D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Matriculas\CrearMatricula\CrearMatriculaCommandValidator.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "

Matriculas" ,
., -
CrearMatricula- ;
;; <
public 
class *
CrearMatriculaCommandValidator +
:, -
AbstractValidator. ?
<? @!
CrearMatriculaCommand@ U
>U V
{ 
public 
*
CrearMatriculaCommandValidator )
() *
)* +
{ 
RuleFor		 
(		 
d		 
=>		 
d		 
.		 
EstudianteId		 #
)		# $
.		$ %
NotEmpty		% -
(		- .
)		. /
;		/ 0
RuleFor

 
(

 
d

 
=>

 
d

 
.

 
CursoId

 
)

 
.

  
NotEmpty

  (
(

( )
)

) *
;

* +
RuleFor 
( 
d 
=> 
d 
. 
	DocenteId  
)  !
.! "
NotEmpty" *
(* +
)+ ,
;, -
} 
} à6
£D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Matriculas\CrearMatricula\CrearMatriculaCommandHandler.cs
	namespace		 	
Estudiantes		
 
.		 
Application		 !
.		! "
Estudiantes		" -
.		- .
CrearEstudiante		. =
;		= >
internal 
sealed	 
class (
CrearMatriculaCommandHandler 2
:3 4
ICommandHandler 
< !
CrearMatriculaCommand %
,% &
Guid' +
>+ ,
{ 
private 
readonly  
IMatriculaRepository ) 
_matriculaRepository* >
;> ?
private 
readonly !
IEstudianteRepository *!
_estudianteRepository+ @
;@ A
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
private 
readonly 
ICursosService #
_cursoService$ 1
;1 2
private 
readonly 
ICacheService "
_cacheService# 0
;0 1
private 
readonly 
IDocentesService %
_docenteService& 5
;5 6
private 
readonly 
IDateTimeProvider &
_dateTimeProvider' 8
;8 9
public 
(
CrearMatriculaCommandHandler '
(' ( 
IMatriculaRepository( <
matriculaRepository= P
,P Q!
IEstudianteRepositoryR g 
estudianteRepositoryh |
,| }
IUnitOfWork	~ â

unitOfWork
ä î
,
î ï
ICursosService
ñ §
cursoService
• ±
,
± ≤
ICacheService
≥ ¿
cacheService
¡ Õ
,
Õ Œ
IDocentesService
œ ﬂ
docenteService
‡ Ó
,
Ó Ô
IDateTimeProvider
 Å
dateTimeProvider
Ç í
)
í ì
{  
_matriculaRepository 
= 
matriculaRepository 2
;2 3!
_estudianteRepository 
=  
estudianteRepository  4
;4 5
_unitOfWork 
= 

unitOfWork  
;  !
_cursoService 
= 
cursoService $
;$ %
_cacheService 
= 
cacheService $
;$ %
_docenteService 
= 
docenteService (
;( )
_dateTimeProvider 
= 
dateTimeProvider ,
;, -
} 
public!! 

async!! 
Task!! 
<!! 
Result!! 
<!! 
Guid!! !
>!!! "
>!!" #
Handle!!$ *
(!!* +!
CrearMatriculaCommand!!+ @
request!!A H
,!!H I
CancellationToken!!J [
cancellationToken!!\ m
)!!m n
{"" 
if## 

(## 
await## !
_estudianteRepository## '
.##' (
GetByIdAsync##( 4
(##4 5
request##5 <
.##< =
EstudianteId##= I
,##I J
cancellationToken##K \
)##\ ]
is##^ `
null##a e
)##e f
{$$ 	
return%% 
Result%% 
.%% 
Failure%% !
<%%! "
Guid%%" &
>%%& '
(%%' (
new%%( +
Error%%, 1
(%%1 2
$str%%2 F
,%%F G
$str%%H b
)%%b c
)%%c d
;%%d e
}&& 	
if'' 

('' 
!'' 
await'' 
_docenteService'' "
.''" #
DocenteExistsAsync''# 5
(''5 6
request''6 =
.''= >
	DocenteId''> G
,''G H
cancellationToken''I Z
)''Z [
)''[ \
{(( 	
return)) 
Result)) 
.)) 
Failure)) !
<))! "
Guid))" &
>))& '
())' (
new))( +
Error)), 1
())1 2
$str))2 C
,))C D
$str))E \
)))\ ]
)))] ^
;))^ _
}** 	
var,, 
cacheKey,, 
=,, 
$",, 
$str,, 
{,,  
request,,  '
.,,' (
CursoId,,( /
},,/ 0
",,0 1
;,,1 2
var-- 
cursoExists-- 
=-- 
await-- 
_cacheService--  -
.--- .
GetCacheValueAsync--. @
<--@ A
bool--A E
>--E F
(--F G
cacheKey--G O
)--O P
;--P Q
if// 

(// 
!// 
cursoExists// 
)// 
{00 	
cursoExists11 
=11 
await11 
_cursoService11  -
.11- .
CursoExistsAsync11. >
(11> ?
request11? F
.11F G
CursoId11G N
,11N O
cancellationToken11P a
)11a b
;11b c
var22 
expirationTime22 
=22  
TimeSpan22! )
.22) *
FromMinutes22* 5
(225 6
$num226 7
)227 8
;228 9
await33 
_cacheService33 
.33  
SetCacheValueAsync33  2
(332 3
cacheKey333 ;
,33; <
cursoExists33= H
,33H I
expirationTime33I W
)33W X
;33X Y
}44 	
if66 

(66 
!66 
cursoExists66 
)66 
{77 	
return88 
Result88 
.88 
Failure88 !
<88! "
Guid88" &
>88& '
(88' (
new88( +
Error88, 1
(881 2
$str882 A
,88A B
$str88C X
)88X Y
)88Y Z
;88Z [
}99 	
var;; 
	matricula;; 
=;; 
	Matricula;; !
.;;! "
Create;;" (
(;;( )
request<< 
.<< 
EstudianteId<<  
,<<  !
request== 
.== 
CursoId== 
,== 
request>> 
.>> 
	DocenteId>> 
,>> 
_dateTimeProvider?? 
.?? 
CurrentTime?? )
)@@	 

;@@
  
_matriculaRepositoryBB 
.BB 
AddBB  
(BB  !
	matriculaBB! *
.BB* +
ValueBB+ 0
)BB0 1
;BB1 2
awaitDD 
_unitOfWorkDD 
.DD 
SaveChangesAsyncDD *
(DD* +
cancellationTokenDD+ <
)DD< =
;DD= >
returnFF 
	matriculaFF 
.FF 
ValueFF 
.FF 
IdFF !
;FF! "
}GG 
}HH ∑
úD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Matriculas\CrearMatricula\CrearMatriculaCommand.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "

Matriculas" ,
., -
CrearMatricula- ;
;; <
public 
record !
CrearMatriculaCommand #
( 
Guid 
EstudianteId	 
, 
Guid 
CursoId	 
, 
Guid		 
	DocenteId			 
)

 
:

 
ICommand

 
<

 
Guid

 
>

 
;

 ¸
åD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Exceptions\ValidationExceptions.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "

Exceptions" ,
;, -
public 
class  
ValidationExceptions !
:" #
	Exception$ -
{ 
public 

IEnumerable 
< 
ValidationError &
>& '
Errors( .
{/ 0
get1 4
;4 5
}6 7
public 
 
ValidationExceptions 
(  
IEnumerable  +
<+ ,
ValidationError, ;
>; <
errors= C
)C D
{ 
Errors		 
=		 
errors		 
;		 
}

 
} Ô
áD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Exceptions\ValidationError.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "

Exceptions" ,
;, -
public 
record 
ValidationError 
( 
string 

PropertyName 
, 
string 

ErrorMessage 
) 
; à
åD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Exceptions\ConcurrencyException.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "

Exceptions" ,
;, -
public 
sealed 
class  
ConcurrencyException (
:) *
	Exception+ 4
{ 
public 
 
ConcurrencyException 
(  
string  &
message' .
,. /
	Exception0 9
	exception: C
)C D
: 
base 	
(
 
message 
, 
	exception 
) 
{ 
}

 
} õ
†D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Estudiantes\GetEstudiante\GetEstudianteQueryHandler.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Estudiantes" -
.- .
GetEstudiante. ;
;; <
internal 
sealed	 
class %
GetEstudianteQueryHandler /
:0 1
IQueryHandler2 ?
<? @
GetEstudianteQuery@ R
,R S
EstudianteResponseT f
>f g
{ 
private		 
readonly		 !
IEstudianteRepository		 *!
_estudianteRepository		+ @
;		@ A
public 
%
GetEstudianteQueryHandler $
($ %!
IEstudianteRepository% : 
estudianteRepository; O
)O P
{ !
_estudianteRepository 
=  
estudianteRepository  4
;4 5
} 
public 

async 
Task 
< 
Result 
< 
EstudianteResponse /
>/ 0
>0 1
Handle2 8
(8 9
GetEstudianteQuery9 K
requestL S
,S T
CancellationTokenU f
cancellationTokeng x
)x y
{ 
var 
estudianteResult 
= 
await $!
_estudianteRepository% :
.: ;
GetByIdAsync; G
(G H
requestH O
.O P
EstudianteIdP \
,\ ]
cancellationToken^ o
)o p
;p q
if 

( 
estudianteResult 
== 
null  $
)$ %
{ 	
return 
Result 
. 
Failure !
<! "
EstudianteResponse" 4
>4 5
(5 6
EstudianteErrors6 F
.F G
NotFoundG O
)O P
;P Q
} 	
return 
Result 
. 
Success 
( 
new !
EstudianteResponse" 4
(4 5
estudianteResult 
. 
Id  
,  !
estudianteResult 
. 
	UsuarioId '
)	 

)
 
; 
} 
} Á
ôD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Estudiantes\GetEstudiante\GetEstudianteQuery.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Estudiantes" -
.- .
GetEstudiante. ;
;; <
public 
sealed 
record 
GetEstudianteQuery '
(' (
Guid( ,
EstudianteId- 9
)9 :
:; <
IQuery= C
<C D
EstudianteResponseD V
>V W
;W X∞
ôD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Estudiantes\GetEstudiante\EstudianteResponse.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Estudiantes" -
.- .
GetEstudiante. ;
;; <
public 
sealed 
record 
EstudianteResponse '
( 
Guid 
Id	 
, 
Guid 
	UsuarioId	 
) 
; Â	
®D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Estudiantes\CrearEstudiante\CrearEstudianteCommandValidator.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Estudiantes" -
.- .
CrearEstudiante. =
;= >
public 
class +
CrearEstudianteCommandValidator ,
:- .
AbstractValidator/ @
<@ A"
CrearEstudianteCommandA W
>W X
{ 
public 
+
CrearEstudianteCommandValidator *
(* +
)+ ,
{ 
RuleFor		 
(		 
d		 
=>		 
d		 
.		 
	UsuarioId		  
)		  !
.

 
Must

 
(

 
guid

 
=>

 
Guid

 
.

 
TryParse

 '
(

' (
guid

( ,
.

, -
ToString

- 5
(

5 6
)

6 7
,

8 9
out

: =
_

> ?
)

? @
)

@ A
. 
WithMessage 
( 
$str C
)C D
;D E
} 
} Ñ
¶D:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Estudiantes\CrearEstudiante\CrearEstudianteCommandHandler.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Estudiantes" -
.- .
CrearEstudiante. =
;= >
internal 
sealed	 
class )
CrearEstudianteCommandHandler 3
:4 5
ICommandHandler		 
<		 "
CrearEstudianteCommand		 &
,		& '
Guid		( ,
>		, -
{

 
private 
readonly !
IEstudianteRepository *!
_estudianteRepository+ @
;@ A
private 
readonly 
IUnitOfWork  
_unitOfWork! ,
;, -
private 
readonly 
IUsuariosService %
_usuarioService& 5
;5 6
public 
)
CrearEstudianteCommandHandler (
(( )!
IEstudianteRepository  
estudianteRepository 2
,2 3
IUnitOfWork 

unitOfWork 
, 
IUsuariosService 
usuarioService '
)' (
{ !
_estudianteRepository 
=  
estudianteRepository  4
;4 5
_unitOfWork 
= 

unitOfWork  
;  !
_usuarioService 
= 
usuarioService (
;( )
} 
public 

async 
Task 
< 
Result 
< 
Guid !
>! "
>" #
Handle$ *
(* +"
CrearEstudianteCommand+ A
requestB I
,I J
CancellationTokenK \
cancellationToken] n
)n o
{ 
if 

( 
! 
await 
_usuarioService "
." #
UsuarioExistsAsync# 5
(5 6
request6 =
.= >
	UsuarioId> G
,G H
cancellationTokenI Z
)Z [
)[ \
{ 	
return 
Result 
. 
Failure !
<! "
Guid" &
>& '
(' (
new( +
Error, 1
(1 2
$str2 C
,C D
$strE \
)\ ]
)] ^
;^ _
} 	
var!! 

estudiante!! 
=!! 

Estudiante!! #
.!!# $
Create!!$ *
(!!* +
request"" 
."" 
	UsuarioId"" 
)##	 

;##
 !
_estudianteRepository%% 
.%% 
Add%% !
(%%! "

estudiante%%" ,
.%%, -
Value%%- 2
)%%2 3
;%%3 4
await'' 
_unitOfWork'' 
.'' 
SaveChangesAsync'' *
(''* +
cancellationToken''+ <
)''< =
;''= >
return)) 

estudiante)) 
.)) 
Value)) 
.))  
Id))  "
;))" #
}** 
internal,, 
static,, )
CrearEstudianteCommandHandler,, 1
CreateInternal,,2 @
(,,@ A!
IEstudianteRepository--  
estudianteRepository-- 2
,--2 3
IUnitOfWork.. 

unitOfWork.. 
,.. 
IUsuariosService// 
usuarioService// '
)//' (
{00 
return11 
new11 )
CrearEstudianteCommandHandler11 0
(110 1 
estudianteRepository22  
,22  !

unitOfWork33 
,33 
usuarioService44 
)55 	
;55	 

}66 
}77 Ã
üD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Estudiantes\CrearEstudiante\CrearEstudianteCommand.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Estudiantes" -
.- .
CrearEstudiante. =
;= >
public 
record "
CrearEstudianteCommand $
( 
Guid 
	UsuarioId	 
) 
: 
ICommand 
< 
Guid 
> 
; ˝
ÄD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\DependencyInjection.cs
	namespace 	
Estudiantes
 
. 
Application !
;! "
public 
static 
class 
DependencyInjection '
{ 
public		 	
static		
 
IServiceCollection		 #
AddApplication		$ 2
(		2 3
this		3 7
IServiceCollection		8 J
services		K S
)		S T
{

 
services 
. 

AddMediatR 
( 
configuration '
=>( *
{ 
configuration	 
. (
RegisterServicesFromAssembly 3
(3 4
typeof4 :
(: ;
DependencyInjection; N
)N O
.O P
AssemblyP X
)X Y
;Y Z
configuration	 
. 
AddOpenBehavior &
(& '
typeof' -
(- .
LoggingBehavior. =
<= >
,> ?
>? @
)@ A
)A B
;B C
configuration	 
. 
AddOpenBehavior &
(& '
typeof' -
(- .
ValidationBehavior. @
<@ A
,A B
>B C
)C D
)D E
;E F
} 
) 
; 	
services 
. %
AddValidatorsFromAssembly (
(( )
typeof) /
(/ 0
DependencyInjection0 C
)C D
.D E
AssemblyE M
)M N
;N O
return 
services 
; 
} 
} Ø
ëD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Abstractions\Messaging\IQueryHandler.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Abstractions" .
.. /
	Messaging/ 8
;8 9
public 
	interface 
IQueryHandler 
< 
TQuery %
,% &
	TResponse' 0
>0 1
: 
IRequestHandler 
< 
TQuery 
, 
Result  
<  !
	TResponse! *
>* +
>+ ,
where 
TQuery 
: 
IQuery 
< 
	TResponse 
>  
{		 
} Ÿ
äD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Abstractions\Messaging\IQuery.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Abstractions" .
.. /
	Messaging/ 8
;8 9
public 
	interface 
IQuery 
< 
	TResponse !
>! "
:" #
IRequest$ ,
<, -
Result- 3
<3 4
	TResponse4 =
>= >
>> ?
{ 
}		 †	
ìD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Abstractions\Messaging\ICommandHandler.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Abstractions" .
.. /
	Messaging/ 8
;8 9
public 
	interface 
ICommandHandler  
<  !
TCommand! )
>) *
:+ ,
IRequestHandler- <
<< =
TCommand= E
,E F
ResultF L
>L M
where 
TCommand 
: 
ICommand 
{ 
}

 
public 
	interface 
ICommandHandler  
<  !
TCommand! )
,) *
	TResponse* 3
>3 4
:5 6
IRequestHandler7 F
<F G
TCommandG O
,O P
ResultP V
<V W
	TResponseW `
>` a
>a b
where 
TCommand 
: 
ICommand 
< 
	TResponse #
># $
{ 
} º
åD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Abstractions\Messaging\ICommand.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Abstractions" .
.. /
	Messaging/ 8
;8 9
public 
	interface 
ICommand 
: 
IRequest $
<$ %
Result% +
>+ ,
,- .
IBaseCommand/ ;
{ 
}		 
public 
	interface 
ICommand 
< 
	TResponse #
># $
:% &
IRequest' /
</ 0
Result0 6
<6 7
	TResponse7 @
>@ A
>A B
,C D
IBaseCommandE Q
{ 
} 
public 
	interface 
IBaseCommand 
{ 
} ô
ëD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Abstractions\Clock\IDateTimeProvider.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Abstractions" .
.. /
Clock/ 4
;4 5
public 

	interface 
IDateTimeProvider &
{ 
DateTime 
CurrentTime 
{ 
get "
;" #
}$ %
} ˆ
ñD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Abstractions\Behaviors\ValidationBehavior.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Abstractions" .
.. /
	Behaviors/ 8
;8 9
public 
class 
ValidationBehavior 
<  
TRequest  (
,( )
	TResponse* 3
>3 4
:		 
IPipelineBehavior		 
<		 
TRequest		 
,		 
	TResponse		 '
>		' (
where

 
TRequest

 
:

 
IBaseCommand

 
{ 
private 
readonly 
IEnumerable  
<  !

IValidator! +
<+ ,
TRequest, 4
>4 5
>5 6
_validators7 B
;B C
public 

ValidationBehavior 
( 
IEnumerable )
<) *

IValidator* 4
<4 5
TRequest5 =
>= >
>> ?

validators@ J
)J K
{ 
_validators 
= 

validators  
;  !
} 
public 

async 
Task 
< 
	TResponse 
>  
Handle! '
(' (
TRequest 
request 
, "
RequestHandlerDelegate 
< 
	TResponse (
>( )
next* .
,. /
CancellationToken 
cancellationToken +
)+ ,
{ 
if 

(
 
! 
_validators 
. 
Any 
( 
) 
) 
{ 	
return 
await 
next 
( 
) 
;  
} 	
var 
context 
= 
new 
ValidationContext +
<+ ,
TRequest, 4
>4 5
(5 6
request6 =
)= >
;> ?
var 
validationErrores 
= 
_validators  +
.   	
Select  	 
(   

validators   
=>   

validators   )
.  ) *
Validate  * 2
(  2 3
context  3 :
)  : ;
)  ; <
.!! 	
Where!!	 
(!! 
validationsResult!! !
=>!!" $
validationsResult!!% 6
.!!6 7
Errors!!7 =
.!!= >
Any!!> A
(!!A B
)!!B C
)!!C D
."" 	

SelectMany""	 
("" 
validationResult"" %
=>""& (
validationResult"") 9
.""9 :
Errors"": @
)""@ A
.## 	
Select##	 
(## 
validatorsFailure$$	 
=>$$ 
new$$ !
ValidationError$$" 1
($$2 3
validatorsFailure%% 
.%% 
PropertyName%% *
,%%* +
validatorsFailure&& 
.&& 
ErrorMessage&& *
)'' 	
)''	 

.''
 
ToList'' 
('' 
)'' 
;'' 
if)) 

())
 
validationErrores)) 
.)) 
Any))  
())  !
)))! "
)))" #
{** 	
throw++ 
new++ 

Exceptions++  
.++  ! 
ValidationExceptions++! 5
(++5 6
validationErrores++6 G
)++G H
;++H I
},, 	
return-- 
await-- 
next-- 
(-- 
)-- 
;-- 
}// 
}00 ù
ìD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Application\Abstractions\Behaviors\LoggingBehavior.cs
	namespace 	
Estudiantes
 
. 
Application !
.! "
Abstractions" .
.. /
	Behaviors/ 8
;8 9
public 
class 
LoggingBehavior 
< 
TRequest %
,% &
	TResponse' 0
>0 1
: 
IPipelineBehavior 
< 
TRequest 
, 
	TResponse '
>' (
where		 
TRequest		 
:		 
IBaseCommand		 
{

 
private 
readonly 
ILogger 
< 
TRequest %
>% &
_logger' .
;. /
public 

LoggingBehavior 
( 
ILogger "
<" #
TRequest# +
>+ ,
logger- 3
)3 4
{ 
_logger 
= 
logger 
; 
} 
public 

async 
Task 
< 
	TResponse 
>  
Handle! '
(' (
TRequest 
request 
, "
RequestHandlerDelegate 
< 
	TResponse (
>( )
next* .
,. /
CancellationToken 
cancellationToken +
)+ ,
{ 
var 
nameRequest 
= 
request !
.! "
GetType" )
() *
)* +
.+ ,
Name, 0
;0 1
try 
{ 	
_logger 
. 
LogInformation "
(" #
$"# %
$str% :
{: ;
nameRequest; F
}F G
"G H
)H I
;I J
var 
result 
= 
await 
next #
(# $
)$ %
;% &
_logger 
. 
LogInformation "
(" #
$"# %
$str% 7
{7 8
nameRequest8 C
}C D
"D E
)E F
;F G
return 
result 
; 
} 	
catch 
( 
	Exception 
ex 
) 
{   	
_logger!! 
.!! 
LogError!! 
(!! 
ex!! 
,!!  
$"!!! #
$str!!# /
{!!/ 0
nameRequest!!0 ;
}!!; <
$str!!< O
"!!O P
)!!P Q
;!!Q R
throw"" 
;"" 
}## 	
}$$ 
}%% 