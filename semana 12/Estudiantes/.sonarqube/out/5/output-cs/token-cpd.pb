ì
lD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Api\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
builder		 
.		 
Services		 
.		 
AddApplication		 
(		  
)		  !
;		! "
builder

 
.

 
Services

 
.

 
AddInfrastructure

 "
(

" #
builder

# *
.

* +
Configuration

+ 8
)

8 9
;

9 :
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
)  
;  !
builder 
. 
Services 
. 
AddMemoryCache 
(  
)  !
;! "
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
if 
( 
app 
. 
Environment 
. 
IsDevelopment !
(! "
)" #
)# $
{ 
app 
. 

UseSwagger 
( 
) 
; 
app 
. 
UseSwaggerUI 
( 
) 
; 
} 
app 
. 
ApplyMigrations 
( 
) 
; 
app 
. %
UseCustomExceptionHandler 
( 
) 
;  
app 
. 
MapControllers 
( 
) 
; 
app!! 
.!! 
Run!! 
(!! 
)!! 	
;!!	 
˘
ÜD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Api\Middleware\RateLimitingMiddleware.cs
	namespace 	
Estudiantes
 
. 
Api 
. 

Middleware $
;$ %
public 
class "
RateLimitingMiddleware #
{ 
private 
readonly 
RequestDelegate $
_next% *
;* +
private 
readonly 
ILogger 
< "
RateLimitingMiddleware 3
>3 4
_logger5 <
;< =
private		 
readonly		 
IMemoryCache		 !
_cache		" (
;		( )
private

 
readonly

 
int

 
_requestLimit

 &
;

& '
private 
readonly 
TimeSpan 
	_timeSpan '
;' (
public 
"
RateLimitingMiddleware !
(! "
RequestDelegate" 1
next2 6
,6 7
ILogger8 ?
<? @"
RateLimitingMiddleware@ V
>V W
loggerX ^
,^ _
IMemoryCache` l
cachem r
,r s
intt w
requestLimit	x Ñ
,
Ñ Ö
TimeSpan
Ü é
timeSpan
è ó
)
ó ò
{ 
_next 
= 
next 
; 
_logger 
= 
logger 
; 
_cache 
= 
cache 
; 
_requestLimit 
= 
requestLimit $
;$ %
	_timeSpan 
= 
timeSpan 
; 
} 
public 

async 
Task 
InvokeAsync !
(! "
HttpContext" -
context. 5
)5 6
{ 
var 
clientIp 
= 
context 
. 

Connection )
.) *
RemoteIpAddress* 9
?9 :
.: ;
ToString; C
(C D
)D E
;E F
if 

( 
clientIp 
!= 
null 
) 
{ 	
var 
cacheKey 
= 
$" 
$str '
{' (
clientIp( 0
}0 1
"1 2
;2 3
if 
( 
! 
_cache 
. 
TryGetValue #
(# $
cacheKey$ ,
,, -
out. 1
int2 5
requestCount6 B
)B C
)C D
{ 
requestCount 
= 
$num  
;  !
}   
if!! 
(!! 
requestCount!! 
>=!! 
_requestLimit!!  -
)!!- .
{"" 
context## 
.## 
Response##  
.##  !

StatusCode##! +
=##, -
StatusCodes##. 9
.##9 :$
Status429TooManyRequests##: R
;##R S
await$$ 
context$$ 
.$$ 
Response$$ &
.$$& '

WriteAsync$$' 1
($$1 2
$str$$2 Z
)$$Z [
;$$[ \
return%% 
;%% 
}&& 
requestCount'' 
++'' 
;'' 
_cache(( 
.(( 
Set(( 
((( 
cacheKey(( 
,((  
requestCount((! -
,((- .
	_timeSpan((/ 8
)((8 9
;((9 :
_logger)) 
.)) 
LogInformation)) "
())" #
$"))# %
$str))% -
{))- .
requestCount)). :
})): ;
$str)); A
{))A B
clientIp))B J
}))J K
"))K L
)))L M
;))M N
}** 	
await++ 
_next++ 
(++ 
context++ 
)++ 
;++ 
},, 
}-- À%
ãD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Api\Middleware\ExceptionHandlingMiddleware.cs
	namespace 	
Estudiantes
 
. 
Api 
. 

Middleware $
;$ %
public 
class '
ExceptionHandlingMiddleware (
{ 
private 
readonly 
RequestDelegate $
_next% *
;* +
private		 
readonly		 
ILogger		 
<		 '
ExceptionHandlingMiddleware		 8
>		8 9
_logger		: A
;		A B
public 
'
ExceptionHandlingMiddleware &
(& '
RequestDelegate' 6
next7 ;
,; <
ILogger= D
<D E'
ExceptionHandlingMiddlewareE `
>` a
loggerb h
)h i
{ 
_next 
= 
next 
; 
_logger 
= 
logger 
; 
} 
public 

async 
Task 
InvokeAsync !
(! "
HttpContext" -
context. 5
)5 6
{ 
try 
{ 	
await 
_next 
( 
context 
)  
;  !
} 	
catch 
( 
	Exception 
ex 
) 
{ 	
_logger 
. 
LogError 
( 
ex 
,  
$str! C
,C D
exE G
.G H
MessageH O
)O P
;P Q
var 
excepcionDetail 
=  !
GetExceptionDeails" 4
(4 5
ex5 7
)7 8
;8 9
var 
problemDetail 
= 
new  #
ProblemDetails$ 2
{ 
Status 
= 
excepcionDetail (
.( )
Status) /
,/ 0
Type 
= 
excepcionDetail &
.& '
Type' +
,+ ,
Title 
= 
excepcionDetail '
.' (
Title( -
,- .
Detail   
=   
excepcionDetail   (
.  ( )
Detail  ) /
,  / 0
}!! 
;!! 
if## 
(## 
excepcionDetail## 
.##  
Errors##  &
is##( *
not##+ .
null##/ 3
)##3 4
{$$ 
problemDetail%% 
.%% 

Extensions%% (
[%%( )
$str%%) 1
]%%1 2
=%%3 4
excepcionDetail%%5 D
.%%D E
Errors%%E K
;%%K L
}&& 
context(( 
.(( 
Response(( 
.(( 

StatusCode(( '
=((( )
excepcionDetail((* 9
.((9 :
Status((: @
;((@ A
await** 
context** 
.** 
Response** "
.**" #
WriteAsJsonAsync**# 3
(**3 4
problemDetail**4 A
)**A B
;**B C
}++ 	
},, 
private.. 
static.. 
ExceptionDetails.. #
GetExceptionDeails..$ 6
(..6 7
	Exception..7 @
	exception..A J
)..J K
{// 
return00 
	exception00 
switch00 
{11 	 
ValidationExceptions22  
validationException22! 4
=>225 7
new228 ;
ExceptionDetails22< L
(22L M
StatusCodes33 
.33 
Status400BadRequest33 /
,33/ 0
$str44 #
,44# $
$str55 %
,55% &
$str66 >
,66> ?
validationException77 #
.77# $
Errors77$ *
)88 
,88 
_99 
=>99 
new99 
ExceptionDetails99 %
(99% &
StatusCodes:: 
.:: (
Status500InternalServerError:: :
,::: ;
$str;; 
,;; 
$str<< $
,<<$ %
$str== =
,=== >
null>> 
)?? 
}@@ 	
;@@	 

}AA 
internalCC 
recordCC 
ExceptionDetailsCC $
(DD 
intEE 
StatusEE 
,EE 
stringFF 
TypeFF 
,FF 
stringGG 
TitleGG 
,GG 
stringHH 
DetailHH 
,HH 
IEnumerableII 
<II 
objectII 
>II 
?II 
ErrorsII #
)JJ 
;JJ 
}LL ◊
åD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Api\Extensions\ApplicationBuilderExtensions.cs
	namespace 	
Estudiantes
 
. 
Api 
. 

Extensions $
;$ %
public 
static 
class (
ApplicationBuilderExtensions 0
{		 
public

 

static

 
async

 
void

 
ApplyMigrations

 ,
(

, -
this

- 1
IApplicationBuilder

2 E
app

F I
)

I J
{ 
using 
( 
var 
scope 
= 
app 
. 
ApplicationServices 1
.1 2
CreateScope2 =
(= >
)> ?
)? @
{ 	
var 
service 
= 
scope 
.  
ServiceProvider  /
;/ 0
var 
loggerFactory 
= 
service  '
.' (
GetRequiredService( :
<: ;
ILoggerFactory; I
>I J
(J K
)K L
;L M
try 
{ 
var 
context 
= 
service %
.% &
GetRequiredService& 8
<8 9 
ApplicationDbContext9 M
>M N
(N O
)O P
;P Q
await 
context 
. 
Database &
.& '
MigrateAsync' 3
(3 4
)4 5
;5 6
} 
catch 
( 
	Exception 
ex 
)  
{ 
var 
logger 
= 
loggerFactory *
.* +
CreateLogger+ 7
<7 8
Program8 ?
>? @
(@ A
)A B
;B C
logger 
. 
LogError 
(  
ex  "
," #
$str# :
): ;
;; <
} 
} 	
} 
public 

static 
void %
UseCustomExceptionHandler 0
(0 1
this1 5
IApplicationBuilder6 I
appJ M
)M N
{ 
app   
.   
UseMiddleware   
<   '
ExceptionHandlingMiddleware   5
>  5 6
(  6 7
)  7 8
;  8 9
}!! 
public## 

static## 
IApplicationBuilder## %
UseRateLimiter##& 4
(##4 5
this$$ 
IApplicationBuilder$$  
app$$! $
,$$$ %
int%% 
requestLimit%% 
,%% 
TimeSpan&& 
timeSpan&& 
)&& 
{'' 	
return(( 
app(( 
.(( 
UseMiddleware(( $
<(($ %"
RateLimitingMiddleware((% ;
>((; <
(((< =
app)) 
.)) 
ApplicationServices)) '
.))' (
GetRequiredService))( :
<)): ;
ILogger)); B
<))B C"
RateLimitingMiddleware))C Y
>))Y Z
>))Z [
())[ \
)))\ ]
,))] ^
app** 
.** 
ApplicationServices** '
.**' (
GetRequiredService**( :
<**: ;
IMemoryCache**; G
>**G H
(**H I
)**I J
,**J K
requestLimit++ 
,++ 
timeSpan,, 
)-- 
;-- 
}.. 	
}00 »
èD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Api\Controllers\Matriculas\MatriculaController.cs
	namespace 	
Estudiantes
 
. 
api 
. 
Controllers %
.% &
Estudiantes& 1
;1 2
[		 
ApiController		 
]		 
[

 
Route

 
(

 
$str

 
)

 
]

 
public 
class 
MatriculaController  
:" #
ControllerBase$ 2
{ 
private 
readonly 
ISender 
_sender $
;$ %
public 

MatriculaController 
( 
ISender &
sender' -
)- .
{ 
_sender 
= 
sender 
; 
} 
[ 
HttpGet 
( 
$str 
) 
] 
public 

async 
Task 
< 
IActionResult #
># $
ObtenerMatricula% 5
(5 6
Guid 
id 
, 
CancellationToken 
cancellationToken +
) 
{ 
var 
query 
= 
new 
GetMatriculaQuery )
() *
id* ,
), -
;- .
var 
	resultado 
= 
await 
_sender %
.% &
Send& *
(* +
query+ 0
,0 1
cancellationToken1 B
)B C
;C D
return 
	resultado 
. 
	IsSuccess "
?# $
Ok% '
(' (
	resultado( 1
)1 2
:3 4
NotFound5 =
(= >
)> ?
;? @
} 
[ 
HttpPost 
] 
public   

async   
Task   
<   
IActionResult   #
>  # $
CrearMatricula  % 3
(  3 4!
CrearMatriculaRequest!!	 
request!! &
,!!& '
CancellationToken"" 
cancellationToken"" +
)## 
{$$ 
var%% 
command%% 
=%% 
new%% !
CrearMatriculaCommand%% /
(&& 	
request'' 
.'' 
EstudianteId''  
,''  !
request(( 
.(( 
CursoId(( 
,(( 
request)) 
.)) 
	DocenteId)) 
)** 	
;**	 

var,, 
	resultado,, 
=,, 
await,, 
_sender,, %
.,,% &
Send,,& *
(,,* +
command,,+ 2
,,,2 3
cancellationToken,,3 D
),,D E
;,,E F
if.. 

(.. 
	resultado.. 
... 
	IsSuccess.. 
)..  
{// 	
return00 
CreatedAtAction00 "
(00" #
nameof00# )
(00) *
ObtenerMatricula00* :
)00: ;
,00; <
new00= @
{00A B
id00C E
=00F G
	resultado00H Q
.00Q R
Value00R W
}00X Y
,00Z [
	resultado00\ e
.00e f
Value00f k
)00l m
;00m n
}11 	
return22 

BadRequest22 
(22 
	resultado22 #
.22# $
Error22$ )
)22) *
;22* +
}33 
}44 «
ëD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Api\Controllers\Matriculas\CrearMatriculaRequest.cs
	namespace 	
Docentes
 
. 
api 
. 
Controllers "
." #
Docentes# +
;+ ,
public 
record !
CrearMatriculaRequest #
( 
Guid 
EstudianteId	 
, 
Guid 
CursoId	 
, 
Guid 
	DocenteId	 
) 
; À
íD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Api\Controllers\Estudiantes\EstudiantesController.cs
	namespace 	
Estudiantes
 
. 
api 
. 
Controllers %
.% &
CursosImpartidos& 6
;6 7
[

 
ApiController

 
]

 
[ 
Route 
( 
$str 
) 
] 
public 
class !
EstudiantesController "
:# $
ControllerBase% 3
{ 
private 
readonly 
ISender 
_sender $
;$ %
public 
!
EstudiantesController  
(  !
ISender! (
sender) /
)/ 0
{ 
_sender 
= 
sender 
; 
} 
[ 
HttpGet 
( 
$str 
) 
] 
[ 
	RateLimit 
( 
$num 
, 
$num 
) 
] 
public 

async 
Task 
< 
IActionResult #
># $
ObtenerEstudiante% 6
(6 7
Guid 

id 
, 
CancellationToken 
cancellationToken )
) 
{ 
var 
query 
= 
new 
GetEstudianteQuery *
(* +
id+ -
)- .
;. /
var 
	resultado 
= 
await 
_sender %
.% &
Send& *
(* +
query+ 0
,0 1
cancellationToken2 C
)C D
;D E
return 
	resultado 
. 
	IsSuccess "
?# $
Ok% '
(' (
	resultado( 1
)1 2
:3 4
NotFound5 =
(= >
)> ?
;? @
} 
[!! 
HttpPost!! 
]!! 
public"" 

async"" 
Task"" 
<"" 
IActionResult"" #
>""# $
CrearEstudiante""% 4
(""4 5"
CrearEstudianteRequest## 
request## %
,##% &
CancellationToken$$ 
cancellationToken$$ *
)%% 
{&& 
var'' 
command'' 
='' 
new'' "
CrearEstudianteCommand'' 0
((( 	
request)) 
.)) 
	UsuarioId)) 
)** 	
;**	 

var,, 
	resultado,, 
=,, 
await,, 
_sender,, %
.,,% &
Send,,& *
(,,* +
command,,+ 2
,,,2 3
cancellationToken,,4 E
),,E F
;,,F G
if.. 

(.. 
	resultado.. 
... 
	IsSuccess.. 
)..  
{// 	
return00 
CreatedAtAction00 "
(00" #
nameof00# )
(00) *
ObtenerEstudiante00* ;
)00; <
,00< =
new00> A
{00B C
id00D F
=00G H
	resultado00I R
.00R S
Value00S X
}00Y Z
,00Z [
	resultado00\ e
.00e f
Value00f k
)00k l
;00l m
}11 	
return22 

BadRequest22 
(22 
	resultado22 #
.22# $
Error22$ )
)22) *
;22* +
}33 
}66 ﬂ
ìD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Api\Controllers\Estudiantes\CrearEstudianteRequest.cs
	namespace 	
Estudiantes
 
. 
Api 
. 
Controllers %
.% &
Estudiantes& 1
;1 2
public 
record "
CrearEstudianteRequest $
( 
Guid 
	UsuarioId	 
) 
; ë 
ÅD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Api\Atributos\RateLimitAttribute.cs
	namespace 	
Estudiantes
 
. 
Api 
. 
	Atributos #
;# $
public 
class 
RateLimitAttribute 
:  !
	Attribute" +
,+ ,
IAsyncActionFilter- ?
{ 
private		 
readonly		 
int		 
_requestLimit		 &
;		& '
private

 
readonly

 
TimeSpan

 
	_timeSpan

 '
;

' (
public 

RateLimitAttribute 
( 
int !
requestLimit" .
,. /
int0 3
seconds4 ;
); <
{ 
_requestLimit 
= 
requestLimit $
;$ %
	_timeSpan 
= 
TimeSpan 
. 
FromSeconds (
(( )
seconds) 0
)0 1
;1 2
} 
public 

async 
Task "
OnActionExecutionAsync ,
(, -"
ActionExecutingContext- C
contextD K
,K L#
ActionExecutionDelegateM d
nexte i
)i j
{ 
var 
clientIp 
= 
context 
. 
HttpContext *
.* +

Connection+ 5
.5 6
RemoteIpAddress6 E
?E F
.F G
ToStringG O
(O P
)P Q
;Q R
if 

( 
clientIp 
!= 
null 
) 
{ 	
var 
cacheKey 
= 
$" 
$str '
{' (
clientIp( 0
}0 1
"1 2
;2 3
var 
cache 
= 
context 
.  
HttpContext  +
.+ ,
RequestServices, ;
.; <

GetService< F
<F G
IMemoryCacheG S
>S T
(T U
)U V
;V W
var 
logger 
= 
context  
.  !
HttpContext! ,
., -
RequestServices- <
.< =

GetService= G
<G H
ILoggerH O
<O P
RateLimitAttributeP b
>b c
>c d
(d e
)e f
;f g
if 
( 
! 
cache 
! 
. 
TryGetValue #
(# $
cacheKey$ ,
,, -
out. 1
int2 5
requestCount6 B
)B C
)C D
{ 
requestCount 
= 
$num  
;  !
} 
if   
(   
requestCount   
>=   
_requestLimit    -
)  - .
{!! 
context"" 
."" 
Result"" 
="" 
new""  #
ContentResult""$ 1
{## 

StatusCode$$ 
=$$  
$num$$! $
,$$$ %
Content%% 
=%% 
$str%% E
}&& 
;&& 
return'' 
;'' 
}(( 
requestCount)) 
++)) 
;)) 
cache** 
!** 
.** 
Set** 
(** 
cacheKey** 
,**  
requestCount**! -
,**- .
	_timeSpan**/ 8
)**8 9
;**9 :
logger,, 
!,, 
.,, 
LogInformation,, "
(,," #
$",,# %
$str,,% -
{,,- .
requestCount,,. :
},,: ;
$str,,; A
{,,A B
clientIp,,B J
},,J K
",,K L
),,L M
;,,M N
}-- 	
await.. 
next.. 
(.. 
).. 
;.. 
}// 
}00 