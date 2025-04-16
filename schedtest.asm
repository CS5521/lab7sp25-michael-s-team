
_schedtest:     file format elf32-i386


Disassembly of section .text:

00000000 <infinite_loop>:
#include "types.h"
#include "stat.h"
#include "user.h"

void infinite_loop() {
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
  while(1) ;
   3:	eb fe                	jmp    3 <infinite_loop+0x3>

00000005 <main>:
}

int main(int argc, char *argv[]) 
{
   5:	55                   	push   %ebp
   6:	89 e5                	mov    %esp,%ebp
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	83 ec 40             	sub    $0x40,%esp
  if (argc < 3 || argc > 9) 
   e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  12:	7e 06                	jle    1a <main+0x15>
  14:	83 7d 08 09          	cmpl   $0x9,0x8(%ebp)
  18:	7e 55                	jle    6f <main+0x6a>
  {
    printf(2, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]\n");
  1a:	c7 44 24 04 b8 0a 00 	movl   $0xab8,0x4(%esp)
  21:	00 
  22:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  29:	e8 bc 06 00 00       	call   6ea <printf>
    printf(2, "     loops must be greater than 0\n");
  2e:	c7 44 24 04 f4 0a 00 	movl   $0xaf4,0x4(%esp)
  35:	00 
  36:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  3d:	e8 a8 06 00 00       	call   6ea <printf>
    printf(2, "     tickets must be greater than or equal to  10\n");
  42:	c7 44 24 04 18 0b 00 	movl   $0xb18,0x4(%esp)
  49:	00 
  4a:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  51:	e8 94 06 00 00       	call   6ea <printf>
    printf(2, "     up to 7 tickets can be provided\n");
  56:	c7 44 24 04 4c 0b 00 	movl   $0xb4c,0x4(%esp)
  5d:	00 
  5e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  65:	e8 80 06 00 00       	call   6ea <printf>
    exit();
  6a:	e8 eb 04 00 00       	call   55a <exit>
  }

  int loops = atoi(argv[1]);
  6f:	8b 45 0c             	mov    0xc(%ebp),%eax
  72:	83 c0 04             	add    $0x4,%eax
  75:	8b 00                	mov    (%eax),%eax
  77:	89 04 24             	mov    %eax,(%esp)
  7a:	e8 2c 03 00 00       	call   3ab <atoi>
  7f:	89 44 24 38          	mov    %eax,0x38(%esp)
  if (loops <= 0)
  83:	83 7c 24 38 00       	cmpl   $0x0,0x38(%esp)
  88:	7f 19                	jg     a3 <main+0x9e>
  {
    printf(2, "loops must be greater than 0\n");
  8a:	c7 44 24 04 72 0b 00 	movl   $0xb72,0x4(%esp)
  91:	00 
  92:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  99:	e8 4c 06 00 00       	call   6ea <printf>
    exit();
  9e:	e8 b7 04 00 00       	call   55a <exit>
  }

  int num_proc = argc - 2;
  a3:	8b 45 08             	mov    0x8(%ebp),%eax
  a6:	83 e8 02             	sub    $0x2,%eax
  a9:	89 44 24 34          	mov    %eax,0x34(%esp)
  int pids[7];
  int i;
  for (i = 0; i < num_proc; i++)
  ad:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
  b4:	00 
  b5:	e9 97 00 00 00       	jmp    151 <main+0x14c>
  {
    int tickets = atoi(argv[i+2]);
  ba:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  be:	83 c0 02             	add    $0x2,%eax
  c1:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  cb:	01 d0                	add    %edx,%eax
  cd:	8b 00                	mov    (%eax),%eax
  cf:	89 04 24             	mov    %eax,(%esp)
  d2:	e8 d4 02 00 00       	call   3ab <atoi>
  d7:	89 44 24 30          	mov    %eax,0x30(%esp)
    if (tickets < 10)
  db:	83 7c 24 30 09       	cmpl   $0x9,0x30(%esp)
  e0:	7f 19                	jg     fb <main+0xf6>
    {
      printf(2, "tickets must be greater than or equal to  10\n");
  e2:	c7 44 24 04 90 0b 00 	movl   $0xb90,0x4(%esp)
  e9:	00 
  ea:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  f1:	e8 f4 05 00 00       	call   6ea <printf>
      exit();
  f6:	e8 5f 04 00 00       	call   55a <exit>
    } 
    
    int pid = fork();
  fb:	e8 52 04 00 00       	call   552 <fork>
 100:	89 44 24 2c          	mov    %eax,0x2c(%esp)
    if (pid == 0)
 104:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
 109:	75 13                	jne    11e <main+0x119>
    {
      settickets(tickets);
 10b:	8b 44 24 30          	mov    0x30(%esp),%eax
 10f:	89 04 24             	mov    %eax,(%esp)
 112:	e8 eb 04 00 00       	call   602 <settickets>
      infinite_loop();
 117:	e8 e4 fe ff ff       	call   0 <infinite_loop>
 11c:	eb 2e                	jmp    14c <main+0x147>
    }
    else if (pid > 0)
 11e:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
 123:	7e 0e                	jle    133 <main+0x12e>
    {
      pids[i] = pid;
 125:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 129:	8b 54 24 2c          	mov    0x2c(%esp),%edx
 12d:	89 54 84 10          	mov    %edx,0x10(%esp,%eax,4)
 131:	eb 19                	jmp    14c <main+0x147>
    }
    else
    {
      printf(2, "Fork failed\n");
 133:	c7 44 24 04 be 0b 00 	movl   $0xbbe,0x4(%esp)
 13a:	00 
 13b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 142:	e8 a3 05 00 00       	call   6ea <printf>
      exit();
 147:	e8 0e 04 00 00       	call   55a <exit>
  for (i = 0; i < num_proc; i++)
 14c:	83 44 24 3c 01       	addl   $0x1,0x3c(%esp)
 151:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 155:	3b 44 24 34          	cmp    0x34(%esp),%eax
 159:	0f 8c 5b ff ff ff    	jl     ba <main+0xb5>
    }
  }

  for (i = 0; i < loops; i++)
 15f:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
 166:	00 
 167:	eb 16                	jmp    17f <main+0x17a>
  {
    ps();
 169:	e8 c7 02 00 00       	call   435 <ps>
    sleep(3);
 16e:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 175:	e8 70 04 00 00       	call   5ea <sleep>
  for (i = 0; i < loops; i++)
 17a:	83 44 24 3c 01       	addl   $0x1,0x3c(%esp)
 17f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 183:	3b 44 24 38          	cmp    0x38(%esp),%eax
 187:	7c e0                	jl     169 <main+0x164>
  }

  for (i = 0; i < num_proc; i++)
 189:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
 190:	00 
 191:	eb 15                	jmp    1a8 <main+0x1a3>
  {
    kill(pids[i]);
 193:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 197:	8b 44 84 10          	mov    0x10(%esp,%eax,4),%eax
 19b:	89 04 24             	mov    %eax,(%esp)
 19e:	e8 e7 03 00 00       	call   58a <kill>
  for (i = 0; i < num_proc; i++)
 1a3:	83 44 24 3c 01       	addl   $0x1,0x3c(%esp)
 1a8:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 1ac:	3b 44 24 34          	cmp    0x34(%esp),%eax
 1b0:	7c e1                	jl     193 <main+0x18e>
  }

  for (i = 0; i < num_proc; i++)
 1b2:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
 1b9:	00 
 1ba:	eb 0a                	jmp    1c6 <main+0x1c1>
  {
    wait();
 1bc:	e8 a1 03 00 00       	call   562 <wait>
  for (i = 0; i < num_proc; i++)
 1c1:	83 44 24 3c 01       	addl   $0x1,0x3c(%esp)
 1c6:	8b 44 24 3c          	mov    0x3c(%esp),%eax
 1ca:	3b 44 24 34          	cmp    0x34(%esp),%eax
 1ce:	7c ec                	jl     1bc <main+0x1b7>
  }

  exit();
 1d0:	e8 85 03 00 00       	call   55a <exit>

000001d5 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1d5:	55                   	push   %ebp
 1d6:	89 e5                	mov    %esp,%ebp
 1d8:	57                   	push   %edi
 1d9:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1da:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1dd:	8b 55 10             	mov    0x10(%ebp),%edx
 1e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e3:	89 cb                	mov    %ecx,%ebx
 1e5:	89 df                	mov    %ebx,%edi
 1e7:	89 d1                	mov    %edx,%ecx
 1e9:	fc                   	cld    
 1ea:	f3 aa                	rep stos %al,%es:(%edi)
 1ec:	89 ca                	mov    %ecx,%edx
 1ee:	89 fb                	mov    %edi,%ebx
 1f0:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1f3:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1f6:	5b                   	pop    %ebx
 1f7:	5f                   	pop    %edi
 1f8:	5d                   	pop    %ebp
 1f9:	c3                   	ret    

000001fa <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 1fa:	55                   	push   %ebp
 1fb:	89 e5                	mov    %esp,%ebp
 1fd:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 200:	8b 45 08             	mov    0x8(%ebp),%eax
 203:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 206:	90                   	nop
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	8d 50 01             	lea    0x1(%eax),%edx
 20d:	89 55 08             	mov    %edx,0x8(%ebp)
 210:	8b 55 0c             	mov    0xc(%ebp),%edx
 213:	8d 4a 01             	lea    0x1(%edx),%ecx
 216:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 219:	0f b6 12             	movzbl (%edx),%edx
 21c:	88 10                	mov    %dl,(%eax)
 21e:	0f b6 00             	movzbl (%eax),%eax
 221:	84 c0                	test   %al,%al
 223:	75 e2                	jne    207 <strcpy+0xd>
    ;
  return os;
 225:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 228:	c9                   	leave  
 229:	c3                   	ret    

0000022a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 22a:	55                   	push   %ebp
 22b:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 22d:	eb 08                	jmp    237 <strcmp+0xd>
    p++, q++;
 22f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 233:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 00             	movzbl (%eax),%eax
 23d:	84 c0                	test   %al,%al
 23f:	74 10                	je     251 <strcmp+0x27>
 241:	8b 45 08             	mov    0x8(%ebp),%eax
 244:	0f b6 10             	movzbl (%eax),%edx
 247:	8b 45 0c             	mov    0xc(%ebp),%eax
 24a:	0f b6 00             	movzbl (%eax),%eax
 24d:	38 c2                	cmp    %al,%dl
 24f:	74 de                	je     22f <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	0f b6 00             	movzbl (%eax),%eax
 257:	0f b6 d0             	movzbl %al,%edx
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	0f b6 00             	movzbl (%eax),%eax
 260:	0f b6 c0             	movzbl %al,%eax
 263:	29 c2                	sub    %eax,%edx
 265:	89 d0                	mov    %edx,%eax
}
 267:	5d                   	pop    %ebp
 268:	c3                   	ret    

