·
áD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Infrastructure\Services\UsuarioService.cs
	namespace 	
Estudiantes
 
. 
Infrastructure $
.$ %
Services% -
;- .
public 
class 
UsuarioService 
: 
IUsuariosService .
{ 
private 
readonly 

HttpClient 
_httpClient  +
;+ ,
public		 

UsuarioService		 
(		 

HttpClient		 $

httpClient		% /
)		/ 0
{

 
_httpClient 
= 

httpClient  
;  !
} 
public 

async 
Task 
< 
bool 
> 
UsuarioExistsAsync .
(. /
Guid/ 3
	usuarioId4 =
,= >
CancellationToken? P
cancellationTokenQ b
)b c
{ 
var 
response 
= 
await 
_httpClient (
.( )
GetAsync) 1
(1 2
$"2 4
$str4 =
{= >
	usuarioId> G
}G H
"H I
,I J
cancellationTokenK \
)\ ]
;] ^
return 
response 
. 
IsSuccessStatusCode +
;+ ,
} 
} ù
äD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Infrastructure\Services\RedisCacheService.cs
	namespace 	
Estudiantes
 
. 
Infrastructure $
.$ %
Services% -
;- .
public 
class 
RedisCacheService 
:  
ICacheService! .
{ 
private		 
readonly		 "
IConnectionMultiplexer		 +"
_connectionMultiplexer		, B
;		B C
public 

RedisCacheService 
( "
IConnectionMultiplexer 3!
connectionMultiplexer4 I
)I J
{ "
_connectionMultiplexer 
=  !
connectionMultiplexer! 6
;6 7
} 
public 

async 
Task 
< 
T 
? 
> 
GetCacheValueAsync ,
<, -
T- .
>. /
(/ 0
string0 6
key7 :
): ;
{ 
var 
db 
= "
_connectionMultiplexer '
.' (
GetDatabase( 3
(3 4
)4 5
;5 6
var 
value 
= 
await 
db 
. 
StringGetAsync +
(+ ,
key, /
)/ 0
;0 1
if 

( 
value 
. 
IsNullOrEmpty 
)  
{ 	
return 
default 
; 
} 	
return 
JsonSerializer 
. 
Deserialize )
<) *
T* +
>+ ,
(, -
value- 2
!2 3
)3 4
;4 5
} 
public 
async 
Task 
SetCacheValueAsync )
<) *
T* +
>+ ,
(, -
string- 3
key4 7
,7 8
T9 :
value; @
,@ A
TimeSpanB J
?J K
expirationTimeL Z
=[ \
null] a
)a b
{ 
var 
db 
= "
_connectionMultiplexer '
.' (
GetDatabase( 3
(3 4
)4 5
;5 6
var 
json 
= 
JsonSerializer !
.! "
	Serialize" +
(+ ,
value, 1
)1 2
;2 3
await!! 
db!! 
.!! 
StringSetAsync!! 
(!!  
key!!  #
,!!# $
json!!% )
,!!) *
expirationTime!!+ 9
)!!9 :
;!!: ;
}"" 
}## ·
áD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Infrastructure\Services\DocenteService.cs
	namespace 	
Estudiantes
 
