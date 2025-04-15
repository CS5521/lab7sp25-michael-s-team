
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 dd 09 00 00 	movl   $0x9dd,(%esp)
  18:	e8 a9 04 00 00       	call   4c6 <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 dd 09 00 00 	movl   $0x9dd,(%esp)
  38:	e8 91 04 00 00       	call   4ce <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 dd 09 00 00 	movl   $0x9dd,(%esp)
  4c:	e8 75 04 00 00       	call   4c6 <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 a1 04 00 00       	call   4fe <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 95 04 00 00       	call   4fe <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  69:	c7 44 24 04 e5 09 00 	movl   $0x9e5,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 91 05 00 00       	call   60e <printf>
    pid = fork();
  7d:	e8 fc 03 00 00       	call   47e <fork>
  82:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
  86:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  8b:	79 19                	jns    a6 <main+0xa6>
      printf(1, "init: fork failed\n");
  8d:	c7 44 24 04 f8 09 00 	movl   $0x9f8,0x4(%esp)
  94:	00 
  95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9c:	e8 6d 05 00 00       	call   60e <printf>
      exit();
  a1:	e8 e0 03 00 00       	call   486 <exit>
    }
    if(pid == 0){
  a6:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  ab:	75 2d                	jne    da <main+0xda>
      exec("sh", argv);
  ad:	c7 44 24 04 cc 0c 00 	movl   $0xccc,0x4(%esp)
  b4:	00 
  b5:	c7 04 24 da 09 00 00 	movl   $0x9da,(%esp)
  bc:	e8 fd 03 00 00       	call   4be <exec>
      printf(1, "init: exec sh failed\n");
  c1:	c7 44 24 04 0b 0a 00 	movl   $0xa0b,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 39 05 00 00       	call   60e <printf>
      exit();
  d5:	e8 ac 03 00 00       	call   486 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  da:	eb 14                	jmp    f0 <main+0xf0>
      printf(1, "zombie!\n");
  dc:	c7 44 24 04 21 0a 00 	movl   $0xa21,0x4(%esp)
  e3:	00 
  e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  eb:	e8 1e 05 00 00       	call   60e <printf>
    while((wpid=wait()) >= 0 && wpid != pid)
  f0:	e8 99 03 00 00       	call   48e <wait>
  f5:	89 44 24 18          	mov    %eax,0x18(%esp)
  f9:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  fe:	78 0a                	js     10a <main+0x10a>
 100:	8b 44 24 18          	mov    0x18(%esp),%eax
 104:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 108:	75 d2                	jne    dc <main+0xdc>
  }
 10a:	e9 5a ff ff ff       	jmp    69 <main+0x69>

0000010f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	57                   	push   %edi
 113:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 114:	8b 4d 08             	mov    0x8(%ebp),%ecx
 117:	8b 55 10             	mov    0x10(%ebp),%edx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 cb                	mov    %ecx,%ebx
 11f:	89 df                	mov    %ebx,%edi
 121:	89 d1                	mov    %edx,%ecx
 123:	fc                   	cld    
 124:	f3 aa                	rep stos %al,%es:(%edi)
 126:	89 ca                	mov    %ecx,%edx
 128:	89 fb                	mov    %edi,%ebx
 12a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 130:	5b                   	pop    %ebx
 131:	5f                   	pop    %edi
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    

00000134 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13a:	8b 45 08             	mov    0x8(%ebp),%eax
 13d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 140:	90                   	nop
 141:	8b 45 08             	mov    0x8(%ebp),%eax
 144:	8d 50 01             	lea    0x1(%eax),%edx
 147:	89 55 08             	mov    %edx,0x8(%ebp)
 14a:	8b 55 0c             	mov    0xc(%ebp),%edx
 14d:	8d 4a 01             	lea    0x1(%edx),%ecx
 150:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 153:	0f b6 12             	movzbl (%edx),%edx
 156:	88 10                	mov    %dl,(%eax)
 158:	0f b6 00             	movzbl (%eax),%eax
 15b:	84 c0                	test   %al,%al
 15d:	75 e2                	jne    141 <strcpy+0xd>
    ;
  return os;
 15f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 162:	c9                   	leave  
 163:	c3                   	ret    

00000164 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 167:	eb 08                	jmp    171 <strcmp+0xd>
    p++, q++;
 169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	0f b6 00             	movzbl (%eax),%eax
 177:	84 c0                	test   %al,%al
 179:	74 10                	je     18b <strcmp+0x27>
 17b:	8b 45 08             	mov    0x8(%ebp),%eax
 17e:	0f b6 10             	movzbl (%eax),%edx
 181:	8b 45 0c             	mov    0xc(%ebp),%eax
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	38 c2                	cmp    %al,%dl
 189:	74 de                	je     169 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	0f b6 00             	movzbl (%eax),%eax
 191:	0f b6 d0             	movzbl %al,%edx
 194:	8b 45 0c             	mov    0xc(%ebp),%eax
 197:	0f b6 00             	movzbl (%eax),%eax
 19a:	0f b6 c0             	movzbl %al,%eax
 19d:	29 c2                	sub    %eax,%edx
 19f:	89 d0                	mov    %edx,%eax
}
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    

