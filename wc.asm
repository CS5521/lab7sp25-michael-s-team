
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 48             	sub    $0x48,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 68                	jmp    8a <wc+0x8a>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 57                	jmp    82 <wc+0x82>
      c++;
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 e0 0d 00 00       	add    $0xde0,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 e0 0d 00 00       	add    $0xde0,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	89 44 24 04          	mov    %eax,0x4(%esp)
  54:	c7 04 24 a4 0a 00 00 	movl   $0xaa4,(%esp)
  5b:	e8 58 02 00 00       	call   2b8 <strchr>
  60:	85 c0                	test   %eax,%eax
  62:	74 09                	je     6d <wc+0x6d>
        inword = 0;
  64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6b:	eb 11                	jmp    7e <wc+0x7e>
      else if(!inword){
  6d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  71:	75 0b                	jne    7e <wc+0x7e>
        w++;
  73:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  77:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
    for(i=0; i<n; i++){
  7e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  85:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  88:	7c a1                	jl     2b <wc+0x2b>
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  91:	00 
  92:	c7 44 24 04 e0 0d 00 	movl   $0xde0,0x4(%esp)
  99:	00 
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 c3 04 00 00       	call   568 <read>
  a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  ac:	0f 8f 70 ff ff ff    	jg     22 <wc+0x22>
      }
    }
  }
  if(n < 0){
  b2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b6:	79 19                	jns    d1 <wc+0xd1>
    printf(1, "wc: read error\n");
  b8:	c7 44 24 04 aa 0a 00 	movl   $0xaaa,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 0c 06 00 00       	call   6d8 <printf>
    exit();
  cc:	e8 7f 04 00 00       	call   550 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  d4:	89 44 24 14          	mov    %eax,0x14(%esp)
  d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  db:	89 44 24 10          	mov    %eax,0x10(%esp)
  df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  e2:	89 44 24 0c          	mov    %eax,0xc(%esp)
  e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  ed:	c7 44 24 04 ba 0a 00 	movl   $0xaba,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 d7 05 00 00       	call   6d8 <printf>
}
 101:	c9                   	leave  
 102:	c3                   	ret    

00000103 <main>:

int
main(int argc, char *argv[])
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	83 e4 f0             	and    $0xfffffff0,%esp
 109:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
 10c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 110:	7f 19                	jg     12b <main+0x28>
    wc(0, "");
 112:	c7 44 24 04 c7 0a 00 	movl   $0xac7,0x4(%esp)
 119:	00 
 11a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 121:	e8 da fe ff ff       	call   0 <wc>
    exit();
 126:	e8 25 04 00 00       	call   550 <exit>
  }

  for(i = 1; i < argc; i++){
 12b:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 132:	00 
 133:	e9 8f 00 00 00       	jmp    1c7 <main+0xc4>
    if((fd = open(argv[i], 0)) < 0){
 138:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 13c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	01 d0                	add    %edx,%eax
 148:	8b 00                	mov    (%eax),%eax
 14a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 151:	00 
 152:	89 04 24             	mov    %eax,(%esp)
 155:	e8 36 04 00 00       	call   590 <open>
 15a:	89 44 24 18          	mov    %eax,0x18(%esp)
 15e:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 163:	79 2f                	jns    194 <main+0x91>
      printf(1, "wc: cannot open %s\n", argv[i]);
 165:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 169:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 170:	8b 45 0c             	mov    0xc(%ebp),%eax
 173:	01 d0                	add    %edx,%eax
 175:	8b 00                	mov    (%eax),%eax
 177:	89 44 24 08          	mov    %eax,0x8(%esp)
 17b:	c7 44 24 04 c8 0a 00 	movl   $0xac8,0x4(%esp)
 182:	00 
 183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18a:	e8 49 05 00 00       	call   6d8 <printf>
      exit();
 18f:	e8 bc 03 00 00       	call   550 <exit>
    }
    wc(fd, argv[i]);
 194:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 198:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 19f:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a2:	01 d0                	add    %edx,%eax
 1a4:	8b 00                	mov    (%eax),%eax
 1a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1aa:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ae:	89 04 24             	mov    %eax,(%esp)
 1b1:	e8 4a fe ff ff       	call   0 <wc>
    close(fd);
 1b6:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ba:	89 04 24             	mov    %eax,(%esp)
 1bd:	e8 b6 03 00 00       	call   578 <close>
  for(i = 1; i < argc; i++){
 1c2:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1c7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1cb:	3b 45 08             	cmp    0x8(%ebp),%eax
 1ce:	0f 8c 64 ff ff ff    	jl     138 <main+0x35>
  }
  exit();
 1d4:	e8 77 03 00 00       	call   550 <exit>

000001d9 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	57                   	push   %edi
 1dd:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1de:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e1:	8b 55 10             	mov    0x10(%ebp),%edx
 1e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e7:	89 cb                	mov    %ecx,%ebx
 1e9:	89 df                	mov    %ebx,%edi
 1eb:	89 d1                	mov    %edx,%ecx
 1ed:	fc                   	cld    
 1ee:	f3 aa                	rep stos %al,%es:(%edi)
 1f0:	89 ca                	mov    %ecx,%edx
 1f2:	89 fb                	mov    %edi,%ebx
 1f4:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1f7:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1fa:	5b                   	pop    %ebx
 1fb:	5f                   	pop    %edi
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    

000001fe <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 204:	8b 45 08             	mov    0x8(%ebp),%eax
 207:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 20a:	90                   	nop
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	8d 50 01             	lea    0x1(%eax),%edx
 211:	89 55 08             	mov    %edx,0x8(%ebp)
 214:	8b 55 0c             	mov    0xc(%ebp),%edx
 217:	8d 4a 01             	lea    0x1(%edx),%ecx
 21a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 21d:	0f b6 12             	movzbl (%edx),%edx
 220:	88 10                	mov    %dl,(%eax)
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	84 c0                	test   %al,%al
 227:	75 e2                	jne    20b <strcpy+0xd>
    ;
  return os;
 229:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22c:	c9                   	leave  
 22d:	c3                   	ret    

0000022e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 22e:	55                   	push   %ebp
 22f:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 231:	eb 08                	jmp    23b <strcmp+0xd>
    p++, q++;
 233:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 237:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
 23e:	0f b6 00             	movzbl (%eax),%eax
 241:	84 c0                	test   %al,%al
 243:	74 10                	je     255 <strcmp+0x27>
 245:	8b 45 08             	mov    0x8(%ebp),%eax
 248:	0f b6 10             	movzbl (%eax),%edx
 24b:	8b 45 0c             	mov    0xc(%ebp),%eax
 24e:	0f b6 00             	movzbl (%eax),%eax
 251:	38 c2                	cmp    %al,%dl
 253:	74 de                	je     233 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 255:	8b 45 08             	mov    0x8(%ebp),%eax
 258:	0f b6 00             	movzbl (%eax),%eax
 25b:	0f b6 d0             	movzbl %al,%edx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	0f b6 c0             	movzbl %al,%eax
 267:	29 c2                	sub    %eax,%edx
 269:	89 d0                	mov    %edx,%eax
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <strlen>:

uint
strlen(const char *s)
{
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 273:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 27a:	eb 04                	jmp    280 <strlen+0x13>
 27c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 280:	8b 55 fc             	mov    -0x4(%ebp),%edx
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	01 d0                	add    %edx,%eax
 288:	0f b6 00             	movzbl (%eax),%eax
 28b:	84 c0                	test   %al,%al
 28d:	75 ed                	jne    27c <strlen+0xf>
    ;
  return n;
 28f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <memset>:

void*
memset(void *dst, int c, uint n)
{
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 29a:	8b 45 10             	mov    0x10(%ebp),%eax
 29d:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	89 04 24             	mov    %eax,(%esp)
 2ae:	e8 26 ff ff ff       	call   1d9 <stosb>
  return dst;
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b6:	c9                   	leave  
 2b7:	c3                   	ret    

000002b8 <strchr>:

char*
strchr(const char *s, char c)
{
 2b8:	55                   	push   %ebp
 2b9:	89 e5                	mov    %esp,%ebp
 2bb:	83 ec 04             	sub    $0x4,%esp
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2c4:	eb 14                	jmp    2da <strchr+0x22>
    if(*s == c)
 2c6:	8b 45 08             	mov    0x8(%ebp),%eax
 2c9:	0f b6 00             	movzbl (%eax),%eax
 2cc:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2cf:	75 05                	jne    2d6 <strchr+0x1e>
      return (char*)s;
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	eb 13                	jmp    2e9 <strchr+0x31>
  for(; *s; s++)
 2d6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
 2dd:	0f b6 00             	movzbl (%eax),%eax
 2e0:	84 c0                	test   %al,%al
 2e2:	75 e2                	jne    2c6 <strchr+0xe>
  return 0;
 2e4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e9:	c9                   	leave  
 2ea:	c3                   	ret    

000002eb <gets>:

char*
gets(char *buf, int max)
{
 2eb:	55                   	push   %ebp
 2ec:	89 e5                	mov    %esp,%ebp
 2ee:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2f8:	eb 4c                	jmp    346 <gets+0x5b>
    cc = read(0, &c, 1);
 2fa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 301:	00 
 302:	8d 45 ef             	lea    -0x11(%ebp),%eax
 305:	89 44 24 04          	mov    %eax,0x4(%esp)
 309:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 310:	e8 53 02 00 00       	call   568 <read>
 315:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 318:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 31c:	7f 02                	jg     320 <gets+0x35>
      break;
 31e:	eb 31                	jmp    351 <gets+0x66>
    buf[i++] = c;
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	8d 50 01             	lea    0x1(%eax),%edx
 326:	89 55 f4             	mov    %edx,-0xc(%ebp)
 329:	89 c2                	mov    %eax,%edx
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	01 c2                	add    %eax,%edx
 330:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 334:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 336:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33a:	3c 0a                	cmp    $0xa,%al
 33c:	74 13                	je     351 <gets+0x66>
 33e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 342:	3c 0d                	cmp    $0xd,%al
 344:	74 0b                	je     351 <gets+0x66>
  for(i=0; i+1 < max; ){
 346:	8b 45 f4             	mov    -0xc(%ebp),%eax
 349:	83 c0 01             	add    $0x1,%eax
 34c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 34f:	7c a9                	jl     2fa <gets+0xf>
      break;
  }
  buf[i] = '\0';
 351:	8b 55 f4             	mov    -0xc(%ebp),%edx
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	01 d0                	add    %edx,%eax
 359:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 35c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35f:	c9                   	leave  
 360:	c3                   	ret    

00000361 <stat>:

int
stat(const char *n, struct stat *st)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 367:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 36e:	00 
 36f:	8b 45 08             	mov    0x8(%ebp),%eax
 372:	89 04 24             	mov    %eax,(%esp)
 375:	e8 16 02 00 00       	call   590 <open>
 37a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 37d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 381:	79 07                	jns    38a <stat+0x29>
    return -1;
 383:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 388:	eb 23                	jmp    3ad <stat+0x4c>
  r = fstat(fd, st);
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	89 44 24 04          	mov    %eax,0x4(%esp)
 391:	8b 45 f4             	mov    -0xc(%ebp),%eax
 394:	89 04 24             	mov    %eax,(%esp)
 397:	e8 0c 02 00 00       	call   5a8 <fstat>
 39c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 39f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a2:	89 04 24             	mov    %eax,(%esp)
 3a5:	e8 ce 01 00 00       	call   578 <close>
  return r;
 3aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3ad:	c9                   	leave  
 3ae:	c3                   	ret    

000003af <atoi>:

int
atoi(const char *s)
{
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3b5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3bc:	eb 25                	jmp    3e3 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3be:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3c1:	89 d0                	mov    %edx,%eax
 3c3:	c1 e0 02             	shl    $0x2,%eax
 3c6:	01 d0                	add    %edx,%eax
 3c8:	01 c0                	add    %eax,%eax
 3ca:	89 c1                	mov    %eax,%ecx
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	8d 50 01             	lea    0x1(%eax),%edx
 3d2:	89 55 08             	mov    %edx,0x8(%ebp)
 3d5:	0f b6 00             	movzbl (%eax),%eax
 3d8:	0f be c0             	movsbl %al,%eax
 3db:	01 c8                	add    %ecx,%eax
 3dd:	83 e8 30             	sub    $0x30,%eax
 3e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	3c 2f                	cmp    $0x2f,%al
 3eb:	7e 0a                	jle    3f7 <atoi+0x48>
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	0f b6 00             	movzbl (%eax),%eax
 3f3:	3c 39                	cmp    $0x39,%al
 3f5:	7e c7                	jle    3be <atoi+0xf>
  return n;
 3f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3fa:	c9                   	leave  
 3fb:	c3                   	ret    

000003fc <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 402:	8b 45 08             	mov    0x8(%ebp),%eax
 405:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 408:	8b 45 0c             	mov    0xc(%ebp),%eax
 40b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 40e:	eb 17                	jmp    427 <memmove+0x2b>
    *dst++ = *src++;
 410:	8b 45 fc             	mov    -0x4(%ebp),%eax
 413:	8d 50 01             	lea    0x1(%eax),%edx
 416:	89 55 fc             	mov    %edx,-0x4(%ebp)
 419:	8b 55 f8             	mov    -0x8(%ebp),%edx
 41c:	8d 4a 01             	lea    0x1(%edx),%ecx
 41f:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 422:	0f b6 12             	movzbl (%edx),%edx
 425:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 427:	8b 45 10             	mov    0x10(%ebp),%eax
 42a:	8d 50 ff             	lea    -0x1(%eax),%edx
 42d:	89 55 10             	mov    %edx,0x10(%ebp)
 430:	85 c0                	test   %eax,%eax
 432:	7f dc                	jg     410 <memmove+0x14>
  return vdst;
 434:	8b 45 08             	mov    0x8(%ebp),%eax
}
 437:	c9                   	leave  
 438:	c3                   	ret    

00000439 <ps>:

void
ps(void)
{
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	57                   	push   %edi
 43d:	56                   	push   %esi
 43e:	53                   	push   %ebx
 43f:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable psinfo;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 445:	c7 44 24 04 dc 0a 00 	movl   $0xadc,0x4(%esp)
 44c:	00 
 44d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 454:	e8 7f 02 00 00       	call   6d8 <printf>
  int i;
  for (i = 0; i < NPROC; i++)
 459:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 460:	e9 ce 00 00 00       	jmp    533 <ps+0xfa>
  {
    if (psinfo[i].inuse)
 465:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 468:	89 d0                	mov    %edx,%eax
 46a:	c1 e0 03             	shl    $0x3,%eax
 46d:	01 d0                	add    %edx,%eax
 46f:	c1 e0 02             	shl    $0x2,%eax
 472:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 475:	01 d8                	add    %ebx,%eax
 477:	2d 04 09 00 00       	sub    $0x904,%eax
 47c:	8b 00                	mov    (%eax),%eax
 47e:	85 c0                	test   %eax,%eax
 480:	0f 84 a9 00 00 00    	je     52f <ps+0xf6>
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
         psinfo[i].pid,
         psinfo[i].tickets,
         psinfo[i].ticks,
         psinfo[i].state,
         psinfo[i].name);
 486:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 48c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 48f:	89 d0                	mov    %edx,%eax
 491:	c1 e0 03             	shl    $0x3,%eax
 494:	01 d0                	add    %edx,%eax
 496:	c1 e0 02             	shl    $0x2,%eax
 499:	83 c0 10             	add    $0x10,%eax
 49c:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
         psinfo[i].state,
 49f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4a2:	89 d0                	mov    %edx,%eax
 4a4:	c1 e0 03             	shl    $0x3,%eax
 4a7:	01 d0                	add    %edx,%eax
 4a9:	c1 e0 02             	shl    $0x2,%eax
 4ac:	8d 75 e8             	lea    -0x18(%ebp),%esi
 4af:	01 f0                	add    %esi,%eax
 4b1:	2d e4 08 00 00       	sub    $0x8e4,%eax
 4b6:	0f b6 00             	movzbl (%eax),%eax
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
 4b9:	0f be f0             	movsbl %al,%esi
 4bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4bf:	89 d0                	mov    %edx,%eax
 4c1:	c1 e0 03             	shl    $0x3,%eax
 4c4:	01 d0                	add    %edx,%eax
 4c6:	c1 e0 02             	shl    $0x2,%eax
 4c9:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4cc:	01 c8                	add    %ecx,%eax
 4ce:	2d f8 08 00 00       	sub    $0x8f8,%eax
 4d3:	8b 18                	mov    (%eax),%ebx
 4d5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4d8:	89 d0                	mov    %edx,%eax
 4da:	c1 e0 03             	shl    $0x3,%eax
 4dd:	01 d0                	add    %edx,%eax
 4df:	c1 e0 02             	shl    $0x2,%eax
 4e2:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4e5:	01 c8                	add    %ecx,%eax
 4e7:	2d 00 09 00 00       	sub    $0x900,%eax
 4ec:	8b 08                	mov    (%eax),%ecx
 4ee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4f1:	89 d0                	mov    %edx,%eax
 4f3:	c1 e0 03             	shl    $0x3,%eax
 4f6:	01 d0                	add    %edx,%eax
 4f8:	c1 e0 02             	shl    $0x2,%eax
 4fb:	8d 55 e8             	lea    -0x18(%ebp),%edx
 4fe:	01 d0                	add    %edx,%eax
 500:	2d fc 08 00 00       	sub    $0x8fc,%eax
 505:	8b 00                	mov    (%eax),%eax
 507:	89 7c 24 18          	mov    %edi,0x18(%esp)
 50b:	89 74 24 14          	mov    %esi,0x14(%esp)
 50f:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 513:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 517:	89 44 24 08          	mov    %eax,0x8(%esp)
 51b:	c7 44 24 04 f5 0a 00 	movl   $0xaf5,0x4(%esp)
 522:	00 
 523:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 52a:	e8 a9 01 00 00       	call   6d8 <printf>
  for (i = 0; i < NPROC; i++)
 52f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 533:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 537:	0f 8e 28 ff ff ff    	jle    465 <ps+0x2c>
    }
  }
}
 53d:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 543:	5b                   	pop    %ebx
 544:	5e                   	pop    %esi
 545:	5f                   	pop    %edi
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    

00000548 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 548:	b8 01 00 00 00       	mov    $0x1,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <exit>:
SYSCALL(exit)
 550:	b8 02 00 00 00       	mov    $0x2,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <wait>:
SYSCALL(wait)
 558:	b8 03 00 00 00       	mov    $0x3,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <pipe>:
SYSCALL(pipe)
 560:	b8 04 00 00 00       	mov    $0x4,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <read>:
SYSCALL(read)
 568:	b8 05 00 00 00       	mov    $0x5,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <write>:
SYSCALL(write)
 570:	b8 10 00 00 00       	mov    $0x10,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <close>:
SYSCALL(close)
 578:	b8 15 00 00 00       	mov    $0x15,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <kill>:
SYSCALL(kill)
 580:	b8 06 00 00 00       	mov    $0x6,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <exec>:
SYSCALL(exec)
 588:	b8 07 00 00 00       	mov    $0x7,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <open>:
SYSCALL(open)
 590:	b8 0f 00 00 00       	mov    $0xf,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <mknod>:
SYSCALL(mknod)
 598:	b8 11 00 00 00       	mov    $0x11,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <unlink>:
SYSCALL(unlink)
 5a0:	b8 12 00 00 00       	mov    $0x12,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <fstat>:
SYSCALL(fstat)
 5a8:	b8 08 00 00 00       	mov    $0x8,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <link>:
SYSCALL(link)
 5b0:	b8 13 00 00 00       	mov    $0x13,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <mkdir>:
SYSCALL(mkdir)
 5b8:	b8 14 00 00 00       	mov    $0x14,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <chdir>:
SYSCALL(chdir)
 5c0:	b8 09 00 00 00       	mov    $0x9,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <dup>:
SYSCALL(dup)
 5c8:	b8 0a 00 00 00       	mov    $0xa,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <getpid>:
SYSCALL(getpid)
 5d0:	b8 0b 00 00 00       	mov    $0xb,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <sbrk>:
SYSCALL(sbrk)
 5d8:	b8 0c 00 00 00       	mov    $0xc,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <sleep>:
SYSCALL(sleep)
 5e0:	b8 0d 00 00 00       	mov    $0xd,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <uptime>:
SYSCALL(uptime)
 5e8:	b8 0e 00 00 00       	mov    $0xe,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <getpinfo>:
SYSCALL(getpinfo)
 5f0:	b8 16 00 00 00       	mov    $0x16,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5f8:	55                   	push   %ebp
 5f9:	89 e5                	mov    %esp,%ebp
 5fb:	83 ec 18             	sub    $0x18,%esp
 5fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 601:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 604:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 60b:	00 
 60c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 60f:	89 44 24 04          	mov    %eax,0x4(%esp)
 613:	8b 45 08             	mov    0x8(%ebp),%eax
 616:	89 04 24             	mov    %eax,(%esp)
 619:	e8 52 ff ff ff       	call   570 <write>
}
 61e:	c9                   	leave  
 61f:	c3                   	ret    

00000620 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	56                   	push   %esi
 624:	53                   	push   %ebx
 625:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 628:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 62f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 633:	74 17                	je     64c <printint+0x2c>
 635:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 639:	79 11                	jns    64c <printint+0x2c>
    neg = 1;
 63b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 642:	8b 45 0c             	mov    0xc(%ebp),%eax
 645:	f7 d8                	neg    %eax
 647:	89 45 ec             	mov    %eax,-0x14(%ebp)
 64a:	eb 06                	jmp    652 <printint+0x32>
  } else {
    x = xx;
 64c:	8b 45 0c             	mov    0xc(%ebp),%eax
 64f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 652:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 659:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 65c:	8d 41 01             	lea    0x1(%ecx),%eax
 65f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 662:	8b 5d 10             	mov    0x10(%ebp),%ebx
 665:	8b 45 ec             	mov    -0x14(%ebp),%eax
 668:	ba 00 00 00 00       	mov    $0x0,%edx
 66d:	f7 f3                	div    %ebx
 66f:	89 d0                	mov    %edx,%eax
 671:	0f b6 80 9c 0d 00 00 	movzbl 0xd9c(%eax),%eax
 678:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 67c:	8b 75 10             	mov    0x10(%ebp),%esi
 67f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 682:	ba 00 00 00 00       	mov    $0x0,%edx
 687:	f7 f6                	div    %esi
 689:	89 45 ec             	mov    %eax,-0x14(%ebp)
 68c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 690:	75 c7                	jne    659 <printint+0x39>
  if(neg)
 692:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 696:	74 10                	je     6a8 <printint+0x88>
    buf[i++] = '-';
 698:	8b 45 f4             	mov    -0xc(%ebp),%eax
 69b:	8d 50 01             	lea    0x1(%eax),%edx
 69e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6a1:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6a6:	eb 1f                	jmp    6c7 <printint+0xa7>
 6a8:	eb 1d                	jmp    6c7 <printint+0xa7>
    putc(fd, buf[i]);
 6aa:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6b0:	01 d0                	add    %edx,%eax
 6b2:	0f b6 00             	movzbl (%eax),%eax
 6b5:	0f be c0             	movsbl %al,%eax
 6b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6bc:	8b 45 08             	mov    0x8(%ebp),%eax
 6bf:	89 04 24             	mov    %eax,(%esp)
 6c2:	e8 31 ff ff ff       	call   5f8 <putc>
  while(--i >= 0)
 6c7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6cf:	79 d9                	jns    6aa <printint+0x8a>
}
 6d1:	83 c4 30             	add    $0x30,%esp
 6d4:	5b                   	pop    %ebx
 6d5:	5e                   	pop    %esi
 6d6:	5d                   	pop    %ebp
 6d7:	c3                   	ret    

000006d8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6d8:	55                   	push   %ebp
 6d9:	89 e5                	mov    %esp,%ebp
 6db:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6de:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6e5:	8d 45 0c             	lea    0xc(%ebp),%eax
 6e8:	83 c0 04             	add    $0x4,%eax
 6eb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6ee:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6f5:	e9 7c 01 00 00       	jmp    876 <printf+0x19e>
    c = fmt[i] & 0xff;
 6fa:	8b 55 0c             	mov    0xc(%ebp),%edx
 6fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 700:	01 d0                	add    %edx,%eax
 702:	0f b6 00             	movzbl (%eax),%eax
 705:	0f be c0             	movsbl %al,%eax
 708:	25 ff 00 00 00       	and    $0xff,%eax
 70d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 710:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 714:	75 2c                	jne    742 <printf+0x6a>
      if(c == '%'){
 716:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 71a:	75 0c                	jne    728 <printf+0x50>
        state = '%';
 71c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 723:	e9 4a 01 00 00       	jmp    872 <printf+0x19a>
      } else {
        putc(fd, c);
 728:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 72b:	0f be c0             	movsbl %al,%eax
 72e:	89 44 24 04          	mov    %eax,0x4(%esp)
 732:	8b 45 08             	mov    0x8(%ebp),%eax
 735:	89 04 24             	mov    %eax,(%esp)
 738:	e8 bb fe ff ff       	call   5f8 <putc>
 73d:	e9 30 01 00 00       	jmp    872 <printf+0x19a>
      }
    } else if(state == '%'){
 742:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 746:	0f 85 26 01 00 00    	jne    872 <printf+0x19a>
      if(c == 'd'){
 74c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 750:	75 2d                	jne    77f <printf+0xa7>
        printint(fd, *ap, 10, 1);
 752:	8b 45 e8             	mov    -0x18(%ebp),%eax
 755:	8b 00                	mov    (%eax),%eax
 757:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 75e:	00 
 75f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 766:	00 
 767:	89 44 24 04          	mov    %eax,0x4(%esp)
 76b:	8b 45 08             	mov    0x8(%ebp),%eax
 76e:	89 04 24             	mov    %eax,(%esp)
 771:	e8 aa fe ff ff       	call   620 <printint>
        ap++;
 776:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 77a:	e9 ec 00 00 00       	jmp    86b <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 77f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 783:	74 06                	je     78b <printf+0xb3>
 785:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 789:	75 2d                	jne    7b8 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 78b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 78e:	8b 00                	mov    (%eax),%eax
 790:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 797:	00 
 798:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 79f:	00 
 7a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a4:	8b 45 08             	mov    0x8(%ebp),%eax
 7a7:	89 04 24             	mov    %eax,(%esp)
 7aa:	e8 71 fe ff ff       	call   620 <printint>
        ap++;
 7af:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7b3:	e9 b3 00 00 00       	jmp    86b <printf+0x193>
      } else if(c == 's'){
 7b8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7bc:	75 45                	jne    803 <printf+0x12b>
        s = (char*)*ap;
 7be:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7c1:	8b 00                	mov    (%eax),%eax
 7c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7c6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7ca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7ce:	75 09                	jne    7d9 <printf+0x101>
          s = "(null)";
 7d0:	c7 45 f4 05 0b 00 00 	movl   $0xb05,-0xc(%ebp)
        while(*s != 0){
 7d7:	eb 1e                	jmp    7f7 <printf+0x11f>
 7d9:	eb 1c                	jmp    7f7 <printf+0x11f>
          putc(fd, *s);
 7db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7de:	0f b6 00             	movzbl (%eax),%eax
 7e1:	0f be c0             	movsbl %al,%eax
 7e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 7e8:	8b 45 08             	mov    0x8(%ebp),%eax
 7eb:	89 04 24             	mov    %eax,(%esp)
 7ee:	e8 05 fe ff ff       	call   5f8 <putc>
          s++;
 7f3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 7f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fa:	0f b6 00             	movzbl (%eax),%eax
 7fd:	84 c0                	test   %al,%al
 7ff:	75 da                	jne    7db <printf+0x103>
 801:	eb 68                	jmp    86b <printf+0x193>
        }
      } else if(c == 'c'){
 803:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 807:	75 1d                	jne    826 <printf+0x14e>
        putc(fd, *ap);
 809:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80c:	8b 00                	mov    (%eax),%eax
 80e:	0f be c0             	movsbl %al,%eax
 811:	89 44 24 04          	mov    %eax,0x4(%esp)
 815:	8b 45 08             	mov    0x8(%ebp),%eax
 818:	89 04 24             	mov    %eax,(%esp)
 81b:	e8 d8 fd ff ff       	call   5f8 <putc>
        ap++;
 820:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 824:	eb 45                	jmp    86b <printf+0x193>
      } else if(c == '%'){
 826:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 82a:	75 17                	jne    843 <printf+0x16b>
        putc(fd, c);
 82c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 82f:	0f be c0             	movsbl %al,%eax
 832:	89 44 24 04          	mov    %eax,0x4(%esp)
 836:	8b 45 08             	mov    0x8(%ebp),%eax
 839:	89 04 24             	mov    %eax,(%esp)
 83c:	e8 b7 fd ff ff       	call   5f8 <putc>
 841:	eb 28                	jmp    86b <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 843:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 84a:	00 
 84b:	8b 45 08             	mov    0x8(%ebp),%eax
 84e:	89 04 24             	mov    %eax,(%esp)
 851:	e8 a2 fd ff ff       	call   5f8 <putc>
        putc(fd, c);
 856:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 859:	0f be c0             	movsbl %al,%eax
 85c:	89 44 24 04          	mov    %eax,0x4(%esp)
 860:	8b 45 08             	mov    0x8(%ebp),%eax
 863:	89 04 24             	mov    %eax,(%esp)
 866:	e8 8d fd ff ff       	call   5f8 <putc>
      }
      state = 0;
 86b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 872:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 876:	8b 55 0c             	mov    0xc(%ebp),%edx
 879:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87c:	01 d0                	add    %edx,%eax
 87e:	0f b6 00             	movzbl (%eax),%eax
 881:	84 c0                	test   %al,%al
 883:	0f 85 71 fe ff ff    	jne    6fa <printf+0x22>
    }
  }
}
 889:	c9                   	leave  
 88a:	c3                   	ret    