. 
Infrastructure $
.$ %
Services% -
;- .
public 
class 
DocenteService 
: 
IDocentesService .
{ 
private 
readonly 

HttpClient 
_httpClient  +
;+ ,
public		 

DocenteService		 
(		 

HttpClient		 $

httpClient		% /
)		/ 0
{

 
_httpClient 
= 

httpClient  
;  !
} 
public 

async 
Task 
< 
bool 
> 
DocenteExistsAsync .
(. /
Guid/ 3
	docenteId4 =
,= >
CancellationToken? P
cancellationTokenQ b
)b c
{ 
var 
response 
= 
await 
_httpClient (
.( )
GetAsync) 1
(1 2
$"2 4
$str4 <
{< =
	docenteId= F
}F G
"G H
,H I
cancellationTokenJ [
)[ \
;\ ]
return 
response 
. 
IsSuccessStatusCode +
;+ ,
} 
} ”
ÖD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Infrastructure\Services\CursoService.cs
	namespace 	
Estudiantes
 
. 
Infrastructure $
.$ %
Services% -
;- .
public 
class 
CursoService 
: 
ICursosService *
{ 
private 
readonly 

HttpClient 
_httpClient  +
;+ ,
public		 

CursoService		 
(		 

HttpClient		 "

httpClient		# -
)		- .
{

 
_httpClient 
= 

httpClient  
;  !
} 
public 

async 
Task 
< 
bool 
> 
CursoExistsAsync ,
(, -
Guid- 1
cursoId2 9
,9 :
CancellationToken; L
cancellationTokenM ^
)^ _
{ 
var 
response 
= 
await 
_httpClient (
.( )
GetAsync) 1
(1 2
$"2 4
$str4 ;
{; <
cursoId< C
}C D
"D E
,E F
cancellationTokenG X
)X Y
;Y Z
return 
response 
. 
IsSuccessStatusCode +
;+ ,
} 
} ä
áD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Infrastructure\Repositories\Repository.cs
	namespace 	
Estudiantes
 
. 
Infrastructure $
.$ %
Repositories% 1
;1 2
internal 
abstract	 
class 

Repository "
<" #
T# $
>$ %
where 
T 
: 	
Entity
 
{ 
	protected		 
readonly		  
ApplicationDbContext		 +
	DbContext		, 5
;		5 6
	protected 

Repository 
(  
ApplicationDbContext -
	dbContext. 7
)7 8
{ 
	DbContext 
= 
	dbContext 
; 
} 
public 

async 
Task 
< 
T 
? 
> 
GetByIdAsync &
(& '
Guid 
id 
, 
CancellationToken 
cancellationToken +
=, -
default. 5
) 
{ 
return 
await 
	DbContext 
. 
Set "
<" #
T# $
>$ %
(% &
)& '
. 	
FirstOrDefaultAsync	 
( 
entity #
=>$ &
entity' -
.- .
Id. 0
==1 3
id4 6
,6 7
cancellationToken8 I
)I J
;J K
} 
public 

void 
Add 
( 
T 
entity 
) 
{ 
	DbContext 
. 
Add 
( 
entity 
) 
; 
} 
public 

void 
Update 
( 
T 
entity 
)  
{ 
	DbContext   
.   
Update   
(   
entity   
)    
;    !
}!! 
}"" ß
êD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Infrastructure\Repositories\MatriculaRepository.cs
	namespace 	
Estudiantes
 
. 
Infrastructure $
.$ %
Repositories% 1
;1 2
internal 
sealed	 
class 
MatriculaRepository )
:* +

Repository, 6
<6 7
	Matricula7 @
>@ A
,A B 
IMatriculaRepositoryC W
{ 
public 

MatriculaRepository 
(  
ApplicationDbContext 3
	dbContext4 =
)= >
:? @
baseA E
(E F
	dbContextF O
)O P
{ 
}

 
} ¨
ëD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Infrastructure\Repositories\EstudianteRepository.cs
	namespace 	
Estudiantes
 
. 
Infrastructure $
.$ %
Repositories% 1
;1 2
internal 
sealed	 
class  
EstudianteRepository *
:+ ,

Repository- 7
<7 8

Estudiante8 B
>B C
,C D!
IEstudianteRepositoryE Z
{ 
public 
 
EstudianteRepository 
(   
ApplicationDbContext  4
	dbContext5 >
)> ?
:@ A
baseB F
(F G
	dbContextG P
)P Q
{ 
}		 
}

 ù3
óD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Infrastructure\Migrations\20240710021551_InitialCreate.cs
	namespace 	
Estudiantes
 
. 
Infrastructure $
.$ %

Migrations% /
{ 
public		 

partial		 
class		 
InitialCreate		 &
:		' (
	Migration		) 2
{

 
	protected 
override 
void 
Up  "
(" #
MigrationBuilder# 3
migrationBuilder4 D
)D E
{ 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str #
,# $
columns 
: 
table 
=> !
new" %
{ 
id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 8
,8 9
nullable: B
:B C
falseD I
)I J
,J K

usuario_id 
=  
table! &
.& '
Column' -
<- .
Guid. 2
>2 3
(3 4
type4 8
:8 9
$str: @
,@ A
nullableB J
:J K
falseL Q
)Q R
,R S
xmin 
= 
table  
.  !
Column! '
<' (
uint( ,
>, -
(- .
type. 2
:2 3
$str4 9
,9 :

rowVersion; E
:E F
trueG K
,K L
nullableM U
:U V
falseW \
)\ ]
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 5
,5 6
x7 8
=>9 ;
x< =
.= >
id> @
)@ A
;A B
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str "
," #
columns 
: 
table 
=> !
new" %
{ 
id 
= 
table 
. 
Column %
<% &
Guid& *
>* +
(+ ,
type, 0
:0 1
$str2 8
,8 9
nullable: B
:B C
falseD I
)I J
,J K
estudiante_id   !
=  " #
table  $ )
.  ) *
Column  * 0
<  0 1
Guid  1 5
>  5 6
(  6 7
type  7 ;
:  ; <
$str  = C
,  C D
nullable  E M
:  M N
false  O T
)  T U
,  U V
curso_id!! 
=!! 
table!! $
.!!$ %
Column!!% +
<!!+ ,
Guid!!, 0
>!!0 1
(!!1 2
type!!2 6
:!!6 7
$str!!8 >
,!!> ?
nullable!!@ H
:!!H I
false!!J O
)!!O P
,!!P Q