000001a3 <strlen>:

uint
strlen(const char *s)
{
 1a3:	55                   	push   %ebp
 1a4:	89 e5                	mov    %esp,%ebp
 1a6:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1a9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b0:	eb 04                	jmp    1b6 <strlen+0x13>
 1b2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1b6:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	01 d0                	add    %edx,%eax
 1be:	0f b6 00             	movzbl (%eax),%eax
 1c1:	84 c0                	test   %al,%al
 1c3:	75 ed                	jne    1b2 <strlen+0xf>
    ;
  return n;
 1c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1c8:	c9                   	leave  
 1c9:	c3                   	ret    

000001ca <memset>:

void*
memset(void *dst, int c, uint n)
{
 1ca:	55                   	push   %ebp
 1cb:	89 e5                	mov    %esp,%ebp
 1cd:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1d0:	8b 45 10             	mov    0x10(%ebp),%eax
 1d3:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1da:	89 44 24 04          	mov    %eax,0x4(%esp)
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	89 04 24             	mov    %eax,(%esp)
 1e4:	e8 26 ff ff ff       	call   10f <stosb>
  return dst;
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ec:	c9                   	leave  
 1ed:	c3                   	ret    

000001ee <strchr>:

char*
strchr(const char *s, char c)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	83 ec 04             	sub    $0x4,%esp
 1f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1fa:	eb 14                	jmp    210 <strchr+0x22>
    if(*s == c)
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	0f b6 00             	movzbl (%eax),%eax
 202:	3a 45 fc             	cmp    -0x4(%ebp),%al
 205:	75 05                	jne    20c <strchr+0x1e>
      return (char*)s;
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	eb 13                	jmp    21f <strchr+0x31>
  for(; *s; s++)
 20c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	0f b6 00             	movzbl (%eax),%eax
 216:	84 c0                	test   %al,%al
 218:	75 e2                	jne    1fc <strchr+0xe>
  return 0;
 21a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 21f:	c9                   	leave  
 220:	c3                   	ret    

00000221 <gets>:

char*
gets(char *buf, int max)
{
 221:	55                   	push   %ebp
 222:	89 e5                	mov    %esp,%ebp
 224:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 227:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 22e:	eb 4c                	jmp    27c <gets+0x5b>
    cc = read(0, &c, 1);
 230:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 237:	00 
 238:	8d 45 ef             	lea    -0x11(%ebp),%eax
 23b:	89 44 24 04          	mov    %eax,0x4(%esp)
 23f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 246:	e8 53 02 00 00       	call   49e <read>
 24b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 24e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 252:	7f 02                	jg     256 <gets+0x35>
      break;
 254:	eb 31                	jmp    287 <gets+0x66>
    buf[i++] = c;
 256:	8b 45 f4             	mov    -0xc(%ebp),%eax
 259:	8d 50 01             	lea    0x1(%eax),%edx
 25c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 25f:	89 c2                	mov    %eax,%edx
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	01 c2                	add    %eax,%edx
 266:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 26a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 26c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 270:	3c 0a                	cmp    $0xa,%al
 272:	74 13                	je     287 <gets+0x66>
 274:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 278:	3c 0d                	cmp    $0xd,%al
 27a:	74 0b                	je     287 <gets+0x66>
  for(i=0; i+1 < max; ){
 27c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 27f:	83 c0 01             	add    $0x1,%eax
 282:	3b 45 0c             	cmp    0xc(%ebp),%eax
 285:	7c a9                	jl     230 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 287:	8b 55 f4             	mov    -0xc(%ebp),%edx
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	01 d0                	add    %edx,%eax
 28f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 292:	8b 45 08             	mov    0x8(%ebp),%eax
}
 295:	c9                   	leave  
 296:	c3                   	ret    

00000297 <stat>:

int
stat(const char *n, struct stat *st)
{
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a4:	00 
 2a5:	8b 45 08             	mov    0x8(%ebp),%eax
 2a8:	89 04 24             	mov    %eax,(%esp)
 2ab:	e8 16 02 00 00       	call   4c6 <open>
 2b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2b7:	79 07                	jns    2c0 <stat+0x29>
    return -1;
 2b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2be:	eb 23                	jmp    2e3 <stat+0x4c>
  r = fstat(fd, st);
 2c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ca:	89 04 24             	mov    %eax,(%esp)
 2cd:	e8 0c 02 00 00       	call   4de <fstat>
 2d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d8:	89 04 24             	mov    %eax,(%esp)
 2db:	e8 ce 01 00 00       	call   4ae <close>
  return r;
 2e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    

000002e5 <atoi>:

int
atoi(const char *s)
{
 2e5:	55                   	push   %ebp
 2e6:	89 e5                	mov    %esp,%ebp
 2e8:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f2:	eb 25                	jmp    319 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2f4:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2f7:	89 d0                	mov    %edx,%eax
 2f9:	c1 e0 02             	shl    $0x2,%eax
 2fc:	01 d0                	add    %edx,%eax
 2fe:	01 c0                	add    %eax,%eax
 300:	89 c1                	mov    %eax,%ecx
 302:	8b 45 08             	mov    0x8(%ebp),%eax
 305:	8d 50 01             	lea    0x1(%eax),%edx
 308:	89 55 08             	mov    %edx,0x8(%ebp)
 30b:	0f b6 00             	movzbl (%eax),%eax
 30e:	0f be c0             	movsbl %al,%eax
 311:	01 c8                	add    %ecx,%eax
 313:	83 e8 30             	sub    $0x30,%eax
 316:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 319:	8b 45 08             	mov    0x8(%ebp),%eax
 31c:	0f b6 00             	movzbl (%eax),%eax
 31f:	3c 2f                	cmp    $0x2f,%al
 321:	7e 0a                	jle    32d <atoi+0x48>
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	0f b6 00             	movzbl (%eax),%eax
 329:	3c 39                	cmp    $0x39,%al
 32b:	7e c7                	jle    2f4 <atoi+0xf>
  return n;
 32d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 330:	c9                   	leave  
 331:	c3                   	ret    

00000332 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 33e:	8b 45 0c             	mov    0xc(%ebp),%eax
 341:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 344:	eb 17                	jmp    35d <memmove+0x2b>
    *dst++ = *src++;
 346:	8b 45 fc             	mov    -0x4(%ebp),%eax
 349:	8d 50 01             	lea    0x1(%eax),%edx
 34c:	89 55 fc             	mov    %edx,-0x4(%ebp)
 34f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 352:	8d 4a 01             	lea    0x1(%edx),%ecx
 355:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 358:	0f b6 12             	movzbl (%edx),%edx
 35b:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 35d:	8b 45 10             	mov    0x10(%ebp),%eax
 360:	8d 50 ff             	lea    -0x1(%eax),%edx
 363:	89 55 10             	mov    %edx,0x10(%ebp)
 366:	85 c0                	test   %eax,%eax
 368:	7f dc                	jg     346 <memmove+0x14>
  return vdst;
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36d:	c9                   	leave  
 36e:	c3                   	ret    

0000036f <ps>:

void
ps(void)
{
 36f:	55                   	push   %ebp
 370:	89 e5                	mov    %esp,%ebp
 372:	57                   	push   %edi
 373:	56                   	push   %esi
 374:	53                   	push   %ebx
 375:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable psinfo;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 37b:	c7 44 24 04 2a 0a 00 	movl   $0xa2a,0x4(%esp)
 382:	00 
 383:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 38a:	e8 7f 02 00 00       	call   60e <printf>
  int i;
  for (i = 0; i < NPROC; i++)
 38f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 396:	e9 ce 00 00 00       	jmp    469 <ps+0xfa>
  {
    if (psinfo[i].inuse)
 39b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 39e:	89 d0                	mov    %edx,%eax
 3a0:	c1 e0 03             	shl    $0x3,%eax
 3a3:	01 d0                	add    %edx,%eax
 3a5:	c1 e0 02             	shl    $0x2,%eax
 3a8:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 3ab:	01 d8                	add    %ebx,%eax
 3ad:	2d 04 09 00 00       	sub    $0x904,%eax
 3b2:	8b 00                	mov    (%eax),%eax
 3b4:	85 c0                	test   %eax,%eax
 3b6:	0f 84 a9 00 00 00    	je     465 <ps+0xf6>
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
         psinfo[i].pid,
         psinfo[i].tickets,
         psinfo[i].ticks,
         psinfo[i].state,
         psinfo[i].name);
 3bc:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 3c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3c5:	89 d0                	mov    %edx,%eax
 3c7:	c1 e0 03             	shl    $0x3,%eax
 3ca:	01 d0                	add    %edx,%eax
 3cc:	c1 e0 02             	shl    $0x2,%eax
 3cf:	83 c0 10             	add    $0x10,%eax
 3d2:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
         psinfo[i].state,
 3d5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3d8:	89 d0                	mov    %edx,%eax
 3da:	c1 e0 03             	shl    $0x3,%eax
 3dd:	01 d0                	add    %edx,%eax
 3df:	c1 e0 02             	shl    $0x2,%eax
 3e2:	8d 75 e8             	lea    -0x18(%ebp),%esi
 3e5:	01 f0                	add    %esi,%eax
 3e7:	2d e4 08 00 00       	sub    $0x8e4,%eax
 3ec:	0f b6 00             	movzbl (%eax),%eax
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
 3ef:	0f be f0             	movsbl %al,%esi
 3f2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3f5:	89 d0                	mov    %edx,%eax
 3f7:	c1 e0 03             	shl    $0x3,%eax
 3fa:	01 d0                	add    %edx,%eax
 3fc:	c1 e0 02             	shl    $0x2,%eax
 3ff:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 402:	01 c8                	add    %ecx,%eax
 404:	2d f8 08 00 00       	sub    $0x8f8,%eax
 409:	8b 18                	mov    (%eax),%ebx
 40b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 40e:	89 d0                	mov    %edx,%eax
 410:	c1 e0 03             	shl    $0x3,%eax
 413:	01 d0                	add    %edx,%eax
 415:	c1 e0 02             	shl    $0x2,%eax
 418:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 41b:	01 c8                	add    %ecx,%eax
 41d:	2d 00 09 00 00       	sub    $0x900,%eax
 422:	8b 08                	mov    (%eax),%ecx
 424:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 427:	89 d0                	mov    %edx,%eax
 429:	c1 e0 03             	shl    $0x3,%eax
 42c:	01 d0                	add    %edx,%eax
 42e:	c1 e0 02             	shl    $0x2,%eax
 431:	8d 55 e8             	lea    -0x18(%ebp),%edx
 434:	01 d0                	add    %edx,%eax
 436:	2d fc 08 00 00       	sub    $0x8fc,%eax
 43b:	8b 00                	mov    (%eax),%eax
 43d:	89 7c 24 18          	mov    %edi,0x18(%esp)
 441:	89 74 24 14          	mov    %esi,0x14(%esp)
 445:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 449:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 44d:	89 44 24 08          	mov    %eax,0x8(%esp)
 451:	c7 44 24 04 43 0a 00 	movl   $0xa43,0x4(%esp)
 458:	00 
 459:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 460:	e8 a9 01 00 00       	call   60e <printf>
  for (i = 0; i < NPROC; i++)
 465:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 469:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 46d:	0f 8e 28 ff ff ff    	jle    39b <ps+0x2c>
    }
  }
}
 473:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 479:	5b                   	pop    %ebx
 47a:	5e                   	pop    %esi
 47b:	5f                   	pop    %edi
 47c:	5d                   	pop    %ebp
 47d:	c3                   	ret    

0000047e <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 47e:	b8 01 00 00 00       	mov    $0x1,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <exit>:
SYSCALL(exit)
 486:	b8 02 00 00 00       	mov    $0x2,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <wait>:
SYSCALL(wait)
 48e:	b8 03 00 00 00       	mov    $0x3,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <pipe>:
SYSCALL(pipe)
 496:	b8 04 00 00 00       	mov    $0x4,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <read>:
SYSCALL(read)
 49e:	b8 05 00 00 00       	mov    $0x5,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <write>:
SYSCALL(write)
 4a6:	b8 10 00 00 00       	mov    $0x10,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <close>:
SYSCALL(close)
 4ae:	b8 15 00 00 00       	mov    $0x15,%eax
 4b3:	cd 40                	int    $0x40
 4b5:	c3                   	ret    

000004b6 <kill>:
SYSCALL(kill)
 4b6:	b8 06 00 00 00       	mov    $0x6,%eax
 4bb:	cd 40                	int    $0x40
 4bd:	c3                   	ret    

000004be <exec>:
SYSCALL(exec)
 4be:	b8 07 00 00 00       	mov    $0x7,%eax
 4c3:	cd 40                	int    $0x40
 4c5:	c3                   	ret    

000004c6 <open>:
SYSCALL(open)
 4c6:	b8 0f 00 00 00       	mov    $0xf,%eax
 4cb:	cd 40                	int    $0x40
 4cd:	c3                   	ret    

000004ce <mknod>:
SYSCALL(mknod)
 4ce:	b8 11 00 00 00       	mov    $0x11,%eax
 4d3:	cd 40                	int    $0x40
 4d5:	c3                   	ret    

000004d6 <unlink>:
SYSCALL(unlink)
 4d6:	b8 12 00 00 00       	mov    $0x12,%eax
 4db:	cd 40                	int    $0x40
 4dd:	c3                   	ret    

000004de <fstat>:
SYSCALL(fstat)
 4de:	b8 08 00 00 00       	mov    $0x8,%eax
 4e3:	cd 40                	int    $0x40
 4e5:	c3                   	ret    

000004e6 <link>:
SYSCALL(link)
 4e6:	b8 13 00 00 00       	mov    $0x13,%eax
 4eb:	cd 40                	int    $0x40
 4ed:	c3                   	ret    

000004ee <mkdir>:
SYSCALL(mkdir)
 4ee:	b8 14 00 00 00       	mov    $0x14,%eax
 4f3:	cd 40                	int    $0x40
 4f5:	c3                   	ret    

000004f6 <chdir>:
SYSCALL(chdir)
 4f6:	b8 09 00 00 00       	mov    $0x9,%eax
 4fb:	cd 40                	int    $0x40
 4fd:	c3                   	ret    

000004fe <dup>:
SYSCALL(dup)
 4fe:	b8 0a 00 00 00       	mov    $0xa,%eax
 503:	cd 40                	int    $0x40
 505:	c3                   	ret    

00000506 <getpid>:
SYSCALL(getpid)
 506:	b8 0b 00 00 00       	mov    $0xb,%eax
 50b:	cd 40                	int    $0x40
 50d:	c3                   	ret    

0000050e <sbrk>:
SYSCALL(sbrk)
 50e:	b8 0c 00 00 00       	mov    $0xc,%eax
 513:	cd 40                	int    $0x40
 515:	c3                   	ret    

00000516 <sleep>:
SYSCALL(sleep)
 516:	b8 0d 00 00 00       	mov    $0xd,%eax
 51b:	cd 40                	int    $0x40
 51d:	c3                   	ret    

0000051e <uptime>:
SYSCALL(uptime)
 51e:	b8 0e 00 00 00       	mov    $0xe,%eax
 523:	cd 40                	int    $0x40
 525:	c3                   	ret    

00000526 <getpinfo>:
SYSCALL(getpinfo)
 526:	b8 16 00 00 00       	mov    $0x16,%eax
 52b:	cd 40                	int    $0x40
 52d:	c3                   	ret    

0000052e <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 52e:	55                   	push   %ebp
 52f:	89 e5                	mov    %esp,%ebp
 531:	83 ec 18             	sub    $0x18,%esp
 534:	8b 45 0c             	mov    0xc(%ebp),%eax
 537:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 53a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 541:	00 
 542:	8d 45 f4             	lea    -0xc(%ebp),%eax
 545:	89 44 24 04          	mov    %eax,0x4(%esp)
 549:	8b 45 08             	mov    0x8(%ebp),%eax
 54c:	89 04 24             	mov    %eax,(%esp)
 54f:	e8 52 ff ff ff       	call   4a6 <write>
}
 554:	c9                   	leave  
 555:	c3                   	ret    

00000556 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 556:	55                   	push   %ebp
 557:	89 e5                	mov    %esp,%ebp
 559:	56                   	push   %esi
 55a:	53                   	push   %ebx
 55b:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 55e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 565:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 569:	74 17                	je     582 <printint+0x2c>
 56b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 56f:	79 11                	jns    582 <printint+0x2c>
    neg = 1;
 571:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 578:	8b 45 0c             	mov    0xc(%ebp),%eax
 57b:	f7 d8                	neg    %eax
 57d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 580:	eb 06                	jmp    588 <printint+0x32>
  } else {
    x = xx;
 582:	8b 45 0c             	mov    0xc(%ebp),%eax
 585:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 588:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 58f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 592:	8d 41 01             	lea    0x1(%ecx),%eax
 595:	89 45 f4             	mov    %eax,-0xc(%ebp)
 598:	8b 5d 10             	mov    0x10(%ebp),%ebx
 59b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 59e:	ba 00 00 00 00       	mov    $0x0,%edx
 5a3:	f7 f3                	div    %ebx
 5a5:	89 d0                	mov    %edx,%eax
 5a7:	0f b6 80 d4 0c 00 00 	movzbl 0xcd4(%eax),%eax
 5ae:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5b2:	8b 75 10             	mov    0x10(%ebp),%esi
 5b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5b8:	ba 00 00 00 00       	mov    $0x0,%edx
 5bd:	f7 f6                	div    %esi
 5bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5c2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5c6:	75 c7                	jne    58f <printint+0x39>
  if(neg)
 5c8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5cc:	74 10                	je     5de <printint+0x88>
    buf[i++] = '-';
 5ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5d1:	8d 50 01             	lea    0x1(%eax),%edx
 5d4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5d7:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5dc:	eb 1f                	jmp    5fd <printint+0xa7>
 5de:	eb 1d                	jmp    5fd <printint+0xa7>
    putc(fd, buf[i]);
 5e0:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5e6:	01 d0                	add    %edx,%eax
 5e8:	0f b6 00             	movzbl (%eax),%eax
 5eb:	0f be c0             	movsbl %al,%eax
 5ee:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f2:	8b 45 08             	mov    0x8(%ebp),%eax
 5f5:	89 04 24             	mov    %eax,(%esp)
 5f8:	e8 31 ff ff ff       	call   52e <putc>
  while(--i >= 0)
 5fd:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 601:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 605:	79 d9                	jns    5e0 <printint+0x8a>
}
 607:	83 c4 30             	add    $0x30,%esp
 60a:	5b                   	pop    %ebx
 60b:	5e                   	pop    %esi
 60c:	5d                   	pop    %ebp
 60d:	c3                   	ret    

0000060e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 60e:	55                   	push   %ebp
 60f:	89 e5                	mov    %esp,%ebp
 611:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 614:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 61b:	8d 45 0c             	lea    0xc(%ebp),%eax
 61e:	83 c0 04             	add    $0x4,%eax
 621:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 624:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 62b:	e9 7c 01 00 00       	jmp    7ac <printf+0x19e>
    c = fmt[i] & 0xff;
 630:	8b 55 0c             	mov    0xc(%ebp),%edx
 633:	8b 45 f0             	mov    -0x10(%ebp),%eax
 636:	01 d0                	add    %edx,%eax
 638:	0f b6 00             	movzbl (%eax),%eax
 63b:	0f be c0             	movsbl %al,%eax
 63e:	25 ff 00 00 00       	and    $0xff,%eax
 643:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 646:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 64a:	75 2c                	jne    678 <printf+0x6a>
      if(c == '%'){
 64c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 650:	75 0c                	jne    65e <printf+0x50>
        state = '%';
 652:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 659:	e9 4a 01 00 00       	jmp    7a8 <printf+0x19a>
      } else {
        putc(fd, c);
 65e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 661:	0f be c0             	movsbl %al,%eax
 664:	89 44 24 04          	mov    %eax,0x4(%esp)
 668:	8b 45 08             	mov    0x8(%ebp),%eax
 66b:	89 04 24             	mov    %eax,(%esp)
 66e:	e8 bb fe ff ff       	call   52e <putc>
 673:	e9 30 01 00 00       	jmp    7a8 <printf+0x19a>
      }
    } else if(state == '%'){
 678:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 67c:	0f 85 26 01 00 00    	jne    7a8 <printf+0x19a>
      if(c == 'd'){
 682:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 686:	75 2d                	jne    6b5 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 688:	8b 45 e8             	mov    -0x18(%ebp),%eax
 68b:	8b 00                	mov    (%eax),%eax
 68d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 694:	00 
 695:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 69c:	00 
 69d:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a1:	8b 45 08             	mov    0x8(%ebp),%eax
 6a4:	89 04 24             	mov    %eax,(%esp)
 6a7:	e8 aa fe ff ff       	call   556 <printint>
        ap++;
 6ac:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6b0:	e9 ec 00 00 00       	jmp    7a1 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6b5:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6b9:	74 06                	je     6c1 <printf+0xb3>
 6bb:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6bf:	75 2d                	jne    6ee <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6c4:	8b 00                	mov    (%eax),%eax
 6c6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6cd:	00 
 6ce:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6d5:	00 
 6d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6da:	8b 45 08             	mov    0x8(%ebp),%eax
 6dd:	89 04 24             	mov    %eax,(%esp)
 6e0:	e8 71 fe ff ff       	call   556 <printint>
        ap++;
 6e5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6e9:	e9 b3 00 00 00       	jmp    7a1 <printf+0x193>
      } else if(c == 's'){
 6ee:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6f2:	75 45                	jne    739 <printf+0x12b>
        s = (char*)*ap;
 6f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6f7:	8b 00                	mov    (%eax),%eax
 6f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6fc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 700:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 704:	75 09                	jne    70f <printf+0x101>
          s = "(null)";
 706:	c7 45 f4 53 0a 00 00 	movl   $0xa53,-0xc(%ebp)
        while(*s != 0){
 70d:	eb 1e                	jmp    72d <printf+0x11f>
 70f:	eb 1c                	jmp    72d <printf+0x11f>
          putc(fd, *s);
 711:	8b 45 f4             	mov    -0xc(%ebp),%eax
 714:	0f b6 00             	movzbl (%eax),%eax
 717:	0f be c0             	movsbl %al,%eax
 71a:	89 44 24 04          	mov    %eax,0x4(%esp)
 71e:	8b 45 08             	mov    0x8(%ebp),%eax
 721:	89 04 24             	mov    %eax,(%esp)
 724:	e8 05 fe ff ff       	call   52e <putc>
          s++;
 729:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 72d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 730:	0f b6 00             	movzbl (%eax),%eax
 733:	84 c0                	test   %al,%al
 735:	75 da                	jne    711 <printf+0x103>
 737:	eb 68                	jmp    7a1 <printf+0x193>
        }
      } else if(c == 'c'){
 739:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 73d:	75 1d                	jne    75c <printf+0x14e>
        putc(fd, *ap);
 73f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 742:	8b 00                	mov    (%eax),%eax
 744:	0f be c0             	movsbl %al,%eax
 747:	89 44 24 04          	mov    %eax,0x4(%esp)
 74b:	8b 45 08             	mov    0x8(%ebp),%eax
 74e:	89 04 24             	mov    %eax,(%esp)
 751:	e8 d8 fd ff ff       	call   52e <putc>
        ap++;
 756:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 75a:	eb 45                	jmp    7a1 <printf+0x193>
      } else if(c == '%'){
 75c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 760:	75 17                	jne    779 <printf+0x16b>
        putc(fd, c);
 762:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 765:	0f be c0             	movsbl %al,%eax
 768:	89 44 24 04          	mov    %eax,0x4(%esp)
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
 76f:	89 04 24             	mov    %eax,(%esp)
 772:	e8 b7 fd ff ff       	call   52e <putc>
 777:	eb 28                	jmp    7a1 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 779:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 780:	00 
 781:	8b 45 08             	mov    0x8(%ebp),%eax
 784:	89 04 24             	mov    %eax,(%esp)
 787:	e8 a2 fd ff ff       	call   52e <putc>
        putc(fd, c);
 78c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 78f:	0f be c0             	movsbl %al,%eax
 792:	89 44 24 04          	mov    %eax,0x4(%esp)
 796:	8b 45 08             	mov    0x8(%ebp),%eax
 799:	89 04 24             	mov    %eax,(%esp)
 79c:	e8 8d fd ff ff       	call   52e <putc>
      }
      state = 0;
 7a1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 7a8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7ac:	8b 55 0c             	mov    0xc(%ebp),%edx
 7af:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b2:	01 d0                	add    %edx,%eax
 7b4:	0f b6 00             	movzbl (%eax),%eax
 7b7:	84 c0                	test   %al,%al
 7b9:	0f 85 71 fe ff ff    	jne    630 <printf+0x22>
    }
  }
}
 7bf:	c9                   	leave  
 7c0:	c3                   	ret    

