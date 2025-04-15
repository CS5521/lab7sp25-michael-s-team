
_rm:     file format elf32-i386


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

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "Usage: rm files...\n");
   f:	c7 44 24 04 5a 09 00 	movl   $0x95a,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 6b 05 00 00       	call   58e <printf>
    exit();
  23:	e8 de 03 00 00       	call   406 <exit>
  }

  for(i = 1; i < argc; i++){
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 4f                	jmp    81 <main+0x81>
    if(unlink(argv[i]) < 0){
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 0a 04 00 00       	call   456 <unlink>
  4c:	85 c0                	test   %eax,%eax
  4e:	79 2c                	jns    7c <main+0x7c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  50:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  54:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  5e:	01 d0                	add    %edx,%eax
  60:	8b 00                	mov    (%eax),%eax
  62:	89 44 24 08          	mov    %eax,0x8(%esp)
  66:	c7 44 24 04 6e 09 00 	movl   $0x96e,0x4(%esp)
  6d:	00 
  6e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  75:	e8 14 05 00 00       	call   58e <printf>
      break;
  7a:	eb 0e                	jmp    8a <main+0x8a>
  for(i = 1; i < argc; i++){
  7c:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  81:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  85:	3b 45 08             	cmp    0x8(%ebp),%eax
  88:	7c a8                	jl     32 <main+0x32>
    }
  }

  exit();
  8a:	e8 77 03 00 00       	call   406 <exit>

0000008f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  8f:	55                   	push   %ebp
  90:	89 e5                	mov    %esp,%ebp
  92:	57                   	push   %edi
  93:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  94:	8b 4d 08             	mov    0x8(%ebp),%ecx
  97:	8b 55 10             	mov    0x10(%ebp),%edx
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	89 cb                	mov    %ecx,%ebx
  9f:	89 df                	mov    %ebx,%edi
  a1:	89 d1                	mov    %edx,%ecx
  a3:	fc                   	cld    
  a4:	f3 aa                	rep stos %al,%es:(%edi)
  a6:	89 ca                	mov    %ecx,%edx
  a8:	89 fb                	mov    %edi,%ebx
  aa:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ad:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  b0:	5b                   	pop    %ebx
  b1:	5f                   	pop    %edi
  b2:	5d                   	pop    %ebp
  b3:	c3                   	ret    

000000b4 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  c0:	90                   	nop
  c1:	8b 45 08             	mov    0x8(%ebp),%eax
  c4:	8d 50 01             	lea    0x1(%eax),%edx
  c7:	89 55 08             	mov    %edx,0x8(%ebp)
  ca:	8b 55 0c             	mov    0xc(%ebp),%edx
  cd:	8d 4a 01             	lea    0x1(%edx),%ecx
  d0:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  d3:	0f b6 12             	movzbl (%edx),%edx
  d6:	88 10                	mov    %dl,(%eax)
  d8:	0f b6 00             	movzbl (%eax),%eax
  db:	84 c0                	test   %al,%al
  dd:	75 e2                	jne    c1 <strcpy+0xd>
    ;
  return os;
  df:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e2:	c9                   	leave  
  e3:	c3                   	ret    

000000e4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e7:	eb 08                	jmp    f1 <strcmp+0xd>
    p++, q++;
  e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ed:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	84 c0                	test   %al,%al
  f9:	74 10                	je     10b <strcmp+0x27>
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  fe:	0f b6 10             	movzbl (%eax),%edx
 101:	8b 45 0c             	mov    0xc(%ebp),%eax
 104:	0f b6 00             	movzbl (%eax),%eax
 107:	38 c2                	cmp    %al,%dl
 109:	74 de                	je     e9 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 10b:	8b 45 08             	mov    0x8(%ebp),%eax
 10e:	0f b6 00             	movzbl (%eax),%eax
 111:	0f b6 d0             	movzbl %al,%edx
 114:	8b 45 0c             	mov    0xc(%ebp),%eax
 117:	0f b6 00             	movzbl (%eax),%eax
 11a:	0f b6 c0             	movzbl %al,%eax
 11d:	29 c2                	sub    %eax,%edx
 11f:	89 d0                	mov    %edx,%eax
}
 121:	5d                   	pop    %ebp
 122:	c3                   	ret    

00000123 <strlen>:

uint
strlen(const char *s)
{
 123:	55                   	push   %ebp
 124:	89 e5                	mov    %esp,%ebp
 126:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 129:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 130:	eb 04                	jmp    136 <strlen+0x13>
 132:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 136:	8b 55 fc             	mov    -0x4(%ebp),%edx
 139:	8b 45 08             	mov    0x8(%ebp),%eax
 13c:	01 d0                	add    %edx,%eax
 13e:	0f b6 00             	movzbl (%eax),%eax
 141:	84 c0                	test   %al,%al
 143:	75 ed                	jne    132 <strlen+0xf>
    ;
  return n;
 145:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <memset>:

void*
memset(void *dst, int c, uint n)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 150:	8b 45 10             	mov    0x10(%ebp),%eax
 153:	89 44 24 08          	mov    %eax,0x8(%esp)
 157:	8b 45 0c             	mov    0xc(%ebp),%eax
 15a:	89 44 24 04          	mov    %eax,0x4(%esp)
 15e:	8b 45 08             	mov    0x8(%ebp),%eax
 161:	89 04 24             	mov    %eax,(%esp)
 164:	e8 26 ff ff ff       	call   8f <stosb>
  return dst;
 169:	8b 45 08             	mov    0x8(%ebp),%eax
}
 16c:	c9                   	leave  
 16d:	c3                   	ret    

0000016e <strchr>:

char*
strchr(const char *s, char c)
{
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	83 ec 04             	sub    $0x4,%esp
 174:	8b 45 0c             	mov    0xc(%ebp),%eax
 177:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 17a:	eb 14                	jmp    190 <strchr+0x22>
    if(*s == c)
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	0f b6 00             	movzbl (%eax),%eax
 182:	3a 45 fc             	cmp    -0x4(%ebp),%al
 185:	75 05                	jne    18c <strchr+0x1e>
      return (char*)s;
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	eb 13                	jmp    19f <strchr+0x31>
  for(; *s; s++)
 18c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	0f b6 00             	movzbl (%eax),%eax
 196:	84 c0                	test   %al,%al
 198:	75 e2                	jne    17c <strchr+0xe>
  return 0;
 19a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 19f:	c9                   	leave  
 1a0:	c3                   	ret    

000001a1 <gets>:

char*
gets(char *buf, int max)
{
 1a1:	55                   	push   %ebp
 1a2:	89 e5                	mov    %esp,%ebp
 1a4:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1ae:	eb 4c                	jmp    1fc <gets+0x5b>
    cc = read(0, &c, 1);
 1b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1b7:	00 
 1b8:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 1bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1c6:	e8 53 02 00 00       	call   41e <read>
 1cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1d2:	7f 02                	jg     1d6 <gets+0x35>
      break;
 1d4:	eb 31                	jmp    207 <gets+0x66>
    buf[i++] = c;
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	8d 50 01             	lea    0x1(%eax),%edx
 1dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1df:	89 c2                	mov    %eax,%edx
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	01 c2                	add    %eax,%edx
 1e6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ea:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1ec:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f0:	3c 0a                	cmp    $0xa,%al
 1f2:	74 13                	je     207 <gets+0x66>
 1f4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f8:	3c 0d                	cmp    $0xd,%al
 1fa:	74 0b                	je     207 <gets+0x66>
  for(i=0; i+1 < max; ){
 1fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ff:	83 c0 01             	add    $0x1,%eax
 202:	3b 45 0c             	cmp    0xc(%ebp),%eax
 205:	7c a9                	jl     1b0 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 207:	8b 55 f4             	mov    -0xc(%ebp),%edx
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	01 d0                	add    %edx,%eax
 20f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 212:	8b 45 08             	mov    0x8(%ebp),%eax
}
 215:	c9                   	leave  
 216:	c3                   	ret    

00000217 <stat>:

int
stat(const char *n, struct stat *st)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 21d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 224:	00 
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	89 04 24             	mov    %eax,(%esp)
 22b:	e8 16 02 00 00       	call   446 <open>
 230:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 233:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 237:	79 07                	jns    240 <stat+0x29>
    return -1;
 239:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23e:	eb 23                	jmp    263 <stat+0x4c>
  r = fstat(fd, st);
 240:	8b 45 0c             	mov    0xc(%ebp),%eax
 243:	89 44 24 04          	mov    %eax,0x4(%esp)
 247:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24a:	89 04 24             	mov    %eax,(%esp)
 24d:	e8 0c 02 00 00       	call   45e <fstat>
 252:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 255:	8b 45 f4             	mov    -0xc(%ebp),%eax
 258:	89 04 24             	mov    %eax,(%esp)
 25b:	e8 ce 01 00 00       	call   42e <close>
  return r;
 260:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 263:	c9                   	leave  
 264:	c3                   	ret    

00000265 <atoi>:

int
atoi(const char *s)
{
 265:	55                   	push   %ebp
 266:	89 e5                	mov    %esp,%ebp
 268:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 26b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 272:	eb 25                	jmp    299 <atoi+0x34>
    n = n*10 + *s++ - '0';
 274:	8b 55 fc             	mov    -0x4(%ebp),%edx
 277:	89 d0                	mov    %edx,%eax
 279:	c1 e0 02             	shl    $0x2,%eax
 27c:	01 d0                	add    %edx,%eax
 27e:	01 c0                	add    %eax,%eax
 280:	89 c1                	mov    %eax,%ecx
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 08             	mov    %edx,0x8(%ebp)
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	0f be c0             	movsbl %al,%eax
 291:	01 c8                	add    %ecx,%eax
 293:	83 e8 30             	sub    $0x30,%eax
 296:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 299:	8b 45 08             	mov    0x8(%ebp),%eax
 29c:	0f b6 00             	movzbl (%eax),%eax
 29f:	3c 2f                	cmp    $0x2f,%al
 2a1:	7e 0a                	jle    2ad <atoi+0x48>
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	0f b6 00             	movzbl (%eax),%eax
 2a9:	3c 39                	cmp    $0x39,%al
 2ab:	7e c7                	jle    274 <atoi+0xf>
  return n;
 2ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2b0:	c9                   	leave  
 2b1:	c3                   	ret    

000002b2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2b2:	55                   	push   %ebp
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 2bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2c4:	eb 17                	jmp    2dd <memmove+0x2b>
    *dst++ = *src++;
 2c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2c9:	8d 50 01             	lea    0x1(%eax),%edx
 2cc:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2cf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2d2:	8d 4a 01             	lea    0x1(%edx),%ecx
 2d5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2d8:	0f b6 12             	movzbl (%edx),%edx
 2db:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2dd:	8b 45 10             	mov    0x10(%ebp),%eax
 2e0:	8d 50 ff             	lea    -0x1(%eax),%edx
 2e3:	89 55 10             	mov    %edx,0x10(%ebp)
 2e6:	85 c0                	test   %eax,%eax
 2e8:	7f dc                	jg     2c6 <memmove+0x14>
  return vdst;
 2ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ed:	c9                   	leave  
 2ee:	c3                   	ret    

000002ef <ps>:

void
ps(void)
{
 2ef:	55                   	push   %ebp
 2f0:	89 e5                	mov    %esp,%ebp
 2f2:	57                   	push   %edi
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
 2f5:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable psinfo;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 2fb:	c7 44 24 04 87 09 00 	movl   $0x987,0x4(%esp)
 302:	00 
 303:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 30a:	e8 7f 02 00 00       	call   58e <printf>
  int i;
  for (i = 0; i < NPROC; i++)
 30f:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 316:	e9 ce 00 00 00       	jmp    3e9 <ps+0xfa>
  {
    if (psinfo[i].inuse)
 31b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 31e:	89 d0                	mov    %edx,%eax
 320:	c1 e0 03             	shl    $0x3,%eax
 323:	01 d0                	add    %edx,%eax
 325:	c1 e0 02             	shl    $0x2,%eax
 328:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 32b:	01 d8                	add    %ebx,%eax
 32d:	2d 04 09 00 00       	sub    $0x904,%eax
 332:	8b 00                	mov    (%eax),%eax
 334:	85 c0                	test   %eax,%eax
 336:	0f 84 a9 00 00 00    	je     3e5 <ps+0xf6>
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
         psinfo[i].pid,
         psinfo[i].tickets,
         psinfo[i].ticks,
         psinfo[i].state,
         psinfo[i].name);
 33c:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 342:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 345:	89 d0                	mov    %edx,%eax
 347:	c1 e0 03             	shl    $0x3,%eax
 34a:	01 d0                	add    %edx,%eax
 34c:	c1 e0 02             	shl    $0x2,%eax
 34f:	83 c0 10             	add    $0x10,%eax
 352:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
         psinfo[i].state,
 355:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 358:	89 d0                	mov    %edx,%eax
 35a:	c1 e0 03             	shl    $0x3,%eax
 35d:	01 d0                	add    %edx,%eax
 35f:	c1 e0 02             	shl    $0x2,%eax
 362:	8d 75 e8             	lea    -0x18(%ebp),%esi
 365:	01 f0                	add    %esi,%eax
 367:	2d e4 08 00 00       	sub    $0x8e4,%eax
 36c:	0f b6 00             	movzbl (%eax),%eax
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
 36f:	0f be f0             	movsbl %al,%esi
 372:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 375:	89 d0                	mov    %edx,%eax
 377:	c1 e0 03             	shl    $0x3,%eax
 37a:	01 d0                	add    %edx,%eax
 37c:	c1 e0 02             	shl    $0x2,%eax
 37f:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 382:	01 c8                	add    %ecx,%eax
 384:	2d f8 08 00 00       	sub    $0x8f8,%eax
 389:	8b 18                	mov    (%eax),%ebx
 38b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 38e:	89 d0                	mov    %edx,%eax
 390:	c1 e0 03             	shl    $0x3,%eax
 393:	01 d0                	add    %edx,%eax
 395:	c1 e0 02             	shl    $0x2,%eax
 398:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 39b:	01 c8                	add    %ecx,%eax
 39d:	2d 00 09 00 00       	sub    $0x900,%eax
 3a2:	8b 08                	mov    (%eax),%ecx
 3a4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3a7:	89 d0                	mov    %edx,%eax
 3a9:	c1 e0 03             	shl    $0x3,%eax
 3ac:	01 d0                	add    %edx,%eax
 3ae:	c1 e0 02             	shl    $0x2,%eax
 3b1:	8d 55 e8             	lea    -0x18(%ebp),%edx
 3b4:	01 d0                	add    %edx,%eax
 3b6:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3bb:	8b 00                	mov    (%eax),%eax
 3bd:	89 7c 24 18          	mov    %edi,0x18(%esp)
 3c1:	89 74 24 14          	mov    %esi,0x14(%esp)
 3c5:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 3c9:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 3cd:	89 44 24 08          	mov    %eax,0x8(%esp)
 3d1:	c7 44 24 04 a0 09 00 	movl   $0x9a0,0x4(%esp)
 3d8:	00 
 3d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3e0:	e8 a9 01 00 00       	call   58e <printf>
  for (i = 0; i < NPROC; i++)
 3e5:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 3e9:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 3ed:	0f 8e 28 ff ff ff    	jle    31b <ps+0x2c>
    }
  }
}
 3f3:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 3f9:	5b                   	pop    %ebx
 3fa:	5e                   	pop    %esi
 3fb:	5f                   	pop    %edi
 3fc:	5d                   	pop    %ebp
 3fd:	c3                   	ret    

000003fe <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3fe:	b8 01 00 00 00       	mov    $0x1,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <exit>:
SYSCALL(exit)
 406:	b8 02 00 00 00       	mov    $0x2,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <wait>:
SYSCALL(wait)
 40e:	b8 03 00 00 00       	mov    $0x3,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <pipe>:
SYSCALL(pipe)
 416:	b8 04 00 00 00       	mov    $0x4,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <read>:
SYSCALL(read)
 41e:	b8 05 00 00 00       	mov    $0x5,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <write>:
SYSCALL(write)
 426:	b8 10 00 00 00       	mov    $0x10,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <close>:
SYSCALL(close)
 42e:	b8 15 00 00 00       	mov    $0x15,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <kill>:
SYSCALL(kill)
 436:	b8 06 00 00 00       	mov    $0x6,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <exec>:
SYSCALL(exec)
 43e:	b8 07 00 00 00       	mov    $0x7,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <open>:
SYSCALL(open)
 446:	b8 0f 00 00 00       	mov    $0xf,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <mknod>:
SYSCALL(mknod)
 44e:	b8 11 00 00 00       	mov    $0x11,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <unlink>:
SYSCALL(unlink)
 456:	b8 12 00 00 00       	mov    $0x12,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <fstat>:
SYSCALL(fstat)
 45e:	b8 08 00 00 00       	mov    $0x8,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <link>:
SYSCALL(link)
 466:	b8 13 00 00 00       	mov    $0x13,%eax
 46b:	cd 40                	int    $0x40
 46d:	c3                   	ret    

0000046e <mkdir>:
SYSCALL(mkdir)
 46e:	b8 14 00 00 00       	mov    $0x14,%eax
 473:	cd 40                	int    $0x40
 475:	c3                   	ret    

00000476 <chdir>:
SYSCALL(chdir)
 476:	b8 09 00 00 00       	mov    $0x9,%eax
 47b:	cd 40                	int    $0x40
 47d:	c3                   	ret    

0000047e <dup>:
SYSCALL(dup)
 47e:	b8 0a 00 00 00       	mov    $0xa,%eax
 483:	cd 40                	int    $0x40
 485:	c3                   	ret    

00000486 <getpid>:
SYSCALL(getpid)
 486:	b8 0b 00 00 00       	mov    $0xb,%eax
 48b:	cd 40                	int    $0x40
 48d:	c3                   	ret    

0000048e <sbrk>:
SYSCALL(sbrk)
 48e:	b8 0c 00 00 00       	mov    $0xc,%eax
 493:	cd 40                	int    $0x40
 495:	c3                   	ret    

00000496 <sleep>:
SYSCALL(sleep)
 496:	b8 0d 00 00 00       	mov    $0xd,%eax
 49b:	cd 40                	int    $0x40
 49d:	c3                   	ret    

0000049e <uptime>:
SYSCALL(uptime)
 49e:	b8 0e 00 00 00       	mov    $0xe,%eax
 4a3:	cd 40                	int    $0x40
 4a5:	c3                   	ret    

000004a6 <getpinfo>:
SYSCALL(getpinfo)
 4a6:	b8 16 00 00 00       	mov    $0x16,%eax
 4ab:	cd 40                	int    $0x40
 4ad:	c3                   	ret    

000004ae <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	83 ec 18             	sub    $0x18,%esp
 4b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b7:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4ba:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4c1:	00 
 4c2:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c9:	8b 45 08             	mov    0x8(%ebp),%eax
 4cc:	89 04 24             	mov    %eax,(%esp)
 4cf:	e8 52 ff ff ff       	call   426 <write>
}
 4d4:	c9                   	leave  
 4d5:	c3                   	ret    

