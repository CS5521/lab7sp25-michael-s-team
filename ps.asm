
_ps:     file format elf32-i386


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
  ps();
   6:	e8 65 02 00 00       	call   270 <ps>
  exit();
   b:	e8 77 03 00 00       	call   387 <exit>

00000010 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  10:	55                   	push   %ebp
  11:	89 e5                	mov    %esp,%ebp
  13:	57                   	push   %edi
  14:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  15:	8b 4d 08             	mov    0x8(%ebp),%ecx
  18:	8b 55 10             	mov    0x10(%ebp),%edx
  1b:	8b 45 0c             	mov    0xc(%ebp),%eax
  1e:	89 cb                	mov    %ecx,%ebx
  20:	89 df                	mov    %ebx,%edi
  22:	89 d1                	mov    %edx,%ecx
  24:	fc                   	cld    
  25:	f3 aa                	rep stos %al,%es:(%edi)
  27:	89 ca                	mov    %ecx,%edx
  29:	89 fb                	mov    %edi,%ebx
  2b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  2e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  31:	5b                   	pop    %ebx
  32:	5f                   	pop    %edi
  33:	5d                   	pop    %ebp
  34:	c3                   	ret    

00000035 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  35:	55                   	push   %ebp
  36:	89 e5                	mov    %esp,%ebp
  38:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  3b:	8b 45 08             	mov    0x8(%ebp),%eax
  3e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  41:	90                   	nop
  42:	8b 45 08             	mov    0x8(%ebp),%eax
  45:	8d 50 01             	lea    0x1(%eax),%edx
  48:	89 55 08             	mov    %edx,0x8(%ebp)
  4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  4e:	8d 4a 01             	lea    0x1(%edx),%ecx
  51:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  54:	0f b6 12             	movzbl (%edx),%edx
  57:	88 10                	mov    %dl,(%eax)
  59:	0f b6 00             	movzbl (%eax),%eax
  5c:	84 c0                	test   %al,%al
  5e:	75 e2                	jne    42 <strcpy+0xd>
    ;
  return os;
  60:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  63:	c9                   	leave  
  64:	c3                   	ret    

00000065 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  68:	eb 08                	jmp    72 <strcmp+0xd>
    p++, q++;
  6a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  6e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  72:	8b 45 08             	mov    0x8(%ebp),%eax
  75:	0f b6 00             	movzbl (%eax),%eax
  78:	84 c0                	test   %al,%al
  7a:	74 10                	je     8c <strcmp+0x27>
  7c:	8b 45 08             	mov    0x8(%ebp),%eax
  7f:	0f b6 10             	movzbl (%eax),%edx
  82:	8b 45 0c             	mov    0xc(%ebp),%eax
  85:	0f b6 00             	movzbl (%eax),%eax
  88:	38 c2                	cmp    %al,%dl
  8a:	74 de                	je     6a <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  8c:	8b 45 08             	mov    0x8(%ebp),%eax
  8f:	0f b6 00             	movzbl (%eax),%eax
  92:	0f b6 d0             	movzbl %al,%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 00             	movzbl (%eax),%eax
  9b:	0f b6 c0             	movzbl %al,%eax
  9e:	29 c2                	sub    %eax,%edx
  a0:	89 d0                	mov    %edx,%eax
}
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    

000000a4 <strlen>:

uint
strlen(const char *s)
{
  a4:	55                   	push   %ebp
  a5:	89 e5                	mov    %esp,%ebp
  a7:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  aa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  b1:	eb 04                	jmp    b7 <strlen+0x13>
  b3:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  b7:	8b 55 fc             	mov    -0x4(%ebp),%edx
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	01 d0                	add    %edx,%eax
  bf:	0f b6 00             	movzbl (%eax),%eax
  c2:	84 c0                	test   %al,%al
  c4:	75 ed                	jne    b3 <strlen+0xf>
    ;
  return n;
  c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c9:	c9                   	leave  
  ca:	c3                   	ret    

000000cb <memset>:

void*
memset(void *dst, int c, uint n)
{
  cb:	55                   	push   %ebp
  cc:	89 e5                	mov    %esp,%ebp
  ce:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  d1:	8b 45 10             	mov    0x10(%ebp),%eax
  d4:	89 44 24 08          	mov    %eax,0x8(%esp)
  d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  db:	89 44 24 04          	mov    %eax,0x4(%esp)
  df:	8b 45 08             	mov    0x8(%ebp),%eax
  e2:	89 04 24             	mov    %eax,(%esp)
  e5:	e8 26 ff ff ff       	call   10 <stosb>
  return dst;
  ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
  ed:	c9                   	leave  
  ee:	c3                   	ret    

000000ef <strchr>:

char*
strchr(const char *s, char c)
{
  ef:	55                   	push   %ebp
  f0:	89 e5                	mov    %esp,%ebp
  f2:	83 ec 04             	sub    $0x4,%esp
  f5:	8b 45 0c             	mov    0xc(%ebp),%eax
  f8:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
  fb:	eb 14                	jmp    111 <strchr+0x22>
    if(*s == c)
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
 100:	0f b6 00             	movzbl (%eax),%eax
 103:	3a 45 fc             	cmp    -0x4(%ebp),%al
 106:	75 05                	jne    10d <strchr+0x1e>
      return (char*)s;
 108:	8b 45 08             	mov    0x8(%ebp),%eax
 10b:	eb 13                	jmp    120 <strchr+0x31>
  for(; *s; s++)
 10d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	0f b6 00             	movzbl (%eax),%eax
 117:	84 c0                	test   %al,%al
 119:	75 e2                	jne    fd <strchr+0xe>
  return 0;
 11b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 120:	c9                   	leave  
 121:	c3                   	ret    

00000122 <gets>:

char*
gets(char *buf, int max)
{
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 128:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 12f:	eb 4c                	jmp    17d <gets+0x5b>
    cc = read(0, &c, 1);
 131:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 138:	00 
 139:	8d 45 ef             	lea    -0x11(%ebp),%eax
 13c:	89 44 24 04          	mov    %eax,0x4(%esp)
 140:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 147:	e8 53 02 00 00       	call   39f <read>
 14c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 14f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 153:	7f 02                	jg     157 <gets+0x35>
      break;
 155:	eb 31                	jmp    188 <gets+0x66>
    buf[i++] = c;
 157:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15a:	8d 50 01             	lea    0x1(%eax),%edx
 15d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 160:	89 c2                	mov    %eax,%edx
 162:	8b 45 08             	mov    0x8(%ebp),%eax
 165:	01 c2                	add    %eax,%edx
 167:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 16b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 16d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 171:	3c 0a                	cmp    $0xa,%al
 173:	74 13                	je     188 <gets+0x66>
 175:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 179:	3c 0d                	cmp    $0xd,%al
 17b:	74 0b                	je     188 <gets+0x66>
  for(i=0; i+1 < max; ){
 17d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 180:	83 c0 01             	add    $0x1,%eax
 183:	3b 45 0c             	cmp    0xc(%ebp),%eax
 186:	7c a9                	jl     131 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 188:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	01 d0                	add    %edx,%eax
 190:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 193:	8b 45 08             	mov    0x8(%ebp),%eax
}
 196:	c9                   	leave  
 197:	c3                   	ret    

00000198 <stat>:

int
stat(const char *n, struct stat *st)
{
 198:	55                   	push   %ebp
 199:	89 e5                	mov    %esp,%ebp
 19b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 19e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1a5:	00 
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 1a9:	89 04 24             	mov    %eax,(%esp)
 1ac:	e8 16 02 00 00       	call   3c7 <open>
 1b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b8:	79 07                	jns    1c1 <stat+0x29>
    return -1;
 1ba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1bf:	eb 23                	jmp    1e4 <stat+0x4c>
  r = fstat(fd, st);
 1c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1cb:	89 04 24             	mov    %eax,(%esp)
 1ce:	e8 0c 02 00 00       	call   3df <fstat>
 1d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	89 04 24             	mov    %eax,(%esp)
 1dc:	e8 ce 01 00 00       	call   3af <close>
  return r;
 1e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1e4:	c9                   	leave  
 1e5:	c3                   	ret    

000001e6 <atoi>:

int
atoi(const char *s)
{
 1e6:	55                   	push   %ebp
 1e7:	89 e5                	mov    %esp,%ebp
 1e9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ec:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 1f3:	eb 25                	jmp    21a <atoi+0x34>
    n = n*10 + *s++ - '0';
 1f5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1f8:	89 d0                	mov    %edx,%eax
 1fa:	c1 e0 02             	shl    $0x2,%eax
 1fd:	01 d0                	add    %edx,%eax
 1ff:	01 c0                	add    %eax,%eax
 201:	89 c1                	mov    %eax,%ecx
 203:	8b 45 08             	mov    0x8(%ebp),%eax
 206:	8d 50 01             	lea    0x1(%eax),%edx
 209:	89 55 08             	mov    %edx,0x8(%ebp)
 20c:	0f b6 00             	movzbl (%eax),%eax
 20f:	0f be c0             	movsbl %al,%eax
 212:	01 c8                	add    %ecx,%eax
 214:	83 e8 30             	sub    $0x30,%eax
 217:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
 21d:	0f b6 00             	movzbl (%eax),%eax
 220:	3c 2f                	cmp    $0x2f,%al
 222:	7e 0a                	jle    22e <atoi+0x48>
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	0f b6 00             	movzbl (%eax),%eax
 22a:	3c 39                	cmp    $0x39,%al
 22c:	7e c7                	jle    1f5 <atoi+0xf>
  return n;
 22e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 231:	c9                   	leave  
 232:	c3                   	ret    

00000233 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 233:	55                   	push   %ebp
 234:	89 e5                	mov    %esp,%ebp
 236:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 239:	8b 45 08             	mov    0x8(%ebp),%eax
 23c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 23f:	8b 45 0c             	mov    0xc(%ebp),%eax
 242:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 245:	eb 17                	jmp    25e <memmove+0x2b>
    *dst++ = *src++;
 247:	8b 45 fc             	mov    -0x4(%ebp),%eax
 24a:	8d 50 01             	lea    0x1(%eax),%edx
 24d:	89 55 fc             	mov    %edx,-0x4(%ebp)
 250:	8b 55 f8             	mov    -0x8(%ebp),%edx
 253:	8d 4a 01             	lea    0x1(%edx),%ecx
 256:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 259:	0f b6 12             	movzbl (%edx),%edx
 25c:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 25e:	8b 45 10             	mov    0x10(%ebp),%eax
 261:	8d 50 ff             	lea    -0x1(%eax),%edx
 264:	89 55 10             	mov    %edx,0x10(%ebp)
 267:	85 c0                	test   %eax,%eax
 269:	7f dc                	jg     247 <memmove+0x14>
  return vdst;
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 26e:	c9                   	leave  
 26f:	c3                   	ret    

00000270 <ps>:

void
ps(void)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	57                   	push   %edi
 274:	56                   	push   %esi
 275:	53                   	push   %ebx
 276:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable psinfo;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 27c:	c7 44 24 04 db 08 00 	movl   $0x8db,0x4(%esp)
 283:	00 
 284:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 28b:	e8 7f 02 00 00       	call   50f <printf>
  int i;
  for (i = 0; i < NPROC; i++)
 290:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 297:	e9 ce 00 00 00       	jmp    36a <ps+0xfa>
  {
    if (psinfo[i].inuse)
 29c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 29f:	89 d0                	mov    %edx,%eax
 2a1:	c1 e0 03             	shl    $0x3,%eax
 2a4:	01 d0                	add    %edx,%eax
 2a6:	c1 e0 02             	shl    $0x2,%eax
 2a9:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 2ac:	01 d8                	add    %ebx,%eax
 2ae:	2d 04 09 00 00       	sub    $0x904,%eax
 2b3:	8b 00                	mov    (%eax),%eax
 2b5:	85 c0                	test   %eax,%eax
 2b7:	0f 84 a9 00 00 00    	je     366 <ps+0xf6>
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
         psinfo[i].pid,
         psinfo[i].tickets,
         psinfo[i].ticks,
         psinfo[i].state,
         psinfo[i].name);
 2bd:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 2c3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	c1 e0 03             	shl    $0x3,%eax
 2cb:	01 d0                	add    %edx,%eax
 2cd:	c1 e0 02             	shl    $0x2,%eax
 2d0:	83 c0 10             	add    $0x10,%eax
 2d3:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
         psinfo[i].state,
 2d6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2d9:	89 d0                	mov    %edx,%eax
 2db:	c1 e0 03             	shl    $0x3,%eax
 2de:	01 d0                	add    %edx,%eax
 2e0:	c1 e0 02             	shl    $0x2,%eax
 2e3:	8d 75 e8             	lea    -0x18(%ebp),%esi
 2e6:	01 f0                	add    %esi,%eax
 2e8:	2d e4 08 00 00       	sub    $0x8e4,%eax
 2ed:	0f b6 00             	movzbl (%eax),%eax
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
 2f0:	0f be f0             	movsbl %al,%esi
 2f3:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2f6:	89 d0                	mov    %edx,%eax
 2f8:	c1 e0 03             	shl    $0x3,%eax
 2fb:	01 d0                	add    %edx,%eax
 2fd:	c1 e0 02             	shl    $0x2,%eax
 300:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 303:	01 c8                	add    %ecx,%eax
 305:	2d f8 08 00 00       	sub    $0x8f8,%eax
 30a:	8b 18                	mov    (%eax),%ebx
 30c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 30f:	89 d0                	mov    %edx,%eax
 311:	c1 e0 03             	shl    $0x3,%eax
 314:	01 d0                	add    %edx,%eax
 316:	c1 e0 02             	shl    $0x2,%eax
 319:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 31c:	01 c8                	add    %ecx,%eax
 31e:	2d 00 09 00 00       	sub    $0x900,%eax
 323:	8b 08                	mov    (%eax),%ecx
 325:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 328:	89 d0                	mov    %edx,%eax
 32a:	c1 e0 03             	shl    $0x3,%eax
 32d:	01 d0                	add    %edx,%eax
 32f:	c1 e0 02             	shl    $0x2,%eax
 332:	8d 55 e8             	lea    -0x18(%ebp),%edx
 335:	01 d0                	add    %edx,%eax
 337:	2d fc 08 00 00       	sub    $0x8fc,%eax
 33c:	8b 00                	mov    (%eax),%eax
 33e:	89 7c 24 18          	mov    %edi,0x18(%esp)
 342:	89 74 24 14          	mov    %esi,0x14(%esp)
 346:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 34a:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 34e:	89 44 24 08          	mov    %eax,0x8(%esp)
 352:	c7 44 24 04 f4 08 00 	movl   $0x8f4,0x4(%esp)
 359:	00 
 35a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 361:	e8 a9 01 00 00       	call   50f <printf>
  for (i = 0; i < NPROC; i++)
 366:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 36a:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 36e:	0f 8e 28 ff ff ff    	jle    29c <ps+0x2c>
    }
  }
}
 374:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 37a:	5b                   	pop    %ebx
 37b:	5e                   	pop    %esi
 37c:	5f                   	pop    %edi
 37d:	5d                   	pop    %ebp
 37e:	c3                   	ret    

0000037f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37f:	b8 01 00 00 00       	mov    $0x1,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <exit>:
SYSCALL(exit)
 387:	b8 02 00 00 00       	mov    $0x2,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <wait>:
SYSCALL(wait)
 38f:	b8 03 00 00 00       	mov    $0x3,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <pipe>:
SYSCALL(pipe)
 397:	b8 04 00 00 00       	mov    $0x4,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <read>:
SYSCALL(read)
 39f:	b8 05 00 00 00       	mov    $0x5,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <write>:
SYSCALL(write)
 3a7:	b8 10 00 00 00       	mov    $0x10,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <close>:
SYSCALL(close)
 3af:	b8 15 00 00 00       	mov    $0x15,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <kill>:
SYSCALL(kill)
 3b7:	b8 06 00 00 00       	mov    $0x6,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <exec>:
SYSCALL(exec)
 3bf:	b8 07 00 00 00       	mov    $0x7,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <open>:
SYSCALL(open)
 3c7:	b8 0f 00 00 00       	mov    $0xf,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <mknod>:
SYSCALL(mknod)
 3cf:	b8 11 00 00 00       	mov    $0x11,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <unlink>:
SYSCALL(unlink)
 3d7:	b8 12 00 00 00       	mov    $0x12,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <fstat>:
SYSCALL(fstat)
 3df:	b8 08 00 00 00       	mov    $0x8,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <link>:
SYSCALL(link)
 3e7:	b8 13 00 00 00       	mov    $0x13,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <mkdir>:
SYSCALL(mkdir)
 3ef:	b8 14 00 00 00       	mov    $0x14,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <chdir>:
SYSCALL(chdir)
 3f7:	b8 09 00 00 00       	mov    $0x9,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <dup>:
SYSCALL(dup)
 3ff:	b8 0a 00 00 00       	mov    $0xa,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <getpid>:
SYSCALL(getpid)
 407:	b8 0b 00 00 00       	mov    $0xb,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <sbrk>:
SYSCALL(sbrk)
 40f:	b8 0c 00 00 00       	mov    $0xc,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <sleep>:
SYSCALL(sleep)
 417:	b8 0d 00 00 00       	mov    $0xd,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <uptime>:
SYSCALL(uptime)
 41f:	b8 0e 00 00 00       	mov    $0xe,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <getpinfo>:
SYSCALL(getpinfo)
 427:	b8 16 00 00 00       	mov    $0x16,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 42f:	55                   	push   %ebp
 430:	89 e5                	mov    %esp,%ebp
 432:	83 ec 18             	sub    $0x18,%esp
 435:	8b 45 0c             	mov    0xc(%ebp),%eax
 438:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 43b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 442:	00 
 443:	8d 45 f4             	lea    -0xc(%ebp),%eax
 446:	89 44 24 04          	mov    %eax,0x4(%esp)
 44a:	8b 45 08             	mov    0x8(%ebp),%eax
 44d:	89 04 24             	mov    %eax,(%esp)
 450:	e8 52 ff ff ff       	call   3a7 <write>
}
 455:	c9                   	leave  
 456:	c3                   	ret    

00000457 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 457:	55                   	push   %ebp
 458:	89 e5                	mov    %esp,%ebp
 45a:	56                   	push   %esi
 45b:	53                   	push   %ebx
 45c:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 45f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 466:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 46a:	74 17                	je     483 <printint+0x2c>
 46c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 470:	79 11                	jns    483 <printint+0x2c>
    neg = 1;
 472:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 479:	8b 45 0c             	mov    0xc(%ebp),%eax
 47c:	f7 d8                	neg    %eax
 47e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 481:	eb 06                	jmp    489 <printint+0x32>
  } else {
    x = xx;
 483:	8b 45 0c             	mov    0xc(%ebp),%eax
 486:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 489:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 490:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 493:	8d 41 01             	lea    0x1(%ecx),%eax
 496:	89 45 f4             	mov    %eax,-0xc(%ebp)
 499:	8b 5d 10             	mov    0x10(%ebp),%ebx
 49c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 49f:	ba 00 00 00 00       	mov    $0x0,%edx
 4a4:	f7 f3                	div    %ebx
 4a6:	89 d0                	mov    %edx,%eax
 4a8:	0f b6 80 7c 0b 00 00 	movzbl 0xb7c(%eax),%eax
 4af:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4b3:	8b 75 10             	mov    0x10(%ebp),%esi
 4b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4b9:	ba 00 00 00 00       	mov    $0x0,%edx
 4be:	f7 f6                	div    %esi
 4c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4c3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4c7:	75 c7                	jne    490 <printint+0x39>
  if(neg)
 4c9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4cd:	74 10                	je     4df <printint+0x88>
    buf[i++] = '-';
 4cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d2:	8d 50 01             	lea    0x1(%eax),%edx
 4d5:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4d8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4dd:	eb 1f                	jmp    4fe <printint+0xa7>
 4df:	eb 1d                	jmp    4fe <printint+0xa7>
    putc(fd, buf[i]);
 4e1:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e7:	01 d0                	add    %edx,%eax
 4e9:	0f b6 00             	movzbl (%eax),%eax
 4ec:	0f be c0             	movsbl %al,%eax
 4ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f3:	8b 45 08             	mov    0x8(%ebp),%eax
 4f6:	89 04 24             	mov    %eax,(%esp)
 4f9:	e8 31 ff ff ff       	call   42f <putc>
  while(--i >= 0)
 4fe:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 502:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 506:	79 d9                	jns    4e1 <printint+0x8a>
}
 508:	83 c4 30             	add    $0x30,%esp
 50b:	5b                   	pop    %ebx
 50c:	5e                   	pop    %esi
 50d:	5d                   	pop    %ebp
 50e:	c3                   	ret    

0000050f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 50f:	55                   	push   %ebp
 510:	89 e5                	mov    %esp,%ebp
 512:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 515:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 51c:	8d 45 0c             	lea    0xc(%ebp),%eax
 51f:	83 c0 04             	add    $0x4,%eax
 522:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 525:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 52c:	e9 7c 01 00 00       	jmp    6ad <printf+0x19e>
    c = fmt[i] & 0xff;
 531:	8b 55 0c             	mov    0xc(%ebp),%edx
 534:	8b 45 f0             	mov    -0x10(%ebp),%eax
 537:	01 d0                	add    %edx,%eax
 539:	0f b6 00             	movzbl (%eax),%eax
 53c:	0f be c0             	movsbl %al,%eax
 53f:	25 ff 00 00 00       	and    $0xff,%eax
 544:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 547:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 54b:	75 2c                	jne    579 <printf+0x6a>
      if(c == '%'){
 54d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 551:	75 0c                	jne    55f <printf+0x50>
        state = '%';
 553:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 55a:	e9 4a 01 00 00       	jmp    6a9 <printf+0x19a>
      } else {
        putc(fd, c);
 55f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 562:	0f be c0             	movsbl %al,%eax
 565:	89 44 24 04          	mov    %eax,0x4(%esp)
 569:	8b 45 08             	mov    0x8(%ebp),%eax
 56c:	89 04 24             	mov    %eax,(%esp)
 56f:	e8 bb fe ff ff       	call   42f <putc>
 574:	e9 30 01 00 00       	jmp    6a9 <printf+0x19a>
      }
    } else if(state == '%'){
 579:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 57d:	0f 85 26 01 00 00    	jne    6a9 <printf+0x19a>
      if(c == 'd'){
 583:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 587:	75 2d                	jne    5b6 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 589:	8b 45 e8             	mov    -0x18(%ebp),%eax
 58c:	8b 00                	mov    (%eax),%eax
 58e:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 595:	00 
 596:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 59d:	00 
 59e:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a2:	8b 45 08             	mov    0x8(%ebp),%eax
 5a5:	89 04 24             	mov    %eax,(%esp)
 5a8:	e8 aa fe ff ff       	call   457 <printint>
        ap++;
 5ad:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5b1:	e9 ec 00 00 00       	jmp    6a2 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5b6:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5ba:	74 06                	je     5c2 <printf+0xb3>
 5bc:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5c0:	75 2d                	jne    5ef <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5c5:	8b 00                	mov    (%eax),%eax
 5c7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5ce:	00 
 5cf:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5d6:	00 
 5d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5db:	8b 45 08             	mov    0x8(%ebp),%eax
 5de:	89 04 24             	mov    %eax,(%esp)
 5e1:	e8 71 fe ff ff       	call   457 <printint>
        ap++;
 5e6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ea:	e9 b3 00 00 00       	jmp    6a2 <printf+0x193>
      } else if(c == 's'){
 5ef:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5f3:	75 45                	jne    63a <printf+0x12b>
        s = (char*)*ap;
 5f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f8:	8b 00                	mov    (%eax),%eax
 5fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5fd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 601:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 605:	75 09                	jne    610 <printf+0x101>
          s = "(null)";
 607:	c7 45 f4 04 09 00 00 	movl   $0x904,-0xc(%ebp)
        while(*s != 0){
 60e:	eb 1e                	jmp    62e <printf+0x11f>
 610:	eb 1c                	jmp    62e <printf+0x11f>
          putc(fd, *s);
 612:	8b 45 f4             	mov    -0xc(%ebp),%eax
 615:	0f b6 00             	movzbl (%eax),%eax
 618:	0f be c0             	movsbl %al,%eax
 61b:	89 44 24 04          	mov    %eax,0x4(%esp)
 61f:	8b 45 08             	mov    0x8(%ebp),%eax
 622:	89 04 24             	mov    %eax,(%esp)
 625:	e8 05 fe ff ff       	call   42f <putc>
          s++;
 62a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 62e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 631:	0f b6 00             	movzbl (%eax),%eax
 634:	84 c0                	test   %al,%al
 636:	75 da                	jne    612 <printf+0x103>
 638:	eb 68                	jmp    6a2 <printf+0x193>
        }
      } else if(c == 'c'){
 63a:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 63e:	75 1d                	jne    65d <printf+0x14e>
        putc(fd, *ap);
 640:	8b 45 e8             	mov    -0x18(%ebp),%eax
 643:	8b 00                	mov    (%eax),%eax
 645:	0f be c0             	movsbl %al,%eax
 648:	89 44 24 04          	mov    %eax,0x4(%esp)
 64c:	8b 45 08             	mov    0x8(%ebp),%eax
 64f:	89 04 24             	mov    %eax,(%esp)
 652:	e8 d8 fd ff ff       	call   42f <putc>
        ap++;
 657:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 65b:	eb 45                	jmp    6a2 <printf+0x193>
      } else if(c == '%'){
 65d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 661:	75 17                	jne    67a <printf+0x16b>
        putc(fd, c);
 663:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 666:	0f be c0             	movsbl %al,%eax
 669:	89 44 24 04          	mov    %eax,0x4(%esp)
 66d:	8b 45 08             	mov    0x8(%ebp),%eax
 670:	89 04 24             	mov    %eax,(%esp)
 673:	e8 b7 fd ff ff       	call   42f <putc>
 678:	eb 28                	jmp    6a2 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 67a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 681:	00 
 682:	8b 45 08             	mov    0x8(%ebp),%eax
 685:	89 04 24             	mov    %eax,(%esp)
 688:	e8 a2 fd ff ff       	call   42f <putc>
        putc(fd, c);
 68d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 690:	0f be c0             	movsbl %al,%eax
 693:	89 44 24 04          	mov    %eax,0x4(%esp)
 697:	8b 45 08             	mov    0x8(%ebp),%eax
 69a:	89 04 24             	mov    %eax,(%esp)
 69d:	e8 8d fd ff ff       	call   42f <putc>
      }
      state = 0;
 6a2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6a9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6ad:	8b 55 0c             	mov    0xc(%ebp),%edx
 6b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6b3:	01 d0                	add    %edx,%eax
 6b5:	0f b6 00             	movzbl (%eax),%eax
 6b8:	84 c0                	test   %al,%al
 6ba:	0f 85 71 fe ff ff    	jne    531 <printf+0x22>
    }
  }
}
 6c0:	c9                   	leave  
 6c1:	c3                   	ret    