00000269 <strlen>:

uint
strlen(const char *s)
{
 269:	55                   	push   %ebp
 26a:	89 e5                	mov    %esp,%ebp
 26c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 26f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 276:	eb 04                	jmp    27c <strlen+0x13>
 278:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 27c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 27f:	8b 45 08             	mov    0x8(%ebp),%eax
 282:	01 d0                	add    %edx,%eax
 284:	0f b6 00             	movzbl (%eax),%eax
 287:	84 c0                	test   %al,%al
 289:	75 ed                	jne    278 <strlen+0xf>
    ;
  return n;
 28b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 28e:	c9                   	leave  
 28f:	c3                   	ret    

00000290 <memset>:

void*
memset(void *dst, int c, uint n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 296:	8b 45 10             	mov    0x10(%ebp),%eax
 299:	89 44 24 08          	mov    %eax,0x8(%esp)
 29d:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a4:	8b 45 08             	mov    0x8(%ebp),%eax
 2a7:	89 04 24             	mov    %eax,(%esp)
 2aa:	e8 26 ff ff ff       	call   1d5 <stosb>
  return dst;
 2af:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b2:	c9                   	leave  
 2b3:	c3                   	ret    

000002b4 <strchr>:

char*
strchr(const char *s, char c)
{
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	83 ec 04             	sub    $0x4,%esp
 2ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bd:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2c0:	eb 14                	jmp    2d6 <strchr+0x22>
    if(*s == c)
 2c2:	8b 45 08             	mov    0x8(%ebp),%eax
 2c5:	0f b6 00             	movzbl (%eax),%eax
 2c8:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2cb:	75 05                	jne    2d2 <strchr+0x1e>
      return (char*)s;
 2cd:	8b 45 08             	mov    0x8(%ebp),%eax
 2d0:	eb 13                	jmp    2e5 <strchr+0x31>
  for(; *s; s++)
 2d2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2d6:	8b 45 08             	mov    0x8(%ebp),%eax
 2d9:	0f b6 00             	movzbl (%eax),%eax
 2dc:	84 c0                	test   %al,%al
 2de:	75 e2                	jne    2c2 <strchr+0xe>
  return 0;
 2e0:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e5:	c9                   	leave  
 2e6:	c3                   	ret    

000002e7 <gets>:

char*
gets(char *buf, int max)
{
 2e7:	55                   	push   %ebp
 2e8:	89 e5                	mov    %esp,%ebp
 2ea:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2f4:	eb 4c                	jmp    342 <gets+0x5b>
    cc = read(0, &c, 1);
 2f6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2fd:	00 
 2fe:	8d 45 ef             	lea    -0x11(%ebp),%eax
 301:	89 44 24 04          	mov    %eax,0x4(%esp)
 305:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 30c:	e8 61 02 00 00       	call   572 <read>
 311:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 314:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 318:	7f 02                	jg     31c <gets+0x35>
      break;
 31a:	eb 31                	jmp    34d <gets+0x66>
    buf[i++] = c;
 31c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31f:	8d 50 01             	lea    0x1(%eax),%edx
 322:	89 55 f4             	mov    %edx,-0xc(%ebp)
 325:	89 c2                	mov    %eax,%edx
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	01 c2                	add    %eax,%edx
 32c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 330:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 332:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 336:	3c 0a                	cmp    $0xa,%al
 338:	74 13                	je     34d <gets+0x66>
 33a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33e:	3c 0d                	cmp    $0xd,%al
 340:	74 0b                	je     34d <gets+0x66>
  for(i=0; i+1 < max; ){
 342:	8b 45 f4             	mov    -0xc(%ebp),%eax
 345:	83 c0 01             	add    $0x1,%eax
 348:	3b 45 0c             	cmp    0xc(%ebp),%eax
 34b:	7c a9                	jl     2f6 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 34d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 350:	8b 45 08             	mov    0x8(%ebp),%eax
 353:	01 d0                	add    %edx,%eax
 355:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 358:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35b:	c9                   	leave  
 35c:	c3                   	ret    

0000035d <stat>:

int
stat(const char *n, struct stat *st)
{
 35d:	55                   	push   %ebp
 35e:	89 e5                	mov    %esp,%ebp
 360:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 363:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 36a:	00 
 36b:	8b 45 08             	mov    0x8(%ebp),%eax
 36e:	89 04 24             	mov    %eax,(%esp)
 371:	e8 24 02 00 00       	call   59a <open>
 376:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 379:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 37d:	79 07                	jns    386 <stat+0x29>
    return -1;
 37f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 384:	eb 23                	jmp    3a9 <stat+0x4c>
  r = fstat(fd, st);
 386:	8b 45 0c             	mov    0xc(%ebp),%eax
 389:	89 44 24 04          	mov    %eax,0x4(%esp)
 38d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 390:	89 04 24             	mov    %eax,(%esp)
 393:	e8 1a 02 00 00       	call   5b2 <fstat>
 398:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 39b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 39e:	89 04 24             	mov    %eax,(%esp)
 3a1:	e8 dc 01 00 00       	call   582 <close>
  return r;
 3a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3a9:	c9                   	leave  
 3aa:	c3                   	ret    

000003ab <atoi>:

int
atoi(const char *s)
{
 3ab:	55                   	push   %ebp
 3ac:	89 e5                	mov    %esp,%ebp
 3ae:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3b1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3b8:	eb 25                	jmp    3df <atoi+0x34>
    n = n*10 + *s++ - '0';
 3ba:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3bd:	89 d0                	mov    %edx,%eax
 3bf:	c1 e0 02             	shl    $0x2,%eax
 3c2:	01 d0                	add    %edx,%eax
 3c4:	01 c0                	add    %eax,%eax
 3c6:	89 c1                	mov    %eax,%ecx
 3c8:	8b 45 08             	mov    0x8(%ebp),%eax
 3cb:	8d 50 01             	lea    0x1(%eax),%edx
 3ce:	89 55 08             	mov    %edx,0x8(%ebp)
 3d1:	0f b6 00             	movzbl (%eax),%eax
 3d4:	0f be c0             	movsbl %al,%eax
 3d7:	01 c8                	add    %ecx,%eax
 3d9:	83 e8 30             	sub    $0x30,%eax
 3dc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3df:	8b 45 08             	mov    0x8(%ebp),%eax
 3e2:	0f b6 00             	movzbl (%eax),%eax
 3e5:	3c 2f                	cmp    $0x2f,%al
 3e7:	7e 0a                	jle    3f3 <atoi+0x48>
 3e9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ec:	0f b6 00             	movzbl (%eax),%eax
 3ef:	3c 39                	cmp    $0x39,%al
 3f1:	7e c7                	jle    3ba <atoi+0xf>
  return n;
 3f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3f6:	c9                   	leave  
 3f7:	c3                   	ret    

000003f8 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 3f8:	55                   	push   %ebp
 3f9:	89 e5                	mov    %esp,%ebp
 3fb:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 3fe:	8b 45 08             	mov    0x8(%ebp),%eax
 401:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 404:	8b 45 0c             	mov    0xc(%ebp),%eax
 407:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 40a:	eb 17                	jmp    423 <memmove+0x2b>
    *dst++ = *src++;
 40c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 40f:	8d 50 01             	lea    0x1(%eax),%edx
 412:	89 55 fc             	mov    %edx,-0x4(%ebp)
 415:	8b 55 f8             	mov    -0x8(%ebp),%edx
 418:	8d 4a 01             	lea    0x1(%edx),%ecx
 41b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 41e:	0f b6 12             	movzbl (%edx),%edx
 421:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 423:	8b 45 10             	mov    0x10(%ebp),%eax
 426:	8d 50 ff             	lea    -0x1(%eax),%edx
 429:	89 55 10             	mov    %edx,0x10(%ebp)
 42c:	85 c0                	test   %eax,%eax
 42e:	7f dc                	jg     40c <memmove+0x14>
  return vdst;
 430:	8b 45 08             	mov    0x8(%ebp),%eax
}
 433:	c9                   	leave  
 434:	c3                   	ret    

00000435 <ps>:

void
ps(void)
{
 435:	55                   	push   %ebp
 436:	89 e5                	mov    %esp,%ebp
 438:	57                   	push   %edi
 439:	56                   	push   %esi
 43a:	53                   	push   %ebx
 43b:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable psinfo;
  getpinfo(&psinfo);
 441:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 447:	89 04 24             	mov    %eax,(%esp)
 44a:	e8 ab 01 00 00       	call   5fa <getpinfo>
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 44f:	c7 44 24 04 cb 0b 00 	movl   $0xbcb,0x4(%esp)
 456:	00 
 457:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 45e:	e8 87 02 00 00       	call   6ea <printf>
  int i;
  for (i = 0; i < NPROC; i++)
 463:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 46a:	e9 ce 00 00 00       	jmp    53d <ps+0x108>
  {
    if (psinfo[i].inuse)
 46f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 472:	89 d0                	mov    %edx,%eax
 474:	c1 e0 03             	shl    $0x3,%eax
 477:	01 d0                	add    %edx,%eax
 479:	c1 e0 02             	shl    $0x2,%eax
 47c:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 47f:	01 d8                	add    %ebx,%eax
 481:	2d 04 09 00 00       	sub    $0x904,%eax
 486:	8b 00                	mov    (%eax),%eax
 488:	85 c0                	test   %eax,%eax
 48a:	0f 84 a9 00 00 00    	je     539 <ps+0x104>
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
         psinfo[i].pid,
         psinfo[i].tickets,
         psinfo[i].ticks,
         psinfo[i].state,
         psinfo[i].name);
 490:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 496:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 499:	89 d0                	mov    %edx,%eax
 49b:	c1 e0 03             	shl    $0x3,%eax
 49e:	01 d0                	add    %edx,%eax
 4a0:	c1 e0 02             	shl    $0x2,%eax
 4a3:	83 c0 10             	add    $0x10,%eax
 4a6:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
         psinfo[i].state,
 4a9:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4ac:	89 d0                	mov    %edx,%eax
 4ae:	c1 e0 03             	shl    $0x3,%eax
 4b1:	01 d0                	add    %edx,%eax
 4b3:	c1 e0 02             	shl    $0x2,%eax
 4b6:	8d 75 e8             	lea    -0x18(%ebp),%esi
 4b9:	01 f0                	add    %esi,%eax
 4bb:	2d e4 08 00 00       	sub    $0x8e4,%eax
 4c0:	0f b6 00             	movzbl (%eax),%eax
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
 4c3:	0f be f0             	movsbl %al,%esi
 4c6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4c9:	89 d0                	mov    %edx,%eax
 4cb:	c1 e0 03             	shl    $0x3,%eax
 4ce:	01 d0                	add    %edx,%eax
 4d0:	c1 e0 02             	shl    $0x2,%eax
 4d3:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4d6:	01 c8                	add    %ecx,%eax
 4d8:	2d f8 08 00 00       	sub    $0x8f8,%eax
 4dd:	8b 18                	mov    (%eax),%ebx
 4df:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4e2:	89 d0                	mov    %edx,%eax
 4e4:	c1 e0 03             	shl    $0x3,%eax
 4e7:	01 d0                	add    %edx,%eax
 4e9:	c1 e0 02             	shl    $0x2,%eax
 4ec:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 4ef:	01 c8                	add    %ecx,%eax
 4f1:	2d 00 09 00 00       	sub    $0x900,%eax
 4f6:	8b 08                	mov    (%eax),%ecx
 4f8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 4fb:	89 d0                	mov    %edx,%eax
 4fd:	c1 e0 03             	shl    $0x3,%eax
 500:	01 d0                	add    %edx,%eax
 502:	c1 e0 02             	shl    $0x2,%eax
 505:	8d 55 e8             	lea    -0x18(%ebp),%edx
 508:	01 d0                	add    %edx,%eax
 50a:	2d fc 08 00 00       	sub    $0x8fc,%eax
 50f:	8b 00                	mov    (%eax),%eax
 511:	89 7c 24 18          	mov    %edi,0x18(%esp)
 515:	89 74 24 14          	mov    %esi,0x14(%esp)
 519:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 51d:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 521:	89 44 24 08          	mov    %eax,0x8(%esp)
 525:	c7 44 24 04 e4 0b 00 	movl   $0xbe4,0x4(%esp)
 52c:	00 
 52d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 534:	e8 b1 01 00 00       	call   6ea <printf>
  for (i = 0; i < NPROC; i++)
 539:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 53d:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 541:	0f 8e 28 ff ff ff    	jle    46f <ps+0x3a>
    }
  }
}
 547:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 54d:	5b                   	pop    %ebx
 54e:	5e                   	pop    %esi
 54f:	5f                   	pop    %edi
 550:	5d                   	pop    %ebp
 551:	c3                   	ret    

00000552 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 552:	b8 01 00 00 00       	mov    $0x1,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <exit>:
SYSCALL(exit)
 55a:	b8 02 00 00 00       	mov    $0x2,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <wait>:
SYSCALL(wait)
 562:	b8 03 00 00 00       	mov    $0x3,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <pipe>:
SYSCALL(pipe)
 56a:	b8 04 00 00 00       	mov    $0x4,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <read>:
SYSCALL(read)
 572:	b8 05 00 00 00       	mov    $0x5,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <write>:
SYSCALL(write)
 57a:	b8 10 00 00 00       	mov    $0x10,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <close>:
SYSCALL(close)
 582:	b8 15 00 00 00       	mov    $0x15,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <kill>:
SYSCALL(kill)
 58a:	b8 06 00 00 00       	mov    $0x6,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <exec>:
SYSCALL(exec)
 592:	b8 07 00 00 00       	mov    $0x7,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <open>:
SYSCALL(open)
 59a:	b8 0f 00 00 00       	mov    $0xf,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <mknod>:
SYSCALL(mknod)
 5a2:	b8 11 00 00 00       	mov    $0x11,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <unlink>:
SYSCALL(unlink)
 5aa:	b8 12 00 00 00       	mov    $0x12,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <fstat>:
SYSCALL(fstat)
 5b2:	b8 08 00 00 00       	mov    $0x8,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <link>:
SYSCALL(link)
 5ba:	b8 13 00 00 00       	mov    $0x13,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <mkdir>:
SYSCALL(mkdir)
 5c2:	b8 14 00 00 00       	mov    $0x14,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <chdir>:
SYSCALL(chdir)
 5ca:	b8 09 00 00 00       	mov    $0x9,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <dup>:
SYSCALL(dup)
 5d2:	b8 0a 00 00 00       	mov    $0xa,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <getpid>:
SYSCALL(getpid)
 5da:	b8 0b 00 00 00       	mov    $0xb,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <sbrk>:
SYSCALL(sbrk)
 5e2:	b8 0c 00 00 00       	mov    $0xc,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <sleep>:
SYSCALL(sleep)
 5ea:	b8 0d 00 00 00       	mov    $0xd,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <uptime>:
SYSCALL(uptime)
 5f2:	b8 0e 00 00 00       	mov    $0xe,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <getpinfo>:
SYSCALL(getpinfo)
 5fa:	b8 16 00 00 00       	mov    $0x16,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <settickets>:
SYSCALL(settickets)
 602:	b8 17 00 00 00       	mov    $0x17,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 60a:	55                   	push   %ebp
 60b:	89 e5                	mov    %esp,%ebp
 60d:	83 ec 18             	sub    $0x18,%esp
 610:	8b 45 0c             	mov    0xc(%ebp),%eax
 613:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 616:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 61d:	00 
 61e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 621:	89 44 24 04          	mov    %eax,0x4(%esp)
 625:	8b 45 08             	mov    0x8(%ebp),%eax
 628:	89 04 24             	mov    %eax,(%esp)
 62b:	e8 4a ff ff ff       	call   57a <write>
}
 630:	c9                   	leave  
 631:	c3                   	ret    

00000632 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 632:	55                   	push   %ebp
 633:	89 e5                	mov    %esp,%ebp
 635:	56                   	push   %esi
 636:	53                   	push   %ebx
 637:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 63a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 641:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 645:	74 17                	je     65e <printint+0x2c>
 647:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 64b:	79 11                	jns    65e <printint+0x2c>
    neg = 1;
 64d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 654:	8b 45 0c             	mov    0xc(%ebp),%eax
 657:	f7 d8                	neg    %eax
 659:	89 45 ec             	mov    %eax,-0x14(%ebp)
 65c:	eb 06                	jmp    664 <printint+0x32>
  } else {
    x = xx;
 65e:	8b 45 0c             	mov    0xc(%ebp),%eax
 661:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 664:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 66b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 66e:	8d 41 01             	lea    0x1(%ecx),%eax
 671:	89 45 f4             	mov    %eax,-0xc(%ebp)
 674:	8b 5d 10             	mov    0x10(%ebp),%ebx
 677:	8b 45 ec             	mov    -0x14(%ebp),%eax
 67a:	ba 00 00 00 00       	mov    $0x0,%edx
 67f:	f7 f3                	div    %ebx
 681:	89 d0                	mov    %edx,%eax
 683:	0f b6 80 8c 0e 00 00 	movzbl 0xe8c(%eax),%eax
 68a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 68e:	8b 75 10             	mov    0x10(%ebp),%esi
 691:	8b 45 ec             	mov    -0x14(%ebp),%eax
 694:	ba 00 00 00 00       	mov    $0x0,%edx
 699:	f7 f6                	div    %esi
 69b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 69e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6a2:	75 c7                	jne    66b <printint+0x39>
  if(neg)
 6a4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6a8:	74 10                	je     6ba <printint+0x88>
    buf[i++] = '-';
 6aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ad:	8d 50 01             	lea    0x1(%eax),%edx
 6b0:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6b3:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6b8:	eb 1f                	jmp    6d9 <printint+0xa7>
 6ba:	eb 1d                	jmp    6d9 <printint+0xa7>
    putc(fd, buf[i]);
 6bc:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c2:	01 d0                	add    %edx,%eax
 6c4:	0f b6 00             	movzbl (%eax),%eax
 6c7:	0f be c0             	movsbl %al,%eax
 6ca:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ce:	8b 45 08             	mov    0x8(%ebp),%eax
 6d1:	89 04 24             	mov    %eax,(%esp)
 6d4:	e8 31 ff ff ff       	call   60a <putc>
  while(--i >= 0)
 6d9:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6e1:	79 d9                	jns    6bc <printint+0x8a>
}
 6e3:	83 c4 30             	add    $0x30,%esp
 6e6:	5b                   	pop    %ebx
 6e7:	5e                   	pop    %esi
 6e8:	5d                   	pop    %ebp
 6e9:	c3                   	ret    

000006ea <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6ea:	55                   	push   %ebp
 6eb:	89 e5                	mov    %esp,%ebp
 6ed:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6f0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6f7:	8d 45 0c             	lea    0xc(%ebp),%eax
 6fa:	83 c0 04             	add    $0x4,%eax
 6fd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 700:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 707:	e9 7c 01 00 00       	jmp    888 <printf+0x19e>
    c = fmt[i] & 0xff;
 70c:	8b 55 0c             	mov    0xc(%ebp),%edx
 70f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 712:	01 d0                	add    %edx,%eax
 714:	0f b6 00             	movzbl (%eax),%eax
 717:	0f be c0             	movsbl %al,%eax
 71a:	25 ff 00 00 00       	and    $0xff,%eax
 71f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 722:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 726:	75 2c                	jne    754 <printf+0x6a>
      if(c == '%'){
 728:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 72c:	75 0c                	jne    73a <printf+0x50>
        state = '%';
 72e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 735:	e9 4a 01 00 00       	jmp    884 <printf+0x19a>
      } else {
        putc(fd, c);
 73a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 73d:	0f be c0             	movsbl %al,%eax
 740:	89 44 24 04          	mov    %eax,0x4(%esp)
 744:	8b 45 08             	mov    0x8(%ebp),%eax
 747:	89 04 24             	mov    %eax,(%esp)
 74a:	e8 bb fe ff ff       	call   60a <putc>
 74f:	e9 30 01 00 00       	jmp    884 <printf+0x19a>
      }
    } else if(state == '%'){
 754:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 758:	0f 85 26 01 00 00    	jne    884 <printf+0x19a>
      if(c == 'd'){
 75e:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 762:	75 2d                	jne    791 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 764:	8b 45 e8             	mov    -0x18(%ebp),%eax
 767:	8b 00                	mov    (%eax),%eax
 769:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 770:	00 
 771:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 778:	00 
 779:	89 44 24 04          	mov    %eax,0x4(%esp)
 77d:	8b 45 08             	mov    0x8(%ebp),%eax
 780:	89 04 24             	mov    %eax,(%esp)
 783:	e8 aa fe ff ff       	call   632 <printint>
        ap++;
 788:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 78c:	e9 ec 00 00 00       	jmp    87d <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 791:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 795:	74 06                	je     79d <printf+0xb3>
 797:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 79b:	75 2d                	jne    7ca <printf+0xe0>
        printint(fd, *ap, 16, 0);
 79d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7a0:	8b 00                	mov    (%eax),%eax
 7a2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7a9:	00 
 7aa:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7b1:	00 
 7b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b6:	8b 45 08             	mov    0x8(%ebp),%eax
 7b9:	89 04 24             	mov    %eax,(%esp)
 7bc:	e8 71 fe ff ff       	call   632 <printint>
        ap++;
 7c1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7c5:	e9 b3 00 00 00       	jmp    87d <printf+0x193>
      } else if(c == 's'){
 7ca:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7ce:	75 45                	jne    815 <printf+0x12b>
        s = (char*)*ap;
 7d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d3:	8b 00                	mov    (%eax),%eax
 7d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7d8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7e0:	75 09                	jne    7eb <printf+0x101>
          s = "(null)";
 7e2:	c7 45 f4 f4 0b 00 00 	movl   $0xbf4,-0xc(%ebp)
        while(*s != 0){
 7e9:	eb 1e                	jmp    809 <printf+0x11f>
 7eb:	eb 1c                	jmp    809 <printf+0x11f>
          putc(fd, *s);
 7ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f0:	0f b6 00             	movzbl (%eax),%eax
 7f3:	0f be c0             	movsbl %al,%eax
 7f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 7fa:	8b 45 08             	mov    0x8(%ebp),%eax
 7fd:	89 04 24             	mov    %eax,(%esp)
 800:	e8 05 fe ff ff       	call   60a <putc>
          s++;
 805:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 809:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80c:	0f b6 00             	movzbl (%eax),%eax
 80f:	84 c0                	test   %al,%al
 811:	75 da                	jne    7ed <printf+0x103>
 813:	eb 68                	jmp    87d <printf+0x193>
        }
      } else if(c == 'c'){
 815:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 819:	75 1d                	jne    838 <printf+0x14e>
        putc(fd, *ap);
 81b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 81e:	8b 00                	mov    (%eax),%eax
 820:	0f be c0             	movsbl %al,%eax
 823:	89 44 24 04          	mov    %eax,0x4(%esp)
 827:	8b 45 08             	mov    0x8(%ebp),%eax
 82a:	89 04 24             	mov    %eax,(%esp)
 82d:	e8 d8 fd ff ff       	call   60a <putc>
        ap++;
 832:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 836:	eb 45                	jmp    87d <printf+0x193>
      } else if(c == '%'){
 838:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 83c:	75 17                	jne    855 <printf+0x16b>
        putc(fd, c);
 83e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 841:	0f be c0             	movsbl %al,%eax
 844:	89 44 24 04          	mov    %eax,0x4(%esp)
 848:	8b 45 08             	mov    0x8(%ebp),%eax
 84b:	89 04 24             	mov    %eax,(%esp)
 84e:	e8 b7 fd ff ff       	call   60a <putc>
 853:	eb 28                	jmp    87d <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 855:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 85c:	00 
 85d:	8b 45 08             	mov    0x8(%ebp),%eax
 860:	89 04 24             	mov    %eax,(%esp)
 863:	e8 a2 fd ff ff       	call   60a <putc>
        putc(fd, c);
 868:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 86b:	0f be c0             	movsbl %al,%eax
 86e:	89 44 24 04          	mov    %eax,0x4(%esp)
 872:	8b 45 08             	mov    0x8(%ebp),%eax
 875:	89 04 24             	mov    %eax,(%esp)
 878:	e8 8d fd ff ff       	call   60a <putc>
      }
      state = 0;
 87d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 884:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 888:	8b 55 0c             	mov    0xc(%ebp),%edx
 88b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88e:	01 d0                	add    %edx,%eax
 890:	0f b6 00             	movzbl (%eax),%eax
 893:	84 c0                	test   %al,%al
 895:	0f 85 71 fe ff ff    	jne    70c <printf+0x22>
    }
  }
}
 89b:	c9                   	leave  
 89c:	c3                   	ret    

