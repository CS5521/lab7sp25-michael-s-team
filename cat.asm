
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
   6:	eb 39                	jmp    41 <cat+0x41>
    if (write(1, buf, n) != n) {
   8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   b:	89 44 24 08          	mov    %eax,0x8(%esp)
   f:	c7 44 24 04 40 0d 00 	movl   $0xd40,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 af 04 00 00       	call   4d2 <write>
  23:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  26:	74 19                	je     41 <cat+0x41>
      printf(1, "cat: write error\n");
  28:	c7 44 24 04 06 0a 00 	movl   $0xa06,0x4(%esp)
  2f:	00 
  30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  37:	e8 fe 05 00 00       	call   63a <printf>
      exit();
  3c:	e8 71 04 00 00       	call   4b2 <exit>
  while((n = read(fd, buf, sizeof(buf))) > 0) {
  41:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  48:	00 
  49:	c7 44 24 04 40 0d 00 	movl   $0xd40,0x4(%esp)
  50:	00 
  51:	8b 45 08             	mov    0x8(%ebp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 6e 04 00 00       	call   4ca <read>
  5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  5f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  63:	7f a3                	jg     8 <cat+0x8>
    }
  }
  if(n < 0){
  65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  69:	79 19                	jns    84 <cat+0x84>
    printf(1, "cat: read error\n");
  6b:	c7 44 24 04 18 0a 00 	movl   $0xa18,0x4(%esp)
  72:	00 
  73:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7a:	e8 bb 05 00 00       	call   63a <printf>
    exit();
  7f:	e8 2e 04 00 00       	call   4b2 <exit>
  }
}
  84:	c9                   	leave  
  85:	c3                   	ret    

00000086 <main>:

int
main(int argc, char *argv[])
{
  86:	55                   	push   %ebp
  87:	89 e5                	mov    %esp,%ebp
  89:	83 e4 f0             	and    $0xfffffff0,%esp
  8c:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
  8f:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  93:	7f 11                	jg     a6 <main+0x20>
    cat(0);
  95:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  9c:	e8 5f ff ff ff       	call   0 <cat>
    exit();
  a1:	e8 0c 04 00 00       	call   4b2 <exit>
  }

  for(i = 1; i < argc; i++){
  a6:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  ad:	00 
  ae:	eb 79                	jmp    129 <main+0xa3>
    if((fd = open(argv[i], 0)) < 0){
  b0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  b4:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  bb:	8b 45 0c             	mov    0xc(%ebp),%eax
  be:	01 d0                	add    %edx,%eax
  c0:	8b 00                	mov    (%eax),%eax
  c2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c9:	00 
  ca:	89 04 24             	mov    %eax,(%esp)
  cd:	e8 20 04 00 00       	call   4f2 <open>
  d2:	89 44 24 18          	mov    %eax,0x18(%esp)
  d6:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  db:	79 2f                	jns    10c <main+0x86>
      printf(1, "cat: cannot open %s\n", argv[i]);
  dd:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  e1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  e8:	8b 45 0c             	mov    0xc(%ebp),%eax
  eb:	01 d0                	add    %edx,%eax
  ed:	8b 00                	mov    (%eax),%eax
  ef:	89 44 24 08          	mov    %eax,0x8(%esp)
  f3:	c7 44 24 04 29 0a 00 	movl   $0xa29,0x4(%esp)
  fa:	00 
  fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 102:	e8 33 05 00 00       	call   63a <printf>
      exit();
 107:	e8 a6 03 00 00       	call   4b2 <exit>
    }
    cat(fd);
 10c:	8b 44 24 18          	mov    0x18(%esp),%eax
 110:	89 04 24             	mov    %eax,(%esp)
 113:	e8 e8 fe ff ff       	call   0 <cat>
    close(fd);
 118:	8b 44 24 18          	mov    0x18(%esp),%eax
 11c:	89 04 24             	mov    %eax,(%esp)
 11f:	e8 b6 03 00 00       	call   4da <close>
  for(i = 1; i < argc; i++){
 124:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 129:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 12d:	3b 45 08             	cmp    0x8(%ebp),%eax
 130:	0f 8c 7a ff ff ff    	jl     b0 <main+0x2a>
  }
  exit();
 136:	e8 77 03 00 00       	call   4b2 <exit>

0000013b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	57                   	push   %edi
 13f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 140:	8b 4d 08             	mov    0x8(%ebp),%ecx
 143:	8b 55 10             	mov    0x10(%ebp),%edx
 146:	8b 45 0c             	mov    0xc(%ebp),%eax
 149:	89 cb                	mov    %ecx,%ebx
 14b:	89 df                	mov    %ebx,%edi
 14d:	89 d1                	mov    %edx,%ecx
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
 152:	89 ca                	mov    %ecx,%edx
 154:	89 fb                	mov    %edi,%ebx
 156:	89 5d 08             	mov    %ebx,0x8(%ebp)
 159:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 15c:	5b                   	pop    %ebx
 15d:	5f                   	pop    %edi
 15e:	5d                   	pop    %ebp
 15f:	c3                   	ret    

00000160 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 16c:	90                   	nop
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	8d 50 01             	lea    0x1(%eax),%edx
 173:	89 55 08             	mov    %edx,0x8(%ebp)
 176:	8b 55 0c             	mov    0xc(%ebp),%edx
 179:	8d 4a 01             	lea    0x1(%edx),%ecx
 17c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 17f:	0f b6 12             	movzbl (%edx),%edx
 182:	88 10                	mov    %dl,(%eax)
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	84 c0                	test   %al,%al
 189:	75 e2                	jne    16d <strcpy+0xd>
    ;
  return os;
 18b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 18e:	c9                   	leave  
 18f:	c3                   	ret    

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 193:	eb 08                	jmp    19d <strcmp+0xd>
    p++, q++;
 195:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 199:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 19d:	8b 45 08             	mov    0x8(%ebp),%eax
 1a0:	0f b6 00             	movzbl (%eax),%eax
 1a3:	84 c0                	test   %al,%al
 1a5:	74 10                	je     1b7 <strcmp+0x27>
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b0:	0f b6 00             	movzbl (%eax),%eax
 1b3:	38 c2                	cmp    %al,%dl
 1b5:	74 de                	je     195 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	0f b6 00             	movzbl (%eax),%eax
 1bd:	0f b6 d0             	movzbl %al,%edx
 1c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c3:	0f b6 00             	movzbl (%eax),%eax
 1c6:	0f b6 c0             	movzbl %al,%eax
 1c9:	29 c2                	sub    %eax,%edx
 1cb:	89 d0                	mov    %edx,%eax
}
 1cd:	5d                   	pop    %ebp
 1ce:	c3                   	ret    

