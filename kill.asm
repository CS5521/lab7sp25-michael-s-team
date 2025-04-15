
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "usage: kill pid...\n");
   f:	c7 44 24 04 32 09 00 	movl   $0x932,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 43 05 00 00       	call   566 <printf>
    exit();
  23:	e8 b6 03 00 00       	call   3de <exit>
  }
  for(i=1; i<argc; i++)
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 27                	jmp    59 <main+0x59>
    kill(atoi(argv[i]));
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 f1 01 00 00       	call   23d <atoi>
  4c:	89 04 24             	mov    %eax,(%esp)
  4f:	e8 ba 03 00 00       	call   40e <kill>
  for(i=1; i<argc; i++)
  54:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  59:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  5d:	3b 45 08             	cmp    0x8(%ebp),%eax
  60:	7c d0                	jl     32 <main+0x32>
  exit();
  62:	e8 77 03 00 00       	call   3de <exit>

00000067 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  67:	55                   	push   %ebp
  68:	89 e5                	mov    %esp,%ebp
  6a:	57                   	push   %edi
  6b:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6f:	8b 55 10             	mov    0x10(%ebp),%edx
  72:	8b 45 0c             	mov    0xc(%ebp),%eax
  75:	89 cb                	mov    %ecx,%ebx
  77:	89 df                	mov    %ebx,%edi
  79:	89 d1                	mov    %edx,%ecx
  7b:	fc                   	cld    
  7c:	f3 aa                	rep stos %al,%es:(%edi)
  7e:	89 ca                	mov    %ecx,%edx
  80:	89 fb                	mov    %edi,%ebx
  82:	89 5d 08             	mov    %ebx,0x8(%ebp)
  85:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  88:	5b                   	pop    %ebx
  89:	5f                   	pop    %edi
  8a:	5d                   	pop    %ebp
  8b:	c3                   	ret    

0000008c <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  92:	8b 45 08             	mov    0x8(%ebp),%eax
  95:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  98:	90                   	nop
  99:	8b 45 08             	mov    0x8(%ebp),%eax
  9c:	8d 50 01             	lea    0x1(%eax),%edx
  9f:	89 55 08             	mov    %edx,0x8(%ebp)
  a2:	8b 55 0c             	mov    0xc(%ebp),%edx
  a5:	8d 4a 01             	lea    0x1(%edx),%ecx
  a8:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  ab:	0f b6 12             	movzbl (%edx),%edx
  ae:	88 10                	mov    %dl,(%eax)
  b0:	0f b6 00             	movzbl (%eax),%eax
  b3:	84 c0                	test   %al,%al
  b5:	75 e2                	jne    99 <strcpy+0xd>
    ;
  return os;
  b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  ba:	c9                   	leave  
  bb:	c3                   	ret    

000000bc <strcmp>:

int
strcmp(const char *p, const char *q)
{
  bc:	55                   	push   %ebp
  bd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  bf:	eb 08                	jmp    c9 <strcmp+0xd>
    p++, q++;
  c1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  c9:	8b 45 08             	mov    0x8(%ebp),%eax
  cc:	0f b6 00             	movzbl (%eax),%eax
  cf:	84 c0                	test   %al,%al
  d1:	74 10                	je     e3 <strcmp+0x27>
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	0f b6 10             	movzbl (%eax),%edx
  d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  dc:	0f b6 00             	movzbl (%eax),%eax
  df:	38 c2                	cmp    %al,%dl
  e1:	74 de                	je     c1 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	0f b6 00             	movzbl (%eax),%eax
  e9:	0f b6 d0             	movzbl %al,%edx
  ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  ef:	0f b6 00             	movzbl (%eax),%eax
  f2:	0f b6 c0             	movzbl %al,%eax
  f5:	29 c2                	sub    %eax,%edx
  f7:	89 d0                	mov    %edx,%eax
}
  f9:	5d                   	pop    %ebp
  fa:	c3                   	ret    

000000fb <strlen>:

uint
strlen(const char *s)
{
  fb:	55                   	push   %ebp
  fc:	89 e5                	mov    %esp,%ebp
  fe:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 101:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 108:	eb 04                	jmp    10e <strlen+0x13>
 10a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 10e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	01 d0                	add    %edx,%eax
 116:	0f b6 00             	movzbl (%eax),%eax
 119:	84 c0                	test   %al,%al
 11b:	75 ed                	jne    10a <strlen+0xf>
    ;
  return n;
 11d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 120:	c9                   	leave  
 121:	c3                   	ret    

00000122 <memset>:

void*
memset(void *dst, int c, uint n)
{
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 128:	8b 45 10             	mov    0x10(%ebp),%eax
 12b:	89 44 24 08          	mov    %eax,0x8(%esp)
 12f:	8b 45 0c             	mov    0xc(%ebp),%eax
 132:	89 44 24 04          	mov    %eax,0x4(%esp)
 136:	8b 45 08             	mov    0x8(%ebp),%eax
 139:	89 04 24             	mov    %eax,(%esp)
 13c:	e8 26 ff ff ff       	call   67 <stosb>
  return dst;
 141:	8b 45 08             	mov    0x8(%ebp),%eax
}
 144:	c9                   	leave  
 145:	c3                   	ret    

00000146 <strchr>:

char*
strchr(const char *s, char c)
{
 146:	55                   	push   %ebp
 147:	89 e5                	mov    %esp,%ebp
 149:	83 ec 04             	sub    $0x4,%esp
 14c:	8b 45 0c             	mov    0xc(%ebp),%eax
 14f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 152:	eb 14                	jmp    168 <strchr+0x22>
    if(*s == c)
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	0f b6 00             	movzbl (%eax),%eax
 15a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 15d:	75 05                	jne    164 <strchr+0x1e>
      return (char*)s;
 15f:	8b 45 08             	mov    0x8(%ebp),%eax
 162:	eb 13                	jmp    177 <strchr+0x31>
  for(; *s; s++)
 164:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	0f b6 00             	movzbl (%eax),%eax
 16e:	84 c0                	test   %al,%al
 170:	75 e2                	jne    154 <strchr+0xe>
  return 0;
 172:	b8 00 00 00 00       	mov    $0x0,%eax
}
 177:	c9                   	leave  
 178:	c3                   	ret    

00000179 <gets>:

char*
gets(char *buf, int max)
{
 179:	55                   	push   %ebp
 17a:	89 e5                	mov    %esp,%ebp
 17c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 186:	eb 4c                	jmp    1d4 <gets+0x5b>
    cc = read(0, &c, 1);
 188:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 18f:	00 
 190:	8d 45 ef             	lea    -0x11(%ebp),%eax
 193:	89 44 24 04          	mov    %eax,0x4(%esp)
 197:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 19e:	e8 53 02 00 00       	call   3f6 <read>
 1a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1aa:	7f 02                	jg     1ae <gets+0x35>
      break;
 1ac:	eb 31                	jmp    1df <gets+0x66>
    buf[i++] = c;
 1ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b1:	8d 50 01             	lea    0x1(%eax),%edx
 1b4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1b7:	89 c2                	mov    %eax,%edx
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	01 c2                	add    %eax,%edx
 1be:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c2:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c8:	3c 0a                	cmp    $0xa,%al
 1ca:	74 13                	je     1df <gets+0x66>
 1cc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d0:	3c 0d                	cmp    $0xd,%al
 1d2:	74 0b                	je     1df <gets+0x66>
  for(i=0; i+1 < max; ){
 1d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d7:	83 c0 01             	add    $0x1,%eax
 1da:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1dd:	7c a9                	jl     188 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 1df:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	01 d0                	add    %edx,%eax
 1e7:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ed:	c9                   	leave  
 1ee:	c3                   	ret    

000001ef <stat>:

int
stat(const char *n, struct stat *st)
{
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1fc:	00 
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	89 04 24             	mov    %eax,(%esp)
 203:	e8 16 02 00 00       	call   41e <open>
 208:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 20b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 20f:	79 07                	jns    218 <stat+0x29>
    return -1;
 211:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 216:	eb 23                	jmp    23b <stat+0x4c>
  r = fstat(fd, st);
 218:	8b 45 0c             	mov    0xc(%ebp),%eax
 21b:	89 44 24 04          	mov    %eax,0x4(%esp)
 21f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 222:	89 04 24             	mov    %eax,(%esp)
 225:	e8 0c 02 00 00       	call   436 <fstat>
 22a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 22d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 230:	89 04 24             	mov    %eax,(%esp)
 233:	e8 ce 01 00 00       	call   406 <close>
  return r;
 238:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 23b:	c9                   	leave  
 23c:	c3                   	ret    

0000023d <atoi>:

int
atoi(const char *s)
{
 23d:	55                   	push   %ebp
 23e:	89 e5                	mov    %esp,%ebp
 240:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 243:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 24a:	eb 25                	jmp    271 <atoi+0x34>
    n = n*10 + *s++ - '0';
 24c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 24f:	89 d0                	mov    %edx,%eax
 251:	c1 e0 02             	shl    $0x2,%eax
 254:	01 d0                	add    %edx,%eax
 256:	01 c0                	add    %eax,%eax
 258:	89 c1                	mov    %eax,%ecx
 25a:	8b 45 08             	mov    0x8(%ebp),%eax
 25d:	8d 50 01             	lea    0x1(%eax),%edx
 260:	89 55 08             	mov    %edx,0x8(%ebp)
 263:	0f b6 00             	movzbl (%eax),%eax
 266:	0f be c0             	movsbl %al,%eax
 269:	01 c8                	add    %ecx,%eax
 26b:	83 e8 30             	sub    $0x30,%eax
 26e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 271:	8b 45 08             	mov    0x8(%ebp),%eax
 274:	0f b6 00             	movzbl (%eax),%eax
 277:	3c 2f                	cmp    $0x2f,%al
 279:	7e 0a                	jle    285 <atoi+0x48>
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	0f b6 00             	movzbl (%eax),%eax
 281:	3c 39                	cmp    $0x39,%al
 283:	7e c7                	jle    24c <atoi+0xf>
  return n;
 285:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 288:	c9                   	leave  
 289:	c3                   	ret    

0000028a <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 28a:	55                   	push   %ebp
 28b:	89 e5                	mov    %esp,%ebp
 28d:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 296:	8b 45 0c             	mov    0xc(%ebp),%eax
 299:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 29c:	eb 17                	jmp    2b5 <memmove+0x2b>
    *dst++ = *src++;
 29e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a1:	8d 50 01             	lea    0x1(%eax),%edx
 2a4:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2a7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2aa:	8d 4a 01             	lea    0x1(%edx),%ecx
 2ad:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2b0:	0f b6 12             	movzbl (%edx),%edx
 2b3:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2b5:	8b 45 10             	mov    0x10(%ebp),%eax
 2b8:	8d 50 ff             	lea    -0x1(%eax),%edx
 2bb:	89 55 10             	mov    %edx,0x10(%ebp)
 2be:	85 c0                	test   %eax,%eax
 2c0:	7f dc                	jg     29e <memmove+0x14>
  return vdst;
 2c2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c5:	c9                   	leave  
 2c6:	c3                   	ret    

000002c7 <ps>:

void
ps(void)
{
 2c7:	55                   	push   %ebp
 2c8:	89 e5                	mov    %esp,%ebp
 2ca:	57                   	push   %edi
 2cb:	56                   	push   %esi
 2cc:	53                   	push   %ebx
 2cd:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable psinfo;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 2d3:	c7 44 24 04 46 09 00 	movl   $0x946,0x4(%esp)
 2da:	00 
 2db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2e2:	e8 7f 02 00 00       	call   566 <printf>
  int i;
  for (i = 0; i < NPROC; i++)
 2e7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 2ee:	e9 ce 00 00 00       	jmp    3c1 <ps+0xfa>
  {
    if (psinfo[i].inuse)
 2f3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2f6:	89 d0                	mov    %edx,%eax
 2f8:	c1 e0 03             	shl    $0x3,%eax
 2fb:	01 d0                	add    %edx,%eax
 2fd:	c1 e0 02             	shl    $0x2,%eax
 300:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 303:	01 d8                	add    %ebx,%eax
 305:	2d 04 09 00 00       	sub    $0x904,%eax
 30a:	8b 00                	mov    (%eax),%eax
 30c:	85 c0                	test   %eax,%eax
 30e:	0f 84 a9 00 00 00    	je     3bd <ps+0xf6>
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
         psinfo[i].pid,
         psinfo[i].tickets,
         psinfo[i].ticks,
         psinfo[i].state,
         psinfo[i].name);
 314:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 31a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 31d:	89 d0                	mov    %edx,%eax
 31f:	c1 e0 03             	shl    $0x3,%eax
 322:	01 d0                	add    %edx,%eax
 324:	c1 e0 02             	shl    $0x2,%eax
 327:	83 c0 10             	add    $0x10,%eax
 32a:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
         psinfo[i].state,
 32d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 330:	89 d0                	mov    %edx,%eax
 332:	c1 e0 03             	shl    $0x3,%eax
 335:	01 d0                	add    %edx,%eax
 337:	c1 e0 02             	shl    $0x2,%eax
 33a:	8d 75 e8             	lea    -0x18(%ebp),%esi
 33d:	01 f0                	add    %esi,%eax
 33f:	2d e4 08 00 00       	sub    $0x8e4,%eax
 344:	0f b6 00             	movzbl (%eax),%eax
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
 347:	0f be f0             	movsbl %al,%esi
 34a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 34d:	89 d0                	mov    %edx,%eax
 34f:	c1 e0 03             	shl    $0x3,%eax
 352:	01 d0                	add    %edx,%eax
 354:	c1 e0 02             	shl    $0x2,%eax
 357:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 35a:	01 c8                	add    %ecx,%eax
 35c:	2d f8 08 00 00       	sub    $0x8f8,%eax
 361:	8b 18                	mov    (%eax),%ebx
 363:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 366:	89 d0                	mov    %edx,%eax
 368:	c1 e0 03             	shl    $0x3,%eax
 36b:	01 d0                	add    %edx,%eax
 36d:	c1 e0 02             	shl    $0x2,%eax
 370:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 373:	01 c8                	add    %ecx,%eax
 375:	2d 00 09 00 00       	sub    $0x900,%eax
 37a:	8b 08                	mov    (%eax),%ecx
 37c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 37f:	89 d0                	mov    %edx,%eax
 381:	c1 e0 03             	shl    $0x3,%eax
 384:	01 d0                	add    %edx,%eax
 386:	c1 e0 02             	shl    $0x2,%eax
 389:	8d 55 e8             	lea    -0x18(%ebp),%edx
 38c:	01 d0                	add    %edx,%eax
 38e:	2d fc 08 00 00       	sub    $0x8fc,%eax
 393:	8b 00                	mov    (%eax),%eax
 395:	89 7c 24 18          	mov    %edi,0x18(%esp)
 399:	89 74 24 14          	mov    %esi,0x14(%esp)
 39d:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 3a1:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 3a5:	89 44 24 08          	mov    %eax,0x8(%esp)
 3a9:	c7 44 24 04 5f 09 00 	movl   $0x95f,0x4(%esp)
 3b0:	00 
 3b1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3b8:	e8 a9 01 00 00       	call   566 <printf>
  for (i = 0; i < NPROC; i++)
 3bd:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 3c1:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 3c5:	0f 8e 28 ff ff ff    	jle    2f3 <ps+0x2c>
    }
  }
}
 3cb:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3d1:	5b                   	pop    %ebx
 3d2:	5e                   	pop    %esi
 3d3:	5f                   	pop    %edi
 3d4:	5d                   	pop    %ebp
 3d5:	c3                   	ret    

000003d6 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3d6:	b8 01 00 00 00       	mov    $0x1,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <exit>:
SYSCALL(exit)
 3de:	b8 02 00 00 00       	mov    $0x2,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <wait>:
SYSCALL(wait)
 3e6:	b8 03 00 00 00       	mov    $0x3,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <pipe>:
SYSCALL(pipe)
 3ee:	b8 04 00 00 00       	mov    $0x4,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <read>:
SYSCALL(read)
 3f6:	b8 05 00 00 00       	mov    $0x5,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <write>:
SYSCALL(write)
 3fe:	b8 10 00 00 00       	mov    $0x10,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <close>:
SYSCALL(close)
 406:	b8 15 00 00 00       	mov    $0x15,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <kill>:
SYSCALL(kill)
 40e:	b8 06 00 00 00       	mov    $0x6,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <exec>:
SYSCALL(exec)
 416:	b8 07 00 00 00       	mov    $0x7,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <open>:
SYSCALL(open)
 41e:	b8 0f 00 00 00       	mov    $0xf,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <mknod>:
SYSCALL(mknod)
 426:	b8 11 00 00 00       	mov    $0x11,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <unlink>:
SYSCALL(unlink)
 42e:	b8 12 00 00 00       	mov    $0x12,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <fstat>:
SYSCALL(fstat)
 436:	b8 08 00 00 00       	mov    $0x8,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <link>:
SYSCALL(link)
 43e:	b8 13 00 00 00       	mov    $0x13,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <mkdir>:
SYSCALL(mkdir)
 446:	b8 14 00 00 00       	mov    $0x14,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <chdir>:
SYSCALL(chdir)
 44e:	b8 09 00 00 00       	mov    $0x9,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <dup>:
SYSCALL(dup)
 456:	b8 0a 00 00 00       	mov    $0xa,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <getpid>:
SYSCALL(getpid)
 45e:	b8 0b 00 00 00       	mov    $0xb,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <sbrk>:
SYSCALL(sbrk)
 466:	b8 0c 00 00 00       	mov    $0xc,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <sleep>:
SYSCALL(sleep)
 46e:	b8 0d 00 00 00       	mov    $0xd,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <uptime>:
SYSCALL(uptime)
 476:	b8 0e 00 00 00       	mov    $0xe,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <getpinfo>:
SYSCALL(getpinfo)
 47e:	b8 16 00 00 00       	mov    $0x16,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 486:	55                   	push   %ebp
 487:	89 e5                	mov    %esp,%ebp
 489:	83 ec 18             	sub    $0x18,%esp
 48c:	8b 45 0c             	mov    0xc(%ebp),%eax
 48f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 492:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 499:	00 
 49a:	8d 45 f4             	lea    -0xc(%ebp),%eax
 49d:	89 44 24 04          	mov    %eax,0x4(%esp)
 4a1:	8b 45 08             	mov    0x8(%ebp),%eax
 4a4:	89 04 24             	mov    %eax,(%esp)
 4a7:	e8 52 ff ff ff       	call   3fe <write>
}
 4ac:	c9                   	leave  
 4ad:	c3                   	ret    

000004ae <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	56                   	push   %esi
 4b2:	53                   	push   %ebx
 4b3:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4b6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4bd:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4c1:	74 17                	je     4da <printint+0x2c>
 4c3:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4c7:	79 11                	jns    4da <printint+0x2c>
    neg = 1;
 4c9:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4d0:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d3:	f7 d8                	neg    %eax
 4d5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4d8:	eb 06                	jmp    4e0 <printint+0x32>
  } else {
    x = xx;
 4da:	8b 45 0c             	mov    0xc(%ebp),%eax
 4dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4e0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4e7:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4ea:	8d 41 01             	lea    0x1(%ecx),%eax
 4ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4f0:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4f6:	ba 00 00 00 00       	mov    $0x0,%edx
 4fb:	f7 f3                	div    %ebx
 4fd:	89 d0                	mov    %edx,%eax
 4ff:	0f b6 80 e8 0b 00 00 	movzbl 0xbe8(%eax),%eax
 506:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 50a:	8b 75 10             	mov    0x10(%ebp),%esi
 50d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 510:	ba 00 00 00 00       	mov    $0x0,%edx
 515:	f7 f6                	div    %esi
 517:	89 45 ec             	mov    %eax,-0x14(%ebp)
 51a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 51e:	75 c7                	jne    4e7 <printint+0x39>
  if(neg)
 520:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 524:	74 10                	je     536 <printint+0x88>
    buf[i++] = '-';
 526:	8b 45 f4             	mov    -0xc(%ebp),%eax
 529:	8d 50 01             	lea    0x1(%eax),%edx
 52c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 52f:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 534:	eb 1f                	jmp    555 <printint+0xa7>
 536:	eb 1d                	jmp    555 <printint+0xa7>
    putc(fd, buf[i]);
 538:	8d 55 dc             	lea    -0x24(%ebp),%edx
 53b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53e:	01 d0                	add    %edx,%eax
 540:	0f b6 00             	movzbl (%eax),%eax
 543:	0f be c0             	movsbl %al,%eax
 546:	89 44 24 04          	mov    %eax,0x4(%esp)
 54a:	8b 45 08             	mov    0x8(%ebp),%eax
 54d:	89 04 24             	mov    %eax,(%esp)
 550:	e8 31 ff ff ff       	call   486 <putc>
  while(--i >= 0)
 555:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 559:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 55d:	79 d9                	jns    538 <printint+0x8a>
}
 55f:	83 c4 30             	add    $0x30,%esp
 562:	5b                   	pop    %ebx
 563:	5e                   	pop    %esi
 564:	5d                   	pop    %ebp
 565:	c3                   	ret    

00000566 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 566:	55                   	push   %ebp
 567:	89 e5                	mov    %esp,%ebp
 569:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 56c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 573:	8d 45 0c             	lea    0xc(%ebp),%eax
 576:	83 c0 04             	add    $0x4,%eax
 579:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 57c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 583:	e9 7c 01 00 00       	jmp    704 <printf+0x19e>
    c = fmt[i] & 0xff;
 588:	8b 55 0c             	mov    0xc(%ebp),%edx
 58b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 58e:	01 d0                	add    %edx,%eax
 590:	0f b6 00             	movzbl (%eax),%eax
 593:	0f be c0             	movsbl %al,%eax
 596:	25 ff 00 00 00       	and    $0xff,%eax
 59b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 59e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5a2:	75 2c                	jne    5d0 <printf+0x6a>
      if(c == '%'){
 5a4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5a8:	75 0c                	jne    5b6 <printf+0x50>
        state = '%';
 5aa:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5b1:	e9 4a 01 00 00       	jmp    700 <printf+0x19a>
      } else {
        putc(fd, c);
 5b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b9:	0f be c0             	movsbl %al,%eax
 5bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c0:	8b 45 08             	mov    0x8(%ebp),%eax
 5c3:	89 04 24             	mov    %eax,(%esp)
 5c6:	e8 bb fe ff ff       	call   486 <putc>
 5cb:	e9 30 01 00 00       	jmp    700 <printf+0x19a>
      }
    } else if(state == '%'){
 5d0:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5d4:	0f 85 26 01 00 00    	jne    700 <printf+0x19a>
      if(c == 'd'){
 5da:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5de:	75 2d                	jne    60d <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e3:	8b 00                	mov    (%eax),%eax
 5e5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5ec:	00 
 5ed:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5f4:	00 
 5f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f9:	8b 45 08             	mov    0x8(%ebp),%eax
 5fc:	89 04 24             	mov    %eax,(%esp)
 5ff:	e8 aa fe ff ff       	call   4ae <printint>
        ap++;
 604:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 608:	e9 ec 00 00 00       	jmp    6f9 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 60d:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 611:	74 06                	je     619 <printf+0xb3>
 613:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 617:	75 2d                	jne    646 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 619:	8b 45 e8             	mov    -0x18(%ebp),%eax
 61c:	8b 00                	mov    (%eax),%eax
 61e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 625:	00 
 626:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 62d:	00 
 62e:	89 44 24 04          	mov    %eax,0x4(%esp)
 632:	8b 45 08             	mov    0x8(%ebp),%eax
 635:	89 04 24             	mov    %eax,(%esp)
 638:	e8 71 fe ff ff       	call   4ae <printint>
        ap++;
 63d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 641:	e9 b3 00 00 00       	jmp    6f9 <printf+0x193>
      } else if(c == 's'){
 646:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 64a:	75 45                	jne    691 <printf+0x12b>
        s = (char*)*ap;
 64c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 64f:	8b 00                	mov    (%eax),%eax
 651:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 654:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 658:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 65c:	75 09                	jne    667 <printf+0x101>
          s = "(null)";
 65e:	c7 45 f4 6f 09 00 00 	movl   $0x96f,-0xc(%ebp)
        while(*s != 0){
 665:	eb 1e                	jmp    685 <printf+0x11f>
 667:	eb 1c                	jmp    685 <printf+0x11f>
          putc(fd, *s);
 669:	8b 45 f4             	mov    -0xc(%ebp),%eax
 66c:	0f b6 00             	movzbl (%eax),%eax
 66f:	0f be c0             	movsbl %al,%eax
 672:	89 44 24 04          	mov    %eax,0x4(%esp)
 676:	8b 45 08             	mov    0x8(%ebp),%eax
 679:	89 04 24             	mov    %eax,(%esp)
 67c:	e8 05 fe ff ff       	call   486 <putc>
          s++;
 681:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 685:	8b 45 f4             	mov    -0xc(%ebp),%eax
 688:	0f b6 00             	movzbl (%eax),%eax
 68b:	84 c0                	test   %al,%al
 68d:	75 da                	jne    669 <printf+0x103>
 68f:	eb 68                	jmp    6f9 <printf+0x193>
        }
      } else if(c == 'c'){
 691:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 695:	75 1d                	jne    6b4 <printf+0x14e>
        putc(fd, *ap);
 697:	8b 45 e8             	mov    -0x18(%ebp),%eax
 69a:	8b 00                	mov    (%eax),%eax
 69c:	0f be c0             	movsbl %al,%eax
 69f:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a3:	8b 45 08             	mov    0x8(%ebp),%eax
 6a6:	89 04 24             	mov    %eax,(%esp)
 6a9:	e8 d8 fd ff ff       	call   486 <putc>
        ap++;
 6ae:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6b2:	eb 45                	jmp    6f9 <printf+0x193>
      } else if(c == '%'){
 6b4:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6b8:	75 17                	jne    6d1 <printf+0x16b>
        putc(fd, c);
 6ba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6bd:	0f be c0             	movsbl %al,%eax
 6c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c4:	8b 45 08             	mov    0x8(%ebp),%eax
 6c7:	89 04 24             	mov    %eax,(%esp)
 6ca:	e8 b7 fd ff ff       	call   486 <putc>
 6cf:	eb 28                	jmp    6f9 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6d1:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6d8:	00 
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
 6dc:	89 04 24             	mov    %eax,(%esp)
 6df:	e8 a2 fd ff ff       	call   486 <putc>
        putc(fd, c);
 6e4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e7:	0f be c0             	movsbl %al,%eax
 6ea:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ee:	8b 45 08             	mov    0x8(%ebp),%eax
 6f1:	89 04 24             	mov    %eax,(%esp)
 6f4:	e8 8d fd ff ff       	call   486 <putc>
      }
      state = 0;
 6f9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 700:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 704:	8b 55 0c             	mov    0xc(%ebp),%edx
 707:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70a:	01 d0                	add    %edx,%eax
 70c:	0f b6 00             	movzbl (%eax),%eax
 70f:	84 c0                	test   %al,%al
 711:	0f 85 71 fe ff ff    	jne    588 <printf+0x22>
    }
  }
}
 717:	c9                   	leave  
 718:	c3                   	ret    

