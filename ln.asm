
_ln:     file format elf32-i386


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
   6:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
   9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   d:	74 19                	je     28 <main+0x28>
    printf(2, "Usage: ln old new\n");
   f:	c7 44 24 04 44 09 00 	movl   $0x944,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 55 05 00 00       	call   578 <printf>
    exit();
  23:	e8 c8 03 00 00       	call   3f0 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 08             	add    $0x8,%eax
  2e:	8b 10                	mov    (%eax),%edx
  30:	8b 45 0c             	mov    0xc(%ebp),%eax
  33:	83 c0 04             	add    $0x4,%eax
  36:	8b 00                	mov    (%eax),%eax
  38:	89 54 24 04          	mov    %edx,0x4(%esp)
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 0c 04 00 00       	call   450 <link>
  44:	85 c0                	test   %eax,%eax
  46:	79 2c                	jns    74 <main+0x74>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  48:	8b 45 0c             	mov    0xc(%ebp),%eax
  4b:	83 c0 08             	add    $0x8,%eax
  4e:	8b 10                	mov    (%eax),%edx
  50:	8b 45 0c             	mov    0xc(%ebp),%eax
  53:	83 c0 04             	add    $0x4,%eax
  56:	8b 00                	mov    (%eax),%eax
  58:	89 54 24 0c          	mov    %edx,0xc(%esp)
  5c:	89 44 24 08          	mov    %eax,0x8(%esp)
  60:	c7 44 24 04 57 09 00 	movl   $0x957,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 04 05 00 00       	call   578 <printf>
  exit();
  74:	e8 77 03 00 00       	call   3f0 <exit>

00000079 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  79:	55                   	push   %ebp
  7a:	89 e5                	mov    %esp,%ebp
  7c:	57                   	push   %edi
  7d:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  7e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  81:	8b 55 10             	mov    0x10(%ebp),%edx
  84:	8b 45 0c             	mov    0xc(%ebp),%eax
  87:	89 cb                	mov    %ecx,%ebx
  89:	89 df                	mov    %ebx,%edi
  8b:	89 d1                	mov    %edx,%ecx
  8d:	fc                   	cld    
  8e:	f3 aa                	rep stos %al,%es:(%edi)
  90:	89 ca                	mov    %ecx,%edx
  92:	89 fb                	mov    %edi,%ebx
  94:	89 5d 08             	mov    %ebx,0x8(%ebp)
  97:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  9a:	5b                   	pop    %ebx
  9b:	5f                   	pop    %edi
  9c:	5d                   	pop    %ebp
  9d:	c3                   	ret    

0000009e <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  9e:	55                   	push   %ebp
  9f:	89 e5                	mov    %esp,%ebp
  a1:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  aa:	90                   	nop
  ab:	8b 45 08             	mov    0x8(%ebp),%eax
  ae:	8d 50 01             	lea    0x1(%eax),%edx
  b1:	89 55 08             	mov    %edx,0x8(%ebp)
  b4:	8b 55 0c             	mov    0xc(%ebp),%edx
  b7:	8d 4a 01             	lea    0x1(%edx),%ecx
  ba:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  bd:	0f b6 12             	movzbl (%edx),%edx
  c0:	88 10                	mov    %dl,(%eax)
  c2:	0f b6 00             	movzbl (%eax),%eax
  c5:	84 c0                	test   %al,%al
  c7:	75 e2                	jne    ab <strcpy+0xd>
    ;
  return os;
  c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  cc:	c9                   	leave  
  cd:	c3                   	ret    

000000ce <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  d1:	eb 08                	jmp    db <strcmp+0xd>
    p++, q++;
  d3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  db:	8b 45 08             	mov    0x8(%ebp),%eax
  de:	0f b6 00             	movzbl (%eax),%eax
  e1:	84 c0                	test   %al,%al
  e3:	74 10                	je     f5 <strcmp+0x27>
  e5:	8b 45 08             	mov    0x8(%ebp),%eax
  e8:	0f b6 10             	movzbl (%eax),%edx
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	0f b6 00             	movzbl (%eax),%eax
  f1:	38 c2                	cmp    %al,%dl
  f3:	74 de                	je     d3 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  f5:	8b 45 08             	mov    0x8(%ebp),%eax
  f8:	0f b6 00             	movzbl (%eax),%eax
  fb:	0f b6 d0             	movzbl %al,%edx
  fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 101:	0f b6 00             	movzbl (%eax),%eax
 104:	0f b6 c0             	movzbl %al,%eax
 107:	29 c2                	sub    %eax,%edx
 109:	89 d0                	mov    %edx,%eax
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    