000001cf <strlen>:

uint
strlen(const char *s)
{
 1cf:	55                   	push   %ebp
 1d0:	89 e5                	mov    %esp,%ebp
 1d2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1d5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1dc:	eb 04                	jmp    1e2 <strlen+0x13>
 1de:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1e2:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	01 d0                	add    %edx,%eax
 1ea:	0f b6 00             	movzbl (%eax),%eax
 1ed:	84 c0                	test   %al,%al
 1ef:	75 ed                	jne    1de <strlen+0xf>
    ;
  return n;
 1f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    

000001f6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1fc:	8b 45 10             	mov    0x10(%ebp),%eax
 1ff:	89 44 24 08          	mov    %eax,0x8(%esp)
 203:	8b 45 0c             	mov    0xc(%ebp),%eax
 206:	89 44 24 04          	mov    %eax,0x4(%esp)
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	89 04 24             	mov    %eax,(%esp)
 210:	e8 26 ff ff ff       	call   13b <stosb>
  return dst;
 215:	8b 45 08             	mov    0x8(%ebp),%eax
}
 218:	c9                   	leave  
 219:	c3                   	ret    

0000021a <strchr>:

char*
strchr(const char *s, char c)
{
 21a:	55                   	push   %ebp
 21b:	89 e5                	mov    %esp,%ebp
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	8b 45 0c             	mov    0xc(%ebp),%eax
 223:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 226:	eb 14                	jmp    23c <strchr+0x22>
    if(*s == c)
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	0f b6 00             	movzbl (%eax),%eax
 22e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 231:	75 05                	jne    238 <strchr+0x1e>
      return (char*)s;
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	eb 13                	jmp    24b <strchr+0x31>
  for(; *s; s++)
 238:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 23c:	8b 45 08             	mov    0x8(%ebp),%eax
 23f:	0f b6 00             	movzbl (%eax),%eax
 242:	84 c0                	test   %al,%al
 244:	75 e2                	jne    228 <strchr+0xe>
  return 0;
 246:	b8 00 00 00 00       	mov    $0x0,%eax
}
 24b:	c9                   	leave  
 24c:	c3                   	ret    

0000024d <gets>:

char*
gets(char *buf, int max)
{
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 253:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 25a:	eb 4c                	jmp    2a8 <gets+0x5b>
    cc = read(0, &c, 1);
 25c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 263:	00 
 264:	8d 45 ef             	lea    -0x11(%ebp),%eax
 267:	89 44 24 04          	mov    %eax,0x4(%esp)
 26b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 272:	e8 53 02 00 00       	call   4ca <read>
 277:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 27a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 27e:	7f 02                	jg     282 <gets+0x35>
      break;
 280:	eb 31                	jmp    2b3 <gets+0x66>
    buf[i++] = c;
 282:	8b 45 f4             	mov    -0xc(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 f4             	mov    %edx,-0xc(%ebp)
 28b:	89 c2                	mov    %eax,%edx
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	01 c2                	add    %eax,%edx
 292:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 296:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 298:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29c:	3c 0a                	cmp    $0xa,%al
 29e:	74 13                	je     2b3 <gets+0x66>
 2a0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a4:	3c 0d                	cmp    $0xd,%al
 2a6:	74 0b                	je     2b3 <gets+0x66>
  for(i=0; i+1 < max; ){
 2a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ab:	83 c0 01             	add    $0x1,%eax
 2ae:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2b1:	7c a9                	jl     25c <gets+0xf>
      break;
  }
  buf[i] = '\0';
 2b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
 2b9:	01 d0                	add    %edx,%eax
 2bb:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c1:	c9                   	leave  
 2c2:	c3                   	ret    

000002c3 <stat>:

int
stat(const char *n, struct stat *st)
{
 2c3:	55                   	push   %ebp
 2c4:	89 e5                	mov    %esp,%ebp
 2c6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2d0:	00 
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	89 04 24             	mov    %eax,(%esp)
 2d7:	e8 16 02 00 00       	call   4f2 <open>
 2dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2df:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e3:	79 07                	jns    2ec <stat+0x29>
    return -1;
 2e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ea:	eb 23                	jmp    30f <stat+0x4c>
  r = fstat(fd, st);
 2ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2f6:	89 04 24             	mov    %eax,(%esp)
 2f9:	e8 0c 02 00 00       	call   50a <fstat>
 2fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 301:	8b 45 f4             	mov    -0xc(%ebp),%eax
 304:	89 04 24             	mov    %eax,(%esp)
 307:	e8 ce 01 00 00       	call   4da <close>
  return r;
 30c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 30f:	c9                   	leave  
 310:	c3                   	ret    

00000311 <atoi>:

int
atoi(const char *s)
{
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
 314:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 317:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 31e:	eb 25                	jmp    345 <atoi+0x34>
    n = n*10 + *s++ - '0';
 320:	8b 55 fc             	mov    -0x4(%ebp),%edx
 323:	89 d0                	mov    %edx,%eax
 325:	c1 e0 02             	shl    $0x2,%eax
 328:	01 d0                	add    %edx,%eax
 32a:	01 c0                	add    %eax,%eax
 32c:	89 c1                	mov    %eax,%ecx
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	8d 50 01             	lea    0x1(%eax),%edx
 334:	89 55 08             	mov    %edx,0x8(%ebp)
 337:	0f b6 00             	movzbl (%eax),%eax
 33a:	0f be c0             	movsbl %al,%eax
 33d:	01 c8                	add    %ecx,%eax
 33f:	83 e8 30             	sub    $0x30,%eax
 342:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 345:	8b 45 08             	mov    0x8(%ebp),%eax
 348:	0f b6 00             	movzbl (%eax),%eax
 34b:	3c 2f                	cmp    $0x2f,%al
 34d:	7e 0a                	jle    359 <atoi+0x48>
 34f:	8b 45 08             	mov    0x8(%ebp),%eax
 352:	0f b6 00             	movzbl (%eax),%eax
 355:	3c 39                	cmp    $0x39,%al
 357:	7e c7                	jle    320 <atoi+0xf>
  return n;
 359:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 35c:	c9                   	leave  
 35d:	c3                   	ret    

0000035e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 35e:	55                   	push   %ebp
 35f:	89 e5                	mov    %esp,%ebp
 361:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 364:	8b 45 08             	mov    0x8(%ebp),%eax
 367:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 36a:	8b 45 0c             	mov    0xc(%ebp),%eax
 36d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 370:	eb 17                	jmp    389 <memmove+0x2b>
    *dst++ = *src++;
 372:	8b 45 fc             	mov    -0x4(%ebp),%eax
 375:	8d 50 01             	lea    0x1(%eax),%edx
 378:	89 55 fc             	mov    %edx,-0x4(%ebp)
 37b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 37e:	8d 4a 01             	lea    0x1(%edx),%ecx
 381:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 384:	0f b6 12             	movzbl (%edx),%edx
 387:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 389:	8b 45 10             	mov    0x10(%ebp),%eax
 38c:	8d 50 ff             	lea    -0x1(%eax),%edx
 38f:	89 55 10             	mov    %edx,0x10(%ebp)
 392:	85 c0                	test   %eax,%eax
 394:	7f dc                	jg     372 <memmove+0x14>
  return vdst;
 396:	8b 45 08             	mov    0x8(%ebp),%eax
}
 399:	c9                   	leave  
 39a:	c3                   	ret    

0000039b <ps>:

void
ps(void)
{
 39b:	55                   	push   %ebp
 39c:	89 e5                	mov    %esp,%ebp
 39e:	57                   	push   %edi
 39f:	56                   	push   %esi
 3a0:	53                   	push   %ebx
 3a1:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable psinfo;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 3a7:	c7 44 24 04 3e 0a 00 	movl   $0xa3e,0x4(%esp)
 3ae:	00 
 3af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3b6:	e8 7f 02 00 00       	call   63a <printf>
  int i;
  for (i = 0; i < NPROC; i++)
 3bb:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 3c2:	e9 ce 00 00 00       	jmp    495 <ps+0xfa>
  {
    if (psinfo[i].inuse)
 3c7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3ca:	89 d0                	mov    %edx,%eax
 3cc:	c1 e0 03             	shl    $0x3,%eax
 3cf:	01 d0                	add    %edx,%eax
 3d1:	c1 e0 02             	shl    $0x2,%eax
 3d4:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 3d7:	01 d8                	add    %ebx,%eax
 3d9:	2d 04 09 00 00       	sub    $0x904,%eax
 3de:	8b 00                	mov    (%eax),%eax
 3e0:	85 c0                	test   %eax,%eax
 3e2:	0f 84 a9 00 00 00    	je     491 <ps+0xf6>
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
         psinfo[i].pid,
         psinfo[i].tickets,
         psinfo[i].ticks,
         psinfo[i].state,
         psinfo[i].name);
 3e8:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 3ee:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3f1:	89 d0                	mov    %edx,%eax
 3f3:	c1 e0 03             	shl    $0x3,%eax
 3f6:	01 d0                	add    %edx,%eax
 3f8:	c1 e0 02             	shl    $0x2,%eax
 3fb:	83 c0 10             	add    $0x10,%eax
 3fe:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
         psinfo[i].state,
 401:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 404:	89 d0                	mov    %edx,%eax
 406:	c1 e0 03             	shl    $0x3,%eax
 409:	01 d0                	add    %edx,%eax
 40b:	c1 e0 02             	shl    $0x2,%eax
 40e:	8d 75 e8             	lea    -0x18(%ebp),%esi
 411:	01 f0                	add    %esi,%eax
 413:	2d e4 08 00 00       	sub    $0x8e4,%eax
 418:	0f b6 00             	movzbl (%eax),%eax
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
 41b:	0f be f0             	movsbl %al,%esi
 41e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 421:	89 d0                	mov    %edx,%eax
 423:	c1 e0 03             	shl    $0x3,%eax
 426:	01 d0                	add    %edx,%eax
 428:	c1 e0 02             	shl    $0x2,%eax
 42b:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 42e:	01 c8                	add    %ecx,%eax
 430:	2d f8 08 00 00       	sub    $0x8f8,%eax
 435:	8b 18                	mov    (%eax),%ebx
 437:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 43a:	89 d0                	mov    %edx,%eax
 43c:	c1 e0 03             	shl    $0x3,%eax
 43f:	01 d0                	add    %edx,%eax
 441:	c1 e0 02             	shl    $0x2,%eax
 444:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 447:	01 c8                	add    %ecx,%eax
 449:	2d 00 09 00 00       	sub    $0x900,%eax
 44e:	8b 08                	mov    (%eax),%ecx
 450:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 453:	89 d0                	mov    %edx,%eax
 455:	c1 e0 03             	shl    $0x3,%eax
 458:	01 d0                	add    %edx,%eax
 45a:	c1 e0 02             	shl    $0x2,%eax
 45d:	8d 55 e8             	lea    -0x18(%ebp),%edx
 460:	01 d0                	add    %edx,%eax
 462:	2d fc 08 00 00       	sub    $0x8fc,%eax
 467:	8b 00                	mov    (%eax),%eax
 469:	89 7c 24 18          	mov    %edi,0x18(%esp)
 46d:	89 74 24 14          	mov    %esi,0x14(%esp)
 471:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 475:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 479:	89 44 24 08          	mov    %eax,0x8(%esp)
 47d:	c7 44 24 04 57 0a 00 	movl   $0xa57,0x4(%esp)
 484:	00 
 485:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 48c:	e8 a9 01 00 00       	call   63a <printf>
  for (i = 0; i < NPROC; i++)
 491:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 495:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 499:	0f 8e 28 ff ff ff    	jle    3c7 <ps+0x2c>
    }
  }
}
 49f:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 4a5:	5b                   	pop    %ebx
 4a6:	5e                   	pop    %esi
 4a7:	5f                   	pop    %edi
 4a8:	5d                   	pop    %ebp
 4a9:	c3                   	ret    

000004aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4aa:	b8 01 00 00 00       	mov    $0x1,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <exit>:
SYSCALL(exit)
 4b2:	b8 02 00 00 00       	mov    $0x2,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <wait>:
SYSCALL(wait)
 4ba:	b8 03 00 00 00       	mov    $0x3,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <pipe>:
SYSCALL(pipe)
 4c2:	b8 04 00 00 00       	mov    $0x4,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <read>:
SYSCALL(read)
 4ca:	b8 05 00 00 00       	mov    $0x5,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <write>:
SYSCALL(write)
 4d2:	b8 10 00 00 00       	mov    $0x10,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <close>:
SYSCALL(close)
 4da:	b8 15 00 00 00       	mov    $0x15,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <kill>:
SYSCALL(kill)
 4e2:	b8 06 00 00 00       	mov    $0x6,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <exec>:
SYSCALL(exec)
 4ea:	b8 07 00 00 00       	mov    $0x7,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <open>:
SYSCALL(open)
 4f2:	b8 0f 00 00 00       	mov    $0xf,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <mknod>:
SYSCALL(mknod)
 4fa:	b8 11 00 00 00       	mov    $0x11,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <unlink>:
SYSCALL(unlink)
 502:	b8 12 00 00 00       	mov    $0x12,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <fstat>:
SYSCALL(fstat)
 50a:	b8 08 00 00 00       	mov    $0x8,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <link>:
SYSCALL(link)
 512:	b8 13 00 00 00       	mov    $0x13,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <mkdir>:
SYSCALL(mkdir)
 51a:	b8 14 00 00 00       	mov    $0x14,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <chdir>:
SYSCALL(chdir)
 522:	b8 09 00 00 00       	mov    $0x9,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <dup>:
SYSCALL(dup)
 52a:	b8 0a 00 00 00       	mov    $0xa,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <getpid>:
SYSCALL(getpid)
 532:	b8 0b 00 00 00       	mov    $0xb,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <sbrk>:
SYSCALL(sbrk)
 53a:	b8 0c 00 00 00       	mov    $0xc,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <sleep>:
SYSCALL(sleep)
 542:	b8 0d 00 00 00       	mov    $0xd,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <uptime>:
SYSCALL(uptime)
 54a:	b8 0e 00 00 00       	mov    $0xe,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <getpinfo>:
SYSCALL(getpinfo)
 552:	b8 16 00 00 00       	mov    $0x16,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 55a:	55                   	push   %ebp
 55b:	89 e5                	mov    %esp,%ebp
 55d:	83 ec 18             	sub    $0x18,%esp
 560:	8b 45 0c             	mov    0xc(%ebp),%eax
 563:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 566:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 56d:	00 
 56e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 571:	89 44 24 04          	mov    %eax,0x4(%esp)
 575:	8b 45 08             	mov    0x8(%ebp),%eax
 578:	89 04 24             	mov    %eax,(%esp)
 57b:	e8 52 ff ff ff       	call   4d2 <write>
}
 580:	c9                   	leave  
 581:	c3                   	ret    

