
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 84 03 00 00       	call   392 <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 0c 04 00 00       	call   42a <sleep>
  exit();
  1e:	e8 77 03 00 00       	call   39a <exit>

00000023 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  23:	55                   	push   %ebp
  24:	89 e5                	mov    %esp,%ebp
  26:	57                   	push   %edi
  27:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  28:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2b:	8b 55 10             	mov    0x10(%ebp),%edx
  2e:	8b 45 0c             	mov    0xc(%ebp),%eax
  31:	89 cb                	mov    %ecx,%ebx
  33:	89 df                	mov    %ebx,%edi
  35:	89 d1                	mov    %edx,%ecx
  37:	fc                   	cld    
  38:	f3 aa                	rep stos %al,%es:(%edi)
  3a:	89 ca                	mov    %ecx,%edx
  3c:	89 fb                	mov    %edi,%ebx
  3e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  41:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  44:	5b                   	pop    %ebx
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    

00000048 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  4e:	8b 45 08             	mov    0x8(%ebp),%eax
  51:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  54:	90                   	nop
  55:	8b 45 08             	mov    0x8(%ebp),%eax
  58:	8d 50 01             	lea    0x1(%eax),%edx
  5b:	89 55 08             	mov    %edx,0x8(%ebp)
  5e:	8b 55 0c             	mov    0xc(%ebp),%edx
  61:	8d 4a 01             	lea    0x1(%edx),%ecx
  64:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  67:	0f b6 12             	movzbl (%edx),%edx
  6a:	88 10                	mov    %dl,(%eax)
  6c:	0f b6 00             	movzbl (%eax),%eax
  6f:	84 c0                	test   %al,%al
  71:	75 e2                	jne    55 <strcpy+0xd>
    ;
  return os;
  73:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  76:	c9                   	leave  
  77:	c3                   	ret    

00000078 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  78:	55                   	push   %ebp
  79:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  7b:	eb 08                	jmp    85 <strcmp+0xd>
    p++, q++;
  7d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  81:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  85:	8b 45 08             	mov    0x8(%ebp),%eax
  88:	0f b6 00             	movzbl (%eax),%eax
  8b:	84 c0                	test   %al,%al
  8d:	74 10                	je     9f <strcmp+0x27>
  8f:	8b 45 08             	mov    0x8(%ebp),%eax
  92:	0f b6 10             	movzbl (%eax),%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 00             	movzbl (%eax),%eax
  9b:	38 c2                	cmp    %al,%dl
  9d:	74 de                	je     7d <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
  9f:	8b 45 08             	mov    0x8(%ebp),%eax
  a2:	0f b6 00             	movzbl (%eax),%eax
  a5:	0f b6 d0             	movzbl %al,%edx
  a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  ab:	0f b6 00             	movzbl (%eax),%eax
  ae:	0f b6 c0             	movzbl %al,%eax
  b1:	29 c2                	sub    %eax,%edx
  b3:	89 d0                	mov    %edx,%eax
}
  b5:	5d                   	pop    %ebp
  b6:	c3                   	ret    

000000b7 <strlen>:

uint
strlen(const char *s)
{
  b7:	55                   	push   %ebp
  b8:	89 e5                	mov    %esp,%ebp
  ba:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c4:	eb 04                	jmp    ca <strlen+0x13>
  c6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  ca:	8b 55 fc             	mov    -0x4(%ebp),%edx
  cd:	8b 45 08             	mov    0x8(%ebp),%eax
  d0:	01 d0                	add    %edx,%eax
  d2:	0f b6 00             	movzbl (%eax),%eax
  d5:	84 c0                	test   %al,%al
  d7:	75 ed                	jne    c6 <strlen+0xf>
    ;
  return n;
  d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  dc:	c9                   	leave  
  dd:	c3                   	ret    

000000de <memset>:

void*
memset(void *dst, int c, uint n)
{
  de:	55                   	push   %ebp
  df:	89 e5                	mov    %esp,%ebp
  e1:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  e4:	8b 45 10             	mov    0x10(%ebp),%eax
  e7:	89 44 24 08          	mov    %eax,0x8(%esp)
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  f2:	8b 45 08             	mov    0x8(%ebp),%eax
  f5:	89 04 24             	mov    %eax,(%esp)
  f8:	e8 26 ff ff ff       	call   23 <stosb>
  return dst;
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 100:	c9                   	leave  
 101:	c3                   	ret    

00000102 <strchr>:

char*
strchr(const char *s, char c)
{
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
 105:	83 ec 04             	sub    $0x4,%esp
 108:	8b 45 0c             	mov    0xc(%ebp),%eax
 10b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10e:	eb 14                	jmp    124 <strchr+0x22>
    if(*s == c)
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	0f b6 00             	movzbl (%eax),%eax
 116:	3a 45 fc             	cmp    -0x4(%ebp),%al
 119:	75 05                	jne    120 <strchr+0x1e>
      return (char*)s;
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	eb 13                	jmp    133 <strchr+0x31>
  for(; *s; s++)
 120:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	0f b6 00             	movzbl (%eax),%eax
 12a:	84 c0                	test   %al,%al
 12c:	75 e2                	jne    110 <strchr+0xe>
  return 0;
 12e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 133:	c9                   	leave  
 134:	c3                   	ret    

00000135 <gets>:

char*
gets(char *buf, int max)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 142:	eb 4c                	jmp    190 <gets+0x5b>
    cc = read(0, &c, 1);
 144:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 14b:	00 
 14c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 14f:	89 44 24 04          	mov    %eax,0x4(%esp)
 153:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 15a:	e8 53 02 00 00       	call   3b2 <read>
 15f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 162:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 166:	7f 02                	jg     16a <gets+0x35>
      break;
 168:	eb 31                	jmp    19b <gets+0x66>
    buf[i++] = c;
 16a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 16d:	8d 50 01             	lea    0x1(%eax),%edx
 170:	89 55 f4             	mov    %edx,-0xc(%ebp)
 173:	89 c2                	mov    %eax,%edx
 175:	8b 45 08             	mov    0x8(%ebp),%eax
 178:	01 c2                	add    %eax,%edx
 17a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 180:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 184:	3c 0a                	cmp    $0xa,%al
 186:	74 13                	je     19b <gets+0x66>
 188:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18c:	3c 0d                	cmp    $0xd,%al
 18e:	74 0b                	je     19b <gets+0x66>
  for(i=0; i+1 < max; ){
 190:	8b 45 f4             	mov    -0xc(%ebp),%eax
 193:	83 c0 01             	add    $0x1,%eax
 196:	3b 45 0c             	cmp    0xc(%ebp),%eax
 199:	7c a9                	jl     144 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 19b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 19e:	8b 45 08             	mov    0x8(%ebp),%eax
 1a1:	01 d0                	add    %edx,%eax
 1a3:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a9:	c9                   	leave  
 1aa:	c3                   	ret    

000001ab <stat>:

int
stat(const char *n, struct stat *st)
{
 1ab:	55                   	push   %ebp
 1ac:	89 e5                	mov    %esp,%ebp
 1ae:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b8:	00 
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	89 04 24             	mov    %eax,(%esp)
 1bf:	e8 16 02 00 00       	call   3da <open>
 1c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1cb:	79 07                	jns    1d4 <stat+0x29>
    return -1;
 1cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d2:	eb 23                	jmp    1f7 <stat+0x4c>
  r = fstat(fd, st);
 1d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1de:	89 04 24             	mov    %eax,(%esp)
 1e1:	e8 0c 02 00 00       	call   3f2 <fstat>
 1e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ec:	89 04 24             	mov    %eax,(%esp)
 1ef:	e8 ce 01 00 00       	call   3c2 <close>
  return r;
 1f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1f7:	c9                   	leave  
 1f8:	c3                   	ret    

000001f9 <atoi>:

int
atoi(const char *s)
{
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 206:	eb 25                	jmp    22d <atoi+0x34>
    n = n*10 + *s++ - '0';
 208:	8b 55 fc             	mov    -0x4(%ebp),%edx
 20b:	89 d0                	mov    %edx,%eax
 20d:	c1 e0 02             	shl    $0x2,%eax
 210:	01 d0                	add    %edx,%eax
 212:	01 c0                	add    %eax,%eax
 214:	89 c1                	mov    %eax,%ecx
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	8d 50 01             	lea    0x1(%eax),%edx
 21c:	89 55 08             	mov    %edx,0x8(%ebp)
 21f:	0f b6 00             	movzbl (%eax),%eax
 222:	0f be c0             	movsbl %al,%eax
 225:	01 c8                	add    %ecx,%eax
 227:	83 e8 30             	sub    $0x30,%eax
 22a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 22d:	8b 45 08             	mov    0x8(%ebp),%eax
 230:	0f b6 00             	movzbl (%eax),%eax
 233:	3c 2f                	cmp    $0x2f,%al
 235:	7e 0a                	jle    241 <atoi+0x48>
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 00             	movzbl (%eax),%eax
 23d:	3c 39                	cmp    $0x39,%al
 23f:	7e c7                	jle    208 <atoi+0xf>
  return n;
 241:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 244:	c9                   	leave  
 245:	c3                   	ret    

00000246 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 246:	55                   	push   %ebp
 247:	89 e5                	mov    %esp,%ebp
 249:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 252:	8b 45 0c             	mov    0xc(%ebp),%eax
 255:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 258:	eb 17                	jmp    271 <memmove+0x2b>
    *dst++ = *src++;
 25a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 25d:	8d 50 01             	lea    0x1(%eax),%edx
 260:	89 55 fc             	mov    %edx,-0x4(%ebp)
 263:	8b 55 f8             	mov    -0x8(%ebp),%edx
 266:	8d 4a 01             	lea    0x1(%edx),%ecx
 269:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 26c:	0f b6 12             	movzbl (%edx),%edx
 26f:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 271:	8b 45 10             	mov    0x10(%ebp),%eax
 274:	8d 50 ff             	lea    -0x1(%eax),%edx
 277:	89 55 10             	mov    %edx,0x10(%ebp)
 27a:	85 c0                	test   %eax,%eax
 27c:	7f dc                	jg     25a <memmove+0x14>
  return vdst;
 27e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 281:	c9                   	leave  
 282:	c3                   	ret    

00000283 <ps>:

void
ps(void)
{
 283:	55                   	push   %ebp
 284:	89 e5                	mov    %esp,%ebp
 286:	57                   	push   %edi
 287:	56                   	push   %esi
 288:	53                   	push   %ebx
 289:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable psinfo;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 28f:	c7 44 24 04 ee 08 00 	movl   $0x8ee,0x4(%esp)
 296:	00 
 297:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 29e:	e8 7f 02 00 00       	call   522 <printf>
  int i;
  for (i = 0; i < NPROC; i++)
 2a3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 2aa:	e9 ce 00 00 00       	jmp    37d <ps+0xfa>
  {
    if (psinfo[i].inuse)
 2af:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2b2:	89 d0                	mov    %edx,%eax
 2b4:	c1 e0 03             	shl    $0x3,%eax
 2b7:	01 d0                	add    %edx,%eax
 2b9:	c1 e0 02             	shl    $0x2,%eax
 2bc:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 2bf:	01 d8                	add    %ebx,%eax
 2c1:	2d 04 09 00 00       	sub    $0x904,%eax
 2c6:	8b 00                	mov    (%eax),%eax
 2c8:	85 c0                	test   %eax,%eax
 2ca:	0f 84 a9 00 00 00    	je     379 <ps+0xf6>
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
         psinfo[i].pid,
         psinfo[i].tickets,
         psinfo[i].ticks,
         psinfo[i].state,
         psinfo[i].name);
 2d0:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 2d6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2d9:	89 d0                	mov    %edx,%eax
 2db:	c1 e0 03             	shl    $0x3,%eax
 2de:	01 d0                	add    %edx,%eax
 2e0:	c1 e0 02             	shl    $0x2,%eax
 2e3:	83 c0 10             	add    $0x10,%eax
 2e6:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
         psinfo[i].state,
 2e9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 2ec:	89 d0                	mov    %edx,%eax
 2ee:	c1 e0 03             	shl    $0x3,%eax
 2f1:	01 d0                	add    %edx,%eax
 2f3:	c1 e0 02             	shl    $0x2,%eax
 2f6:	8d 75 e8             	lea    -0x18(%ebp),%esi
 2f9:	01 f0                	add    %esi,%eax
 2fb:	2d e4 08 00 00       	sub    $0x8e4,%eax
 300:	0f b6 00             	movzbl (%eax),%eax
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
 303:	0f be f0             	movsbl %al,%esi
 306:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 309:	89 d0                	mov    %edx,%eax
 30b:	c1 e0 03             	shl    $0x3,%eax
 30e:	01 d0                	add    %edx,%eax
 310:	c1 e0 02             	shl    $0x2,%eax
 313:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 316:	01 c8                	add    %ecx,%eax
 318:	2d f8 08 00 00       	sub    $0x8f8,%eax
 31d:	8b 18                	mov    (%eax),%ebx
 31f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 322:	89 d0                	mov    %edx,%eax
 324:	c1 e0 03             	shl    $0x3,%eax
 327:	01 d0                	add    %edx,%eax
 329:	c1 e0 02             	shl    $0x2,%eax
 32c:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 32f:	01 c8                	add    %ecx,%eax
 331:	2d 00 09 00 00       	sub    $0x900,%eax
 336:	8b 08                	mov    (%eax),%ecx
 338:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 33b:	89 d0                	mov    %edx,%eax
 33d:	c1 e0 03             	shl    $0x3,%eax
 340:	01 d0                	add    %edx,%eax
 342:	c1 e0 02             	shl    $0x2,%eax
 345:	8d 55 e8             	lea    -0x18(%ebp),%edx
 348:	01 d0                	add    %edx,%eax
 34a:	2d fc 08 00 00       	sub    $0x8fc,%eax
 34f:	8b 00                	mov    (%eax),%eax
 351:	89 7c 24 18          	mov    %edi,0x18(%esp)
 355:	89 74 24 14          	mov    %esi,0x14(%esp)
 359:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 35d:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 361:	89 44 24 08          	mov    %eax,0x8(%esp)
 365:	c7 44 24 04 07 09 00 	movl   $0x907,0x4(%esp)
 36c:	00 
 36d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 374:	e8 a9 01 00 00       	call   522 <printf>
  for (i = 0; i < NPROC; i++)
 379:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 37d:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 381:	0f 8e 28 ff ff ff    	jle    2af <ps+0x2c>
    }
  }
}
 387:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 38d:	5b                   	pop    %ebx
 38e:	5e                   	pop    %esi
 38f:	5f                   	pop    %edi
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 392:	b8 01 00 00 00       	mov    $0x1,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <exit>:
SYSCALL(exit)
 39a:	b8 02 00 00 00       	mov    $0x2,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <wait>:
SYSCALL(wait)
 3a2:	b8 03 00 00 00       	mov    $0x3,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <pipe>:
SYSCALL(pipe)
 3aa:	b8 04 00 00 00       	mov    $0x4,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <read>:
SYSCALL(read)
 3b2:	b8 05 00 00 00       	mov    $0x5,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <write>:
SYSCALL(write)
 3ba:	b8 10 00 00 00       	mov    $0x10,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <close>:
SYSCALL(close)
 3c2:	b8 15 00 00 00       	mov    $0x15,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <kill>:
SYSCALL(kill)
 3ca:	b8 06 00 00 00       	mov    $0x6,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <exec>:
SYSCALL(exec)
 3d2:	b8 07 00 00 00       	mov    $0x7,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <open>:
SYSCALL(open)
 3da:	b8 0f 00 00 00       	mov    $0xf,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <mknod>:
SYSCALL(mknod)
 3e2:	b8 11 00 00 00       	mov    $0x11,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <unlink>:
SYSCALL(unlink)
 3ea:	b8 12 00 00 00       	mov    $0x12,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <fstat>:
SYSCALL(fstat)
 3f2:	b8 08 00 00 00       	mov    $0x8,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <link>:
SYSCALL(link)
 3fa:	b8 13 00 00 00       	mov    $0x13,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <mkdir>:
SYSCALL(mkdir)
 402:	b8 14 00 00 00       	mov    $0x14,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <chdir>:
SYSCALL(chdir)
 40a:	b8 09 00 00 00       	mov    $0x9,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <dup>:
SYSCALL(dup)
 412:	b8 0a 00 00 00       	mov    $0xa,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <getpid>:
SYSCALL(getpid)
 41a:	b8 0b 00 00 00       	mov    $0xb,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <sbrk>:
SYSCALL(sbrk)
 422:	b8 0c 00 00 00       	mov    $0xc,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <sleep>:
SYSCALL(sleep)
 42a:	b8 0d 00 00 00       	mov    $0xd,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <uptime>:
SYSCALL(uptime)
 432:	b8 0e 00 00 00       	mov    $0xe,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <getpinfo>:
SYSCALL(getpinfo)
 43a:	b8 16 00 00 00       	mov    $0x16,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 442:	55                   	push   %ebp
 443:	89 e5                	mov    %esp,%ebp
 445:	83 ec 18             	sub    $0x18,%esp
 448:	8b 45 0c             	mov    0xc(%ebp),%eax
 44b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 44e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 455:	00 
 456:	8d 45 f4             	lea    -0xc(%ebp),%eax
 459:	89 44 24 04          	mov    %eax,0x4(%esp)
 45d:	8b 45 08             	mov    0x8(%ebp),%eax
 460:	89 04 24             	mov    %eax,(%esp)
 463:	e8 52 ff ff ff       	call   3ba <write>
}
 468:	c9                   	leave  
 469:	c3                   	ret    

0000046a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 46a:	55                   	push   %ebp
 46b:	89 e5                	mov    %esp,%ebp
 46d:	56                   	push   %esi
 46e:	53                   	push   %ebx
 46f:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 472:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 479:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 47d:	74 17                	je     496 <printint+0x2c>
 47f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 483:	79 11                	jns    496 <printint+0x2c>
    neg = 1;
 485:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 48c:	8b 45 0c             	mov    0xc(%ebp),%eax
 48f:	f7 d8                	neg    %eax
 491:	89 45 ec             	mov    %eax,-0x14(%ebp)
 494:	eb 06                	jmp    49c <printint+0x32>
  } else {
    x = xx;
 496:	8b 45 0c             	mov    0xc(%ebp),%eax
 499:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 49c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4a3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4a6:	8d 41 01             	lea    0x1(%ecx),%eax
 4a9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4ac:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4af:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4b2:	ba 00 00 00 00       	mov    $0x0,%edx
 4b7:	f7 f3                	div    %ebx
 4b9:	89 d0                	mov    %edx,%eax
 4bb:	0f b6 80 90 0b 00 00 	movzbl 0xb90(%eax),%eax
 4c2:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4c6:	8b 75 10             	mov    0x10(%ebp),%esi
 4c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4cc:	ba 00 00 00 00       	mov    $0x0,%edx
 4d1:	f7 f6                	div    %esi
 4d3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4d6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4da:	75 c7                	jne    4a3 <printint+0x39>
  if(neg)
 4dc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4e0:	74 10                	je     4f2 <printint+0x88>
    buf[i++] = '-';
 4e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e5:	8d 50 01             	lea    0x1(%eax),%edx
 4e8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4eb:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4f0:	eb 1f                	jmp    511 <printint+0xa7>
 4f2:	eb 1d                	jmp    511 <printint+0xa7>
    putc(fd, buf[i]);
 4f4:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4fa:	01 d0                	add    %edx,%eax
 4fc:	0f b6 00             	movzbl (%eax),%eax
 4ff:	0f be c0             	movsbl %al,%eax
 502:	89 44 24 04          	mov    %eax,0x4(%esp)
 506:	8b 45 08             	mov    0x8(%ebp),%eax
 509:	89 04 24             	mov    %eax,(%esp)
 50c:	e8 31 ff ff ff       	call   442 <putc>
  while(--i >= 0)
 511:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 515:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 519:	79 d9                	jns    4f4 <printint+0x8a>
}
 51b:	83 c4 30             	add    $0x30,%esp
 51e:	5b                   	pop    %ebx
 51f:	5e                   	pop    %esi
 520:	5d                   	pop    %ebp
 521:	c3                   	ret    

00000522 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 522:	55                   	push   %ebp
 523:	89 e5                	mov    %esp,%ebp
 525:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 528:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 52f:	8d 45 0c             	lea    0xc(%ebp),%eax
 532:	83 c0 04             	add    $0x4,%eax
 535:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 538:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 53f:	e9 7c 01 00 00       	jmp    6c0 <printf+0x19e>
    c = fmt[i] & 0xff;
 544:	8b 55 0c             	mov    0xc(%ebp),%edx
 547:	8b 45 f0             	mov    -0x10(%ebp),%eax
 54a:	01 d0                	add    %edx,%eax
 54c:	0f b6 00             	movzbl (%eax),%eax
 54f:	0f be c0             	movsbl %al,%eax
 552:	25 ff 00 00 00       	and    $0xff,%eax
 557:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 55a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 55e:	75 2c                	jne    58c <printf+0x6a>
      if(c == '%'){
 560:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 564:	75 0c                	jne    572 <printf+0x50>
        state = '%';
 566:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 56d:	e9 4a 01 00 00       	jmp    6bc <printf+0x19a>
      } else {
        putc(fd, c);
 572:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 575:	0f be c0             	movsbl %al,%eax
 578:	89 44 24 04          	mov    %eax,0x4(%esp)
 57c:	8b 45 08             	mov    0x8(%ebp),%eax
 57f:	89 04 24             	mov    %eax,(%esp)
 582:	e8 bb fe ff ff       	call   442 <putc>
 587:	e9 30 01 00 00       	jmp    6bc <printf+0x19a>
      }
    } else if(state == '%'){
 58c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 590:	0f 85 26 01 00 00    	jne    6bc <printf+0x19a>
      if(c == 'd'){
 596:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 59a:	75 2d                	jne    5c9 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 59c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 59f:	8b 00                	mov    (%eax),%eax
 5a1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5a8:	00 
 5a9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5b0:	00 
 5b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b5:	8b 45 08             	mov    0x8(%ebp),%eax
 5b8:	89 04 24             	mov    %eax,(%esp)
 5bb:	e8 aa fe ff ff       	call   46a <printint>
        ap++;
 5c0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c4:	e9 ec 00 00 00       	jmp    6b5 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5c9:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5cd:	74 06                	je     5d5 <printf+0xb3>
 5cf:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5d3:	75 2d                	jne    602 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d8:	8b 00                	mov    (%eax),%eax
 5da:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5e1:	00 
 5e2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5e9:	00 
 5ea:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ee:	8b 45 08             	mov    0x8(%ebp),%eax
 5f1:	89 04 24             	mov    %eax,(%esp)
 5f4:	e8 71 fe ff ff       	call   46a <printint>
        ap++;
 5f9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5fd:	e9 b3 00 00 00       	jmp    6b5 <printf+0x193>
      } else if(c == 's'){
 602:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 606:	75 45                	jne    64d <printf+0x12b>
        s = (char*)*ap;
 608:	8b 45 e8             	mov    -0x18(%ebp),%eax
 60b:	8b 00                	mov    (%eax),%eax
 60d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 610:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 614:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 618:	75 09                	jne    623 <printf+0x101>
          s = "(null)";
 61a:	c7 45 f4 17 09 00 00 	movl   $0x917,-0xc(%ebp)
        while(*s != 0){
 621:	eb 1e                	jmp    641 <printf+0x11f>
 623:	eb 1c                	jmp    641 <printf+0x11f>
          putc(fd, *s);
 625:	8b 45 f4             	mov    -0xc(%ebp),%eax
 628:	0f b6 00             	movzbl (%eax),%eax
 62b:	0f be c0             	movsbl %al,%eax
 62e:	89 44 24 04          	mov    %eax,0x4(%esp)
 632:	8b 45 08             	mov    0x8(%ebp),%eax
 635:	89 04 24             	mov    %eax,(%esp)
 638:	e8 05 fe ff ff       	call   442 <putc>
          s++;
 63d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 641:	8b 45 f4             	mov    -0xc(%ebp),%eax
 644:	0f b6 00             	movzbl (%eax),%eax
 647:	84 c0                	test   %al,%al
 649:	75 da                	jne    625 <printf+0x103>
 64b:	eb 68                	jmp    6b5 <printf+0x193>
        }
      } else if(c == 'c'){
 64d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 651:	75 1d                	jne    670 <printf+0x14e>
        putc(fd, *ap);
 653:	8b 45 e8             	mov    -0x18(%ebp),%eax
 656:	8b 00                	mov    (%eax),%eax
 658:	0f be c0             	movsbl %al,%eax
 65b:	89 44 24 04          	mov    %eax,0x4(%esp)
 65f:	8b 45 08             	mov    0x8(%ebp),%eax
 662:	89 04 24             	mov    %eax,(%esp)
 665:	e8 d8 fd ff ff       	call   442 <putc>
        ap++;
 66a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 66e:	eb 45                	jmp    6b5 <printf+0x193>
      } else if(c == '%'){
 670:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 674:	75 17                	jne    68d <printf+0x16b>
        putc(fd, c);
 676:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 679:	0f be c0             	movsbl %al,%eax
 67c:	89 44 24 04          	mov    %eax,0x4(%esp)
 680:	8b 45 08             	mov    0x8(%ebp),%eax
 683:	89 04 24             	mov    %eax,(%esp)
 686:	e8 b7 fd ff ff       	call   442 <putc>
 68b:	eb 28                	jmp    6b5 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 68d:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 694:	00 
 695:	8b 45 08             	mov    0x8(%ebp),%eax
 698:	89 04 24             	mov    %eax,(%esp)
 69b:	e8 a2 fd ff ff       	call   442 <putc>
        putc(fd, c);
 6a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6a3:	0f be c0             	movsbl %al,%eax
 6a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6aa:	8b 45 08             	mov    0x8(%ebp),%eax
 6ad:	89 04 24             	mov    %eax,(%esp)
 6b0:	e8 8d fd ff ff       	call   442 <putc>
      }
      state = 0;
 6b5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 6bc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6c0:	8b 55 0c             	mov    0xc(%ebp),%edx
 6c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6c6:	01 d0                	add    %edx,%eax
 6c8:	0f b6 00             	movzbl (%eax),%eax
 6cb:	84 c0                	test   %al,%al
 6cd:	0f 85 71 fe ff ff    	jne    544 <printf+0x22>
    }
  }
}
 6d3:	c9                   	leave  
 6d4:	c3                   	ret    