000004d6 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4d6:	55                   	push   %ebp
 4d7:	89 e5                	mov    %esp,%ebp
 4d9:	56                   	push   %esi
 4da:	53                   	push   %ebx
 4db:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4de:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4e5:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4e9:	74 17                	je     502 <printint+0x2c>
 4eb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4ef:	79 11                	jns    502 <printint+0x2c>
    neg = 1;
 4f1:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 4fb:	f7 d8                	neg    %eax
 4fd:	89 45 ec             	mov    %eax,-0x14(%ebp)
 500:	eb 06                	jmp    508 <printint+0x32>
  } else {
    x = xx;
 502:	8b 45 0c             	mov    0xc(%ebp),%eax
 505:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 508:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 50f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 512:	8d 41 01             	lea    0x1(%ecx),%eax
 515:	89 45 f4             	mov    %eax,-0xc(%ebp)
 518:	8b 5d 10             	mov    0x10(%ebp),%ebx
 51b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 51e:	ba 00 00 00 00       	mov    $0x0,%edx
 523:	f7 f3                	div    %ebx
 525:	89 d0                	mov    %edx,%eax
 527:	0f b6 80 28 0c 00 00 	movzbl 0xc28(%eax),%eax
 52e:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 532:	8b 75 10             	mov    0x10(%ebp),%esi
 535:	8b 45 ec             	mov    -0x14(%ebp),%eax
 538:	ba 00 00 00 00       	mov    $0x0,%edx
 53d:	f7 f6                	div    %esi
 53f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 542:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 546:	75 c7                	jne    50f <printint+0x39>
  if(neg)
 548:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 54c:	74 10                	je     55e <printint+0x88>
    buf[i++] = '-';
 54e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 551:	8d 50 01             	lea    0x1(%eax),%edx
 554:	89 55 f4             	mov    %edx,-0xc(%ebp)
 557:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 55c:	eb 1f                	jmp    57d <printint+0xa7>
 55e:	eb 1d                	jmp    57d <printint+0xa7>
    putc(fd, buf[i]);
 560:	8d 55 dc             	lea    -0x24(%ebp),%edx
 563:	8b 45 f4             	mov    -0xc(%ebp),%eax
 566:	01 d0                	add    %edx,%eax
 568:	0f b6 00             	movzbl (%eax),%eax
 56b:	0f be c0             	movsbl %al,%eax
 56e:	89 44 24 04          	mov    %eax,0x4(%esp)
 572:	8b 45 08             	mov    0x8(%ebp),%eax
 575:	89 04 24             	mov    %eax,(%esp)
 578:	e8 31 ff ff ff       	call   4ae <putc>
  while(--i >= 0)
 57d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 581:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 585:	79 d9                	jns    560 <printint+0x8a>
}
 587:	83 c4 30             	add    $0x30,%esp
 58a:	5b                   	pop    %ebx
 58b:	5e                   	pop    %esi
 58c:	5d                   	pop    %ebp
 58d:	c3                   	ret    