0000088b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 88b:	55                   	push   %ebp
 88c:	89 e5                	mov    %esp,%ebp
 88e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 891:	8b 45 08             	mov    0x8(%ebp),%eax
 894:	83 e8 08             	sub    $0x8,%eax
 897:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 89a:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 89f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8a2:	eb 24                	jmp    8c8 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a7:	8b 00                	mov    (%eax),%eax
 8a9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8ac:	77 12                	ja     8c0 <free+0x35>
 8ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8b4:	77 24                	ja     8da <free+0x4f>
 8b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b9:	8b 00                	mov    (%eax),%eax
 8bb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8be:	77 1a                	ja     8da <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c3:	8b 00                	mov    (%eax),%eax
 8c5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8cb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8ce:	76 d4                	jbe    8a4 <free+0x19>
 8d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d3:	8b 00                	mov    (%eax),%eax
 8d5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8d8:	76 ca                	jbe    8a4 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8dd:	8b 40 04             	mov    0x4(%eax),%eax
 8e0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ea:	01 c2                	add    %eax,%edx
 8ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ef:	8b 00                	mov    (%eax),%eax
 8f1:	39 c2                	cmp    %eax,%edx
 8f3:	75 24                	jne    919 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f8:	8b 50 04             	mov    0x4(%eax),%edx
 8fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8fe:	8b 00                	mov    (%eax),%eax
 900:	8b 40 04             	mov    0x4(%eax),%eax
 903:	01 c2                	add    %eax,%edx
 905:	8b 45 f8             	mov    -0x8(%ebp),%eax
 908:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 90b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90e:	8b 00                	mov    (%eax),%eax
 910:	8b 10                	mov    (%eax),%edx
 912:	8b 45 f8             	mov    -0x8(%ebp),%eax
 915:	89 10                	mov    %edx,(%eax)
 917:	eb 0a                	jmp    923 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 919:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91c:	8b 10                	mov    (%eax),%edx
 91e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 921:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 923:	8b 45 fc             	mov    -0x4(%ebp),%eax
 926:	8b 40 04             	mov    0x4(%eax),%eax
 929:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 930:	8b 45 fc             	mov    -0x4(%ebp),%eax
 933:	01 d0                	add    %edx,%eax
 935:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 938:	75 20                	jne    95a <free+0xcf>
    p->s.size += bp->s.size;
 93a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93d:	8b 50 04             	mov    0x4(%eax),%edx
 940:	8b 45 f8             	mov    -0x8(%ebp),%eax
 943:	8b 40 04             	mov    0x4(%eax),%eax
 946:	01 c2                	add    %eax,%edx
 948:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 94e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 951:	8b 10                	mov    (%eax),%edx
 953:	8b 45 fc             	mov    -0x4(%ebp),%eax
 956:	89 10                	mov    %edx,(%eax)
 958:	eb 08                	jmp    962 <free+0xd7>
  } else
    p->s.ptr = bp;
 95a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 960:	89 10                	mov    %edx,(%eax)
  freep = p;
 962:	8b 45 fc             	mov    -0x4(%ebp),%eax
 965:	a3 c8 0d 00 00       	mov    %eax,0xdc8
}
 96a:	c9                   	leave  
 96b:	c3                   	ret    