000006d5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d5:	55                   	push   %ebp
 6d6:	89 e5                	mov    %esp,%ebp
 6d8:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6db:	8b 45 08             	mov    0x8(%ebp),%eax
 6de:	83 e8 08             	sub    $0x8,%eax
 6e1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e4:	a1 ac 0b 00 00       	mov    0xbac,%eax
 6e9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6ec:	eb 24                	jmp    712 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f1:	8b 00                	mov    (%eax),%eax
 6f3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f6:	77 12                	ja     70a <free+0x35>
 6f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6fe:	77 24                	ja     724 <free+0x4f>
 700:	8b 45 fc             	mov    -0x4(%ebp),%eax
 703:	8b 00                	mov    (%eax),%eax
 705:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 708:	77 1a                	ja     724 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70d:	8b 00                	mov    (%eax),%eax
 70f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 712:	8b 45 f8             	mov    -0x8(%ebp),%eax
 715:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 718:	76 d4                	jbe    6ee <free+0x19>
 71a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71d:	8b 00                	mov    (%eax),%eax
 71f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 722:	76 ca                	jbe    6ee <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 724:	8b 45 f8             	mov    -0x8(%ebp),%eax
 727:	8b 40 04             	mov    0x4(%eax),%eax
 72a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 731:	8b 45 f8             	mov    -0x8(%ebp),%eax
 734:	01 c2                	add    %eax,%edx
 736:	8b 45 fc             	mov    -0x4(%ebp),%eax
 739:	8b 00                	mov    (%eax),%eax
 73b:	39 c2                	cmp    %eax,%edx
 73d:	75 24                	jne    763 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 73f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 742:	8b 50 04             	mov    0x4(%eax),%edx
 745:	8b 45 fc             	mov    -0x4(%ebp),%eax
 748:	8b 00                	mov    (%eax),%eax
 74a:	8b 40 04             	mov    0x4(%eax),%eax
 74d:	01 c2                	add    %eax,%edx
 74f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 752:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 755:	8b 45 fc             	mov    -0x4(%ebp),%eax
 758:	8b 00                	mov    (%eax),%eax
 75a:	8b 10                	mov    (%eax),%edx
 75c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75f:	89 10                	mov    %edx,(%eax)
 761:	eb 0a                	jmp    76d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 763:	8b 45 fc             	mov    -0x4(%ebp),%eax
 766:	8b 10                	mov    (%eax),%edx
 768:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 76d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 770:	8b 40 04             	mov    0x4(%eax),%eax
 773:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 77a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77d:	01 d0                	add    %edx,%eax
 77f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 782:	75 20                	jne    7a4 <free+0xcf>
    p->s.size += bp->s.size;
 784:	8b 45 fc             	mov    -0x4(%ebp),%eax
 787:	8b 50 04             	mov    0x4(%eax),%edx
 78a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78d:	8b 40 04             	mov    0x4(%eax),%eax
 790:	01 c2                	add    %eax,%edx
 792:	8b 45 fc             	mov    -0x4(%ebp),%eax
 795:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 798:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79b:	8b 10                	mov    (%eax),%edx
 79d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a0:	89 10                	mov    %edx,(%eax)
 7a2:	eb 08                	jmp    7ac <free+0xd7>
  } else
    p->s.ptr = bp;
 7a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7aa:	89 10                	mov    %edx,(%eax)
  freep = p;
 7ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7af:	a3 ac 0b 00 00       	mov    %eax,0xbac
}
 7b4:	c9                   	leave  
 7b5:	c3                   	ret    