000006c2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6c2:	55                   	push   %ebp
 6c3:	89 e5                	mov    %esp,%ebp
 6c5:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6c8:	8b 45 08             	mov    0x8(%ebp),%eax
 6cb:	83 e8 08             	sub    $0x8,%eax
 6ce:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d1:	a1 98 0b 00 00       	mov    0xb98,%eax
 6d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6d9:	eb 24                	jmp    6ff <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6de:	8b 00                	mov    (%eax),%eax
 6e0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e3:	77 12                	ja     6f7 <free+0x35>
 6e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6eb:	77 24                	ja     711 <free+0x4f>
 6ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f0:	8b 00                	mov    (%eax),%eax
 6f2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6f5:	77 1a                	ja     711 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fa:	8b 00                	mov    (%eax),%eax
 6fc:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 702:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 705:	76 d4                	jbe    6db <free+0x19>
 707:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70a:	8b 00                	mov    (%eax),%eax
 70c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 70f:	76 ca                	jbe    6db <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 711:	8b 45 f8             	mov    -0x8(%ebp),%eax
 714:	8b 40 04             	mov    0x4(%eax),%eax
 717:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 71e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 721:	01 c2                	add    %eax,%edx
 723:	8b 45 fc             	mov    -0x4(%ebp),%eax
 726:	8b 00                	mov    (%eax),%eax
 728:	39 c2                	cmp    %eax,%edx
 72a:	75 24                	jne    750 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 72c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72f:	8b 50 04             	mov    0x4(%eax),%edx
 732:	8b 45 fc             	mov    -0x4(%ebp),%eax
 735:	8b 00                	mov    (%eax),%eax
 737:	8b 40 04             	mov    0x4(%eax),%eax
 73a:	01 c2                	add    %eax,%edx
 73c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 742:	8b 45 fc             	mov    -0x4(%ebp),%eax
 745:	8b 00                	mov    (%eax),%eax
 747:	8b 10                	mov    (%eax),%edx
 749:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74c:	89 10                	mov    %edx,(%eax)
 74e:	eb 0a                	jmp    75a <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 750:	8b 45 fc             	mov    -0x4(%ebp),%eax
 753:	8b 10                	mov    (%eax),%edx
 755:	8b 45 f8             	mov    -0x8(%ebp),%eax
 758:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 75a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75d:	8b 40 04             	mov    0x4(%eax),%eax
 760:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 767:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76a:	01 d0                	add    %edx,%eax
 76c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76f:	75 20                	jne    791 <free+0xcf>
    p->s.size += bp->s.size;
 771:	8b 45 fc             	mov    -0x4(%ebp),%eax
 774:	8b 50 04             	mov    0x4(%eax),%edx
 777:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77a:	8b 40 04             	mov    0x4(%eax),%eax
 77d:	01 c2                	add    %eax,%edx
 77f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 782:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 785:	8b 45 f8             	mov    -0x8(%ebp),%eax
 788:	8b 10                	mov    (%eax),%edx
 78a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78d:	89 10                	mov    %edx,(%eax)
 78f:	eb 08                	jmp    799 <free+0xd7>
  } else
    p->s.ptr = bp;
 791:	8b 45 fc             	mov    -0x4(%ebp),%eax
 794:	8b 55 f8             	mov    -0x8(%ebp),%edx
 797:	89 10                	mov    %edx,(%eax)
  freep = p;
 799:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79c:	a3 98 0b 00 00       	mov    %eax,0xb98
}
 7a1:	c9                   	leave  
 7a2:	c3                   	ret    