0000096c <morecore>:

static Header*
morecore(uint nu)
{
 96c:	55                   	push   %ebp
 96d:	89 e5                	mov    %esp,%ebp
 96f:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 972:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 979:	77 07                	ja     982 <morecore+0x16>
    nu = 4096;
 97b:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 982:	8b 45 08             	mov    0x8(%ebp),%eax
 985:	c1 e0 03             	shl    $0x3,%eax
 988:	89 04 24             	mov    %eax,(%esp)
 98b:	e8 48 fc ff ff       	call   5d8 <sbrk>
 990:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 993:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 997:	75 07                	jne    9a0 <morecore+0x34>
    return 0;
 999:	b8 00 00 00 00       	mov    $0x0,%eax
 99e:	eb 22                	jmp    9c2 <morecore+0x56>
  hp = (Header*)p;
 9a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a9:	8b 55 08             	mov    0x8(%ebp),%edx
 9ac:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9af:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b2:	83 c0 08             	add    $0x8,%eax
 9b5:	89 04 24             	mov    %eax,(%esp)
 9b8:	e8 ce fe ff ff       	call   88b <free>
  return freep;
 9bd:	a1 c8 0d 00 00       	mov    0xdc8,%eax
}
 9c2:	c9                   	leave  
 9c3:	c3                   	ret    