00000582 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 582:	55                   	push   %ebp
 583:	89 e5                	mov    %esp,%ebp
 585:	56                   	push   %esi
 586:	53                   	push   %ebx
 587:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 58a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 591:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 595:	74 17                	je     5ae <printint+0x2c>
 597:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 59b:	79 11                	jns    5ae <printint+0x2c>
    neg = 1;
 59d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5a4:	8b 45 0c             	mov    0xc(%ebp),%eax
 5a7:	f7 d8                	neg    %eax
 5a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5ac:	eb 06                	jmp    5b4 <printint+0x32>
  } else {
    x = xx;
 5ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 5b1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 5bb:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5be:	8d 41 01             	lea    0x1(%ecx),%eax
 5c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5c4:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5ca:	ba 00 00 00 00       	mov    $0x0,%edx
 5cf:	f7 f3                	div    %ebx
 5d1:	89 d0                	mov    %edx,%eax
 5d3:	0f b6 80 00 0d 00 00 	movzbl 0xd00(%eax),%eax
 5da:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5de:	8b 75 10             	mov    0x10(%ebp),%esi
 5e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5e4:	ba 00 00 00 00       	mov    $0x0,%edx
 5e9:	f7 f6                	div    %esi
 5eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5ee:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5f2:	75 c7                	jne    5bb <printint+0x39>
  if(neg)
 5f4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5f8:	74 10                	je     60a <printint+0x88>
    buf[i++] = '-';
 5fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5fd:	8d 50 01             	lea    0x1(%eax),%edx
 600:	89 55 f4             	mov    %edx,-0xc(%ebp)
 603:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 608:	eb 1f                	jmp    629 <printint+0xa7>
 60a:	eb 1d                	jmp    629 <printint+0xa7>
    putc(fd, buf[i]);
 60c:	8d 55 dc             	lea    -0x24(%ebp),%edx
 60f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 612:	01 d0                	add    %edx,%eax
 614:	0f b6 00             	movzbl (%eax),%eax
 617:	0f be c0             	movsbl %al,%eax
 61a:	89 44 24 04          	mov    %eax,0x4(%esp)
 61e:	8b 45 08             	mov    0x8(%ebp),%eax
 621:	89 04 24             	mov    %eax,(%esp)
 624:	e8 31 ff ff ff       	call   55a <putc>
  while(--i >= 0)
 629:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 62d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 631:	79 d9                	jns    60c <printint+0x8a>
}
 633:	83 c4 30             	add    $0x30,%esp
 636:	5b                   	pop    %ebx
 637:	5e                   	pop    %esi
 638:	5d                   	pop    %ebp
 639:	c3                   	ret    