0000010d <strlen>:

uint
strlen(const char *s)
{
 10d:	55                   	push   %ebp
 10e:	89 e5                	mov    %esp,%ebp
 110:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 113:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 11a:	eb 04                	jmp    120 <strlen+0x13>
 11c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 120:	8b 55 fc             	mov    -0x4(%ebp),%edx
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	01 d0                	add    %edx,%eax
 128:	0f b6 00             	movzbl (%eax),%eax
 12b:	84 c0                	test   %al,%al
 12d:	75 ed                	jne    11c <strlen+0xf>
    ;
  return n;
 12f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 132:	c9                   	leave  
 133:	c3                   	ret    

00000134 <memset>:

void*
memset(void *dst, int c, uint n)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 13a:	8b 45 10             	mov    0x10(%ebp),%eax
 13d:	89 44 24 08          	mov    %eax,0x8(%esp)
 141:	8b 45 0c             	mov    0xc(%ebp),%eax
 144:	89 44 24 04          	mov    %eax,0x4(%esp)
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	89 04 24             	mov    %eax,(%esp)
 14e:	e8 26 ff ff ff       	call   79 <stosb>
  return dst;
 153:	8b 45 08             	mov    0x8(%ebp),%eax
}
 156:	c9                   	leave  
 157:	c3                   	ret    

00000158 <strchr>:

char*
strchr(const char *s, char c)
{
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	83 ec 04             	sub    $0x4,%esp
 15e:	8b 45 0c             	mov    0xc(%ebp),%eax
 161:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 164:	eb 14                	jmp    17a <strchr+0x22>
    if(*s == c)
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	0f b6 00             	movzbl (%eax),%eax
 16c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 16f:	75 05                	jne    176 <strchr+0x1e>
      return (char*)s;
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	eb 13                	jmp    189 <strchr+0x31>
  for(; *s; s++)
 176:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 17a:	8b 45 08             	mov    0x8(%ebp),%eax
 17d:	0f b6 00             	movzbl (%eax),%eax
 180:	84 c0                	test   %al,%al
 182:	75 e2                	jne    166 <strchr+0xe>
  return 0;
 184:	b8 00 00 00 00       	mov    $0x0,%eax
}
 189:	c9                   	leave  
 18a:	c3                   	ret    

0000018b <gets>:

char*
gets(char *buf, int max)
{
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 191:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 198:	eb 4c                	jmp    1e6 <gets+0x5b>
    cc = read(0, &c, 1);
 19a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1a1:	00 
 1a2:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 1a9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b0:	e8 53 02 00 00       	call   408 <read>
 1b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1bc:	7f 02                	jg     1c0 <gets+0x35>
      break;
 1be:	eb 31                	jmp    1f1 <gets+0x66>
    buf[i++] = c;
 1c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c3:	8d 50 01             	lea    0x1(%eax),%edx
 1c6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1c9:	89 c2                	mov    %eax,%edx
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ce:	01 c2                	add    %eax,%edx
 1d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d4:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1d6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1da:	3c 0a                	cmp    $0xa,%al
 1dc:	74 13                	je     1f1 <gets+0x66>
 1de:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e2:	3c 0d                	cmp    $0xd,%al
 1e4:	74 0b                	je     1f1 <gets+0x66>
  for(i=0; i+1 < max; ){
 1e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e9:	83 c0 01             	add    $0x1,%eax
 1ec:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1ef:	7c a9                	jl     19a <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	01 d0                	add    %edx,%eax
 1f9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ff:	c9                   	leave  
 200:	c3                   	ret    

00000201 <stat>:

int
stat(const char *n, struct stat *st)
{
 201:	55                   	push   %ebp
 202:	89 e5                	mov    %esp,%ebp
 204:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 207:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 20e:	00 
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	89 04 24             	mov    %eax,(%esp)
 215:	e8 16 02 00 00       	call   430 <open>
 21a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 21d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 221:	79 07                	jns    22a <stat+0x29>
    return -1;
 223:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 228:	eb 23                	jmp    24d <stat+0x4c>
  r = fstat(fd, st);
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	89 44 24 04          	mov    %eax,0x4(%esp)
 231:	8b 45 f4             	mov    -0xc(%ebp),%eax
 234:	89 04 24             	mov    %eax,(%esp)
 237:	e8 0c 02 00 00       	call   448 <fstat>
 23c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 23f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 242:	89 04 24             	mov    %eax,(%esp)
 245:	e8 ce 01 00 00       	call   418 <close>
  return r;
 24a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 24d:	c9                   	leave  
 24e:	c3                   	ret    

0000024f <atoi>:

int
atoi(const char *s)
{
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
 252:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 255:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 25c:	eb 25                	jmp    283 <atoi+0x34>
    n = n*10 + *s++ - '0';
 25e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 261:	89 d0                	mov    %edx,%eax
 263:	c1 e0 02             	shl    $0x2,%eax
 266:	01 d0                	add    %edx,%eax
 268:	01 c0                	add    %eax,%eax
 26a:	89 c1                	mov    %eax,%ecx
 26c:	8b 45 08             	mov    0x8(%ebp),%eax
 26f:	8d 50 01             	lea    0x1(%eax),%edx
 272:	89 55 08             	mov    %edx,0x8(%ebp)
 275:	0f b6 00             	movzbl (%eax),%eax
 278:	0f be c0             	movsbl %al,%eax
 27b:	01 c8                	add    %ecx,%eax
 27d:	83 e8 30             	sub    $0x30,%eax
 280:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	0f b6 00             	movzbl (%eax),%eax
 289:	3c 2f                	cmp    $0x2f,%al
 28b:	7e 0a                	jle    297 <atoi+0x48>
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	0f b6 00             	movzbl (%eax),%eax
 293:	3c 39                	cmp    $0x39,%al
 295:	7e c7                	jle    25e <atoi+0xf>
  return n;
 297:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 29a:	c9                   	leave  
 29b:	c3                   	ret    

0000029c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 29c:	55                   	push   %ebp
 29d:	89 e5                	mov    %esp,%ebp
 29f:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 2a2:	8b 45 08             	mov    0x8(%ebp),%eax
 2a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2ae:	eb 17                	jmp    2c7 <memmove+0x2b>
    *dst++ = *src++;
 2b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2b3:	8d 50 01             	lea    0x1(%eax),%edx
 2b6:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2b9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2bc:	8d 4a 01             	lea    0x1(%edx),%ecx
 2bf:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2c2:	0f b6 12             	movzbl (%edx),%edx
 2c5:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2c7:	8b 45 10             	mov    0x10(%ebp),%eax
 2ca:	8d 50 ff             	lea    -0x1(%eax),%edx
 2cd:	89 55 10             	mov    %edx,0x10(%ebp)
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7f dc                	jg     2b0 <memmove+0x14>
  return vdst;
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <ps>:

void
ps(void)
{
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	57                   	push   %edi
 2dd:	56                   	push   %esi
 2de:	53                   	push   %ebx
 2df:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable psinfo;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 2e5:	c7 44 24 04 6b 09 00 	movl   $0x96b,0x4(%esp)
 2ec:	00 
 2ed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2f4:	e8 7f 02 00 00       	call   578 <printf>
  int i;
  for (i = 0; i < NPROC; i++)
 2f9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 300:	e9 ce 00 00 00       	jmp    3d3 <ps+0xfa>
  {
    if (psinfo[i].inuse)
 305:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 308:	89 d0                	mov    %edx,%eax
 30a:	c1 e0 03             	shl    $0x3,%eax
 30d:	01 d0                	add    %edx,%eax
 30f:	c1 e0 02             	shl    $0x2,%eax
 312:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 315:	01 d8                	add    %ebx,%eax
 317:	2d 04 09 00 00       	sub    $0x904,%eax
 31c:	8b 00                	mov    (%eax),%eax
 31e:	85 c0                	test   %eax,%eax
 320:	0f 84 a9 00 00 00    	je     3cf <ps+0xf6>
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
         psinfo[i].pid,
         psinfo[i].tickets,
         psinfo[i].ticks,
         psinfo[i].state,
         psinfo[i].name);
 326:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 32c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 32f:	89 d0                	mov    %edx,%eax
 331:	c1 e0 03             	shl    $0x3,%eax
 334:	01 d0                	add    %edx,%eax
 336:	c1 e0 02             	shl    $0x2,%eax
 339:	83 c0 10             	add    $0x10,%eax
 33c:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
         psinfo[i].state,
 33f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 342:	89 d0                	mov    %edx,%eax
 344:	c1 e0 03             	shl    $0x3,%eax
 347:	01 d0                	add    %edx,%eax
 349:	c1 e0 02             	shl    $0x2,%eax
 34c:	8d 75 e8             	lea    -0x18(%ebp),%esi
 34f:	01 f0                	add    %esi,%eax
 351:	2d e4 08 00 00       	sub    $0x8e4,%eax
 356:	0f b6 00             	movzbl (%eax),%eax
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
 359:	0f be f0             	movsbl %al,%esi
 35c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 35f:	89 d0                	mov    %edx,%eax
 361:	c1 e0 03             	shl    $0x3,%eax
 364:	01 d0                	add    %edx,%eax
 366:	c1 e0 02             	shl    $0x2,%eax
 369:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 36c:	01 c8                	add    %ecx,%eax
 36e:	2d f8 08 00 00       	sub    $0x8f8,%eax
 373:	8b 18                	mov    (%eax),%ebx
 375:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 378:	89 d0                	mov    %edx,%eax
 37a:	c1 e0 03             	shl    $0x3,%eax
 37d:	01 d0                	add    %edx,%eax
 37f:	c1 e0 02             	shl    $0x2,%eax
 382:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 385:	01 c8                	add    %ecx,%eax
 387:	2d 00 09 00 00       	sub    $0x900,%eax
 38c:	8b 08                	mov    (%eax),%ecx
 38e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 391:	89 d0                	mov    %edx,%eax
 393:	c1 e0 03             	shl    $0x3,%eax
 396:	01 d0                	add    %edx,%eax
 398:	c1 e0 02             	shl    $0x2,%eax
 39b:	8d 55 e8             	lea    -0x18(%ebp),%edx
 39e:	01 d0                	add    %edx,%eax
 3a0:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3a5:	8b 00                	mov    (%eax),%eax
 3a7:	89 7c 24 18          	mov    %edi,0x18(%esp)
 3ab:	89 74 24 14          	mov    %esi,0x14(%esp)
 3af:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 3b3:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 3b7:	89 44 24 08          	mov    %eax,0x8(%esp)
 3bb:	c7 44 24 04 84 09 00 	movl   $0x984,0x4(%esp)
 3c2:	00 
 3c3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3ca:	e8 a9 01 00 00       	call   578 <printf>
  for (i = 0; i < NPROC; i++)
 3cf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 3d3:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 3d7:	0f 8e 28 ff ff ff    	jle    305 <ps+0x2c>
    }
  }
}
 3dd:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3e3:	5b                   	pop    %ebx
 3e4:	5e                   	pop    %esi
 3e5:	5f                   	pop    %edi
 3e6:	5d                   	pop    %ebp
 3e7:	c3                   	ret    

000003e8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3e8:	b8 01 00 00 00       	mov    $0x1,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <exit>:
SYSCALL(exit)
 3f0:	b8 02 00 00 00       	mov    $0x2,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <wait>:
SYSCALL(wait)
 3f8:	b8 03 00 00 00       	mov    $0x3,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <pipe>:
SYSCALL(pipe)
 400:	b8 04 00 00 00       	mov    $0x4,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <read>:
SYSCALL(read)
 408:	b8 05 00 00 00       	mov    $0x5,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <write>:
SYSCALL(write)
 410:	b8 10 00 00 00       	mov    $0x10,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <close>:
SYSCALL(close)
 418:	b8 15 00 00 00       	mov    $0x15,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <kill>:
SYSCALL(kill)
 420:	b8 06 00 00 00       	mov    $0x6,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <exec>:
SYSCALL(exec)
 428:	b8 07 00 00 00       	mov    $0x7,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <open>:
SYSCALL(open)
 430:	b8 0f 00 00 00       	mov    $0xf,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <mknod>:
SYSCALL(mknod)
 438:	b8 11 00 00 00       	mov    $0x11,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <unlink>:
SYSCALL(unlink)
 440:	b8 12 00 00 00       	mov    $0x12,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <fstat>:
SYSCALL(fstat)
 448:	b8 08 00 00 00       	mov    $0x8,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <link>:
SYSCALL(link)
 450:	b8 13 00 00 00       	mov    $0x13,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <mkdir>:
SYSCALL(mkdir)
 458:	b8 14 00 00 00       	mov    $0x14,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <chdir>:
SYSCALL(chdir)
 460:	b8 09 00 00 00       	mov    $0x9,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <dup>:
SYSCALL(dup)
 468:	b8 0a 00 00 00       	mov    $0xa,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <getpid>:
SYSCALL(getpid)
 470:	b8 0b 00 00 00       	mov    $0xb,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <sbrk>:
SYSCALL(sbrk)
 478:	b8 0c 00 00 00       	mov    $0xc,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <sleep>:
SYSCALL(sleep)
 480:	b8 0d 00 00 00       	mov    $0xd,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <uptime>:
SYSCALL(uptime)
 488:	b8 0e 00 00 00       	mov    $0xe,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <getpinfo>:
SYSCALL(getpinfo)
 490:	b8 16 00 00 00       	mov    $0x16,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 498:	55                   	push   %ebp
 499:	89 e5                	mov    %esp,%ebp
 49b:	83 ec 18             	sub    $0x18,%esp
 49e:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4a4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4ab:	00 
 4ac:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4af:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
 4b6:	89 04 24             	mov    %eax,(%esp)
 4b9:	e8 52 ff ff ff       	call   410 <write>
}
 4be:	c9                   	leave  
 4bf:	c3                   	ret    

000004c0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
 4c3:	56                   	push   %esi
 4c4:	53                   	push   %ebx
 4c5:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4c8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4cf:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4d3:	74 17                	je     4ec <printint+0x2c>
 4d5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4d9:	79 11                	jns    4ec <printint+0x2c>
    neg = 1;
 4db:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e5:	f7 d8                	neg    %eax
 4e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4ea:	eb 06                	jmp    4f2 <printint+0x32>
  } else {
    x = xx;
 4ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4f2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4f9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4fc:	8d 41 01             	lea    0x1(%ecx),%eax
 4ff:	89 45 f4             	mov    %eax,-0xc(%ebp)
 502:	8b 5d 10             	mov    0x10(%ebp),%ebx
 505:	8b 45 ec             	mov    -0x14(%ebp),%eax
 508:	ba 00 00 00 00       	mov    $0x0,%edx
 50d:	f7 f3                	div    %ebx
 50f:	89 d0                	mov    %edx,%eax
 511:	0f b6 80 0c 0c 00 00 	movzbl 0xc0c(%eax),%eax
 518:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 51c:	8b 75 10             	mov    0x10(%ebp),%esi
 51f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 522:	ba 00 00 00 00       	mov    $0x0,%edx
 527:	f7 f6                	div    %esi
 529:	89 45 ec             	mov    %eax,-0x14(%ebp)
 52c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 530:	75 c7                	jne    4f9 <printint+0x39>
  if(neg)
 532:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 536:	74 10                	je     548 <printint+0x88>
    buf[i++] = '-';
 538:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53b:	8d 50 01             	lea    0x1(%eax),%edx
 53e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 541:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 546:	eb 1f                	jmp    567 <printint+0xa7>
 548:	eb 1d                	jmp    567 <printint+0xa7>
    putc(fd, buf[i]);
 54a:	8d 55 dc             	lea    -0x24(%ebp),%edx
 54d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 550:	01 d0                	add    %edx,%eax
 552:	0f b6 00             	movzbl (%eax),%eax
 555:	0f be c0             	movsbl %al,%eax
 558:	89 44 24 04          	mov    %eax,0x4(%esp)
 55c:	8b 45 08             	mov    0x8(%ebp),%eax
 55f:	89 04 24             	mov    %eax,(%esp)
 562:	e8 31 ff ff ff       	call   498 <putc>
  while(--i >= 0)
 567:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 56b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 56f:	79 d9                	jns    54a <printint+0x8a>
}
 571:	83 c4 30             	add    $0x30,%esp
 574:	5b                   	pop    %ebx
 575:	5e                   	pop    %esi
 576:	5d                   	pop    %ebp
 577:	c3                   	ret    

