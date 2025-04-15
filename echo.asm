
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  for(i = 1; i < argc; i++)
   9:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  10:	00 
  11:	eb 4b                	jmp    5e <main+0x5e>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  13:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  17:	83 c0 01             	add    $0x1,%eax
  1a:	3b 45 08             	cmp    0x8(%ebp),%eax
  1d:	7d 07                	jge    26 <main+0x26>
  1f:	b8 37 09 00 00       	mov    $0x937,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 39 09 00 00       	mov    $0x939,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  39:	01 ca                	add    %ecx,%edx
  3b:	8b 12                	mov    (%edx),%edx
  3d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  41:	89 54 24 08          	mov    %edx,0x8(%esp)
  45:	c7 44 24 04 3b 09 00 	movl   $0x93b,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  54:	e8 12 05 00 00       	call   56b <printf>
  for(i = 1; i < argc; i++)
  59:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  5e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  62:	3b 45 08             	cmp    0x8(%ebp),%eax
  65:	7c ac                	jl     13 <main+0x13>
  exit();
  67:	e8 77 03 00 00       	call   3e3 <exit>

0000006c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	57                   	push   %edi
  70:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  71:	8b 4d 08             	mov    0x8(%ebp),%ecx
  74:	8b 55 10             	mov    0x10(%ebp),%edx
  77:	8b 45 0c             	mov    0xc(%ebp),%eax
  7a:	89 cb                	mov    %ecx,%ebx
  7c:	89 df                	mov    %ebx,%edi
  7e:	89 d1                	mov    %edx,%ecx
  80:	fc                   	cld    
  81:	f3 aa                	rep stos %al,%es:(%edi)
  83:	89 ca                	mov    %ecx,%edx
  85:	89 fb                	mov    %edi,%ebx
  87:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  8d:	5b                   	pop    %ebx
  8e:	5f                   	pop    %edi
  8f:	5d                   	pop    %ebp
  90:	c3                   	ret    

00000091 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  91:	55                   	push   %ebp
  92:	89 e5                	mov    %esp,%ebp
  94:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  97:	8b 45 08             	mov    0x8(%ebp),%eax
  9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  9d:	90                   	nop
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	8d 50 01             	lea    0x1(%eax),%edx
  a4:	89 55 08             	mov    %edx,0x8(%ebp)
  a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  aa:	8d 4a 01             	lea    0x1(%edx),%ecx
  ad:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b0:	0f b6 12             	movzbl (%edx),%edx
  b3:	88 10                	mov    %dl,(%eax)
  b5:	0f b6 00             	movzbl (%eax),%eax
  b8:	84 c0                	test   %al,%al
  ba:	75 e2                	jne    9e <strcpy+0xd>
    ;
  return os;
  bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  bf:	c9                   	leave  
  c0:	c3                   	ret    

000000c1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c1:	55                   	push   %ebp
  c2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  c4:	eb 08                	jmp    ce <strcmp+0xd>
    p++, q++;
  c6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ca:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  ce:	8b 45 08             	mov    0x8(%ebp),%eax
  d1:	0f b6 00             	movzbl (%eax),%eax
  d4:	84 c0                	test   %al,%al
  d6:	74 10                	je     e8 <strcmp+0x27>
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	0f b6 10             	movzbl (%eax),%edx
  de:	8b 45 0c             	mov    0xc(%ebp),%eax
  e1:	0f b6 00             	movzbl (%eax),%eax
  e4:	38 c2                	cmp    %al,%dl
  e6:	74 de                	je     c6 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  e8:	8b 45 08             	mov    0x8(%ebp),%eax
  eb:	0f b6 00             	movzbl (%eax),%eax
  ee:	0f b6 d0             	movzbl %al,%edx
  f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	0f b6 c0             	movzbl %al,%eax
  fa:	29 c2                	sub    %eax,%edx
  fc:	89 d0                	mov    %edx,%eax
}
  fe:	5d                   	pop    %ebp
  ff:	c3                   	ret    

00000100 <strlen>:

uint
strlen(const char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 106:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 10d:	eb 04                	jmp    113 <strlen+0x13>
 10f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 113:	8b 55 fc             	mov    -0x4(%ebp),%edx
 116:	8b 45 08             	mov    0x8(%ebp),%eax
 119:	01 d0                	add    %edx,%eax
 11b:	0f b6 00             	movzbl (%eax),%eax
 11e:	84 c0                	test   %al,%al
 120:	75 ed                	jne    10f <strlen+0xf>
    ;
  return n;
 122:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 125:	c9                   	leave  
 126:	c3                   	ret    

00000127 <memset>:

void*
memset(void *dst, int c, uint n)
{
 127:	55                   	push   %ebp
 128:	89 e5                	mov    %esp,%ebp
 12a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 12d:	8b 45 10             	mov    0x10(%ebp),%eax
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	8b 45 0c             	mov    0xc(%ebp),%eax
 137:	89 44 24 04          	mov    %eax,0x4(%esp)
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	89 04 24             	mov    %eax,(%esp)
 141:	e8 26 ff ff ff       	call   6c <stosb>
  return dst;
 146:	8b 45 08             	mov    0x8(%ebp),%eax
}
 149:	c9                   	leave  
 14a:	c3                   	ret    

0000014b <strchr>:

char*
strchr(const char *s, char c)
{
 14b:	55                   	push   %ebp
 14c:	89 e5                	mov    %esp,%ebp
 14e:	83 ec 04             	sub    $0x4,%esp
 151:	8b 45 0c             	mov    0xc(%ebp),%eax
 154:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 157:	eb 14                	jmp    16d <strchr+0x22>
    if(*s == c)
 159:	8b 45 08             	mov    0x8(%ebp),%eax
 15c:	0f b6 00             	movzbl (%eax),%eax
 15f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 162:	75 05                	jne    169 <strchr+0x1e>
      return (char*)s;
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	eb 13                	jmp    17c <strchr+0x31>
  for(; *s; s++)
 169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	0f b6 00             	movzbl (%eax),%eax
 173:	84 c0                	test   %al,%al
 175:	75 e2                	jne    159 <strchr+0xe>
  return 0;
 177:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17c:	c9                   	leave  
 17d:	c3                   	ret    

0000017e <gets>:

char*
gets(char *buf, int max)
{
 17e:	55                   	push   %ebp
 17f:	89 e5                	mov    %esp,%ebp
 181:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 184:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18b:	eb 4c                	jmp    1d9 <gets+0x5b>
    cc = read(0, &c, 1);
 18d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 194:	00 
 195:	8d 45 ef             	lea    -0x11(%ebp),%eax
 198:	89 44 24 04          	mov    %eax,0x4(%esp)
 19c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a3:	e8 53 02 00 00       	call   3fb <read>
 1a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1af:	7f 02                	jg     1b3 <gets+0x35>
      break;
 1b1:	eb 31                	jmp    1e4 <gets+0x66>
    buf[i++] = c;
 1b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b6:	8d 50 01             	lea    0x1(%eax),%edx
 1b9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1bc:	89 c2                	mov    %eax,%edx
 1be:	8b 45 08             	mov    0x8(%ebp),%eax
 1c1:	01 c2                	add    %eax,%edx
 1c3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c7:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1c9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 13                	je     1e4 <gets+0x66>
 1d1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d5:	3c 0d                	cmp    $0xd,%al
 1d7:	74 0b                	je     1e4 <gets+0x66>
  for(i=0; i+1 < max; ){
 1d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1e2:	7c a9                	jl     18d <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ea:	01 d0                	add    %edx,%eax
 1ec:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f2:	c9                   	leave  
 1f3:	c3                   	ret    

000001f4 <stat>:

int
stat(const char *n, struct stat *st)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1fa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 201:	00 
 202:	8b 45 08             	mov    0x8(%ebp),%eax
 205:	89 04 24             	mov    %eax,(%esp)
 208:	e8 16 02 00 00       	call   423 <open>
 20d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 210:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 214:	79 07                	jns    21d <stat+0x29>
    return -1;
 216:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 21b:	eb 23                	jmp    240 <stat+0x4c>
  r = fstat(fd, st);
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	89 44 24 04          	mov    %eax,0x4(%esp)
 224:	8b 45 f4             	mov    -0xc(%ebp),%eax
 227:	89 04 24             	mov    %eax,(%esp)
 22a:	e8 0c 02 00 00       	call   43b <fstat>
 22f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 232:	8b 45 f4             	mov    -0xc(%ebp),%eax
 235:	89 04 24             	mov    %eax,(%esp)
 238:	e8 ce 01 00 00       	call   40b <close>
  return r;
 23d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 240:	c9                   	leave  
 241:	c3                   	ret    

00000242 <atoi>:

int
atoi(const char *s)
{
 242:	55                   	push   %ebp
 243:	89 e5                	mov    %esp,%ebp
 245:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 248:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 24f:	eb 25                	jmp    276 <atoi+0x34>
    n = n*10 + *s++ - '0';
 251:	8b 55 fc             	mov    -0x4(%ebp),%edx
 254:	89 d0                	mov    %edx,%eax
 256:	c1 e0 02             	shl    $0x2,%eax
 259:	01 d0                	add    %edx,%eax
 25b:	01 c0                	add    %eax,%eax
 25d:	89 c1                	mov    %eax,%ecx
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
 262:	8d 50 01             	lea    0x1(%eax),%edx
 265:	89 55 08             	mov    %edx,0x8(%ebp)
 268:	0f b6 00             	movzbl (%eax),%eax
 26b:	0f be c0             	movsbl %al,%eax
 26e:	01 c8                	add    %ecx,%eax
 270:	83 e8 30             	sub    $0x30,%eax
 273:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	0f b6 00             	movzbl (%eax),%eax
 27c:	3c 2f                	cmp    $0x2f,%al
 27e:	7e 0a                	jle    28a <atoi+0x48>
 280:	8b 45 08             	mov    0x8(%ebp),%eax
 283:	0f b6 00             	movzbl (%eax),%eax
 286:	3c 39                	cmp    $0x39,%al
 288:	7e c7                	jle    251 <atoi+0xf>
  return n;
 28a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 28d:	c9                   	leave  
 28e:	c3                   	ret    

0000028f <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 295:	8b 45 08             	mov    0x8(%ebp),%eax
 298:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 29b:	8b 45 0c             	mov    0xc(%ebp),%eax
 29e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2a1:	eb 17                	jmp    2ba <memmove+0x2b>
    *dst++ = *src++;
 2a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a6:	8d 50 01             	lea    0x1(%eax),%edx
 2a9:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2ac:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2af:	8d 4a 01             	lea    0x1(%edx),%ecx
 2b2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2b5:	0f b6 12             	movzbl (%edx),%edx
 2b8:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2ba:	8b 45 10             	mov    0x10(%ebp),%eax
 2bd:	8d 50 ff             	lea    -0x1(%eax),%edx
 2c0:	89 55 10             	mov    %edx,0x10(%ebp)
 2c3:	85 c0                	test   %eax,%eax
 2c5:	7f dc                	jg     2a3 <memmove+0x14>
  return vdst;
 2c7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ca:	c9                   	leave  
 2cb:	c3                   	ret    

000002cc <ps>:

void
ps(void)
{
 2cc:	55                   	push   %ebp
 2cd:	89 e5                	mov    %esp,%ebp
 2cf:	57                   	push   %edi
 2d0:	56                   	push   %esi
 2d1:	53                   	push   %ebx
 2d2:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable psinfo;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 2d8:	c7 44 24 04 40 09 00 	movl   $0x940,0x4(%esp)
 2df:	00 
 2e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2e7:	e8 7f 02 00 00       	call   56b <printf>
  int i;
  for (i = 0; i < NPROC; i++)
 2ec:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 2f3:	e9 ce 00 00 00       	jmp    3c6 <ps+0xfa>
  {
    if (psinfo[i].inuse)
 2f8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2fb:	89 d0                	mov    %edx,%eax
 2fd:	c1 e0 03             	shl    $0x3,%eax
 300:	01 d0                	add    %edx,%eax
 302:	c1 e0 02             	shl    $0x2,%eax
 305:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 308:	01 d8                	add    %ebx,%eax
 30a:	2d 04 09 00 00       	sub    $0x904,%eax
 30f:	8b 00                	mov    (%eax),%eax
 311:	85 c0                	test   %eax,%eax
 313:	0f 84 a9 00 00 00    	je     3c2 <ps+0xf6>
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
         psinfo[i].pid,
         psinfo[i].tickets,
         psinfo[i].ticks,
         psinfo[i].state,
         psinfo[i].name);
 319:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 31f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 322:	89 d0                	mov    %edx,%eax
 324:	c1 e0 03             	shl    $0x3,%eax
 327:	01 d0                	add    %edx,%eax
 329:	c1 e0 02             	shl    $0x2,%eax
 32c:	83 c0 10             	add    $0x10,%eax
 32f:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
         psinfo[i].state,
 332:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 335:	89 d0                	mov    %edx,%eax
 337:	c1 e0 03             	shl    $0x3,%eax
 33a:	01 d0                	add    %edx,%eax
 33c:	c1 e0 02             	shl    $0x2,%eax
 33f:	8d 75 e8             	lea    -0x18(%ebp),%esi
 342:	01 f0                	add    %esi,%eax
 344:	2d e4 08 00 00       	sub    $0x8e4,%eax
 349:	0f b6 00             	movzbl (%eax),%eax
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
 34c:	0f be f0             	movsbl %al,%esi
 34f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 352:	89 d0                	mov    %edx,%eax
 354:	c1 e0 03             	shl    $0x3,%eax
 357:	01 d0                	add    %edx,%eax
 359:	c1 e0 02             	shl    $0x2,%eax
 35c:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 35f:	01 c8                	add    %ecx,%eax
 361:	2d f8 08 00 00       	sub    $0x8f8,%eax
 366:	8b 18                	mov    (%eax),%ebx
 368:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 36b:	89 d0                	mov    %edx,%eax
 36d:	c1 e0 03             	shl    $0x3,%eax
 370:	01 d0                	add    %edx,%eax
 372:	c1 e0 02             	shl    $0x2,%eax
 375:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 378:	01 c8                	add    %ecx,%eax
 37a:	2d 00 09 00 00       	sub    $0x900,%eax
 37f:	8b 08                	mov    (%eax),%ecx
 381:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 384:	89 d0                	mov    %edx,%eax
 386:	c1 e0 03             	shl    $0x3,%eax
 389:	01 d0                	add    %edx,%eax
 38b:	c1 e0 02             	shl    $0x2,%eax
 38e:	8d 55 e8             	lea    -0x18(%ebp),%edx
 391:	01 d0                	add    %edx,%eax
 393:	2d fc 08 00 00       	sub    $0x8fc,%eax
 398:	8b 00                	mov    (%eax),%eax
 39a:	89 7c 24 18          	mov    %edi,0x18(%esp)
 39e:	89 74 24 14          	mov    %esi,0x14(%esp)
 3a2:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 3a6:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 3aa:	89 44 24 08          	mov    %eax,0x8(%esp)
 3ae:	c7 44 24 04 59 09 00 	movl   $0x959,0x4(%esp)
 3b5:	00 
 3b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3bd:	e8 a9 01 00 00       	call   56b <printf>
  for (i = 0; i < NPROC; i++)
 3c2:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 3c6:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 3ca:	0f 8e 28 ff ff ff    	jle    2f8 <ps+0x2c>
    }
  }
}
 3d0:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3d6:	5b                   	pop    %ebx
 3d7:	5e                   	pop    %esi
 3d8:	5f                   	pop    %edi
 3d9:	5d                   	pop    %ebp
 3da:	c3                   	ret    

000003db <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3db:	b8 01 00 00 00       	mov    $0x1,%eax
 3e0:	cd 40                	int    $0x40
 3e2:	c3                   	ret    

000003e3 <exit>:
SYSCALL(exit)
 3e3:	b8 02 00 00 00       	mov    $0x2,%eax
 3e8:	cd 40                	int    $0x40
 3ea:	c3                   	ret    

000003eb <wait>:
SYSCALL(wait)
 3eb:	b8 03 00 00 00       	mov    $0x3,%eax
 3f0:	cd 40                	int    $0x40
 3f2:	c3                   	ret    

000003f3 <pipe>:
SYSCALL(pipe)
 3f3:	b8 04 00 00 00       	mov    $0x4,%eax
 3f8:	cd 40                	int    $0x40
 3fa:	c3                   	ret    

000003fb <read>:
SYSCALL(read)
 3fb:	b8 05 00 00 00       	mov    $0x5,%eax
 400:	cd 40                	int    $0x40
 402:	c3                   	ret    

00000403 <write>:
SYSCALL(write)
 403:	b8 10 00 00 00       	mov    $0x10,%eax
 408:	cd 40                	int    $0x40
 40a:	c3                   	ret    

0000040b <close>:
SYSCALL(close)
 40b:	b8 15 00 00 00       	mov    $0x15,%eax
 410:	cd 40                	int    $0x40
 412:	c3                   	ret    

00000413 <kill>:
SYSCALL(kill)
 413:	b8 06 00 00 00       	mov    $0x6,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <exec>:
SYSCALL(exec)
 41b:	b8 07 00 00 00       	mov    $0x7,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <open>:
SYSCALL(open)
 423:	b8 0f 00 00 00       	mov    $0xf,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <mknod>:
SYSCALL(mknod)
 42b:	b8 11 00 00 00       	mov    $0x11,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <unlink>:
SYSCALL(unlink)
 433:	b8 12 00 00 00       	mov    $0x12,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <fstat>:
SYSCALL(fstat)
 43b:	b8 08 00 00 00       	mov    $0x8,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <link>:
SYSCALL(link)
 443:	b8 13 00 00 00       	mov    $0x13,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <mkdir>:
SYSCALL(mkdir)
 44b:	b8 14 00 00 00       	mov    $0x14,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <chdir>:
SYSCALL(chdir)
 453:	b8 09 00 00 00       	mov    $0x9,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <dup>:
SYSCALL(dup)
 45b:	b8 0a 00 00 00       	mov    $0xa,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <getpid>:
SYSCALL(getpid)
 463:	b8 0b 00 00 00       	mov    $0xb,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <sbrk>:
SYSCALL(sbrk)
 46b:	b8 0c 00 00 00       	mov    $0xc,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <sleep>:
SYSCALL(sleep)
 473:	b8 0d 00 00 00       	mov    $0xd,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <uptime>:
SYSCALL(uptime)
 47b:	b8 0e 00 00 00       	mov    $0xe,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <getpinfo>:
SYSCALL(getpinfo)
 483:	b8 16 00 00 00       	mov    $0x16,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 48b:	55                   	push   %ebp
 48c:	89 e5                	mov    %esp,%ebp
 48e:	83 ec 18             	sub    $0x18,%esp
 491:	8b 45 0c             	mov    0xc(%ebp),%eax
 494:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 497:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 49e:	00 
 49f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4a6:	8b 45 08             	mov    0x8(%ebp),%eax
 4a9:	89 04 24             	mov    %eax,(%esp)
 4ac:	e8 52 ff ff ff       	call   403 <write>
}
 4b1:	c9                   	leave  
 4b2:	c3                   	ret    

000004b3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4b3:	55                   	push   %ebp
 4b4:	89 e5                	mov    %esp,%ebp
 4b6:	56                   	push   %esi
 4b7:	53                   	push   %ebx
 4b8:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4c2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4c6:	74 17                	je     4df <printint+0x2c>
 4c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4cc:	79 11                	jns    4df <printint+0x2c>
    neg = 1;
 4ce:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d8:	f7 d8                	neg    %eax
 4da:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4dd:	eb 06                	jmp    4e5 <printint+0x32>
  } else {
    x = xx;
 4df:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4ec:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4ef:	8d 41 01             	lea    0x1(%ecx),%eax
 4f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4fb:	ba 00 00 00 00       	mov    $0x0,%edx
 500:	f7 f3                	div    %ebx
 502:	89 d0                	mov    %edx,%eax
 504:	0f b6 80 e0 0b 00 00 	movzbl 0xbe0(%eax),%eax
 50b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 50f:	8b 75 10             	mov    0x10(%ebp),%esi
 512:	8b 45 ec             	mov    -0x14(%ebp),%eax
 515:	ba 00 00 00 00       	mov    $0x0,%edx
 51a:	f7 f6                	div    %esi
 51c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 51f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 523:	75 c7                	jne    4ec <printint+0x39>
  if(neg)
 525:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 529:	74 10                	je     53b <printint+0x88>
    buf[i++] = '-';
 52b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 52e:	8d 50 01             	lea    0x1(%eax),%edx
 531:	89 55 f4             	mov    %edx,-0xc(%ebp)
 534:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 539:	eb 1f                	jmp    55a <printint+0xa7>
 53b:	eb 1d                	jmp    55a <printint+0xa7>
    putc(fd, buf[i]);
 53d:	8d 55 dc             	lea    -0x24(%ebp),%edx
 540:	8b 45 f4             	mov    -0xc(%ebp),%eax
 543:	01 d0                	add    %edx,%eax
 545:	0f b6 00             	movzbl (%eax),%eax
 548:	0f be c0             	movsbl %al,%eax
 54b:	89 44 24 04          	mov    %eax,0x4(%esp)
 54f:	8b 45 08             	mov    0x8(%ebp),%eax
 552:	89 04 24             	mov    %eax,(%esp)
 555:	e8 31 ff ff ff       	call   48b <putc>
  while(--i >= 0)
 55a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 55e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 562:	79 d9                	jns    53d <printint+0x8a>
}
 564:	83 c4 30             	add    $0x30,%esp
 567:	5b                   	pop    %ebx
 568:	5e                   	pop    %esi
 569:	5d                   	pop    %ebp
 56a:	c3                   	ret    

0000056b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 56b:	55                   	push   %ebp
 56c:	89 e5                	mov    %esp,%ebp
 56e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 571:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 578:	8d 45 0c             	lea    0xc(%ebp),%eax
 57b:	83 c0 04             	add    $0x4,%eax
 57e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 581:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 588:	e9 7c 01 00 00       	jmp    709 <printf+0x19e>
    c = fmt[i] & 0xff;
 58d:	8b 55 0c             	mov    0xc(%ebp),%edx
 590:	8b 45 f0             	mov    -0x10(%ebp),%eax
 593:	01 d0                	add    %edx,%eax
 595:	0f b6 00             	movzbl (%eax),%eax
 598:	0f be c0             	movsbl %al,%eax
 59b:	25 ff 00 00 00       	and    $0xff,%eax
 5a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5a3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5a7:	75 2c                	jne    5d5 <printf+0x6a>
      if(c == '%'){
 5a9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5ad:	75 0c                	jne    5bb <printf+0x50>
        state = '%';
 5af:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5b6:	e9 4a 01 00 00       	jmp    705 <printf+0x19a>
      } else {
        putc(fd, c);
 5bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5be:	0f be c0             	movsbl %al,%eax
 5c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c5:	8b 45 08             	mov    0x8(%ebp),%eax
 5c8:	89 04 24             	mov    %eax,(%esp)
 5cb:	e8 bb fe ff ff       	call   48b <putc>
 5d0:	e9 30 01 00 00       	jmp    705 <printf+0x19a>
      }
    } else if(state == '%'){
 5d5:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5d9:	0f 85 26 01 00 00    	jne    705 <printf+0x19a>
      if(c == 'd'){
 5df:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5e3:	75 2d                	jne    612 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e8:	8b 00                	mov    (%eax),%eax
 5ea:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5f1:	00 
 5f2:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5f9:	00 
 5fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fe:	8b 45 08             	mov    0x8(%ebp),%eax
 601:	89 04 24             	mov    %eax,(%esp)
 604:	e8 aa fe ff ff       	call   4b3 <printint>
        ap++;
 609:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 60d:	e9 ec 00 00 00       	jmp    6fe <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 612:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 616:	74 06                	je     61e <printf+0xb3>
 618:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 61c:	75 2d                	jne    64b <printf+0xe0>
        printint(fd, *ap, 16, 0);
 61e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 621:	8b 00                	mov    (%eax),%eax
 623:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 62a:	00 
 62b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 632:	00 
 633:	89 44 24 04          	mov    %eax,0x4(%esp)
 637:	8b 45 08             	mov    0x8(%ebp),%eax
 63a:	89 04 24             	mov    %eax,(%esp)
 63d:	e8 71 fe ff ff       	call   4b3 <printint>
        ap++;
 642:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 646:	e9 b3 00 00 00       	jmp    6fe <printf+0x193>
      } else if(c == 's'){
 64b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 64f:	75 45                	jne    696 <printf+0x12b>
        s = (char*)*ap;
 651:	8b 45 e8             	mov    -0x18(%ebp),%eax
 654:	8b 00                	mov    (%eax),%eax
 656:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 659:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 65d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 661:	75 09                	jne    66c <printf+0x101>
          s = "(null)";
 663:	c7 45 f4 69 09 00 00 	movl   $0x969,-0xc(%ebp)
        while(*s != 0){
 66a:	eb 1e                	jmp    68a <printf+0x11f>
 66c:	eb 1c                	jmp    68a <printf+0x11f>
          putc(fd, *s);
 66e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 671:	0f b6 00             	movzbl (%eax),%eax
 674:	0f be c0             	movsbl %al,%eax
 677:	89 44 24 04          	mov    %eax,0x4(%esp)
 67b:	8b 45 08             	mov    0x8(%ebp),%eax
 67e:	89 04 24             	mov    %eax,(%esp)
 681:	e8 05 fe ff ff       	call   48b <putc>
          s++;
 686:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 68a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 68d:	0f b6 00             	movzbl (%eax),%eax
 690:	84 c0                	test   %al,%al
 692:	75 da                	jne    66e <printf+0x103>
 694:	eb 68                	jmp    6fe <printf+0x193>
        }
      } else if(c == 'c'){
 696:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 69a:	75 1d                	jne    6b9 <printf+0x14e>
        putc(fd, *ap);
 69c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 69f:	8b 00                	mov    (%eax),%eax
 6a1:	0f be c0             	movsbl %al,%eax
 6a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a8:	8b 45 08             	mov    0x8(%ebp),%eax
 6ab:	89 04 24             	mov    %eax,(%esp)
 6ae:	e8 d8 fd ff ff       	call   48b <putc>
        ap++;
 6b3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6b7:	eb 45                	jmp    6fe <printf+0x193>
      } else if(c == '%'){
 6b9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6bd:	75 17                	jne    6d6 <printf+0x16b>
        putc(fd, c);
 6bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c2:	0f be c0             	movsbl %al,%eax
 6c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c9:	8b 45 08             	mov    0x8(%ebp),%eax
 6cc:	89 04 24             	mov    %eax,(%esp)
 6cf:	e8 b7 fd ff ff       	call   48b <putc>
 6d4:	eb 28                	jmp    6fe <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6d6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6dd:	00 
 6de:	8b 45 08             	mov    0x8(%ebp),%eax
 6e1:	89 04 24             	mov    %eax,(%esp)
 6e4:	e8 a2 fd ff ff       	call   48b <putc>
        putc(fd, c);
 6e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6ec:	0f be c0             	movsbl %al,%eax
 6ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f3:	8b 45 08             	mov    0x8(%ebp),%eax
 6f6:	89 04 24             	mov    %eax,(%esp)
 6f9:	e8 8d fd ff ff       	call   48b <putc>
      }
      state = 0;
 6fe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 705:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 709:	8b 55 0c             	mov    0xc(%ebp),%edx
 70c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70f:	01 d0                	add    %edx,%eax
 711:	0f b6 00             	movzbl (%eax),%eax
 714:	84 c0                	test   %al,%al
 716:	0f 85 71 fe ff ff    	jne    58d <printf+0x22>
    }
  }
}
 71c:	c9                   	leave  
 71d:	c3                   	ret    