000007c1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7c1:	55                   	push   %ebp
 7c2:	89 e5                	mov    %esp,%ebp
 7c4:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7c7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ca:	83 e8 08             	sub    $0x8,%eax
 7cd:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d0:	a1 f0 0c 00 00       	mov    0xcf0,%eax
 7d5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7d8:	eb 24                	jmp    7fe <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7dd:	8b 00                	mov    (%eax),%eax
 7df:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7e2:	77 12                	ja     7f6 <free+0x35>
 7e4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ea:	77 24                	ja     810 <free+0x4f>
 7ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ef:	8b 00                	mov    (%eax),%eax
 7f1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7f4:	77 1a                	ja     810 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f9:	8b 00                	mov    (%eax),%eax
 7fb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7fe:	8b 45 f8             	mov    -0x8(%ebp),%eax
 801:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 804:	76 d4                	jbe    7da <free+0x19>
 806:	8b 45 fc             	mov    -0x4(%ebp),%eax
 809:	8b 00                	mov    (%eax),%eax
 80b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 80e:	76 ca                	jbe    7da <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 810:	8b 45 f8             	mov    -0x8(%ebp),%eax
 813:	8b 40 04             	mov    0x4(%eax),%eax
 816:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 81d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 820:	01 c2                	add    %eax,%edx
 822:	8b 45 fc             	mov    -0x4(%ebp),%eax
 825:	8b 00                	mov    (%eax),%eax
 827:	39 c2                	cmp    %eax,%edx
 829:	75 24                	jne    84f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 82b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82e:	8b 50 04             	mov    0x4(%eax),%edx
 831:	8b 45 fc             	mov    -0x4(%ebp),%eax
 834:	8b 00                	mov    (%eax),%eax
 836:	8b 40 04             	mov    0x4(%eax),%eax
 839:	01 c2                	add    %eax,%edx
 83b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 841:	8b 45 fc             	mov    -0x4(%ebp),%eax
 844:	8b 00                	mov    (%eax),%eax
 846:	8b 10                	mov    (%eax),%edx
 848:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84b:	89 10                	mov    %edx,(%eax)
 84d:	eb 0a                	jmp    859 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 84f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 852:	8b 10                	mov    (%eax),%edx
 854:	8b 45 f8             	mov    -0x8(%ebp),%eax
 857:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 859:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85c:	8b 40 04             	mov    0x4(%eax),%eax
 85f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 866:	8b 45 fc             	mov    -0x4(%ebp),%eax
 869:	01 d0                	add    %edx,%eax
 86b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 86e:	75 20                	jne    890 <free+0xcf>
    p->s.size += bp->s.size;
 870:	8b 45 fc             	mov    -0x4(%ebp),%eax
 873:	8b 50 04             	mov    0x4(%eax),%edx
 876:	8b 45 f8             	mov    -0x8(%ebp),%eax
 879:	8b 40 04             	mov    0x4(%eax),%eax
 87c:	01 c2                	add    %eax,%edx
 87e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 881:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 884:	8b 45 f8             	mov    -0x8(%ebp),%eax
 887:	8b 10                	mov    (%eax),%edx
 889:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88c:	89 10                	mov    %edx,(%eax)
 88e:	eb 08                	jmp    898 <free+0xd7>
  } else
    p->s.ptr = bp;
 890:	8b 45 fc             	mov    -0x4(%ebp),%eax
 893:	8b 55 f8             	mov    -0x8(%ebp),%edx
 896:	89 10                	mov    %edx,(%eax)
  freep = p;
 898:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89b:	a3 f0 0c 00 00       	mov    %eax,0xcf0
}
 8a0:	c9                   	leave  
 8a1:	c3                   	ret    