0000058e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 58e:	55                   	push   %ebp
 58f:	89 e5                	mov    %esp,%ebp
 591:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 594:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 59b:	8d 45 0c             	lea    0xc(%ebp),%eax
 59e:	83 c0 04             	add    $0x4,%eax
 5a1:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5a4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5ab:	e9 7c 01 00 00       	jmp    72c <printf+0x19e>
    c = fmt[i] & 0xff;
 5b0:	8b 55 0c             	mov    0xc(%ebp),%edx
 5b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5b6:	01 d0                	add    %edx,%eax
 5b8:	0f b6 00             	movzbl (%eax),%eax
 5bb:	0f be c0             	movsbl %al,%eax
 5be:	25 ff 00 00 00       	and    $0xff,%eax
 5c3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5c6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5ca:	75 2c                	jne    5f8 <printf+0x6a>
      if(c == '%'){
 5cc:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5d0:	75 0c                	jne    5de <printf+0x50>
        state = '%';
 5d2:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5d9:	e9 4a 01 00 00       	jmp    728 <printf+0x19a>
      } else {
        putc(fd, c);
 5de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5e1:	0f be c0             	movsbl %al,%eax
 5e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e8:	8b 45 08             	mov    0x8(%ebp),%eax
 5eb:	89 04 24             	mov    %eax,(%esp)
 5ee:	e8 bb fe ff ff       	call   4ae <putc>
 5f3:	e9 30 01 00 00       	jmp    728 <printf+0x19a>
      }
    } else if(state == '%'){
 5f8:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5fc:	0f 85 26 01 00 00    	jne    728 <printf+0x19a>
      if(c == 'd'){
 602:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 606:	75 2d                	jne    635 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 608:	8b 45 e8             	mov    -0x18(%ebp),%eax
 60b:	8b 00                	mov    (%eax),%eax
 60d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 614:	00 
 615:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 61c:	00 
 61d:	89 44 24 04          	mov    %eax,0x4(%esp)
 621:	8b 45 08             	mov    0x8(%ebp),%eax
 624:	89 04 24             	mov    %eax,(%esp)
 627:	e8 aa fe ff ff       	call   4d6 <printint>
        ap++;
 62c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 630:	e9 ec 00 00 00       	jmp    721 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 635:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 639:	74 06                	je     641 <printf+0xb3>
 63b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 63f:	75 2d                	jne    66e <printf+0xe0>
        printint(fd, *ap, 16, 0);
 641:	8b 45 e8             	mov    -0x18(%ebp),%eax
 644:	8b 00                	mov    (%eax),%eax
 646:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 64d:	00 
 64e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 655:	00 
 656:	89 44 24 04          	mov    %eax,0x4(%esp)
 65a:	8b 45 08             	mov    0x8(%ebp),%eax
 65d:	89 04 24             	mov    %eax,(%esp)
 660:	e8 71 fe ff ff       	call   4d6 <printint>
        ap++;
 665:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 669:	e9 b3 00 00 00       	jmp    721 <printf+0x193>
      } else if(c == 's'){
 66e:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 672:	75 45                	jne    6b9 <printf+0x12b>
        s = (char*)*ap;
 674:	8b 45 e8             	mov    -0x18(%ebp),%eax
 677:	8b 00                	mov    (%eax),%eax
 679:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 67c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 680:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 684:	75 09                	jne    68f <printf+0x101>
          s = "(null)";
 686:	c7 45 f4 b0 09 00 00 	movl   $0x9b0,-0xc(%ebp)
        while(*s != 0){
 68d:	eb 1e                	jmp    6ad <printf+0x11f>
 68f:	eb 1c                	jmp    6ad <printf+0x11f>
          putc(fd, *s);
 691:	8b 45 f4             	mov    -0xc(%ebp),%eax
 694:	0f b6 00             	movzbl (%eax),%eax
 697:	0f be c0             	movsbl %al,%eax
 69a:	89 44 24 04          	mov    %eax,0x4(%esp)
 69e:	8b 45 08             	mov    0x8(%ebp),%eax
 6a1:	89 04 24             	mov    %eax,(%esp)
 6a4:	e8 05 fe ff ff       	call   4ae <putc>
          s++;
 6a9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6b0:	0f b6 00             	movzbl (%eax),%eax
 6b3:	84 c0                	test   %al,%al
 6b5:	75 da                	jne    691 <printf+0x103>
 6b7:	eb 68                	jmp    721 <printf+0x193>
        }
      } else if(c == 'c'){
 6b9:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6bd:	75 1d                	jne    6dc <printf+0x14e>
        putc(fd, *ap);
 6bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6c2:	8b 00                	mov    (%eax),%eax
 6c4:	0f be c0             	movsbl %al,%eax
 6c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 6cb:	8b 45 08             	mov    0x8(%ebp),%eax
 6ce:	89 04 24             	mov    %eax,(%esp)
 6d1:	e8 d8 fd ff ff       	call   4ae <putc>
        ap++;
 6d6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6da:	eb 45                	jmp    721 <printf+0x193>
      } else if(c == '%'){
 6dc:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6e0:	75 17                	jne    6f9 <printf+0x16b>
        putc(fd, c);
 6e2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e5:	0f be c0             	movsbl %al,%eax
 6e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ec:	8b 45 08             	mov    0x8(%ebp),%eax
 6ef:	89 04 24             	mov    %eax,(%esp)
 6f2:	e8 b7 fd ff ff       	call   4ae <putc>
 6f7:	eb 28                	jmp    721 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6f9:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 700:	00 
 701:	8b 45 08             	mov    0x8(%ebp),%eax
 704:	89 04 24             	mov    %eax,(%esp)
 707:	e8 a2 fd ff ff       	call   4ae <putc>
        putc(fd, c);
 70c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 70f:	0f be c0             	movsbl %al,%eax
 712:	89 44 24 04          	mov    %eax,0x4(%esp)
 716:	8b 45 08             	mov    0x8(%ebp),%eax
 719:	89 04 24             	mov    %eax,(%esp)
 71c:	e8 8d fd ff ff       	call   4ae <putc>
      }
      state = 0;
 721:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 728:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 72c:	8b 55 0c             	mov    0xc(%ebp),%edx
 72f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 732:	01 d0                	add    %edx,%eax
 734:	0f b6 00             	movzbl (%eax),%eax
 737:	84 c0                	test   %al,%al
 739:	0f 85 71 fe ff ff    	jne    5b0 <printf+0x22>
    }
  }
}
 73f:	c9                   	leave  
 740:	c3                   	ret    