docente_id"" 
=""  
table""! &
.""& '
Column""' -
<""- .
Guid"". 2
>""2 3
(""3 4
type""4 8
:""8 9
$str"": @
,""@ A
nullable""B J
:""J K
false""L Q
)""Q R
,""R S
fecha_matricula## #
=##$ %
table##& +
.##+ ,
Column##, 2
<##2 3
DateTime##3 ;
>##; <
(##< =
type##= A
:##A B
$str##C ]
,##] ^
nullable##_ g
:##g h
false##i n
)##n o
,##o p
xmin$$ 
=$$ 
table$$  
.$$  !
Column$$! '
<$$' (
uint$$( ,
>$$, -
($$- .
type$$. 2
:$$2 3
$str$$4 9
,$$9 :

rowVersion$$; E
:$$E F
true$$G K
,$$K L
nullable$$M U
:$$U V
false$$W \
)$$\ ]
}%% 
,%% 
constraints&& 
:&& 
table&& "
=>&&# %
{'' 
table(( 
.(( 

PrimaryKey(( $
((($ %
$str((% 4
,((4 5
x((6 7
=>((8 :
x((; <
.((< =
id((= ?
)((? @
;((@ A
table)) 
.)) 

ForeignKey)) $
())$ %
name** 
:** 
$str** G
,**G H
column++ 
:++ 
x++  !
=>++" $
x++% &
.++& '
estudiante_id++' 4
,++4 5
principalTable,, &
:,,& '
$str,,( 5
,,,5 6
principalColumn-- '
:--' (
$str--) -
,--- .
onDelete..  
:..  !
ReferentialAction.." 3
...3 4
Cascade..4 ;
)..; <
;..< =
}// 
)// 
;// 
migrationBuilder11 
.11 
CreateIndex11 (
(11( )
name22 
:22 
$str22 1
,221 2
table33 
:33 
$str33 $
,33$ %
column44 
:44 
$str44 $
,44$ %
unique55 
:55 
true55 
)55 
;55 
migrationBuilder77 
.77 
CreateIndex77 (
(77( )
name88 
:88 
$str88 3
,883 4
table99 
:99 
$str99 #
,99# $
column:: 
::: 
$str:: '
)::' (
;::( )
};; 	
	protected>> 
override>> 
void>> 
Down>>  $
(>>$ %
MigrationBuilder>>% 5
migrationBuilder>>6 F
)>>F G
{?? 	
migrationBuilder@@ 
.@@ 
	DropTable@@ &
(@@& '
nameAA 
:AA 
$strAA "
)AA" #
;AA# $
migrationBuilderCC 
.CC 
	DropTableCC &
(CC& '
nameDD 
:DD 
$strDD #
)DD# $
;DD$ %
}EE 	
}FF 
}GG √,
ÉD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Infrastructure\DependencyInjection.cs
	namespace 	
Estudiantes
 
. 
Infrastructure $
;$ %
public 
static 
class 
DependencyInjection '
{ 
public 

static 
IServiceCollection $
AddInfrastructure% 6
(6 7
this 
IServiceCollection 
services  (
,( )
IConfiguration 
configuration $
) 
{ 
services 
. 
AddTransient 
< 
IDateTimeProvider /
,/ 0
DateTimeProvider0 @
>@ A
(A B
)B C
;C D
var $
connectionStringPostgres (
=) *
configuration+ 8
.8 9
GetConnectionString9 L
(L M
$strM W
)W X
?? 

throw 
new !
ArgumentNullException *
(* +
nameof+ 1
(1 2
configuration2 ?
)? @
)@ A
;A B
var !
connectionStringRedis !
=" #
configuration$ 1
.1 2
GetConnectionString2 E
(E F
$strF M
)M N
?? 

throw 
new !
ArgumentNullException *
(* +
nameof+ 1
(1 2
configuration2 ?
)? @
)@ A
;A B
var 
usuariosApiBaseUrl 
=  
configuration! .
[. /
$str/ C
]C D
;D E
var   
cursosApiBaseUrl   
=   
configuration   ,
[  , -
$str  - ?
]  ? @
;  @ A
var!! 
docentesApiBaseUrl!! 
=!!  
configuration!!! .
[!!. /
$str!!/ C
]!!C D
;!!D E
services## 
.## 
AddDbContext## 
<##  
ApplicationDbContext## 2
>##2 3
(##3 4
options$$ 
=>$$ 
{%% 
options&& 
.&& 
	UseNpgsql&& !
(&&! "$
connectionStringPostgres&&" :
)&&: ;
.&&; <(
UseSnakeCaseNamingConvention&&< X
(&&X Y
)&&Y Z
;&&Z [
}'' 
)(( 	
;((	 

services**	 
.** 
AddSingleton** 
<** "
IConnectionMultiplexer** 5
>**5 6
(**6 7
sp**7 9
=>**: <
{++ 	
var,, 
configurationRedis,, "
=,,# $ 
ConfigurationOptions,,% 9
.,,9 :
Parse,,: ?
(,,? @!
connectionStringRedis,,@ U
),,U V
;,,V W
return-- !
ConnectionMultiplexer-- (
.--( )
Connect--) 0
(--0 1
configurationRedis--1 C
)--C D
;--D E
}.. 	
)..	 

;..
 
services00 
.00 
	AddScoped00 
<00 !
IEstudianteRepository00 0
,000 1 
EstudianteRepository001 E
>00E F
(00F G
)00G H
;00H I
services11 
.11 
	AddScoped11 
<11  
IMatriculaRepository11 /
,11/ 0
MatriculaRepository111 D
>11D E
(11E F
)11F G
;11G H
services33 
.33 
	AddScoped33 
<33 
IUnitOfWork33 &
>33& '
(33' (
sp33( *
=>33+ -
sp33. 0
.330 1
GetRequiredService331 C
<33C D 
ApplicationDbContext33D X
>33X Y
(33Y Z
)33Z [
)33[ \
;33\ ]
services55	 
.55 
AddHttpClient55 
<55  
IUsuariosService55  0
,550 1
UsuarioService552 @
>55@ A
(55A B
client55B H
=>55I K
{66 	
client77 
.77 
BaseAddress77 
=77  
new77! $
Uri77% (
(77( )
usuariosApiBaseUrl77) ;
!77; <
)77< =
;77= >
}88 	
)88	 

;88
 
services:: 
.:: 
AddHttpClient:: 
<:: 
ICursosService:: -
,::- .
CursoService::/ ;
>::; <
(::< =
client::= C
=>::D F
{;; 	
client<< 
.<< 
BaseAddress<< 
=<<  
new<<! $
Uri<<% (
(<<( )
cursosApiBaseUrl<<) 9
!<<9 :
)<<: ;
;<<; <
}== 	
)==	 

;==
 
services?? 
.?? 
AddHttpClient?? 
<?? 
IDocentesService?? /
,??/ 0
DocenteService??1 ?
>??? @
(??@ A
client??A G
=>??H J
{@@ 	
clientAA 
.AA 
BaseAddressAA 
=AA  
newAA! $
UriAA% (
(AA( )
docentesApiBaseUrlAA) ;
!AA; <
)AA< =
;AA= >
}BB 	
)BB	 

;BB
 
servicesDD 
.DD 
	AddScopedDD 
<DD 
ICacheServiceDD (
,DD( )
RedisCacheServiceDD* ;
>DD; <
(DD< =
)DD= >
;DD> ?
returnFF 
servicesFF 
;FF 
}GG 
}HH Á
ñD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Infrastructure\Configurations\MatriculaConfigurations.cs
	namespace 	
Estudiantes
 
. 
Infrastructure $
.$ %
Configurations% 3
;3 4
internal 
sealed	 
class !
UsuarioConfigurations +
:, -$
IEntityTypeConfiguration. F
<F G
	MatriculaG P
>P Q
{		 
public

 

void

 
	Configure

 
(

 
EntityTypeBuilder

 +
<

+ ,
	Matricula

, 5
>

5 6
builder

7 >
)

> ?
{ 
builder 
. 
ToTable 
( 
$str $
)$ %
;% &
builder 
. 
HasKey 
( 
x 
=> 
x 
. 
Id  
)  !
;! "
builder 
. 
Property 
( 
docente  
=>! #
docente$ +
.+ ,
	DocenteId, 5
)5 6
;6 7
builder 
. 
Property 
( 
curso 
=> !
curso" '
.' (
CursoId( /
)/ 0
;0 1
builder 
. 
Property 
( 

estudiante #
=>$ &

estudiante' 1
.1 2
EstudianteId2 >
)> ?
;? @
builder 
. 
HasOne 
( 

estudiante !
=>" $

estudiante% /
./ 0

Estudiante0 :
): ;
. 	
WithMany	 
( 
) 
. 	
HasForeignKey	 
( 

estudiante !
=>" $

estudiante% /
./ 0
EstudianteId0 <
)< =
. 	

IsRequired	 
( 
) 
; 
builder 
. 
Property 
< 
uint 
> 
( 
$str (
)( )
.) *
IsRowVersion* 6
(6 7
)7 8
;8 9
} 
} ˝
óD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Infrastructure\Configurations\EstudianteConfigurations.cs
	namespace 	
Estudiantes
 
. 
Infrastructure $
.$ %
Configurations% 3
;3 4
public 
class %
EstudiantesConfigurations &
:' ($
IEntityTypeConfiguration) A
<A B

EstudianteB L
>L M
{ 
public		 

void		 
	Configure		 
(		 
EntityTypeBuilder		 +
<		+ ,

Estudiante		, 6
>		6 7
builder		8 ?
)		? @
{

 
builder 
. 
ToTable 
( 
$str %
)% &
;& '
builder 
. 
HasKey 
( 
x 
=> 
x 
. 
Id  
)  !
;! "
builder 
. 
HasIndex 
( 
rol 
=> 
rol  #
.# $
	UsuarioId$ -
)- .
.. /
IsUnique/ 7
(7 8
)8 9
;9 :
builder 
. 
Property 
< 
uint 
> 
( 
$str (
)( )
.) *
IsRowVersion* 6
(6 7
)7 8
;8 9
} 
} œ
ÜD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Infrastructure\Clock\DateTimeProvider.cs
	namespace 	
Estudiantes
 
. 
Infrastructure $
.$ %
Clock% *
;* +
internal 
sealed	 
class 
DateTimeProvider &
:' (
IDateTimeProvider) :
{ 
public 

DateTime 
CurrentTime 
=>  "
DateTime# +
.+ ,
UtcNow, 2
;2 3
} Á
ÑD:\OneDrive\Trabajo\TecyLab\Curso Net y AWS\semana 12\Estudiantes\src\Estudiantes\Estudiantes.Infrastructure\ApplicationDbContext.cs
	namespace 	
Estudiantes
 
. 
Infrastructure $
;$ %
public 
sealed 
class  
ApplicationDbContext (
:) *
	DbContext+ 4
,4 5
IUnitOfWork6 A
{		 
public

 

readonly

 

IPublisher

 

_publisher

 )
;

) *
public 
 
ApplicationDbContext 
(  
DbContextOptions  0
options1 8
,8 9

IPublisher: D
	publisherE N
)N O
:P Q
baseR V
(V W
optionsW ^
)^ _
{ 

_publisher 
= 
	publisher 
; 
} 
public 

override 
async 
Task 
< 
int "
>" #
SaveChangesAsync$ 4
(4 5
CancellationToken5 F
cancellationTokenG X
)X Y
{ 
try 
{ 	
var 
result 
= 
await 
base #
.# $
SaveChangesAsync$ 4
(4 5
cancellationToken5 F
)F G
;G H
return 
result 
; 
} 	
catch 
( (
DbUpdateConcurrencyException +
ex, .
). /
{ 	
throw 
new  
ConcurrencyException *
(* +
$str+ U
,U V
exW Y
)Y Z
;Z [
} 	
} 
	protected 
override 
void 
OnModelCreating +
(+ ,
ModelBuilder, 8
modelBuilder9 E
)E F
{ 
modelBuilder   
.   +
ApplyConfigurationsFromAssembly   4
(  4 5
typeof  5 ;
(  ; < 
ApplicationDbContext  < P
)  P Q
.  Q R
Assembly  R Z
)  Z [
;  [ \
base!! 
.!! 
OnModelCreating!! 
(!! 
modelBuilder!! )
)!!) *
;!!* +
}"" 
}$$ 