00000719 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 719:	55                   	push   %ebp
 71a:	89 e5                	mov    %esp,%ebp
 71c:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 71f:	8b 45 08             	mov    0x8(%ebp),%eax
 722:	83 e8 08             	sub    $0x8,%eax
 725:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 728:	a1 04 0c 00 00       	mov    0xc04,%eax
 72d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 730:	eb 24                	jmp    756 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 732:	8b 45 fc             	mov    -0x4(%ebp),%eax
 735:	8b 00                	mov    (%eax),%eax
 737:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 73a:	77 12                	ja     74e <free+0x35>
 73c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 742:	77 24                	ja     768 <free+0x4f>
 744:	8b 45 fc             	mov    -0x4(%ebp),%eax
 747:	8b 00                	mov    (%eax),%eax
 749:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 74c:	77 1a                	ja     768 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 74e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 751:	8b 00                	mov    (%eax),%eax
 753:	89 45 fc             	mov    %eax,-0x4(%ebp)
 756:	8b 45 f8             	mov    -0x8(%ebp),%eax
 759:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 75c:	76 d4                	jbe    732 <free+0x19>
 75e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 761:	8b 00                	mov    (%eax),%eax
 763:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 766:	76 ca                	jbe    732 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 768:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76b:	8b 40 04             	mov    0x4(%eax),%eax
 76e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 775:	8b 45 f8             	mov    -0x8(%ebp),%eax
 778:	01 c2                	add    %eax,%edx
 77a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77d:	8b 00                	mov    (%eax),%eax
 77f:	39 c2                	cmp    %eax,%edx
 781:	75 24                	jne    7a7 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 783:	8b 45 f8             	mov    -0x8(%ebp),%eax
 786:	8b 50 04             	mov    0x4(%eax),%edx
 789:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78c:	8b 00                	mov    (%eax),%eax
 78e:	8b 40 04             	mov    0x4(%eax),%eax
 791:	01 c2                	add    %eax,%edx
 793:	8b 45 f8             	mov    -0x8(%ebp),%eax
 796:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 799:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79c:	8b 00                	mov    (%eax),%eax
 79e:	8b 10                	mov    (%eax),%edx
 7a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a3:	89 10                	mov    %edx,(%eax)
 7a5:	eb 0a                	jmp    7b1 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7aa:	8b 10                	mov    (%eax),%edx
 7ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7af:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b4:	8b 40 04             	mov    0x4(%eax),%eax
 7b7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7be:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c1:	01 d0                	add    %edx,%eax
 7c3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7c6:	75 20                	jne    7e8 <free+0xcf>
    p->s.size += bp->s.size;
 7c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cb:	8b 50 04             	mov    0x4(%eax),%edx
 7ce:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d1:	8b 40 04             	mov    0x4(%eax),%eax
 7d4:	01 c2                	add    %eax,%edx
 7d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d9:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7dc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7df:	8b 10                	mov    (%eax),%edx
 7e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e4:	89 10                	mov    %edx,(%eax)
 7e6:	eb 08                	jmp    7f0 <free+0xd7>
  } else
    p->s.ptr = bp;
 7e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7eb:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7ee:	89 10                	mov    %edx,(%eax)
  freep = p;
 7f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f3:	a3 04 0c 00 00       	mov    %eax,0xc04
}
 7f8:	c9                   	leave  
 7f9:	c3                   	ret    