00000741 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 741:	55                   	push   %ebp
 742:	89 e5                	mov    %esp,%ebp
 744:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 747:	8b 45 08             	mov    0x8(%ebp),%eax
 74a:	83 e8 08             	sub    $0x8,%eax
 74d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 750:	a1 44 0c 00 00       	mov    0xc44,%eax
 755:	89 45 fc             	mov    %eax,-0x4(%ebp)
 758:	eb 24                	jmp    77e <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 75a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75d:	8b 00                	mov    (%eax),%eax
 75f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 762:	77 12                	ja     776 <free+0x35>
 764:	8b 45 f8             	mov    -0x8(%ebp),%eax
 767:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 76a:	77 24                	ja     790 <free+0x4f>
 76c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76f:	8b 00                	mov    (%eax),%eax
 771:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 774:	77 1a                	ja     790 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 776:	8b 45 fc             	mov    -0x4(%ebp),%eax
 779:	8b 00                	mov    (%eax),%eax
 77b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 77e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 781:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 784:	76 d4                	jbe    75a <free+0x19>
 786:	8b 45 fc             	mov    -0x4(%ebp),%eax
 789:	8b 00                	mov    (%eax),%eax
 78b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 78e:	76 ca                	jbe    75a <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 790:	8b 45 f8             	mov    -0x8(%ebp),%eax
 793:	8b 40 04             	mov    0x4(%eax),%eax
 796:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 79d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a0:	01 c2                	add    %eax,%edx
 7a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a5:	8b 00                	mov    (%eax),%eax
 7a7:	39 c2                	cmp    %eax,%edx
 7a9:	75 24                	jne    7cf <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ae:	8b 50 04             	mov    0x4(%eax),%edx
 7b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b4:	8b 00                	mov    (%eax),%eax
 7b6:	8b 40 04             	mov    0x4(%eax),%eax
 7b9:	01 c2                	add    %eax,%edx
 7bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7be:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c4:	8b 00                	mov    (%eax),%eax
 7c6:	8b 10                	mov    (%eax),%edx
 7c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cb:	89 10                	mov    %edx,(%eax)
 7cd:	eb 0a                	jmp    7d9 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d2:	8b 10                	mov    (%eax),%edx
 7d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d7:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7dc:	8b 40 04             	mov    0x4(%eax),%eax
 7df:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e9:	01 d0                	add    %edx,%eax
 7eb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ee:	75 20                	jne    810 <free+0xcf>
    p->s.size += bp->s.size;
 7f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f3:	8b 50 04             	mov    0x4(%eax),%edx
 7f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f9:	8b 40 04             	mov    0x4(%eax),%eax
 7fc:	01 c2                	add    %eax,%edx
 7fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 801:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 804:	8b 45 f8             	mov    -0x8(%ebp),%eax
 807:	8b 10                	mov    (%eax),%edx
 809:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80c:	89 10                	mov    %edx,(%eax)
 80e:	eb 08                	jmp    818 <free+0xd7>
  } else
    p->s.ptr = bp;
 810:	8b 45 fc             	mov    -0x4(%ebp),%eax
 813:	8b 55 f8             	mov    -0x8(%ebp),%edx
 816:	89 10                	mov    %edx,(%eax)
  freep = p;
 818:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81b:	a3 44 0c 00 00       	mov    %eax,0xc44
}
 820:	c9                   	leave  
 821:	c3                   	ret    