0000063a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 63a:	55                   	push   %ebp
 63b:	89 e5                	mov    %esp,%ebp
 63d:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 640:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 647:	8d 45 0c             	lea    0xc(%ebp),%eax
 64a:	83 c0 04             	add    $0x4,%eax
 64d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 650:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 657:	e9 7c 01 00 00       	jmp    7d8 <printf+0x19e>
    c = fmt[i] & 0xff;
 65c:	8b 55 0c             	mov    0xc(%ebp),%edx
 65f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 662:	01 d0                	add    %edx,%eax
 664:	0f b6 00             	movzbl (%eax),%eax
 667:	0f be c0             	movsbl %al,%eax
 66a:	25 ff 00 00 00       	and    $0xff,%eax
 66f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 672:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 676:	75 2c                	jne    6a4 <printf+0x6a>
      if(c == '%'){
 678:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 67c:	75 0c                	jne    68a <printf+0x50>
        state = '%';
 67e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 685:	e9 4a 01 00 00       	jmp    7d4 <printf+0x19a>
      } else {
        putc(fd, c);
 68a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 68d:	0f be c0             	movsbl %al,%eax
 690:	89 44 24 04          	mov    %eax,0x4(%esp)
 694:	8b 45 08             	mov    0x8(%ebp),%eax
 697:	89 04 24             	mov    %eax,(%esp)
 69a:	e8 bb fe ff ff       	call   55a <putc>
 69f:	e9 30 01 00 00       	jmp    7d4 <printf+0x19a>
      }
    } else if(state == '%'){
 6a4:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6a8:	0f 85 26 01 00 00    	jne    7d4 <printf+0x19a>
      if(c == 'd'){
 6ae:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6b2:	75 2d                	jne    6e1 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b7:	8b 00                	mov    (%eax),%eax
 6b9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6c0:	00 
 6c1:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6c8:	00 
 6c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	89 04 24             	mov    %eax,(%esp)
 6d3:	e8 aa fe ff ff       	call   582 <printint>
        ap++;
 6d8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6dc:	e9 ec 00 00 00       	jmp    7cd <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 6e1:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6e5:	74 06                	je     6ed <printf+0xb3>
 6e7:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6eb:	75 2d                	jne    71a <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6f0:	8b 00                	mov    (%eax),%eax
 6f2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6f9:	00 
 6fa:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 701:	00 
 702:	89 44 24 04          	mov    %eax,0x4(%esp)
 706:	8b 45 08             	mov    0x8(%ebp),%eax
 709:	89 04 24             	mov    %eax,(%esp)
 70c:	e8 71 fe ff ff       	call   582 <printint>
        ap++;
 711:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 715:	e9 b3 00 00 00       	jmp    7cd <printf+0x193>
      } else if(c == 's'){
 71a:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 71e:	75 45                	jne    765 <printf+0x12b>
        s = (char*)*ap;
 720:	8b 45 e8             	mov    -0x18(%ebp),%eax
 723:	8b 00                	mov    (%eax),%eax
 725:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 728:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 72c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 730:	75 09                	jne    73b <printf+0x101>
          s = "(null)";
 732:	c7 45 f4 67 0a 00 00 	movl   $0xa67,-0xc(%ebp)
        while(*s != 0){
 739:	eb 1e                	jmp    759 <printf+0x11f>
 73b:	eb 1c                	jmp    759 <printf+0x11f>
          putc(fd, *s);
 73d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 740:	0f b6 00             	movzbl (%eax),%eax
 743:	0f be c0             	movsbl %al,%eax
 746:	89 44 24 04          	mov    %eax,0x4(%esp)
 74a:	8b 45 08             	mov    0x8(%ebp),%eax
 74d:	89 04 24             	mov    %eax,(%esp)
 750:	e8 05 fe ff ff       	call   55a <putc>
          s++;
 755:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 759:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75c:	0f b6 00             	movzbl (%eax),%eax
 75f:	84 c0                	test   %al,%al
 761:	75 da                	jne    73d <printf+0x103>
 763:	eb 68                	jmp    7cd <printf+0x193>
        }
      } else if(c == 'c'){
 765:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 769:	75 1d                	jne    788 <printf+0x14e>
        putc(fd, *ap);
 76b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 76e:	8b 00                	mov    (%eax),%eax
 770:	0f be c0             	movsbl %al,%eax
 773:	89 44 24 04          	mov    %eax,0x4(%esp)
 777:	8b 45 08             	mov    0x8(%ebp),%eax
 77a:	89 04 24             	mov    %eax,(%esp)
 77d:	e8 d8 fd ff ff       	call   55a <putc>
        ap++;
 782:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 786:	eb 45                	jmp    7cd <printf+0x193>
      } else if(c == '%'){
 788:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 78c:	75 17                	jne    7a5 <printf+0x16b>
        putc(fd, c);
 78e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 791:	0f be c0             	movsbl %al,%eax
 794:	89 44 24 04          	mov    %eax,0x4(%esp)
 798:	8b 45 08             	mov    0x8(%ebp),%eax
 79b:	89 04 24             	mov    %eax,(%esp)
 79e:	e8 b7 fd ff ff       	call   55a <putc>
 7a3:	eb 28                	jmp    7cd <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7a5:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7ac:	00 
 7ad:	8b 45 08             	mov    0x8(%ebp),%eax
 7b0:	89 04 24             	mov    %eax,(%esp)
 7b3:	e8 a2 fd ff ff       	call   55a <putc>
        putc(fd, c);
 7b8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7bb:	0f be c0             	movsbl %al,%eax
 7be:	89 44 24 04          	mov    %eax,0x4(%esp)
 7c2:	8b 45 08             	mov    0x8(%ebp),%eax
 7c5:	89 04 24             	mov    %eax,(%esp)
 7c8:	e8 8d fd ff ff       	call   55a <putc>
      }
      state = 0;
 7cd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 7d4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 7d8:	8b 55 0c             	mov    0xc(%ebp),%edx
 7db:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7de:	01 d0                	add    %edx,%eax
 7e0:	0f b6 00             	movzbl (%eax),%eax
 7e3:	84 c0                	test   %al,%al
 7e5:	0f 85 71 fe ff ff    	jne    65c <printf+0x22>
    }
  }
}
 7eb:	c9                   	leave  
 7ec:	c3                   	ret    