0000071e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 71e:	55                   	push   %ebp
 71f:	89 e5                	mov    %esp,%ebp
 721:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 724:	8b 45 08             	mov    0x8(%ebp),%eax
 727:	83 e8 08             	sub    $0x8,%eax
 72a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 72d:	a1 fc 0b 00 00       	mov    0xbfc,%eax
 732:	89 45 fc             	mov    %eax,-0x4(%ebp)
 735:	eb 24                	jmp    75b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 737:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73a:	8b 00                	mov    (%eax),%eax
 73c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 73f:	77 12                	ja     753 <free+0x35>
 741:	8b 45 f8             	mov    -0x8(%ebp),%eax
 744:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 747:	77 24                	ja     76d <free+0x4f>
 749:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74c:	8b 00                	mov    (%eax),%eax
 74e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 751:	77 1a                	ja     76d <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 753:	8b 45 fc             	mov    -0x4(%ebp),%eax
 756:	8b 00                	mov    (%eax),%eax
 758:	89 45 fc             	mov    %eax,-0x4(%ebp)
 75b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 761:	76 d4                	jbe    737 <free+0x19>
 763:	8b 45 fc             	mov    -0x4(%ebp),%eax
 766:	8b 00                	mov    (%eax),%eax
 768:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76b:	76 ca                	jbe    737 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 76d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 770:	8b 40 04             	mov    0x4(%eax),%eax
 773:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 77a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77d:	01 c2                	add    %eax,%edx
 77f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 782:	8b 00                	mov    (%eax),%eax
 784:	39 c2                	cmp    %eax,%edx
 786:	75 24                	jne    7ac <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 788:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78b:	8b 50 04             	mov    0x4(%eax),%edx
 78e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 791:	8b 00                	mov    (%eax),%eax
 793:	8b 40 04             	mov    0x4(%eax),%eax
 796:	01 c2                	add    %eax,%edx
 798:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79b:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 79e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a1:	8b 00                	mov    (%eax),%eax
 7a3:	8b 10                	mov    (%eax),%edx
 7a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a8:	89 10                	mov    %edx,(%eax)
 7aa:	eb 0a                	jmp    7b6 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7af:	8b 10                	mov    (%eax),%edx
 7b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b4:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b9:	8b 40 04             	mov    0x4(%eax),%eax
 7bc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c6:	01 d0                	add    %edx,%eax
 7c8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7cb:	75 20                	jne    7ed <free+0xcf>
    p->s.size += bp->s.size;
 7cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d0:	8b 50 04             	mov    0x4(%eax),%edx
 7d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d6:	8b 40 04             	mov    0x4(%eax),%eax
 7d9:	01 c2                	add    %eax,%edx
 7db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7de:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e4:	8b 10                	mov    (%eax),%edx
 7e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e9:	89 10                	mov    %edx,(%eax)
 7eb:	eb 08                	jmp    7f5 <free+0xd7>
  } else
    p->s.ptr = bp;
 7ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7f3:	89 10                	mov    %edx,(%eax)
  freep = p;
 7f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f8:	a3 fc 0b 00 00       	mov    %eax,0xbfc
}
 7fd:	c9                   	leave  
 7fe:	c3                   	ret    