00000822 <morecore>:

static Header*
morecore(uint nu)
{
 822:	55                   	push   %ebp
 823:	89 e5                	mov    %esp,%ebp
 825:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 828:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 82f:	77 07                	ja     838 <morecore+0x16>
    nu = 4096;
 831:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 838:	8b 45 08             	mov    0x8(%ebp),%eax
 83b:	c1 e0 03             	shl    $0x3,%eax
 83e:	89 04 24             	mov    %eax,(%esp)
 841:	e8 48 fc ff ff       	call   48e <sbrk>
 846:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 849:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 84d:	75 07                	jne    856 <morecore+0x34>
    return 0;
 84f:	b8 00 00 00 00       	mov    $0x0,%eax
 854:	eb 22                	jmp    878 <morecore+0x56>
  hp = (Header*)p;
 856:	8b 45 f4             	mov    -0xc(%ebp),%eax
 859:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 85c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85f:	8b 55 08             	mov    0x8(%ebp),%edx
 862:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 865:	8b 45 f0             	mov    -0x10(%ebp),%eax
 868:	83 c0 08             	add    $0x8,%eax
 86b:	89 04 24             	mov    %eax,(%esp)
 86e:	e8 ce fe ff ff       	call   741 <free>
  return freep;
 873:	a1 44 0c 00 00       	mov    0xc44,%eax
}
 878:	c9                   	leave  
 879:	c3                   	ret    