000007ed <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ed:	55                   	push   %ebp
 7ee:	89 e5                	mov    %esp,%ebp
 7f0:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7f3:	8b 45 08             	mov    0x8(%ebp),%eax
 7f6:	83 e8 08             	sub    $0x8,%eax
 7f9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7fc:	a1 28 0d 00 00       	mov    0xd28,%eax
 801:	89 45 fc             	mov    %eax,-0x4(%ebp)
 804:	eb 24                	jmp    82a <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 806:	8b 45 fc             	mov    -0x4(%ebp),%eax
 809:	8b 00                	mov    (%eax),%eax
 80b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 80e:	77 12                	ja     822 <free+0x35>
 810:	8b 45 f8             	mov    -0x8(%ebp),%eax
 813:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 816:	77 24                	ja     83c <free+0x4f>
 818:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81b:	8b 00                	mov    (%eax),%eax
 81d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 820:	77 1a                	ja     83c <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 822:	8b 45 fc             	mov    -0x4(%ebp),%eax
 825:	8b 00                	mov    (%eax),%eax
 827:	89 45 fc             	mov    %eax,-0x4(%ebp)
 82a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 830:	76 d4                	jbe    806 <free+0x19>
 832:	8b 45 fc             	mov    -0x4(%ebp),%eax
 835:	8b 00                	mov    (%eax),%eax
 837:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 83a:	76 ca                	jbe    806 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 83c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83f:	8b 40 04             	mov    0x4(%eax),%eax
 842:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 849:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84c:	01 c2                	add    %eax,%edx
 84e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 851:	8b 00                	mov    (%eax),%eax
 853:	39 c2                	cmp    %eax,%edx
 855:	75 24                	jne    87b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 857:	8b 45 f8             	mov    -0x8(%ebp),%eax
 85a:	8b 50 04             	mov    0x4(%eax),%edx
 85d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 860:	8b 00                	mov    (%eax),%eax
 862:	8b 40 04             	mov    0x4(%eax),%eax
 865:	01 c2                	add    %eax,%edx
 867:	8b 45 f8             	mov    -0x8(%ebp),%eax
 86a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 86d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 870:	8b 00                	mov    (%eax),%eax
 872:	8b 10                	mov    (%eax),%edx
 874:	8b 45 f8             	mov    -0x8(%ebp),%eax
 877:	89 10                	mov    %edx,(%eax)
 879:	eb 0a                	jmp    885 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 87b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87e:	8b 10                	mov    (%eax),%edx
 880:	8b 45 f8             	mov    -0x8(%ebp),%eax
 883:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 885:	8b 45 fc             	mov    -0x4(%ebp),%eax
 888:	8b 40 04             	mov    0x4(%eax),%eax
 88b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 892:	8b 45 fc             	mov    -0x4(%ebp),%eax
 895:	01 d0                	add    %edx,%eax
 897:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 89a:	75 20                	jne    8bc <free+0xcf>
    p->s.size += bp->s.size;
 89c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89f:	8b 50 04             	mov    0x4(%eax),%edx
 8a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a5:	8b 40 04             	mov    0x4(%eax),%eax
 8a8:	01 c2                	add    %eax,%edx
 8aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ad:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b3:	8b 10                	mov    (%eax),%edx
 8b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b8:	89 10                	mov    %edx,(%eax)
 8ba:	eb 08                	jmp    8c4 <free+0xd7>
  } else
    p->s.ptr = bp;
 8bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8bf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8c2:	89 10                	mov    %edx,(%eax)
  freep = p;
 8c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c7:	a3 28 0d 00 00       	mov    %eax,0xd28
}
 8cc:	c9                   	leave  
 8cd:	c3                   	ret    