000007a3 <morecore>:

static Header*
morecore(uint nu)
{
 7a3:	55                   	push   %ebp
 7a4:	89 e5                	mov    %esp,%ebp
 7a6:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7a9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7b0:	77 07                	ja     7b9 <morecore+0x16>
    nu = 4096;
 7b2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
 7bc:	c1 e0 03             	shl    $0x3,%eax
 7bf:	89 04 24             	mov    %eax,(%esp)
 7c2:	e8 48 fc ff ff       	call   40f <sbrk>
 7c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7ca:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7ce:	75 07                	jne    7d7 <morecore+0x34>
    return 0;
 7d0:	b8 00 00 00 00       	mov    $0x0,%eax
 7d5:	eb 22                	jmp    7f9 <morecore+0x56>
  hp = (Header*)p;
 7d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7da:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e0:	8b 55 08             	mov    0x8(%ebp),%edx
 7e3:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e9:	83 c0 08             	add    $0x8,%eax
 7ec:	89 04 24             	mov    %eax,(%esp)
 7ef:	e8 ce fe ff ff       	call   6c2 <free>
  return freep;
 7f4:	a1 98 0b 00 00       	mov    0xb98,%eax
}
 7f9:	c9                   	leave  
 7fa:	c3                   	ret    

000007fb <malloc>:

void*
malloc(uint nbytes)
{
 7fb:	55                   	push   %ebp
 7fc:	89 e5                	mov    %esp,%ebp
 7fe:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 801:	8b 45 08             	mov    0x8(%ebp),%eax
 804:	83 c0 07             	add    $0x7,%eax
 807:	c1 e8 03             	shr    $0x3,%eax
 80a:	83 c0 01             	add    $0x1,%eax
 80d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 810:	a1 98 0b 00 00       	mov    0xb98,%eax
 815:	89 45 f0             	mov    %eax,-0x10(%ebp)
 818:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 81c:	75 23                	jne    841 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 81e:	c7 45 f0 90 0b 00 00 	movl   $0xb90,-0x10(%ebp)
 825:	8b 45 f0             	mov    -0x10(%ebp),%eax
 828:	a3 98 0b 00 00       	mov    %eax,0xb98
 82d:	a1 98 0b 00 00       	mov    0xb98,%eax
 832:	a3 90 0b 00 00       	mov    %eax,0xb90
    base.s.size = 0;
 837:	c7 05 94 0b 00 00 00 	movl   $0x0,0xb94
 83e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 841:	8b 45 f0             	mov    -0x10(%ebp),%eax
 844:	8b 00                	mov    (%eax),%eax
 846:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 849:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84c:	8b 40 04             	mov    0x4(%eax),%eax
 84f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 852:	72 4d                	jb     8a1 <malloc+0xa6>
      if(p->s.size == nunits)
 854:	8b 45 f4             	mov    -0xc(%ebp),%eax
 857:	8b 40 04             	mov    0x4(%eax),%eax
 85a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 85d:	75 0c                	jne    86b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 85f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 862:	8b 10                	mov    (%eax),%edx
 864:	8b 45 f0             	mov    -0x10(%ebp),%eax
 867:	89 10                	mov    %edx,(%eax)
 869:	eb 26                	jmp    891 <malloc+0x96>
      else {
        p->s.size -= nunits;
 86b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86e:	8b 40 04             	mov    0x4(%eax),%eax
 871:	2b 45 ec             	sub    -0x14(%ebp),%eax
 874:	89 c2                	mov    %eax,%edx
 876:	8b 45 f4             	mov    -0xc(%ebp),%eax
 879:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 87c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87f:	8b 40 04             	mov    0x4(%eax),%eax
 882:	c1 e0 03             	shl    $0x3,%eax
 885:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 888:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 88e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 891:	8b 45 f0             	mov    -0x10(%ebp),%eax
 894:	a3 98 0b 00 00       	mov    %eax,0xb98
      return (void*)(p + 1);
 899:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89c:	83 c0 08             	add    $0x8,%eax
 89f:	eb 38                	jmp    8d9 <malloc+0xde>
    }
    if(p == freep)
 8a1:	a1 98 0b 00 00       	mov    0xb98,%eax
 8a6:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8a9:	75 1b                	jne    8c6 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8ae:	89 04 24             	mov    %eax,(%esp)
 8b1:	e8 ed fe ff ff       	call   7a3 <morecore>
 8b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8bd:	75 07                	jne    8c6 <malloc+0xcb>
        return 0;
 8bf:	b8 00 00 00 00       	mov    $0x0,%eax
 8c4:	eb 13                	jmp    8d9 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cf:	8b 00                	mov    (%eax),%eax
 8d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8d4:	e9 70 ff ff ff       	jmp    849 <malloc+0x4e>
}
 8d9:	c9                   	leave  
 8da:	c3                   	ret    