0000087a <malloc>:

void*
malloc(uint nbytes)
{
 87a:	55                   	push   %ebp
 87b:	89 e5                	mov    %esp,%ebp
 87d:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 880:	8b 45 08             	mov    0x8(%ebp),%eax
 883:	83 c0 07             	add    $0x7,%eax
 886:	c1 e8 03             	shr    $0x3,%eax
 889:	83 c0 01             	add    $0x1,%eax
 88c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 88f:	a1 44 0c 00 00       	mov    0xc44,%eax
 894:	89 45 f0             	mov    %eax,-0x10(%ebp)
 897:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 89b:	75 23                	jne    8c0 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 89d:	c7 45 f0 3c 0c 00 00 	movl   $0xc3c,-0x10(%ebp)
 8a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a7:	a3 44 0c 00 00       	mov    %eax,0xc44
 8ac:	a1 44 0c 00 00       	mov    0xc44,%eax
 8b1:	a3 3c 0c 00 00       	mov    %eax,0xc3c
    base.s.size = 0;
 8b6:	c7 05 40 0c 00 00 00 	movl   $0x0,0xc40
 8bd:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c3:	8b 00                	mov    (%eax),%eax
 8c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cb:	8b 40 04             	mov    0x4(%eax),%eax
 8ce:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8d1:	72 4d                	jb     920 <malloc+0xa6>
      if(p->s.size == nunits)
 8d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d6:	8b 40 04             	mov    0x4(%eax),%eax
 8d9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8dc:	75 0c                	jne    8ea <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e1:	8b 10                	mov    (%eax),%edx
 8e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e6:	89 10                	mov    %edx,(%eax)
 8e8:	eb 26                	jmp    910 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ed:	8b 40 04             	mov    0x4(%eax),%eax
 8f0:	2b 45 ec             	sub    -0x14(%ebp),%eax
 8f3:	89 c2                	mov    %eax,%edx
 8f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f8:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fe:	8b 40 04             	mov    0x4(%eax),%eax
 901:	c1 e0 03             	shl    $0x3,%eax
 904:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 907:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90a:	8b 55 ec             	mov    -0x14(%ebp),%edx
 90d:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 910:	8b 45 f0             	mov    -0x10(%ebp),%eax
 913:	a3 44 0c 00 00       	mov    %eax,0xc44
      return (void*)(p + 1);
 918:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91b:	83 c0 08             	add    $0x8,%eax
 91e:	eb 38                	jmp    958 <malloc+0xde>
    }
    if(p == freep)
 920:	a1 44 0c 00 00       	mov    0xc44,%eax
 925:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 928:	75 1b                	jne    945 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 92a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 92d:	89 04 24             	mov    %eax,(%esp)
 930:	e8 ed fe ff ff       	call   822 <morecore>
 935:	89 45 f4             	mov    %eax,-0xc(%ebp)
 938:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 93c:	75 07                	jne    945 <malloc+0xcb>
        return 0;
 93e:	b8 00 00 00 00       	mov    $0x0,%eax
 943:	eb 13                	jmp    958 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 945:	8b 45 f4             	mov    -0xc(%ebp),%eax
 948:	89 45 f0             	mov    %eax,-0x10(%ebp)
 94b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94e:	8b 00                	mov    (%eax),%eax
 950:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 953:	e9 70 ff ff ff       	jmp    8c8 <malloc+0x4e>
}
 958:	c9                   	leave  
 959:	c3                   	ret    