000008ce <morecore>:

static Header*
morecore(uint nu)
{
 8ce:	55                   	push   %ebp
 8cf:	89 e5                	mov    %esp,%ebp
 8d1:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8d4:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8db:	77 07                	ja     8e4 <morecore+0x16>
    nu = 4096;
 8dd:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8e4:	8b 45 08             	mov    0x8(%ebp),%eax
 8e7:	c1 e0 03             	shl    $0x3,%eax
 8ea:	89 04 24             	mov    %eax,(%esp)
 8ed:	e8 48 fc ff ff       	call   53a <sbrk>
 8f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8f5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8f9:	75 07                	jne    902 <morecore+0x34>
    return 0;
 8fb:	b8 00 00 00 00       	mov    $0x0,%eax
 900:	eb 22                	jmp    924 <morecore+0x56>
  hp = (Header*)p;
 902:	8b 45 f4             	mov    -0xc(%ebp),%eax
 905:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 908:	8b 45 f0             	mov    -0x10(%ebp),%eax
 90b:	8b 55 08             	mov    0x8(%ebp),%edx
 90e:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 911:	8b 45 f0             	mov    -0x10(%ebp),%eax
 914:	83 c0 08             	add    $0x8,%eax
 917:	89 04 24             	mov    %eax,(%esp)
 91a:	e8 ce fe ff ff       	call   7ed <free>
  return freep;
 91f:	a1 28 0d 00 00       	mov    0xd28,%eax
}
 924:	c9                   	leave  
 925:	c3                   	ret    