00000578 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 578:	55                   	push   %ebp
 579:	89 e5                	mov    %esp,%ebp
 57b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 57e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 585:	8d 45 0c             	lea    0xc(%ebp),%eax
 588:	83 c0 04             	add    $0x4,%eax
 58b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 58e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 595:	e9 7c 01 00 00       	jmp    716 <printf+0x19e>
    c = fmt[i] & 0xff;
 59a:	8b 55 0c             	mov    0xc(%ebp),%edx
 59d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5a0:	01 d0                	add    %edx,%eax
 5a2:	0f b6 00             	movzbl (%eax),%eax
 5a5:	0f be c0             	movsbl %al,%eax
 5a8:	25 ff 00 00 00       	and    $0xff,%eax
 5ad:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5b0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b4:	75 2c                	jne    5e2 <printf+0x6a>
      if(c == '%'){
 5b6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5ba:	75 0c                	jne    5c8 <printf+0x50>
        state = '%';
 5bc:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5c3:	e9 4a 01 00 00       	jmp    712 <printf+0x19a>
      } else {
        putc(fd, c);
 5c8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5cb:	0f be c0             	movsbl %al,%eax
 5ce:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d2:	8b 45 08             	mov    0x8(%ebp),%eax
 5d5:	89 04 24             	mov    %eax,(%esp)
 5d8:	e8 bb fe ff ff       	call   498 <putc>
 5dd:	e9 30 01 00 00       	jmp    712 <printf+0x19a>
      }
    } else if(state == '%'){
 5e2:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5e6:	0f 85 26 01 00 00    	jne    712 <printf+0x19a>
      if(c == 'd'){
 5ec:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5f0:	75 2d                	jne    61f <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5f2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f5:	8b 00                	mov    (%eax),%eax
 5f7:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5fe:	00 
 5ff:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 606:	00 
 607:	89 44 24 04          	mov    %eax,0x4(%esp)
 60b:	8b 45 08             	mov    0x8(%ebp),%eax
 60e:	89 04 24             	mov    %eax,(%esp)
 611:	e8 aa fe ff ff       	call   4c0 <printint>
        ap++;
 616:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 61a:	e9 ec 00 00 00       	jmp    70b <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 61f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 623:	74 06                	je     62b <printf+0xb3>
 625:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 629:	75 2d                	jne    658 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 62b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 62e:	8b 00                	mov    (%eax),%eax
 630:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 637:	00 
 638:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 63f:	00 
 640:	89 44 24 04          	mov    %eax,0x4(%esp)
 644:	8b 45 08             	mov    0x8(%ebp),%eax
 647:	89 04 24             	mov    %eax,(%esp)
 64a:	e8 71 fe ff ff       	call   4c0 <printint>
        ap++;
 64f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 653:	e9 b3 00 00 00       	jmp    70b <printf+0x193>
      } else if(c == 's'){
 658:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 65c:	75 45                	jne    6a3 <printf+0x12b>
        s = (char*)*ap;
 65e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 661:	8b 00                	mov    (%eax),%eax
 663:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 666:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 66a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 66e:	75 09                	jne    679 <printf+0x101>
          s = "(null)";
 670:	c7 45 f4 94 09 00 00 	movl   $0x994,-0xc(%ebp)
        while(*s != 0){
 677:	eb 1e                	jmp    697 <printf+0x11f>
 679:	eb 1c                	jmp    697 <printf+0x11f>
          putc(fd, *s);
 67b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 67e:	0f b6 00             	movzbl (%eax),%eax
 681:	0f be c0             	movsbl %al,%eax
 684:	89 44 24 04          	mov    %eax,0x4(%esp)
 688:	8b 45 08             	mov    0x8(%ebp),%eax
 68b:	89 04 24             	mov    %eax,(%esp)
 68e:	e8 05 fe ff ff       	call   498 <putc>
          s++;
 693:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 697:	8b 45 f4             	mov    -0xc(%ebp),%eax
 69a:	0f b6 00             	movzbl (%eax),%eax
 69d:	84 c0                	test   %al,%al
 69f:	75 da                	jne    67b <printf+0x103>
 6a1:	eb 68                	jmp    70b <printf+0x193>
        }
      } else if(c == 'c'){
 6a3:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6a7:	75 1d                	jne    6c6 <printf+0x14e>
        putc(fd, *ap);
 6a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ac:	8b 00                	mov    (%eax),%eax
 6ae:	0f be c0             	movsbl %al,%eax
 6b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b5:	8b 45 08             	mov    0x8(%ebp),%eax
 6b8:	89 04 24             	mov    %eax,(%esp)
 6bb:	e8 d8 fd ff ff       	call   498 <putc>
        ap++;
 6c0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c4:	eb 45                	jmp    70b <printf+0x193>
      } else if(c == '%'){
 6c6:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6ca:	75 17                	jne    6e3 <printf+0x16b>
        putc(fd, c);
 6cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6cf:	0f be c0             	movsbl %al,%eax
 6d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d6:	8b 45 08             	mov    0x8(%ebp),%eax
 6d9:	89 04 24             	mov    %eax,(%esp)
 6dc:	e8 b7 fd ff ff       	call   498 <putc>
 6e1:	eb 28                	jmp    70b <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6e3:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6ea:	00 
 6eb:	8b 45 08             	mov    0x8(%ebp),%eax
 6ee:	89 04 24             	mov    %eax,(%esp)
 6f1:	e8 a2 fd ff ff       	call   498 <putc>
        putc(fd, c);
 6f6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f9:	0f be c0             	movsbl %al,%eax
 6fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 700:	8b 45 08             	mov    0x8(%ebp),%eax
 703:	89 04 24             	mov    %eax,(%esp)
 706:	e8 8d fd ff ff       	call   498 <putc>
      }
      state = 0;
 70b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 712:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 716:	8b 55 0c             	mov    0xc(%ebp),%edx
 719:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71c:	01 d0                	add    %edx,%eax
 71e:	0f b6 00             	movzbl (%eax),%eax
 721:	84 c0                	test   %al,%al
 723:	0f 85 71 fe ff ff    	jne    59a <printf+0x22>
    }
  }
}
 729:	c9                   	leave  
 72a:	c3                   	ret    