000007b6 <morecore>:

static Header*
morecore(uint nu)
{
 7b6:	55                   	push   %ebp
 7b7:	89 e5                	mov    %esp,%ebp
 7b9:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7bc:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7c3:	77 07                	ja     7cc <morecore+0x16>
    nu = 4096;
 7c5:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7cc:	8b 45 08             	mov    0x8(%ebp),%eax
 7cf:	c1 e0 03             	shl    $0x3,%eax
 7d2:	89 04 24             	mov    %eax,(%esp)
 7d5:	e8 48 fc ff ff       	call   422 <sbrk>
 7da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7dd:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7e1:	75 07                	jne    7ea <morecore+0x34>
    return 0;
 7e3:	b8 00 00 00 00       	mov    $0x0,%eax
 7e8:	eb 22                	jmp    80c <morecore+0x56>
  hp = (Header*)p;
 7ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f3:	8b 55 08             	mov    0x8(%ebp),%edx
 7f6:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fc:	83 c0 08             	add    $0x8,%eax
 7ff:	89 04 24             	mov    %eax,(%esp)
 802:	e8 ce fe ff ff       	call   6d5 <free>
  return freep;
 807:	a1 ac 0b 00 00       	mov    0xbac,%eax
}
 80c:	c9                   	leave  
 80d:	c3                   	ret    