000009c4 <malloc>:

void*
malloc(uint nbytes)
{
 9c4:	55                   	push   %ebp
 9c5:	89 e5                	mov    %esp,%ebp
 9c7:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9ca:	8b 45 08             	mov    0x8(%ebp),%eax
 9cd:	83 c0 07             	add    $0x7,%eax
 9d0:	c1 e8 03             	shr    $0x3,%eax
 9d3:	83 c0 01             	add    $0x1,%eax
 9d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9d9:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 9de:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9e1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9e5:	75 23                	jne    a0a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9e7:	c7 45 f0 c0 0d 00 00 	movl   $0xdc0,-0x10(%ebp)
 9ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f1:	a3 c8 0d 00 00       	mov    %eax,0xdc8
 9f6:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 9fb:	a3 c0 0d 00 00       	mov    %eax,0xdc0
    base.s.size = 0;
 a00:	c7 05 c4 0d 00 00 00 	movl   $0x0,0xdc4
 a07:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0d:	8b 00                	mov    (%eax),%eax
 a0f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a12:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a15:	8b 40 04             	mov    0x4(%eax),%eax
 a18:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a1b:	72 4d                	jb     a6a <malloc+0xa6>
      if(p->s.size == nunits)
 a1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a20:	8b 40 04             	mov    0x4(%eax),%eax
 a23:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a26:	75 0c                	jne    a34 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a28:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2b:	8b 10                	mov    (%eax),%edx
 a2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a30:	89 10                	mov    %edx,(%eax)
 a32:	eb 26                	jmp    a5a <malloc+0x96>
      else {
        p->s.size -= nunits;
 a34:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a37:	8b 40 04             	mov    0x4(%eax),%eax
 a3a:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a3d:	89 c2                	mov    %eax,%edx
 a3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a42:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a45:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a48:	8b 40 04             	mov    0x4(%eax),%eax
 a4b:	c1 e0 03             	shl    $0x3,%eax
 a4e:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a51:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a54:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a57:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a5d:	a3 c8 0d 00 00       	mov    %eax,0xdc8
      return (void*)(p + 1);
 a62:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a65:	83 c0 08             	add    $0x8,%eax
 a68:	eb 38                	jmp    aa2 <malloc+0xde>
    }
    if(p == freep)
 a6a:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 a6f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a72:	75 1b                	jne    a8f <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a74:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a77:	89 04 24             	mov    %eax,(%esp)
 a7a:	e8 ed fe ff ff       	call   96c <morecore>
 a7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a82:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a86:	75 07                	jne    a8f <malloc+0xcb>
        return 0;
 a88:	b8 00 00 00 00       	mov    $0x0,%eax
 a8d:	eb 13                	jmp    aa2 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a92:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a95:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a98:	8b 00                	mov    (%eax),%eax
 a9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a9d:	e9 70 ff ff ff       	jmp    a12 <malloc+0x4e>
}
 aa2:	c9                   	leave  
 aa3:	c3                   	ret    
