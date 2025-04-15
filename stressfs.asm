
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	81 ec 30 02 00 00    	sub    $0x230,%esp
  int fd, i;
  char path[] = "stressfs0";
   c:	c7 84 24 1e 02 00 00 	movl   $0x65727473,0x21e(%esp)
  13:	73 74 72 65 
  17:	c7 84 24 22 02 00 00 	movl   $0x73667373,0x222(%esp)
  1e:	73 73 66 73 
  22:	66 c7 84 24 26 02 00 	movw   $0x30,0x226(%esp)
  29:	00 30 00 
  char data[512];

  printf(1, "stressfs starting\n");
  2c:	c7 44 24 04 7e 0a 00 	movl   $0xa7e,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	e8 72 06 00 00       	call   6b2 <printf>
  memset(data, 'a', sizeof(data));
  40:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  47:	00 
  48:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  4f:	00 
  50:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 12 02 00 00       	call   26e <memset>

  for(i = 0; i < 4; i++)
  5c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  63:	00 00 00 00 
  67:	eb 13                	jmp    7c <main+0x7c>
    if(fork() > 0)
  69:	e8 b4 04 00 00       	call   522 <fork>
  6e:	85 c0                	test   %eax,%eax
  70:	7e 02                	jle    74 <main+0x74>
      break;
  72:	eb 12                	jmp    86 <main+0x86>
  for(i = 0; i < 4; i++)
  74:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
  7b:	01 
  7c:	83 bc 24 2c 02 00 00 	cmpl   $0x3,0x22c(%esp)
  83:	03 
  84:	7e e3                	jle    69 <main+0x69>

  printf(1, "write %d\n", i);
  86:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  8d:	89 44 24 08          	mov    %eax,0x8(%esp)
  91:	c7 44 24 04 91 0a 00 	movl   $0xa91,0x4(%esp)
  98:	00 
  99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a0:	e8 0d 06 00 00       	call   6b2 <printf>

  path[8] += i;
  a5:	0f b6 84 24 26 02 00 	movzbl 0x226(%esp),%eax
  ac:	00 
  ad:	89 c2                	mov    %eax,%edx
  af:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  b6:	01 d0                	add    %edx,%eax
  b8:	88 84 24 26 02 00 00 	mov    %al,0x226(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  bf:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  c6:	00 
  c7:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
  ce:	89 04 24             	mov    %eax,(%esp)
  d1:	e8 94 04 00 00       	call   56a <open>
  d6:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for(i = 0; i < 20; i++)
  dd:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  e4:	00 00 00 00 
  e8:	eb 27                	jmp    111 <main+0x111>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  ea:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  f1:	00 
  f2:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  fa:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 101:	89 04 24             	mov    %eax,(%esp)
 104:	e8 41 04 00 00       	call   54a <write>
  for(i = 0; i < 20; i++)
 109:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 110:	01 
 111:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 118:	13 
 119:	7e cf                	jle    ea <main+0xea>
  close(fd);
 11b:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 122:	89 04 24             	mov    %eax,(%esp)
 125:	e8 28 04 00 00       	call   552 <close>

  printf(1, "read\n");
 12a:	c7 44 24 04 9b 0a 00 	movl   $0xa9b,0x4(%esp)
 131:	00 
 132:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 139:	e8 74 05 00 00       	call   6b2 <printf>

  fd = open(path, O_RDONLY);
 13e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 145:	00 
 146:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
 14d:	89 04 24             	mov    %eax,(%esp)
 150:	e8 15 04 00 00       	call   56a <open>
 155:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for (i = 0; i < 20; i++)
 15c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
 163:	00 00 00 00 
 167:	eb 27                	jmp    190 <main+0x190>
    read(fd, data, sizeof(data));
 169:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 170:	00 
 171:	8d 44 24 1e          	lea    0x1e(%esp),%eax
 175:	89 44 24 04          	mov    %eax,0x4(%esp)
 179:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 180:	89 04 24             	mov    %eax,(%esp)
 183:	e8 ba 03 00 00       	call   542 <read>
  for (i = 0; i < 20; i++)
 188:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 18f:	01 
 190:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 197:	13 
 198:	7e cf                	jle    169 <main+0x169>
  close(fd);
 19a:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 1a1:	89 04 24             	mov    %eax,(%esp)
 1a4:	e8 a9 03 00 00       	call   552 <close>

  wait();
 1a9:	e8 84 03 00 00       	call   532 <wait>

  exit();
 1ae:	e8 77 03 00 00       	call   52a <exit>

000001b3 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1b3:	55                   	push   %ebp
 1b4:	89 e5                	mov    %esp,%ebp
 1b6:	57                   	push   %edi
 1b7:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1bb:	8b 55 10             	mov    0x10(%ebp),%edx
 1be:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c1:	89 cb                	mov    %ecx,%ebx
 1c3:	89 df                	mov    %ebx,%edi
 1c5:	89 d1                	mov    %edx,%ecx
 1c7:	fc                   	cld    
 1c8:	f3 aa                	rep stos %al,%es:(%edi)
 1ca:	89 ca                	mov    %ecx,%edx
 1cc:	89 fb                	mov    %edi,%ebx
 1ce:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1d1:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1d4:	5b                   	pop    %ebx
 1d5:	5f                   	pop    %edi
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    

000001d8 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1e4:	90                   	nop
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	8d 50 01             	lea    0x1(%eax),%edx
 1eb:	89 55 08             	mov    %edx,0x8(%ebp)
 1ee:	8b 55 0c             	mov    0xc(%ebp),%edx
 1f1:	8d 4a 01             	lea    0x1(%edx),%ecx
 1f4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1f7:	0f b6 12             	movzbl (%edx),%edx
 1fa:	88 10                	mov    %dl,(%eax)
 1fc:	0f b6 00             	movzbl (%eax),%eax
 1ff:	84 c0                	test   %al,%al
 201:	75 e2                	jne    1e5 <strcpy+0xd>
    ;
  return os;
 203:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 20b:	eb 08                	jmp    215 <strcmp+0xd>
    p++, q++;
 20d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 211:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 215:	8b 45 08             	mov    0x8(%ebp),%eax
 218:	0f b6 00             	movzbl (%eax),%eax
 21b:	84 c0                	test   %al,%al
 21d:	74 10                	je     22f <strcmp+0x27>
 21f:	8b 45 08             	mov    0x8(%ebp),%eax
 222:	0f b6 10             	movzbl (%eax),%edx
 225:	8b 45 0c             	mov    0xc(%ebp),%eax
 228:	0f b6 00             	movzbl (%eax),%eax
 22b:	38 c2                	cmp    %al,%dl
 22d:	74 de                	je     20d <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 22f:	8b 45 08             	mov    0x8(%ebp),%eax
 232:	0f b6 00             	movzbl (%eax),%eax
 235:	0f b6 d0             	movzbl %al,%edx
 238:	8b 45 0c             	mov    0xc(%ebp),%eax
 23b:	0f b6 00             	movzbl (%eax),%eax
 23e:	0f b6 c0             	movzbl %al,%eax
 241:	29 c2                	sub    %eax,%edx
 243:	89 d0                	mov    %edx,%eax
}
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    