0000089d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 89d:	55                   	push   %ebp
 89e:	89 e5                	mov    %esp,%ebp
 8a0:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8a3:	8b 45 08             	mov    0x8(%ebp),%eax
 8a6:	83 e8 08             	sub    $0x8,%eax
 8a9:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ac:	a1 a8 0e 00 00       	mov    0xea8,%eax
 8b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8b4:	eb 24                	jmp    8da <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b9:	8b 00                	mov    (%eax),%eax
 8bb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8be:	77 12                	ja     8d2 <free+0x35>
 8c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8c6:	77 24                	ja     8ec <free+0x4f>
 8c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8cb:	8b 00                	mov    (%eax),%eax
 8cd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8d0:	77 1a                	ja     8ec <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d5:	8b 00                	mov    (%eax),%eax
 8d7:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8dd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8e0:	76 d4                	jbe    8b6 <free+0x19>
 8e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e5:	8b 00                	mov    (%eax),%eax
 8e7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8ea:	76 ca                	jbe    8b6 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8ec:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ef:	8b 40 04             	mov    0x4(%eax),%eax
 8f2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fc:	01 c2                	add    %eax,%edx
 8fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 901:	8b 00                	mov    (%eax),%eax
 903:	39 c2                	cmp    %eax,%edx
 905:	75 24                	jne    92b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 907:	8b 45 f8             	mov    -0x8(%ebp),%eax
 90a:	8b 50 04             	mov    0x4(%eax),%edx
 90d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 910:	8b 00                	mov    (%eax),%eax
 912:	8b 40 04             	mov    0x4(%eax),%eax
 915:	01 c2                	add    %eax,%edx
 917:	8b 45 f8             	mov    -0x8(%ebp),%eax
 91a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 91d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 920:	8b 00                	mov    (%eax),%eax
 922:	8b 10                	mov    (%eax),%edx
 924:	8b 45 f8             	mov    -0x8(%ebp),%eax
 927:	89 10                	mov    %edx,(%eax)
 929:	eb 0a                	jmp    935 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 92b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92e:	8b 10                	mov    (%eax),%edx
 930:	8b 45 f8             	mov    -0x8(%ebp),%eax
 933:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 935:	8b 45 fc             	mov    -0x4(%ebp),%eax
 938:	8b 40 04             	mov    0x4(%eax),%eax
 93b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 942:	8b 45 fc             	mov    -0x4(%ebp),%eax
 945:	01 d0                	add    %edx,%eax
 947:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 94a:	75 20                	jne    96c <free+0xcf>
    p->s.size += bp->s.size;
 94c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94f:	8b 50 04             	mov    0x4(%eax),%edx
 952:	8b 45 f8             	mov    -0x8(%ebp),%eax
 955:	8b 40 04             	mov    0x4(%eax),%eax
 958:	01 c2                	add    %eax,%edx
 95a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 960:	8b 45 f8             	mov    -0x8(%ebp),%eax
 963:	8b 10                	mov    (%eax),%edx
 965:	8b 45 fc             	mov    -0x4(%ebp),%eax
 968:	89 10                	mov    %edx,(%eax)
 96a:	eb 08                	jmp    974 <free+0xd7>
  } else
    p->s.ptr = bp;
 96c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 972:	89 10                	mov    %edx,(%eax)
  freep = p;
 974:	8b 45 fc             	mov    -0x4(%ebp),%eax
 977:	a3 a8 0e 00 00       	mov    %eax,0xea8
}
 97c:	c9                   	leave  
 97d:	c3                   	ret    