0000072b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72b:	55                   	push   %ebp
 72c:	89 e5                	mov    %esp,%ebp
 72e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 731:	8b 45 08             	mov    0x8(%ebp),%eax
 734:	83 e8 08             	sub    $0x8,%eax
 737:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73a:	a1 28 0c 00 00       	mov    0xc28,%eax
 73f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 742:	eb 24                	jmp    768 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 744:	8b 45 fc             	mov    -0x4(%ebp),%eax
 747:	8b 00                	mov    (%eax),%eax
 749:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 74c:	77 12                	ja     760 <free+0x35>
 74e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 751:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 754:	77 24                	ja     77a <free+0x4f>
 756:	8b 45 fc             	mov    -0x4(%ebp),%eax
 759:	8b 00                	mov    (%eax),%eax
 75b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 75e:	77 1a                	ja     77a <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 760:	8b 45 fc             	mov    -0x4(%ebp),%eax
 763:	8b 00                	mov    (%eax),%eax
 765:	89 45 fc             	mov    %eax,-0x4(%ebp)
 768:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 76e:	76 d4                	jbe    744 <free+0x19>
 770:	8b 45 fc             	mov    -0x4(%ebp),%eax
 773:	8b 00                	mov    (%eax),%eax
 775:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 778:	76 ca                	jbe    744 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 77a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77d:	8b 40 04             	mov    0x4(%eax),%eax
 780:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 787:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78a:	01 c2                	add    %eax,%edx
 78c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78f:	8b 00                	mov    (%eax),%eax
 791:	39 c2                	cmp    %eax,%edx
 793:	75 24                	jne    7b9 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 795:	8b 45 f8             	mov    -0x8(%ebp),%eax
 798:	8b 50 04             	mov    0x4(%eax),%edx
 79b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79e:	8b 00                	mov    (%eax),%eax
 7a0:	8b 40 04             	mov    0x4(%eax),%eax
 7a3:	01 c2                	add    %eax,%edx
 7a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a8:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ae:	8b 00                	mov    (%eax),%eax
 7b0:	8b 10                	mov    (%eax),%edx
 7b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b5:	89 10                	mov    %edx,(%eax)
 7b7:	eb 0a                	jmp    7c3 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bc:	8b 10                	mov    (%eax),%edx
 7be:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c1:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c6:	8b 40 04             	mov    0x4(%eax),%eax
 7c9:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d3:	01 d0                	add    %edx,%eax
 7d5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7d8:	75 20                	jne    7fa <free+0xcf>
    p->s.size += bp->s.size;
 7da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7dd:	8b 50 04             	mov    0x4(%eax),%edx
 7e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e3:	8b 40 04             	mov    0x4(%eax),%eax
 7e6:	01 c2                	add    %eax,%edx
 7e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7eb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7ee:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f1:	8b 10                	mov    (%eax),%edx
 7f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f6:	89 10                	mov    %edx,(%eax)
 7f8:	eb 08                	jmp    802 <free+0xd7>
  } else
    p->s.ptr = bp;
 7fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fd:	8b 55 f8             	mov    -0x8(%ebp),%edx
 800:	89 10                	mov    %edx,(%eax)
  freep = p;
 802:	8b 45 fc             	mov    -0x4(%ebp),%eax
 805:	a3 28 0c 00 00       	mov    %eax,0xc28
}
 80a:	c9                   	leave  
 80b:	c3                   	ret    