000008a2 <morecore>:

static Header*
morecore(uint nu)
{
 8a2:	55                   	push   %ebp
 8a3:	89 e5                	mov    %esp,%ebp
 8a5:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8a8:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8af:	77 07                	ja     8b8 <morecore+0x16>
    nu = 4096;
 8b1:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8b8:	8b 45 08             	mov    0x8(%ebp),%eax
 8bb:	c1 e0 03             	shl    $0x3,%eax
 8be:	89 04 24             	mov    %eax,(%esp)
 8c1:	e8 48 fc ff ff       	call   50e <sbrk>
 8c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8c9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8cd:	75 07                	jne    8d6 <morecore+0x34>
    return 0;
 8cf:	b8 00 00 00 00       	mov    $0x0,%eax
 8d4:	eb 22                	jmp    8f8 <morecore+0x56>
  hp = (Header*)p;
 8d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8df:	8b 55 08             	mov    0x8(%ebp),%edx
 8e2:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e8:	83 c0 08             	add    $0x8,%eax
 8eb:	89 04 24             	mov    %eax,(%esp)
 8ee:	e8 ce fe ff ff       	call   7c1 <free>
  return freep;
 8f3:	a1 f0 0c 00 00       	mov    0xcf0,%eax
}
 8f8:	c9                   	leave  
 8f9:	c3                   	ret    