0000097e <morecore>:

static Header*
morecore(uint nu)
{
 97e:	55                   	push   %ebp
 97f:	89 e5                	mov    %esp,%ebp
 981:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 984:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 98b:	77 07                	ja     994 <morecore+0x16>
    nu = 4096;
 98d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 994:	8b 45 08             	mov    0x8(%ebp),%eax
 997:	c1 e0 03             	shl    $0x3,%eax
 99a:	89 04 24             	mov    %eax,(%esp)
 99d:	e8 40 fc ff ff       	call   5e2 <sbrk>
 9a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9a5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9a9:	75 07                	jne    9b2 <morecore+0x34>
    return 0;
 9ab:	b8 00 00 00 00       	mov    $0x0,%eax
 9b0:	eb 22                	jmp    9d4 <morecore+0x56>
  hp = (Header*)p;
 9b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9bb:	8b 55 08             	mov    0x8(%ebp),%edx
 9be:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9c4:	83 c0 08             	add    $0x8,%eax
 9c7:	89 04 24             	mov    %eax,(%esp)
 9ca:	e8 ce fe ff ff       	call   89d <free>
  return freep;
 9cf:	a1 a8 0e 00 00       	mov    0xea8,%eax
}
 9d4:	c9                   	leave  
 9d5:	c3                   	ret    