000007fa <morecore>:

static Header*
morecore(uint nu)
{
 7fa:	55                   	push   %ebp
 7fb:	89 e5                	mov    %esp,%ebp
 7fd:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 800:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 807:	77 07                	ja     810 <morecore+0x16>
    nu = 4096;
 809:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 810:	8b 45 08             	mov    0x8(%ebp),%eax
 813:	c1 e0 03             	shl    $0x3,%eax
 816:	89 04 24             	mov    %eax,(%esp)
 819:	e8 48 fc ff ff       	call   466 <sbrk>
 81e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 821:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 825:	75 07                	jne    82e <morecore+0x34>
    return 0;
 827:	b8 00 00 00 00       	mov    $0x0,%eax
 82c:	eb 22                	jmp    850 <morecore+0x56>
  hp = (Header*)p;
 82e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 831:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 834:	8b 45 f0             	mov    -0x10(%ebp),%eax
 837:	8b 55 08             	mov    0x8(%ebp),%edx
 83a:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 83d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 840:	83 c0 08             	add    $0x8,%eax
 843:	89 04 24             	mov    %eax,(%esp)
 846:	e8 ce fe ff ff       	call   719 <free>
  return freep;
 84b:	a1 04 0c 00 00       	mov    0xc04,%eax
}
 850:	c9                   	leave  
 851:	c3                   	ret    