000007ff <morecore>:

static Header*
morecore(uint nu)
{
 7ff:	55                   	push   %ebp
 800:	89 e5                	mov    %esp,%ebp
 802:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 805:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 80c:	77 07                	ja     815 <morecore+0x16>
    nu = 4096;
 80e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 815:	8b 45 08             	mov    0x8(%ebp),%eax
 818:	c1 e0 03             	shl    $0x3,%eax
 81b:	89 04 24             	mov    %eax,(%esp)
 81e:	e8 48 fc ff ff       	call   46b <sbrk>
 823:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 826:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 82a:	75 07                	jne    833 <morecore+0x34>
    return 0;
 82c:	b8 00 00 00 00       	mov    $0x0,%eax
 831:	eb 22                	jmp    855 <morecore+0x56>
  hp = (Header*)p;
 833:	8b 45 f4             	mov    -0xc(%ebp),%eax
 836:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 839:	8b 45 f0             	mov    -0x10(%ebp),%eax
 83c:	8b 55 08             	mov    0x8(%ebp),%edx
 83f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 842:	8b 45 f0             	mov    -0x10(%ebp),%eax
 845:	83 c0 08             	add    $0x8,%eax
 848:	89 04 24             	mov    %eax,(%esp)
 84b:	e8 ce fe ff ff       	call   71e <free>
  return freep;
 850:	a1 fc 0b 00 00       	mov    0xbfc,%eax
}
 855:	c9                   	leave  
 856:	c3                   	ret    