0000080c <morecore>:

static Header*
morecore(uint nu)
{
 80c:	55                   	push   %ebp
 80d:	89 e5                	mov    %esp,%ebp
 80f:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 812:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 819:	77 07                	ja     822 <morecore+0x16>
    nu = 4096;
 81b:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 822:	8b 45 08             	mov    0x8(%ebp),%eax
 825:	c1 e0 03             	shl    $0x3,%eax
 828:	89 04 24             	mov    %eax,(%esp)
 82b:	e8 48 fc ff ff       	call   478 <sbrk>
 830:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 833:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 837:	75 07                	jne    840 <morecore+0x34>
    return 0;
 839:	b8 00 00 00 00       	mov    $0x0,%eax
 83e:	eb 22                	jmp    862 <morecore+0x56>
  hp = (Header*)p;
 840:	8b 45 f4             	mov    -0xc(%ebp),%eax
 843:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 846:	8b 45 f0             	mov    -0x10(%ebp),%eax
 849:	8b 55 08             	mov    0x8(%ebp),%edx
 84c:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 84f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 852:	83 c0 08             	add    $0x8,%eax
 855:	89 04 24             	mov    %eax,(%esp)
 858:	e8 ce fe ff ff       	call   72b <free>
  return freep;
 85d:	a1 28 0c 00 00       	mov    0xc28,%eax
}
 862:	c9                   	leave  
 863:	c3                   	ret    