00000852 <malloc>:

void*
malloc(uint nbytes)
{
 852:	55                   	push   %ebp
 853:	89 e5                	mov    %esp,%ebp
 855:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 858:	8b 45 08             	mov    0x8(%ebp),%eax
 85b:	83 c0 07             	add    $0x7,%eax
 85e:	c1 e8 03             	shr    $0x3,%eax
 861:	83 c0 01             	add    $0x1,%eax
 864:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 867:	a1 04 0c 00 00       	mov    0xc04,%eax
 86c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 86f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 873:	75 23                	jne    898 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 875:	c7 45 f0 fc 0b 00 00 	movl   $0xbfc,-0x10(%ebp)
 87c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87f:	a3 04 0c 00 00       	mov    %eax,0xc04
 884:	a1 04 0c 00 00       	mov    0xc04,%eax
 889:	a3 fc 0b 00 00       	mov    %eax,0xbfc
    base.s.size = 0;
 88e:	c7 05 00 0c 00 00 00 	movl   $0x0,0xc00
 895:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 898:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89b:	8b 00                	mov    (%eax),%eax
 89d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a3:	8b 40 04             	mov    0x4(%eax),%eax
 8a6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8a9:	72 4d                	jb     8f8 <malloc+0xa6>
      if(p->s.size == nunits)
 8ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ae:	8b 40 04             	mov    0x4(%eax),%eax
 8b1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8b4:	75 0c                	jne    8c2 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b9:	8b 10                	mov    (%eax),%edx
 8bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8be:	89 10                	mov    %edx,(%eax)
 8c0:	eb 26                	jmp    8e8 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c5:	8b 40 04             	mov    0x4(%eax),%eax
 8c8:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8cb:	89 c2                	mov    %eax,%edx
 8cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d0:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d6:	8b 40 04             	mov    0x4(%eax),%eax
 8d9:	c1 e0 03             	shl    $0x3,%eax
 8dc:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e2:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8e5:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8eb:	a3 04 0c 00 00       	mov    %eax,0xc04
      return (void*)(p + 1);
 8f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f3:	83 c0 08             	add    $0x8,%eax
 8f6:	eb 38                	jmp    930 <malloc+0xde>
    }
    if(p == freep)
 8f8:	a1 04 0c 00 00       	mov    0xc04,%eax
 8fd:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 900:	75 1b                	jne    91d <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 902:	8b 45 ec             	mov    -0x14(%ebp),%eax
 905:	89 04 24             	mov    %eax,(%esp)
 908:	e8 ed fe ff ff       	call   7fa <morecore>
 90d:	89 45 f4             	mov    %eax,-0xc(%ebp)
 910:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 914:	75 07                	jne    91d <malloc+0xcb>
        return 0;
 916:	b8 00 00 00 00       	mov    $0x0,%eax
 91b:	eb 13                	jmp    930 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 920:	89 45 f0             	mov    %eax,-0x10(%ebp)
 923:	8b 45 f4             	mov    -0xc(%ebp),%eax
 926:	8b 00                	mov    (%eax),%eax
 928:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 92b:	e9 70 ff ff ff       	jmp    8a0 <malloc+0x4e>
}
 930:	c9                   	leave  
 931:	c3                   	ret    