00000247 <strlen>:

uint
strlen(const char *s)
{
 247:	55                   	push   %ebp
 248:	89 e5                	mov    %esp,%ebp
 24a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 24d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 254:	eb 04                	jmp    25a <strlen+0x13>
 256:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 25a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 25d:	8b 45 08             	mov    0x8(%ebp),%eax
 260:	01 d0                	add    %edx,%eax
 262:	0f b6 00             	movzbl (%eax),%eax
 265:	84 c0                	test   %al,%al
 267:	75 ed                	jne    256 <strlen+0xf>
    ;
  return n;
 269:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 26c:	c9                   	leave  
 26d:	c3                   	ret    

0000026e <memset>:

void*
memset(void *dst, int c, uint n)
{
 26e:	55                   	push   %ebp
 26f:	89 e5                	mov    %esp,%ebp
 271:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 274:	8b 45 10             	mov    0x10(%ebp),%eax
 277:	89 44 24 08          	mov    %eax,0x8(%esp)
 27b:	8b 45 0c             	mov    0xc(%ebp),%eax
 27e:	89 44 24 04          	mov    %eax,0x4(%esp)
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	89 04 24             	mov    %eax,(%esp)
 288:	e8 26 ff ff ff       	call   1b3 <stosb>
  return dst;
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 290:	c9                   	leave  
 291:	c3                   	ret    

00000292 <strchr>:

char*
strchr(const char *s, char c)
{
 292:	55                   	push   %ebp
 293:	89 e5                	mov    %esp,%ebp
 295:	83 ec 04             	sub    $0x4,%esp
 298:	8b 45 0c             	mov    0xc(%ebp),%eax
 29b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 29e:	eb 14                	jmp    2b4 <strchr+0x22>
    if(*s == c)
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
 2a3:	0f b6 00             	movzbl (%eax),%eax
 2a6:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2a9:	75 05                	jne    2b0 <strchr+0x1e>
      return (char*)s;
 2ab:	8b 45 08             	mov    0x8(%ebp),%eax
 2ae:	eb 13                	jmp    2c3 <strchr+0x31>
  for(; *s; s++)
 2b0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	0f b6 00             	movzbl (%eax),%eax
 2ba:	84 c0                	test   %al,%al
 2bc:	75 e2                	jne    2a0 <strchr+0xe>
  return 0;
 2be:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c3:	c9                   	leave  
 2c4:	c3                   	ret    

000002c5 <gets>:

char*
gets(char *buf, int max)
{
 2c5:	55                   	push   %ebp
 2c6:	89 e5                	mov    %esp,%ebp
 2c8:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2cb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2d2:	eb 4c                	jmp    320 <gets+0x5b>
    cc = read(0, &c, 1);
 2d4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2db:	00 
 2dc:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2df:	89 44 24 04          	mov    %eax,0x4(%esp)
 2e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2ea:	e8 53 02 00 00       	call   542 <read>
 2ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2f6:	7f 02                	jg     2fa <gets+0x35>
      break;
 2f8:	eb 31                	jmp    32b <gets+0x66>
    buf[i++] = c;
 2fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2fd:	8d 50 01             	lea    0x1(%eax),%edx
 300:	89 55 f4             	mov    %edx,-0xc(%ebp)
 303:	89 c2                	mov    %eax,%edx
 305:	8b 45 08             	mov    0x8(%ebp),%eax
 308:	01 c2                	add    %eax,%edx
 30a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 30e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 310:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 314:	3c 0a                	cmp    $0xa,%al
 316:	74 13                	je     32b <gets+0x66>
 318:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 31c:	3c 0d                	cmp    $0xd,%al
 31e:	74 0b                	je     32b <gets+0x66>
  for(i=0; i+1 < max; ){
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	83 c0 01             	add    $0x1,%eax
 326:	3b 45 0c             	cmp    0xc(%ebp),%eax
 329:	7c a9                	jl     2d4 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 32b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	01 d0                	add    %edx,%eax
 333:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 336:	8b 45 08             	mov    0x8(%ebp),%eax
}
 339:	c9                   	leave  
 33a:	c3                   	ret    

0000033b <stat>:

int
stat(const char *n, struct stat *st)
{
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 341:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 348:	00 
 349:	8b 45 08             	mov    0x8(%ebp),%eax
 34c:	89 04 24             	mov    %eax,(%esp)
 34f:	e8 16 02 00 00       	call   56a <open>
 354:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 357:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 35b:	79 07                	jns    364 <stat+0x29>
    return -1;
 35d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 362:	eb 23                	jmp    387 <stat+0x4c>
  r = fstat(fd, st);
 364:	8b 45 0c             	mov    0xc(%ebp),%eax
 367:	89 44 24 04          	mov    %eax,0x4(%esp)
 36b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 36e:	89 04 24             	mov    %eax,(%esp)
 371:	e8 0c 02 00 00       	call   582 <fstat>
 376:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 379:	8b 45 f4             	mov    -0xc(%ebp),%eax
 37c:	89 04 24             	mov    %eax,(%esp)
 37f:	e8 ce 01 00 00       	call   552 <close>
  return r;
 384:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 387:	c9                   	leave  
 388:	c3                   	ret    

00000389 <atoi>:

int
atoi(const char *s)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 38f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 396:	eb 25                	jmp    3bd <atoi+0x34>
    n = n*10 + *s++ - '0';
 398:	8b 55 fc             	mov    -0x4(%ebp),%edx
 39b:	89 d0                	mov    %edx,%eax
 39d:	c1 e0 02             	shl    $0x2,%eax
 3a0:	01 d0                	add    %edx,%eax
 3a2:	01 c0                	add    %eax,%eax
 3a4:	89 c1                	mov    %eax,%ecx
 3a6:	8b 45 08             	mov    0x8(%ebp),%eax
 3a9:	8d 50 01             	lea    0x1(%eax),%edx
 3ac:	89 55 08             	mov    %edx,0x8(%ebp)
 3af:	0f b6 00             	movzbl (%eax),%eax
 3b2:	0f be c0             	movsbl %al,%eax
 3b5:	01 c8                	add    %ecx,%eax
 3b7:	83 e8 30             	sub    $0x30,%eax
 3ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	0f b6 00             	movzbl (%eax),%eax
 3c3:	3c 2f                	cmp    $0x2f,%al
 3c5:	7e 0a                	jle    3d1 <atoi+0x48>
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 00             	movzbl (%eax),%eax
 3cd:	3c 39                	cmp    $0x39,%al
 3cf:	7e c7                	jle    398 <atoi+0xf>
  return n;
 3d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3d4:	c9                   	leave  
 3d5:	c3                   	ret    

000003d6 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 3dc:	8b 45 08             	mov    0x8(%ebp),%eax
 3df:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3e8:	eb 17                	jmp    401 <memmove+0x2b>
    *dst++ = *src++;
 3ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3ed:	8d 50 01             	lea    0x1(%eax),%edx
 3f0:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3f3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3f6:	8d 4a 01             	lea    0x1(%edx),%ecx
 3f9:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3fc:	0f b6 12             	movzbl (%edx),%edx
 3ff:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 401:	8b 45 10             	mov    0x10(%ebp),%eax
 404:	8d 50 ff             	lea    -0x1(%eax),%edx
 407:	89 55 10             	mov    %edx,0x10(%ebp)
 40a:	85 c0                	test   %eax,%eax
 40c:	7f dc                	jg     3ea <memmove+0x14>
  return vdst;
 40e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 411:	c9                   	leave  
 412:	c3                   	ret    

00000413 <ps>:

void
ps(void)
{
 413:	55                   	push   %ebp
 414:	89 e5                	mov    %esp,%ebp
 416:	57                   	push   %edi
 417:	56                   	push   %esi
 418:	53                   	push   %ebx
 419:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable psinfo;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 41f:	c7 44 24 04 a1 0a 00 	movl   $0xaa1,0x4(%esp)
 426:	00 
 427:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 42e:	e8 7f 02 00 00       	call   6b2 <printf>
  int i;
  for (i = 0; i < NPROC; i++)
 433:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 43a:	e9 ce 00 00 00       	jmp    50d <ps+0xfa>
  {
    if (psinfo[i].inuse)
 43f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 442:	89 d0                	mov    %edx,%eax
 444:	c1 e0 03             	shl    $0x3,%eax
 447:	01 d0                	add    %edx,%eax
 449:	c1 e0 02             	shl    $0x2,%eax
 44c:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 44f:	01 d8                	add    %ebx,%eax
 451:	2d 04 09 00 00       	sub    $0x904,%eax
 456:	8b 00                	mov    (%eax),%eax
 458:	85 c0                	test   %eax,%eax
 45a:	0f 84 a9 00 00 00    	je     509 <ps+0xf6>
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
         psinfo[i].pid,
         psinfo[i].tickets,
         psinfo[i].ticks,
         psinfo[i].state,
         psinfo[i].name);
 460:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 466:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 469:	89 d0                	mov    %edx,%eax
 46b:	c1 e0 03             	shl    $0x3,%eax
 46e:	01 d0                	add    %edx,%eax
 470:	c1 e0 02             	shl    $0x2,%eax
 473:	83 c0 10             	add    $0x10,%eax
 476:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
         psinfo[i].state,
 479:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 47c:	89 d0                	mov    %edx,%eax
 47e:	c1 e0 03             	shl    $0x3,%eax
 481:	01 d0                	add    %edx,%eax
 483:	c1 e0 02             	shl    $0x2,%eax
 486:	8d 75 e8             	lea    -0x18(%ebp),%esi
 489:	01 f0                	add    %esi,%eax
 48b:	2d e4 08 00 00       	sub    $0x8e4,%eax
 490:	0f b6 00             	movzbl (%eax),%eax
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
 493:	0f be f0             	movsbl %al,%esi
 496:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 499:	89 d0                	mov    %edx,%eax
 49b:	c1 e0 03             	shl    $0x3,%eax
 49e:	01 d0                	add    %edx,%eax
 4a0:	c1 e0 02             	shl    $0x2,%eax
 4a3:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4a6:	01 c8                	add    %ecx,%eax
 4a8:	2d f8 08 00 00       	sub    $0x8f8,%eax
 4ad:	8b 18                	mov    (%eax),%ebx
 4af:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4b2:	89 d0                	mov    %edx,%eax
 4b4:	c1 e0 03             	shl    $0x3,%eax
 4b7:	01 d0                	add    %edx,%eax
 4b9:	c1 e0 02             	shl    $0x2,%eax
 4bc:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4bf:	01 c8                	add    %ecx,%eax
 4c1:	2d 00 09 00 00       	sub    $0x900,%eax
 4c6:	8b 08                	mov    (%eax),%ecx
 4c8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4cb:	89 d0                	mov    %edx,%eax
 4cd:	c1 e0 03             	shl    $0x3,%eax
 4d0:	01 d0                	add    %edx,%eax
 4d2:	c1 e0 02             	shl    $0x2,%eax
 4d5:	8d 55 e8             	lea    -0x18(%ebp),%edx
 4d8:	01 d0                	add    %edx,%eax
 4da:	2d fc 08 00 00       	sub    $0x8fc,%eax
 4df:	8b 00                	mov    (%eax),%eax
 4e1:	89 7c 24 18          	mov    %edi,0x18(%esp)
 4e5:	89 74 24 14          	mov    %esi,0x14(%esp)
 4e9:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 4ed:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 4f1:	89 44 24 08          	mov    %eax,0x8(%esp)
 4f5:	c7 44 24 04 ba 0a 00 	movl   $0xaba,0x4(%esp)
 4fc:	00 
 4fd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 504:	e8 a9 01 00 00       	call   6b2 <printf>
  for (i = 0; i < NPROC; i++)
 509:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 50d:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 511:	0f 8e 28 ff ff ff    	jle    43f <ps+0x2c>
    }
  }
}
 517:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 51d:	5b                   	pop    %ebx
 51e:	5e                   	pop    %esi
 51f:	5f                   	pop    %edi
 520:	5d                   	pop    %ebp
 521:	c3                   	ret    

00000522 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 522:	b8 01 00 00 00       	mov    $0x1,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <exit>:
SYSCALL(exit)
 52a:	b8 02 00 00 00       	mov    $0x2,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <wait>:
SYSCALL(wait)
 532:	b8 03 00 00 00       	mov    $0x3,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <pipe>:
SYSCALL(pipe)
 53a:	b8 04 00 00 00       	mov    $0x4,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <read>:
SYSCALL(read)
 542:	b8 05 00 00 00       	mov    $0x5,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <write>:
SYSCALL(write)
 54a:	b8 10 00 00 00       	mov    $0x10,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <close>:
SYSCALL(close)
 552:	b8 15 00 00 00       	mov    $0x15,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <kill>:
SYSCALL(kill)
 55a:	b8 06 00 00 00       	mov    $0x6,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <exec>:
SYSCALL(exec)
 562:	b8 07 00 00 00       	mov    $0x7,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <open>:
SYSCALL(open)
 56a:	b8 0f 00 00 00       	mov    $0xf,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <mknod>:
SYSCALL(mknod)
 572:	b8 11 00 00 00       	mov    $0x11,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <unlink>:
SYSCALL(unlink)
 57a:	b8 12 00 00 00       	mov    $0x12,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <fstat>:
SYSCALL(fstat)
 582:	b8 08 00 00 00       	mov    $0x8,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <link>:
SYSCALL(link)
 58a:	b8 13 00 00 00       	mov    $0x13,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <mkdir>:
SYSCALL(mkdir)
 592:	b8 14 00 00 00       	mov    $0x14,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <chdir>:
SYSCALL(chdir)
 59a:	b8 09 00 00 00       	mov    $0x9,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <dup>:
SYSCALL(dup)
 5a2:	b8 0a 00 00 00       	mov    $0xa,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <getpid>:
SYSCALL(getpid)
 5aa:	b8 0b 00 00 00       	mov    $0xb,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <sbrk>:
SYSCALL(sbrk)
 5b2:	b8 0c 00 00 00       	mov    $0xc,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <sleep>:
SYSCALL(sleep)
 5ba:	b8 0d 00 00 00       	mov    $0xd,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <uptime>:
SYSCALL(uptime)
 5c2:	b8 0e 00 00 00       	mov    $0xe,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <getpinfo>:
SYSCALL(getpinfo)
 5ca:	b8 16 00 00 00       	mov    $0x16,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5d2:	55                   	push   %ebp
 5d3:	89 e5                	mov    %esp,%ebp
 5d5:	83 ec 18             	sub    $0x18,%esp
 5d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 5db:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5de:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5e5:	00 
 5e6:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ed:	8b 45 08             	mov    0x8(%ebp),%eax
 5f0:	89 04 24             	mov    %eax,(%esp)
 5f3:	e8 52 ff ff ff       	call   54a <write>
}
 5f8:	c9                   	leave  
 5f9:	c3                   	ret    

000005fa <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5fa:	55                   	push   %ebp
 5fb:	89 e5                	mov    %esp,%ebp
 5fd:	56                   	push   %esi
 5fe:	53                   	push   %ebx
 5ff:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 602:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 609:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 60d:	74 17                	je     626 <printint+0x2c>
 60f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 613:	79 11                	jns    626 <printint+0x2c>
    neg = 1;
 615:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 61c:	8b 45 0c             	mov    0xc(%ebp),%eax
 61f:	f7 d8                	neg    %eax
 621:	89 45 ec             	mov    %eax,-0x14(%ebp)
 624:	eb 06                	jmp    62c <printint+0x32>
  } else {
    x = xx;
 626:	8b 45 0c             	mov    0xc(%ebp),%eax
 629:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 62c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 633:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 636:	8d 41 01             	lea    0x1(%ecx),%eax
 639:	89 45 f4             	mov    %eax,-0xc(%ebp)
 63c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 63f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 642:	ba 00 00 00 00       	mov    $0x0,%edx
 647:	f7 f3                	div    %ebx
 649:	89 d0                	mov    %edx,%eax
 64b:	0f b6 80 44 0d 00 00 	movzbl 0xd44(%eax),%eax
 652:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 656:	8b 75 10             	mov    0x10(%ebp),%esi
 659:	8b 45 ec             	mov    -0x14(%ebp),%eax
 65c:	ba 00 00 00 00       	mov    $0x0,%edx
 661:	f7 f6                	div    %esi
 663:	89 45 ec             	mov    %eax,-0x14(%ebp)
 666:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 66a:	75 c7                	jne    633 <printint+0x39>
  if(neg)
 66c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 670:	74 10                	je     682 <printint+0x88>
    buf[i++] = '-';
 672:	8b 45 f4             	mov    -0xc(%ebp),%eax
 675:	8d 50 01             	lea    0x1(%eax),%edx
 678:	89 55 f4             	mov    %edx,-0xc(%ebp)
 67b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 680:	eb 1f                	jmp    6a1 <printint+0xa7>
 682:	eb 1d                	jmp    6a1 <printint+0xa7>
    putc(fd, buf[i]);
 684:	8d 55 dc             	lea    -0x24(%ebp),%edx
 687:	8b 45 f4             	mov    -0xc(%ebp),%eax
 68a:	01 d0                	add    %edx,%eax
 68c:	0f b6 00             	movzbl (%eax),%eax
 68f:	0f be c0             	movsbl %al,%eax
 692:	89 44 24 04          	mov    %eax,0x4(%esp)
 696:	8b 45 08             	mov    0x8(%ebp),%eax
 699:	89 04 24             	mov    %eax,(%esp)
 69c:	e8 31 ff ff ff       	call   5d2 <putc>
  while(--i >= 0)
 6a1:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6a5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6a9:	79 d9                	jns    684 <printint+0x8a>
}
 6ab:	83 c4 30             	add    $0x30,%esp
 6ae:	5b                   	pop    %ebx
 6af:	5e                   	pop    %esi
 6b0:	5d                   	pop    %ebp
 6b1:	c3                   	ret    

000006b2 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6b2:	55                   	push   %ebp
 6b3:	89 e5                	mov    %esp,%ebp
 6b5:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6b8:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6bf:	8d 45 0c             	lea    0xc(%ebp),%eax
 6c2:	83 c0 04             	add    $0x4,%eax
 6c5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6c8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6cf:	e9 7c 01 00 00       	jmp    850 <printf+0x19e>
    c = fmt[i] & 0xff;
 6d4:	8b 55 0c             	mov    0xc(%ebp),%edx
 6d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6da:	01 d0                	add    %edx,%eax
 6dc:	0f b6 00             	movzbl (%eax),%eax
 6df:	0f be c0             	movsbl %al,%eax
 6e2:	25 ff 00 00 00       	and    $0xff,%eax
 6e7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6ea:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6ee:	75 2c                	jne    71c <printf+0x6a>
      if(c == '%'){
 6f0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6f4:	75 0c                	jne    702 <printf+0x50>
        state = '%';
 6f6:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6fd:	e9 4a 01 00 00       	jmp    84c <printf+0x19a>
      } else {
        putc(fd, c);
 702:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 705:	0f be c0             	movsbl %al,%eax
 708:	89 44 24 04          	mov    %eax,0x4(%esp)
 70c:	8b 45 08             	mov    0x8(%ebp),%eax
 70f:	89 04 24             	mov    %eax,(%esp)
 712:	e8 bb fe ff ff       	call   5d2 <putc>
 717:	e9 30 01 00 00       	jmp    84c <printf+0x19a>
      }
    } else if(state == '%'){
 71c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 720:	0f 85 26 01 00 00    	jne    84c <printf+0x19a>
      if(c == 'd'){
 726:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 72a:	75 2d                	jne    759 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 72c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 72f:	8b 00                	mov    (%eax),%eax
 731:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 738:	00 
 739:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 740:	00 
 741:	89 44 24 04          	mov    %eax,0x4(%esp)
 745:	8b 45 08             	mov    0x8(%ebp),%eax
 748:	89 04 24             	mov    %eax,(%esp)
 74b:	e8 aa fe ff ff       	call   5fa <printint>
        ap++;
 750:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 754:	e9 ec 00 00 00       	jmp    845 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 759:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 75d:	74 06                	je     765 <printf+0xb3>
 75f:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 763:	75 2d                	jne    792 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 765:	8b 45 e8             	mov    -0x18(%ebp),%eax
 768:	8b 00                	mov    (%eax),%eax
 76a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 771:	00 
 772:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 779:	00 
 77a:	89 44 24 04          	mov    %eax,0x4(%esp)
 77e:	8b 45 08             	mov    0x8(%ebp),%eax
 781:	89 04 24             	mov    %eax,(%esp)
 784:	e8 71 fe ff ff       	call   5fa <printint>
        ap++;
 789:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 78d:	e9 b3 00 00 00       	jmp    845 <printf+0x193>
      } else if(c == 's'){
 792:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 796:	75 45                	jne    7dd <printf+0x12b>
        s = (char*)*ap;
 798:	8b 45 e8             	mov    -0x18(%ebp),%eax
 79b:	8b 00                	mov    (%eax),%eax
 79d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7a0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7a4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7a8:	75 09                	jne    7b3 <printf+0x101>
          s = "(null)";
 7aa:	c7 45 f4 ca 0a 00 00 	movl   $0xaca,-0xc(%ebp)
        while(*s != 0){
 7b1:	eb 1e                	jmp    7d1 <printf+0x11f>
 7b3:	eb 1c                	jmp    7d1 <printf+0x11f>
          putc(fd, *s);
 7b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b8:	0f b6 00             	movzbl (%eax),%eax
 7bb:	0f be c0             	movsbl %al,%eax
 7be:	89 44 24 04          	mov    %eax,0x4(%esp)
 7c2:	8b 45 08             	mov    0x8(%ebp),%eax
 7c5:	89 04 24             	mov    %eax,(%esp)
 7c8:	e8 05 fe ff ff       	call   5d2 <putc>
          s++;
 7cd:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 7d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d4:	0f b6 00             	movzbl (%eax),%eax
 7d7:	84 c0                	test   %al,%al
 7d9:	75 da                	jne    7b5 <printf+0x103>
 7db:	eb 68                	jmp    845 <printf+0x193>
        }
      } else if(c == 'c'){
 7dd:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7e1:	75 1d                	jne    800 <printf+0x14e>
        putc(fd, *ap);
 7e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7e6:	8b 00                	mov    (%eax),%eax
 7e8:	0f be c0             	movsbl %al,%eax
 7eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ef:	8b 45 08             	mov    0x8(%ebp),%eax
 7f2:	89 04 24             	mov    %eax,(%esp)
 7f5:	e8 d8 fd ff ff       	call   5d2 <putc>
        ap++;
 7fa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7fe:	eb 45                	jmp    845 <printf+0x193>
      } else if(c == '%'){
 800:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 804:	75 17                	jne    81d <printf+0x16b>
        putc(fd, c);
 806:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 809:	0f be c0             	movsbl %al,%eax
 80c:	89 44 24 04          	mov    %eax,0x4(%esp)
 810:	8b 45 08             	mov    0x8(%ebp),%eax
 813:	89 04 24             	mov    %eax,(%esp)
 816:	e8 b7 fd ff ff       	call   5d2 <putc>
 81b:	eb 28                	jmp    845 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 81d:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 824:	00 
 825:	8b 45 08             	mov    0x8(%ebp),%eax
 828:	89 04 24             	mov    %eax,(%esp)
 82b:	e8 a2 fd ff ff       	call   5d2 <putc>
        putc(fd, c);
 830:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 833:	0f be c0             	movsbl %al,%eax
 836:	89 44 24 04          	mov    %eax,0x4(%esp)
 83a:	8b 45 08             	mov    0x8(%ebp),%eax
 83d:	89 04 24             	mov    %eax,(%esp)
 840:	e8 8d fd ff ff       	call   5d2 <putc>
      }
      state = 0;
 845:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 84c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 850:	8b 55 0c             	mov    0xc(%ebp),%edx
 853:	8b 45 f0             	mov    -0x10(%ebp),%eax
 856:	01 d0                	add    %edx,%eax
 858:	0f b6 00             	movzbl (%eax),%eax
 85b:	84 c0                	test   %al,%al
 85d:	0f 85 71 fe ff ff    	jne    6d4 <printf+0x22>
    }
  }
}
 863:	c9                   	leave  
 864:	c3                   	ret    