00000926 <malloc>:

void*
malloc(uint nbytes)
{
 926:	55                   	push   %ebp
 927:	89 e5                	mov    %esp,%ebp
 929:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 92c:	8b 45 08             	mov    0x8(%ebp),%eax
 92f:	83 c0 07             	add    $0x7,%eax
 932:	c1 e8 03             	shr    $0x3,%eax
 935:	83 c0 01             	add    $0x1,%eax
 938:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 93b:	a1 28 0d 00 00       	mov    0xd28,%eax
 940:	89 45 f0             	mov    %eax,-0x10(%ebp)
 943:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 947:	75 23                	jne    96c <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 949:	c7 45 f0 20 0d 00 00 	movl   $0xd20,-0x10(%ebp)
 950:	8b 45 f0             	mov    -0x10(%ebp),%eax
 953:	a3 28 0d 00 00       	mov    %eax,0xd28
 958:	a1 28 0d 00 00       	mov    0xd28,%eax
 95d:	a3 20 0d 00 00       	mov    %eax,0xd20
    base.s.size = 0;
 962:	c7 05 24 0d 00 00 00 	movl   $0x0,0xd24
 969:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 96c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 96f:	8b 00                	mov    (%eax),%eax
 971:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 974:	8b 45 f4             	mov    -0xc(%ebp),%eax
 977:	8b 40 04             	mov    0x4(%eax),%eax
 97a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 97d:	72 4d                	jb     9cc <malloc+0xa6>
      if(p->s.size == nunits)
 97f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 982:	8b 40 04             	mov    0x4(%eax),%eax
 985:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 988:	75 0c                	jne    996 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 98a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98d:	8b 10                	mov    (%eax),%edx
 98f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 992:	89 10                	mov    %edx,(%eax)
 994:	eb 26                	jmp    9bc <malloc+0x96>
      else {
        p->s.size -= nunits;
 996:	8b 45 f4             	mov    -0xc(%ebp),%eax
 999:	8b 40 04             	mov    0x4(%eax),%eax
 99c:	2b 45 ec             	sub    -0x14(%ebp),%eax
 99f:	89 c2                	mov    %eax,%edx
 9a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9aa:	8b 40 04             	mov    0x4(%eax),%eax
 9ad:	c1 e0 03             	shl    $0x3,%eax
 9b0:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b6:	8b 55 ec             	mov    -0x14(%ebp),%edx
 9b9:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9bf:	a3 28 0d 00 00       	mov    %eax,0xd28
      return (void*)(p + 1);
 9c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c7:	83 c0 08             	add    $0x8,%eax
 9ca:	eb 38                	jmp    a04 <malloc+0xde>
    }
    if(p == freep)
 9cc:	a1 28 0d 00 00       	mov    0xd28,%eax
 9d1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 9d4:	75 1b                	jne    9f1 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9d9:	89 04 24             	mov    %eax,(%esp)
 9dc:	e8 ed fe ff ff       	call   8ce <morecore>
 9e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9e4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9e8:	75 07                	jne    9f1 <malloc+0xcb>
        return 0;
 9ea:	b8 00 00 00 00       	mov    $0x0,%eax
 9ef:	eb 13                	jmp    a04 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9fa:	8b 00                	mov    (%eax),%eax
 9fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 9ff:	e9 70 ff ff ff       	jmp    974 <malloc+0x4e>
}
 a04:	c9                   	leave  
 a05:	c3                   	ret    