000009d6 <malloc>:

void*
malloc(uint nbytes)
{
 9d6:	55                   	push   %ebp
 9d7:	89 e5                	mov    %esp,%ebp
 9d9:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9dc:	8b 45 08             	mov    0x8(%ebp),%eax
 9df:	83 c0 07             	add    $0x7,%eax
 9e2:	c1 e8 03             	shr    $0x3,%eax
 9e5:	83 c0 01             	add    $0x1,%eax
 9e8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9eb:	a1 a8 0e 00 00       	mov    0xea8,%eax
 9f0:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9f3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9f7:	75 23                	jne    a1c <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9f9:	c7 45 f0 a0 0e 00 00 	movl   $0xea0,-0x10(%ebp)
 a00:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a03:	a3 a8 0e 00 00       	mov    %eax,0xea8
 a08:	a1 a8 0e 00 00       	mov    0xea8,%eax
 a0d:	a3 a0 0e 00 00       	mov    %eax,0xea0
    base.s.size = 0;
 a12:	c7 05 a4 0e 00 00 00 	movl   $0x0,0xea4
 a19:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a1f:	8b 00                	mov    (%eax),%eax
 a21:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a24:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a27:	8b 40 04             	mov    0x4(%eax),%eax
 a2a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a2d:	72 4d                	jb     a7c <malloc+0xa6>
      if(p->s.size == nunits)
 a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a32:	8b 40 04             	mov    0x4(%eax),%eax
 a35:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a38:	75 0c                	jne    a46 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3d:	8b 10                	mov    (%eax),%edx
 a3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a42:	89 10                	mov    %edx,(%eax)
 a44:	eb 26                	jmp    a6c <malloc+0x96>
      else {
        p->s.size -= nunits;
 a46:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a49:	8b 40 04             	mov    0x4(%eax),%eax
 a4c:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a4f:	89 c2                	mov    %eax,%edx
 a51:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a54:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5a:	8b 40 04             	mov    0x4(%eax),%eax
 a5d:	c1 e0 03             	shl    $0x3,%eax
 a60:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a63:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a66:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a69:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a6c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a6f:	a3 a8 0e 00 00       	mov    %eax,0xea8
      return (void*)(p + 1);
 a74:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a77:	83 c0 08             	add    $0x8,%eax
 a7a:	eb 38                	jmp    ab4 <malloc+0xde>
    }
    if(p == freep)
 a7c:	a1 a8 0e 00 00       	mov    0xea8,%eax
 a81:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a84:	75 1b                	jne    aa1 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a86:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a89:	89 04 24             	mov    %eax,(%esp)
 a8c:	e8 ed fe ff ff       	call   97e <morecore>
 a91:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a94:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a98:	75 07                	jne    aa1 <malloc+0xcb>
        return 0;
 a9a:	b8 00 00 00 00       	mov    $0x0,%eax
 a9f:	eb 13                	jmp    ab4 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 aa7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aaa:	8b 00                	mov    (%eax),%eax
 aac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 aaf:	e9 70 ff ff ff       	jmp    a24 <malloc+0x4e>
}
 ab4:	c9                   	leave  
 ab5:	c3                   	ret    