00000865 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 865:	55                   	push   %ebp
 866:	89 e5                	mov    %esp,%ebp
 868:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 86b:	8b 45 08             	mov    0x8(%ebp),%eax
 86e:	83 e8 08             	sub    $0x8,%eax
 871:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 874:	a1 60 0d 00 00       	mov    0xd60,%eax
 879:	89 45 fc             	mov    %eax,-0x4(%ebp)
 87c:	eb 24                	jmp    8a2 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 87e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 881:	8b 00                	mov    (%eax),%eax
 883:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 886:	77 12                	ja     89a <free+0x35>
 888:	8b 45 f8             	mov    -0x8(%ebp),%eax
 88b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 88e:	77 24                	ja     8b4 <free+0x4f>
 890:	8b 45 fc             	mov    -0x4(%ebp),%eax
 893:	8b 00                	mov    (%eax),%eax
 895:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 898:	77 1a                	ja     8b4 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 89a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89d:	8b 00                	mov    (%eax),%eax
 89f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8a8:	76 d4                	jbe    87e <free+0x19>
 8aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ad:	8b 00                	mov    (%eax),%eax
 8af:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8b2:	76 ca                	jbe    87e <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8b4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b7:	8b 40 04             	mov    0x4(%eax),%eax
 8ba:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c4:	01 c2                	add    %eax,%edx
 8c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c9:	8b 00                	mov    (%eax),%eax
 8cb:	39 c2                	cmp    %eax,%edx
 8cd:	75 24                	jne    8f3 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d2:	8b 50 04             	mov    0x4(%eax),%edx
 8d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d8:	8b 00                	mov    (%eax),%eax
 8da:	8b 40 04             	mov    0x4(%eax),%eax
 8dd:	01 c2                	add    %eax,%edx
 8df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e2:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e8:	8b 00                	mov    (%eax),%eax
 8ea:	8b 10                	mov    (%eax),%edx
 8ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ef:	89 10                	mov    %edx,(%eax)
 8f1:	eb 0a                	jmp    8fd <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f6:	8b 10                	mov    (%eax),%edx
 8f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fb:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 900:	8b 40 04             	mov    0x4(%eax),%eax
 903:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 90a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90d:	01 d0                	add    %edx,%eax
 90f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 912:	75 20                	jne    934 <free+0xcf>
    p->s.size += bp->s.size;
 914:	8b 45 fc             	mov    -0x4(%ebp),%eax
 917:	8b 50 04             	mov    0x4(%eax),%edx
 91a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 91d:	8b 40 04             	mov    0x4(%eax),%eax
 920:	01 c2                	add    %eax,%edx
 922:	8b 45 fc             	mov    -0x4(%ebp),%eax
 925:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 928:	8b 45 f8             	mov    -0x8(%ebp),%eax
 92b:	8b 10                	mov    (%eax),%edx
 92d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 930:	89 10                	mov    %edx,(%eax)
 932:	eb 08                	jmp    93c <free+0xd7>
  } else
    p->s.ptr = bp;
 934:	8b 45 fc             	mov    -0x4(%ebp),%eax
 937:	8b 55 f8             	mov    -0x8(%ebp),%edx
 93a:	89 10                	mov    %edx,(%eax)
  freep = p;
 93c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93f:	a3 60 0d 00 00       	mov    %eax,0xd60
}
 944:	c9                   	leave  
 945:	c3                   	ret    