0000080e <malloc>:

void*
malloc(uint nbytes)
{
 80e:	55                   	push   %ebp
 80f:	89 e5                	mov    %esp,%ebp
 811:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 814:	8b 45 08             	mov    0x8(%ebp),%eax
 817:	83 c0 07             	add    $0x7,%eax
 81a:	c1 e8 03             	shr    $0x3,%eax
 81d:	83 c0 01             	add    $0x1,%eax
 820:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 823:	a1 ac 0b 00 00       	mov    0xbac,%eax
 828:	89 45 f0             	mov    %eax,-0x10(%ebp)
 82b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 82f:	75 23                	jne    854 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 831:	c7 45 f0 a4 0b 00 00 	movl   $0xba4,-0x10(%ebp)
 838:	8b 45 f0             	mov    -0x10(%ebp),%eax
 83b:	a3 ac 0b 00 00       	mov    %eax,0xbac
 840:	a1 ac 0b 00 00       	mov    0xbac,%eax
 845:	a3 a4 0b 00 00       	mov    %eax,0xba4
    base.s.size = 0;
 84a:	c7 05 a8 0b 00 00 00 	movl   $0x0,0xba8
 851:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 854:	8b 45 f0             	mov    -0x10(%ebp),%eax
 857:	8b 00                	mov    (%eax),%eax
 859:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 85c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85f:	8b 40 04             	mov    0x4(%eax),%eax
 862:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 865:	72 4d                	jb     8b4 <malloc+0xa6>
      if(p->s.size == nunits)
 867:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86a:	8b 40 04             	mov    0x4(%eax),%eax
 86d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 870:	75 0c                	jne    87e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 872:	8b 45 f4             	mov    -0xc(%ebp),%eax
 875:	8b 10                	mov    (%eax),%edx
 877:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87a:	89 10                	mov    %edx,(%eax)
 87c:	eb 26                	jmp    8a4 <malloc+0x96>
      else {
        p->s.size -= nunits;
 87e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 881:	8b 40 04             	mov    0x4(%eax),%eax
 884:	2b 45 ec             	sub    -0x14(%ebp),%eax
 887:	89 c2                	mov    %eax,%edx
 889:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 88f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 892:	8b 40 04             	mov    0x4(%eax),%eax
 895:	c1 e0 03             	shl    $0x3,%eax
 898:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 89b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8a1:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a7:	a3 ac 0b 00 00       	mov    %eax,0xbac
      return (void*)(p + 1);
 8ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8af:	83 c0 08             	add    $0x8,%eax
 8b2:	eb 38                	jmp    8ec <malloc+0xde>
    }
    if(p == freep)
 8b4:	a1 ac 0b 00 00       	mov    0xbac,%eax
 8b9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8bc:	75 1b                	jne    8d9 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8be:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8c1:	89 04 24             	mov    %eax,(%esp)
 8c4:	e8 ed fe ff ff       	call   7b6 <morecore>
 8c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8cc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8d0:	75 07                	jne    8d9 <malloc+0xcb>
        return 0;
 8d2:	b8 00 00 00 00       	mov    $0x0,%eax
 8d7:	eb 13                	jmp    8ec <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e2:	8b 00                	mov    (%eax),%eax
 8e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 8e7:	e9 70 ff ff ff       	jmp    85c <malloc+0x4e>
}
 8ec:	c9                   	leave  
 8ed:	c3                   	ret    