00000864 <malloc>:

void*
malloc(uint nbytes)
{
 864:	55                   	push   %ebp
 865:	89 e5                	mov    %esp,%ebp
 867:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 86a:	8b 45 08             	mov    0x8(%ebp),%eax
 86d:	83 c0 07             	add    $0x7,%eax
 870:	c1 e8 03             	shr    $0x3,%eax
 873:	83 c0 01             	add    $0x1,%eax
 876:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 879:	a1 28 0c 00 00       	mov    0xc28,%eax
 87e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 881:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 885:	75 23                	jne    8aa <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 887:	c7 45 f0 20 0c 00 00 	movl   $0xc20,-0x10(%ebp)
 88e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 891:	a3 28 0c 00 00       	mov    %eax,0xc28
 896:	a1 28 0c 00 00       	mov    0xc28,%eax
 89b:	a3 20 0c 00 00       	mov    %eax,0xc20
    base.s.size = 0;
 8a0:	c7 05 24 0c 00 00 00 	movl   $0x0,0xc24
 8a7:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ad:	8b 00                	mov    (%eax),%eax
 8af:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b5:	8b 40 04             	mov    0x4(%eax),%eax
 8b8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8bb:	72 4d                	jb     90a <malloc+0xa6>
      if(p->s.size == nunits)
 8bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c0:	8b 40 04             	mov    0x4(%eax),%eax
 8c3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8c6:	75 0c                	jne    8d4 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cb:	8b 10                	mov    (%eax),%edx
 8cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d0:	89 10                	mov    %edx,(%eax)
 8d2:	eb 26                	jmp    8fa <malloc+0x96>
      else {
        p->s.size -= nunits;
 8d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d7:	8b 40 04             	mov    0x4(%eax),%eax
 8da:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8dd:	89 c2                	mov    %eax,%edx
 8df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e8:	8b 40 04             	mov    0x4(%eax),%eax
 8eb:	c1 e0 03             	shl    $0x3,%eax
 8ee:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f4:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8f7:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fd:	a3 28 0c 00 00       	mov    %eax,0xc28
      return (void*)(p + 1);
 902:	8b 45 f4             	mov    -0xc(%ebp),%eax
 905:	83 c0 08             	add    $0x8,%eax
 908:	eb 38                	jmp    942 <malloc+0xde>
    }
    if(p == freep)
 90a:	a1 28 0c 00 00       	mov    0xc28,%eax
 90f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 912:	75 1b                	jne    92f <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 914:	8b 45 ec             	mov    -0x14(%ebp),%eax
 917:	89 04 24             	mov    %eax,(%esp)
 91a:	e8 ed fe ff ff       	call   80c <morecore>
 91f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 922:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 926:	75 07                	jne    92f <malloc+0xcb>
        return 0;
 928:	b8 00 00 00 00       	mov    $0x0,%eax
 92d:	eb 13                	jmp    942 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 92f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 932:	89 45 f0             	mov    %eax,-0x10(%ebp)
 935:	8b 45 f4             	mov    -0xc(%ebp),%eax
 938:	8b 00                	mov    (%eax),%eax
 93a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 93d:	e9 70 ff ff ff       	jmp    8b2 <malloc+0x4e>
}
 942:	c9                   	leave  
 943:	c3                   	ret    