00000946 <morecore>:

static Header*
morecore(uint nu)
{
 946:	55                   	push   %ebp
 947:	89 e5                	mov    %esp,%ebp
 949:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 94c:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 953:	77 07                	ja     95c <morecore+0x16>
    nu = 4096;
 955:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 95c:	8b 45 08             	mov    0x8(%ebp),%eax
 95f:	c1 e0 03             	shl    $0x3,%eax
 962:	89 04 24             	mov    %eax,(%esp)
 965:	e8 48 fc ff ff       	call   5b2 <sbrk>
 96a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 96d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 971:	75 07                	jne    97a <morecore+0x34>
    return 0;
 973:	b8 00 00 00 00       	mov    $0x0,%eax
 978:	eb 22                	jmp    99c <morecore+0x56>
  hp = (Header*)p;
 97a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 980:	8b 45 f0             	mov    -0x10(%ebp),%eax
 983:	8b 55 08             	mov    0x8(%ebp),%edx
 986:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 989:	8b 45 f0             	mov    -0x10(%ebp),%eax
 98c:	83 c0 08             	add    $0x8,%eax
 98f:	89 04 24             	mov    %eax,(%esp)
 992:	e8 ce fe ff ff       	call   865 <free>
  return freep;
 997:	a1 60 0d 00 00       	mov    0xd60,%eax
}
 99c:	c9                   	leave  
 99d:	c3                   	ret    