00000857 <malloc>:

void*
malloc(uint nbytes)
{
 857:	55                   	push   %ebp
 858:	89 e5                	mov    %esp,%ebp
 85a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 85d:	8b 45 08             	mov    0x8(%ebp),%eax
 860:	83 c0 07             	add    $0x7,%eax
 863:	c1 e8 03             	shr    $0x3,%eax
 866:	83 c0 01             	add    $0x1,%eax
 869:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 86c:	a1 fc 0b 00 00       	mov    0xbfc,%eax
 871:	89 45 f0             	mov    %eax,-0x10(%ebp)
 874:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 878:	75 23                	jne    89d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 87a:	c7 45 f0 f4 0b 00 00 	movl   $0xbf4,-0x10(%ebp)
 881:	8b 45 f0             	mov    -0x10(%ebp),%eax
 884:	a3 fc 0b 00 00       	mov    %eax,0xbfc
 889:	a1 fc 0b 00 00       	mov    0xbfc,%eax
 88e:	a3 f4 0b 00 00       	mov    %eax,0xbf4
    base.s.size = 0;
 893:	c7 05 f8 0b 00 00 00 	movl   $0x0,0xbf8
 89a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 89d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a0:	8b 00                	mov    (%eax),%eax
 8a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a8:	8b 40 04             	mov    0x4(%eax),%eax
 8ab:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8ae:	72 4d                	jb     8fd <malloc+0xa6>
      if(p->s.size == nunits)
 8b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b3:	8b 40 04             	mov    0x4(%eax),%eax
 8b6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8b9:	75 0c                	jne    8c7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8be:	8b 10                	mov    (%eax),%edx
 8c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c3:	89 10                	mov    %edx,(%eax)
 8c5:	eb 26                	jmp    8ed <malloc+0x96>
      else {
        p->s.size -= nunits;
 8c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ca:	8b 40 04             	mov    0x4(%eax),%eax
 8cd:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8d0:	89 c2                	mov    %eax,%edx
 8d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8db:	8b 40 04             	mov    0x4(%eax),%eax
 8de:	c1 e0 03             	shl    $0x3,%eax
 8e1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8ea:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f0:	a3 fc 0b 00 00       	mov    %eax,0xbfc
      return (void*)(p + 1);
 8f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f8:	83 c0 08             	add    $0x8,%eax
 8fb:	eb 38                	jmp    935 <malloc+0xde>
    }
    if(p == freep)
 8fd:	a1 fc 0b 00 00       	mov    0xbfc,%eax
 902:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 905:	75 1b                	jne    922 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 907:	8b 45 ec             	mov    -0x14(%ebp),%eax
 90a:	89 04 24             	mov    %eax,(%esp)
 90d:	e8 ed fe ff ff       	call   7ff <morecore>
 912:	89 45 f4             	mov    %eax,-0xc(%ebp)
 915:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 919:	75 07                	jne    922 <malloc+0xcb>
        return 0;
 91b:	b8 00 00 00 00       	mov    $0x0,%eax
 920:	eb 13                	jmp    935 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 922:	8b 45 f4             	mov    -0xc(%ebp),%eax
 925:	89 45 f0             	mov    %eax,-0x10(%ebp)
 928:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92b:	8b 00                	mov    (%eax),%eax
 92d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 930:	e9 70 ff ff ff       	jmp    8a5 <malloc+0x4e>
}
 935:	c9                   	leave  
 936:	c3                   	ret    