000008fa <malloc>:

void*
malloc(uint nbytes)
{
 8fa:	55                   	push   %ebp
 8fb:	89 e5                	mov    %esp,%ebp
 8fd:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 900:	8b 45 08             	mov    0x8(%ebp),%eax
 903:	83 c0 07             	add    $0x7,%eax
 906:	c1 e8 03             	shr    $0x3,%eax
 909:	83 c0 01             	add    $0x1,%eax
 90c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 90f:	a1 f0 0c 00 00       	mov    0xcf0,%eax
 914:	89 45 f0             	mov    %eax,-0x10(%ebp)
 917:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 91b:	75 23                	jne    940 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 91d:	c7 45 f0 e8 0c 00 00 	movl   $0xce8,-0x10(%ebp)
 924:	8b 45 f0             	mov    -0x10(%ebp),%eax
 927:	a3 f0 0c 00 00       	mov    %eax,0xcf0
 92c:	a1 f0 0c 00 00       	mov    0xcf0,%eax
 931:	a3 e8 0c 00 00       	mov    %eax,0xce8
    base.s.size = 0;
 936:	c7 05 ec 0c 00 00 00 	movl   $0x0,0xcec
 93d:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 940:	8b 45 f0             	mov    -0x10(%ebp),%eax
 943:	8b 00                	mov    (%eax),%eax
 945:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 948:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94b:	8b 40 04             	mov    0x4(%eax),%eax
 94e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 951:	72 4d                	jb     9a0 <malloc+0xa6>
      if(p->s.size == nunits)
 953:	8b 45 f4             	mov    -0xc(%ebp),%eax
 956:	8b 40 04             	mov    0x4(%eax),%eax
 959:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 95c:	75 0c                	jne    96a <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 95e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 961:	8b 10                	mov    (%eax),%edx
 963:	8b 45 f0             	mov    -0x10(%ebp),%eax
 966:	89 10                	mov    %edx,(%eax)
 968:	eb 26                	jmp    990 <malloc+0x96>
      else {
        p->s.size -= nunits;
 96a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96d:	8b 40 04             	mov    0x4(%eax),%eax
 970:	2b 45 ec             	sub    -0x14(%ebp),%eax
 973:	89 c2                	mov    %eax,%edx
 975:	8b 45 f4             	mov    -0xc(%ebp),%eax
 978:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 97b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97e:	8b 40 04             	mov    0x4(%eax),%eax
 981:	c1 e0 03             	shl    $0x3,%eax
 984:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 987:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98a:	8b 55 ec             	mov    -0x14(%ebp),%edx
 98d:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 990:	8b 45 f0             	mov    -0x10(%ebp),%eax
 993:	a3 f0 0c 00 00       	mov    %eax,0xcf0
      return (void*)(p + 1);
 998:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99b:	83 c0 08             	add    $0x8,%eax
 99e:	eb 38                	jmp    9d8 <malloc+0xde>
    }
    if(p == freep)
 9a0:	a1 f0 0c 00 00       	mov    0xcf0,%eax
 9a5:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9a8:	75 1b                	jne    9c5 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9ad:	89 04 24             	mov    %eax,(%esp)
 9b0:	e8 ed fe ff ff       	call   8a2 <morecore>
 9b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9b8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9bc:	75 07                	jne    9c5 <malloc+0xcb>
        return 0;
 9be:	b8 00 00 00 00       	mov    $0x0,%eax
 9c3:	eb 13                	jmp    9d8 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ce:	8b 00                	mov    (%eax),%eax
 9d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9d3:	e9 70 ff ff ff       	jmp    948 <malloc+0x4e>
}
 9d8:	c9                   	leave  
 9d9:	c3                   	ret    