0000099e <malloc>:

void*
malloc(uint nbytes)
{
 99e:	55                   	push   %ebp
 99f:	89 e5                	mov    %esp,%ebp
 9a1:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9a4:	8b 45 08             	mov    0x8(%ebp),%eax
 9a7:	83 c0 07             	add    $0x7,%eax
 9aa:	c1 e8 03             	shr    $0x3,%eax
 9ad:	83 c0 01             	add    $0x1,%eax
 9b0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9b3:	a1 60 0d 00 00       	mov    0xd60,%eax
 9b8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9bb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9bf:	75 23                	jne    9e4 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9c1:	c7 45 f0 58 0d 00 00 	movl   $0xd58,-0x10(%ebp)
 9c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9cb:	a3 60 0d 00 00       	mov    %eax,0xd60
 9d0:	a1 60 0d 00 00       	mov    0xd60,%eax
 9d5:	a3 58 0d 00 00       	mov    %eax,0xd58
    base.s.size = 0;
 9da:	c7 05 5c 0d 00 00 00 	movl   $0x0,0xd5c
 9e1:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e7:	8b 00                	mov    (%eax),%eax
 9e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ef:	8b 40 04             	mov    0x4(%eax),%eax
 9f2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9f5:	72 4d                	jb     a44 <malloc+0xa6>
      if(p->s.size == nunits)
 9f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9fa:	8b 40 04             	mov    0x4(%eax),%eax
 9fd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a00:	75 0c                	jne    a0e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a02:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a05:	8b 10                	mov    (%eax),%edx
 a07:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0a:	89 10                	mov    %edx,(%eax)
 a0c:	eb 26                	jmp    a34 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a11:	8b 40 04             	mov    0x4(%eax),%eax
 a14:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a17:	89 c2                	mov    %eax,%edx
 a19:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a22:	8b 40 04             	mov    0x4(%eax),%eax
 a25:	c1 e0 03             	shl    $0x3,%eax
 a28:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a31:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a34:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a37:	a3 60 0d 00 00       	mov    %eax,0xd60
      return (void*)(p + 1);
 a3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3f:	83 c0 08             	add    $0x8,%eax
 a42:	eb 38                	jmp    a7c <malloc+0xde>
    }
    if(p == freep)
 a44:	a1 60 0d 00 00       	mov    0xd60,%eax
 a49:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a4c:	75 1b                	jne    a69 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a4e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a51:	89 04 24             	mov    %eax,(%esp)
 a54:	e8 ed fe ff ff       	call   946 <morecore>
 a59:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a5c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a60:	75 07                	jne    a69 <malloc+0xcb>
        return 0;
 a62:	b8 00 00 00 00       	mov    $0x0,%eax
 a67:	eb 13                	jmp    a7c <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a69:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a6c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a72:	8b 00                	mov    (%eax),%eax
 a74:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 a77:	e9 70 ff ff ff       	jmp    9ec <malloc+0x4e>
}
 a7c:	c9                   	leave  
 a7d:	c3                   	ret    
