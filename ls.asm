
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 24             	sub    $0x24,%esp
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   7:	8b 45 08             	mov    0x8(%ebp),%eax
   a:	89 04 24             	mov    %eax,(%esp)
   d:	e8 dd 03 00 00       	call   3ef <strlen>
  12:	8b 55 08             	mov    0x8(%ebp),%edx
  15:	01 d0                	add    %edx,%eax
  17:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1a:	eb 04                	jmp    20 <fmtname+0x20>
  1c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  23:	3b 45 08             	cmp    0x8(%ebp),%eax
  26:	72 0a                	jb     32 <fmtname+0x32>
  28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2b:	0f b6 00             	movzbl (%eax),%eax
  2e:	3c 2f                	cmp    $0x2f,%al
  30:	75 ea                	jne    1c <fmtname+0x1c>
    ;
  p++;
  32:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  39:	89 04 24             	mov    %eax,(%esp)
  3c:	e8 ae 03 00 00       	call   3ef <strlen>
  41:	83 f8 0d             	cmp    $0xd,%eax
  44:	76 05                	jbe    4b <fmtname+0x4b>
    return p;
  46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  49:	eb 5f                	jmp    aa <fmtname+0xaa>
  memmove(buf, p, strlen(p));
  4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  4e:	89 04 24             	mov    %eax,(%esp)
  51:	e8 99 03 00 00       	call   3ef <strlen>
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  61:	c7 04 24 78 0f 00 00 	movl   $0xf78,(%esp)
  68:	e8 11 05 00 00       	call   57e <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  70:	89 04 24             	mov    %eax,(%esp)
  73:	e8 77 03 00 00       	call   3ef <strlen>
  78:	ba 0e 00 00 00       	mov    $0xe,%edx
  7d:	89 d3                	mov    %edx,%ebx
  7f:	29 c3                	sub    %eax,%ebx
  81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  84:	89 04 24             	mov    %eax,(%esp)
  87:	e8 63 03 00 00       	call   3ef <strlen>
  8c:	05 78 0f 00 00       	add    $0xf78,%eax
  91:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  95:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9c:	00 
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 71 03 00 00       	call   416 <memset>
  return buf;
  a5:	b8 78 0f 00 00       	mov    $0xf78,%eax
}
  aa:	83 c4 24             	add    $0x24,%esp
  ad:	5b                   	pop    %ebx
  ae:	5d                   	pop    %ebp
  af:	c3                   	ret    

000000b0 <ls>:

void
ls(char *path)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	81 ec 5c 02 00 00    	sub    $0x25c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
  bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c3:	00 
  c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c7:	89 04 24             	mov    %eax,(%esp)
  ca:	e8 43 06 00 00       	call   712 <open>
  cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  d6:	79 20                	jns    f8 <ls+0x48>
    printf(2, "ls: cannot open %s\n", path);
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	89 44 24 08          	mov    %eax,0x8(%esp)
  df:	c7 44 24 04 26 0c 00 	movl   $0xc26,0x4(%esp)
  e6:	00 
  e7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ee:	e8 67 07 00 00       	call   85a <printf>
    return;
  f3:	e9 01 02 00 00       	jmp    2f9 <ls+0x249>
  }

  if(fstat(fd, &st) < 0){
  f8:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
  fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 102:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 105:	89 04 24             	mov    %eax,(%esp)
 108:	e8 1d 06 00 00       	call   72a <fstat>
 10d:	85 c0                	test   %eax,%eax
 10f:	79 2b                	jns    13c <ls+0x8c>
    printf(2, "ls: cannot stat %s\n", path);
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	89 44 24 08          	mov    %eax,0x8(%esp)
 118:	c7 44 24 04 3a 0c 00 	movl   $0xc3a,0x4(%esp)
 11f:	00 
 120:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 127:	e8 2e 07 00 00       	call   85a <printf>
    close(fd);
 12c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 12f:	89 04 24             	mov    %eax,(%esp)
 132:	e8 c3 05 00 00       	call   6fa <close>
    return;
 137:	e9 bd 01 00 00       	jmp    2f9 <ls+0x249>
  }

  switch(st.type){
 13c:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 143:	98                   	cwtl   
 144:	83 f8 01             	cmp    $0x1,%eax
 147:	74 53                	je     19c <ls+0xec>
 149:	83 f8 02             	cmp    $0x2,%eax
 14c:	0f 85 9c 01 00 00    	jne    2ee <ls+0x23e>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 152:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 158:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 15e:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 165:	0f bf d8             	movswl %ax,%ebx
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	89 04 24             	mov    %eax,(%esp)
 16e:	e8 8d fe ff ff       	call   0 <fmtname>
 173:	89 7c 24 14          	mov    %edi,0x14(%esp)
 177:	89 74 24 10          	mov    %esi,0x10(%esp)
 17b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 17f:	89 44 24 08          	mov    %eax,0x8(%esp)
 183:	c7 44 24 04 4e 0c 00 	movl   $0xc4e,0x4(%esp)
 18a:	00 
 18b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 192:	e8 c3 06 00 00       	call   85a <printf>
    break;
 197:	e9 52 01 00 00       	jmp    2ee <ls+0x23e>

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 48 02 00 00       	call   3ef <strlen>
 1a7:	83 c0 10             	add    $0x10,%eax
 1aa:	3d 00 02 00 00       	cmp    $0x200,%eax
 1af:	76 19                	jbe    1ca <ls+0x11a>
      printf(1, "ls: path too long\n");
 1b1:	c7 44 24 04 5b 0c 00 	movl   $0xc5b,0x4(%esp)
 1b8:	00 
 1b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c0:	e8 95 06 00 00       	call   85a <printf>
      break;
 1c5:	e9 24 01 00 00       	jmp    2ee <ls+0x23e>
    }
    strcpy(buf, path);
 1ca:	8b 45 08             	mov    0x8(%ebp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1d7:	89 04 24             	mov    %eax,(%esp)
 1da:	e8 a1 01 00 00       	call   380 <strcpy>
    p = buf+strlen(buf);
 1df:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1e5:	89 04 24             	mov    %eax,(%esp)
 1e8:	e8 02 02 00 00       	call   3ef <strlen>
 1ed:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
 1f3:	01 d0                	add    %edx,%eax
 1f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1f8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1fb:	8d 50 01             	lea    0x1(%eax),%edx
 1fe:	89 55 e0             	mov    %edx,-0x20(%ebp)
 201:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 204:	e9 be 00 00 00       	jmp    2c7 <ls+0x217>
      if(de.inum == 0)
 209:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 210:	66 85 c0             	test   %ax,%ax
 213:	75 05                	jne    21a <ls+0x16a>
        continue;
 215:	e9 ad 00 00 00       	jmp    2c7 <ls+0x217>
      memmove(p, de.name, DIRSIZ);
 21a:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 221:	00 
 222:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 228:	83 c0 02             	add    $0x2,%eax
 22b:	89 44 24 04          	mov    %eax,0x4(%esp)
 22f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 232:	89 04 24             	mov    %eax,(%esp)
 235:	e8 44 03 00 00       	call   57e <memmove>
      p[DIRSIZ] = 0;
 23a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 23d:	83 c0 0e             	add    $0xe,%eax
 240:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 243:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 253:	89 04 24             	mov    %eax,(%esp)
 256:	e8 88 02 00 00       	call   4e3 <stat>
 25b:	85 c0                	test   %eax,%eax
 25d:	79 20                	jns    27f <ls+0x1cf>
        printf(1, "ls: cannot stat %s\n", buf);
 25f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 265:	89 44 24 08          	mov    %eax,0x8(%esp)
 269:	c7 44 24 04 3a 0c 00 	movl   $0xc3a,0x4(%esp)
 270:	00 
 271:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 278:	e8 dd 05 00 00       	call   85a <printf>
        continue;
 27d:	eb 48                	jmp    2c7 <ls+0x217>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 27f:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 285:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 28b:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 292:	0f bf d8             	movswl %ax,%ebx
 295:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 29b:	89 04 24             	mov    %eax,(%esp)
 29e:	e8 5d fd ff ff       	call   0 <fmtname>
 2a3:	89 7c 24 14          	mov    %edi,0x14(%esp)
 2a7:	89 74 24 10          	mov    %esi,0x10(%esp)
 2ab:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 2af:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b3:	c7 44 24 04 4e 0c 00 	movl   $0xc4e,0x4(%esp)
 2ba:	00 
 2bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c2:	e8 93 05 00 00       	call   85a <printf>
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2c7:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 2ce:	00 
 2cf:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2dc:	89 04 24             	mov    %eax,(%esp)
 2df:	e8 06 04 00 00       	call   6ea <read>
 2e4:	83 f8 10             	cmp    $0x10,%eax
 2e7:	0f 84 1c ff ff ff    	je     209 <ls+0x159>
    }
    break;
 2ed:	90                   	nop
  }
  close(fd);
 2ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2f1:	89 04 24             	mov    %eax,(%esp)
 2f4:	e8 01 04 00 00       	call   6fa <close>
}
 2f9:	81 c4 5c 02 00 00    	add    $0x25c,%esp
 2ff:	5b                   	pop    %ebx
 300:	5e                   	pop    %esi
 301:	5f                   	pop    %edi
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    

00000304 <main>:

int
main(int argc, char *argv[])
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	83 e4 f0             	and    $0xfffffff0,%esp
 30a:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
 30d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 311:	7f 11                	jg     324 <main+0x20>
    ls(".");
 313:	c7 04 24 6e 0c 00 00 	movl   $0xc6e,(%esp)
 31a:	e8 91 fd ff ff       	call   b0 <ls>
    exit();
 31f:	e8 ae 03 00 00       	call   6d2 <exit>
  }
  for(i=1; i<argc; i++)
 324:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 32b:	00 
 32c:	eb 1f                	jmp    34d <main+0x49>
    ls(argv[i]);
 32e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 332:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 339:	8b 45 0c             	mov    0xc(%ebp),%eax
 33c:	01 d0                	add    %edx,%eax
 33e:	8b 00                	mov    (%eax),%eax
 340:	89 04 24             	mov    %eax,(%esp)
 343:	e8 68 fd ff ff       	call   b0 <ls>
  for(i=1; i<argc; i++)
 348:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 34d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 351:	3b 45 08             	cmp    0x8(%ebp),%eax
 354:	7c d8                	jl     32e <main+0x2a>
  exit();
 356:	e8 77 03 00 00       	call   6d2 <exit>

0000035b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	57                   	push   %edi
 35f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 360:	8b 4d 08             	mov    0x8(%ebp),%ecx
 363:	8b 55 10             	mov    0x10(%ebp),%edx
 366:	8b 45 0c             	mov    0xc(%ebp),%eax
 369:	89 cb                	mov    %ecx,%ebx
 36b:	89 df                	mov    %ebx,%edi
 36d:	89 d1                	mov    %edx,%ecx
 36f:	fc                   	cld    
 370:	f3 aa                	rep stos %al,%es:(%edi)
 372:	89 ca                	mov    %ecx,%edx
 374:	89 fb                	mov    %edi,%ebx
 376:	89 5d 08             	mov    %ebx,0x8(%ebp)
 379:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 37c:	5b                   	pop    %ebx
 37d:	5f                   	pop    %edi
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    

00000380 <strcpy>:
#include "x86.h"
#include "pstat.h"

char*
strcpy(char *s, const char *t)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 386:	8b 45 08             	mov    0x8(%ebp),%eax
 389:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 38c:	90                   	nop
 38d:	8b 45 08             	mov    0x8(%ebp),%eax
 390:	8d 50 01             	lea    0x1(%eax),%edx
 393:	89 55 08             	mov    %edx,0x8(%ebp)
 396:	8b 55 0c             	mov    0xc(%ebp),%edx
 399:	8d 4a 01             	lea    0x1(%edx),%ecx
 39c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 39f:	0f b6 12             	movzbl (%edx),%edx
 3a2:	88 10                	mov    %dl,(%eax)
 3a4:	0f b6 00             	movzbl (%eax),%eax
 3a7:	84 c0                	test   %al,%al
 3a9:	75 e2                	jne    38d <strcpy+0xd>
    ;
  return os;
 3ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ae:	c9                   	leave  
 3af:	c3                   	ret    

000003b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3b3:	eb 08                	jmp    3bd <strcmp+0xd>
    p++, q++;
 3b5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3b9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	0f b6 00             	movzbl (%eax),%eax
 3c3:	84 c0                	test   %al,%al
 3c5:	74 10                	je     3d7 <strcmp+0x27>
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 10             	movzbl (%eax),%edx
 3cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d0:	0f b6 00             	movzbl (%eax),%eax
 3d3:	38 c2                	cmp    %al,%dl
 3d5:	74 de                	je     3b5 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3d7:	8b 45 08             	mov    0x8(%ebp),%eax
 3da:	0f b6 00             	movzbl (%eax),%eax
 3dd:	0f b6 d0             	movzbl %al,%edx
 3e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e3:	0f b6 00             	movzbl (%eax),%eax
 3e6:	0f b6 c0             	movzbl %al,%eax
 3e9:	29 c2                	sub    %eax,%edx
 3eb:	89 d0                	mov    %edx,%eax
}
 3ed:	5d                   	pop    %ebp
 3ee:	c3                   	ret    

000003ef <strlen>:

uint
strlen(const char *s)
{
 3ef:	55                   	push   %ebp
 3f0:	89 e5                	mov    %esp,%ebp
 3f2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3f5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3fc:	eb 04                	jmp    402 <strlen+0x13>
 3fe:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 402:	8b 55 fc             	mov    -0x4(%ebp),%edx
 405:	8b 45 08             	mov    0x8(%ebp),%eax
 408:	01 d0                	add    %edx,%eax
 40a:	0f b6 00             	movzbl (%eax),%eax
 40d:	84 c0                	test   %al,%al
 40f:	75 ed                	jne    3fe <strlen+0xf>
    ;
  return n;
 411:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <memset>:

void*
memset(void *dst, int c, uint n)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 41c:	8b 45 10             	mov    0x10(%ebp),%eax
 41f:	89 44 24 08          	mov    %eax,0x8(%esp)
 423:	8b 45 0c             	mov    0xc(%ebp),%eax
 426:	89 44 24 04          	mov    %eax,0x4(%esp)
 42a:	8b 45 08             	mov    0x8(%ebp),%eax
 42d:	89 04 24             	mov    %eax,(%esp)
 430:	e8 26 ff ff ff       	call   35b <stosb>
  return dst;
 435:	8b 45 08             	mov    0x8(%ebp),%eax
}
 438:	c9                   	leave  
 439:	c3                   	ret    

0000043a <strchr>:

char*
strchr(const char *s, char c)
{
 43a:	55                   	push   %ebp
 43b:	89 e5                	mov    %esp,%ebp
 43d:	83 ec 04             	sub    $0x4,%esp
 440:	8b 45 0c             	mov    0xc(%ebp),%eax
 443:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 446:	eb 14                	jmp    45c <strchr+0x22>
    if(*s == c)
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	0f b6 00             	movzbl (%eax),%eax
 44e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 451:	75 05                	jne    458 <strchr+0x1e>
      return (char*)s;
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	eb 13                	jmp    46b <strchr+0x31>
  for(; *s; s++)
 458:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 45c:	8b 45 08             	mov    0x8(%ebp),%eax
 45f:	0f b6 00             	movzbl (%eax),%eax
 462:	84 c0                	test   %al,%al
 464:	75 e2                	jne    448 <strchr+0xe>
  return 0;
 466:	b8 00 00 00 00       	mov    $0x0,%eax
}
 46b:	c9                   	leave  
 46c:	c3                   	ret    

0000046d <gets>:

char*
gets(char *buf, int max)
{
 46d:	55                   	push   %ebp
 46e:	89 e5                	mov    %esp,%ebp
 470:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 473:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 47a:	eb 4c                	jmp    4c8 <gets+0x5b>
    cc = read(0, &c, 1);
 47c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 483:	00 
 484:	8d 45 ef             	lea    -0x11(%ebp),%eax
 487:	89 44 24 04          	mov    %eax,0x4(%esp)
 48b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 492:	e8 53 02 00 00       	call   6ea <read>
 497:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 49a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 49e:	7f 02                	jg     4a2 <gets+0x35>
      break;
 4a0:	eb 31                	jmp    4d3 <gets+0x66>
    buf[i++] = c;
 4a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a5:	8d 50 01             	lea    0x1(%eax),%edx
 4a8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4ab:	89 c2                	mov    %eax,%edx
 4ad:	8b 45 08             	mov    0x8(%ebp),%eax
 4b0:	01 c2                	add    %eax,%edx
 4b2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4b6:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4b8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4bc:	3c 0a                	cmp    $0xa,%al
 4be:	74 13                	je     4d3 <gets+0x66>
 4c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c4:	3c 0d                	cmp    $0xd,%al
 4c6:	74 0b                	je     4d3 <gets+0x66>
  for(i=0; i+1 < max; ){
 4c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4cb:	83 c0 01             	add    $0x1,%eax
 4ce:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4d1:	7c a9                	jl     47c <gets+0xf>
      break;
  }
  buf[i] = '\0';
 4d3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
 4d9:	01 d0                	add    %edx,%eax
 4db:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4de:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e1:	c9                   	leave  
 4e2:	c3                   	ret    

000004e3 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e3:	55                   	push   %ebp
 4e4:	89 e5                	mov    %esp,%ebp
 4e6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4f0:	00 
 4f1:	8b 45 08             	mov    0x8(%ebp),%eax
 4f4:	89 04 24             	mov    %eax,(%esp)
 4f7:	e8 16 02 00 00       	call   712 <open>
 4fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 503:	79 07                	jns    50c <stat+0x29>
    return -1;
 505:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 50a:	eb 23                	jmp    52f <stat+0x4c>
  r = fstat(fd, st);
 50c:	8b 45 0c             	mov    0xc(%ebp),%eax
 50f:	89 44 24 04          	mov    %eax,0x4(%esp)
 513:	8b 45 f4             	mov    -0xc(%ebp),%eax
 516:	89 04 24             	mov    %eax,(%esp)
 519:	e8 0c 02 00 00       	call   72a <fstat>
 51e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 521:	8b 45 f4             	mov    -0xc(%ebp),%eax
 524:	89 04 24             	mov    %eax,(%esp)
 527:	e8 ce 01 00 00       	call   6fa <close>
  return r;
 52c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 52f:	c9                   	leave  
 530:	c3                   	ret    

00000531 <atoi>:

int
atoi(const char *s)
{
 531:	55                   	push   %ebp
 532:	89 e5                	mov    %esp,%ebp
 534:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 537:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 53e:	eb 25                	jmp    565 <atoi+0x34>
    n = n*10 + *s++ - '0';
 540:	8b 55 fc             	mov    -0x4(%ebp),%edx
 543:	89 d0                	mov    %edx,%eax
 545:	c1 e0 02             	shl    $0x2,%eax
 548:	01 d0                	add    %edx,%eax
 54a:	01 c0                	add    %eax,%eax
 54c:	89 c1                	mov    %eax,%ecx
 54e:	8b 45 08             	mov    0x8(%ebp),%eax
 551:	8d 50 01             	lea    0x1(%eax),%edx
 554:	89 55 08             	mov    %edx,0x8(%ebp)
 557:	0f b6 00             	movzbl (%eax),%eax
 55a:	0f be c0             	movsbl %al,%eax
 55d:	01 c8                	add    %ecx,%eax
 55f:	83 e8 30             	sub    $0x30,%eax
 562:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 565:	8b 45 08             	mov    0x8(%ebp),%eax
 568:	0f b6 00             	movzbl (%eax),%eax
 56b:	3c 2f                	cmp    $0x2f,%al
 56d:	7e 0a                	jle    579 <atoi+0x48>
 56f:	8b 45 08             	mov    0x8(%ebp),%eax
 572:	0f b6 00             	movzbl (%eax),%eax
 575:	3c 39                	cmp    $0x39,%al
 577:	7e c7                	jle    540 <atoi+0xf>
  return n;
 579:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 57c:	c9                   	leave  
 57d:	c3                   	ret    

0000057e <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 57e:	55                   	push   %ebp
 57f:	89 e5                	mov    %esp,%ebp
 581:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 584:	8b 45 08             	mov    0x8(%ebp),%eax
 587:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 58a:	8b 45 0c             	mov    0xc(%ebp),%eax
 58d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 590:	eb 17                	jmp    5a9 <memmove+0x2b>
    *dst++ = *src++;
 592:	8b 45 fc             	mov    -0x4(%ebp),%eax
 595:	8d 50 01             	lea    0x1(%eax),%edx
 598:	89 55 fc             	mov    %edx,-0x4(%ebp)
 59b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 59e:	8d 4a 01             	lea    0x1(%edx),%ecx
 5a1:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5a4:	0f b6 12             	movzbl (%edx),%edx
 5a7:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 5a9:	8b 45 10             	mov    0x10(%ebp),%eax
 5ac:	8d 50 ff             	lea    -0x1(%eax),%edx
 5af:	89 55 10             	mov    %edx,0x10(%ebp)
 5b2:	85 c0                	test   %eax,%eax
 5b4:	7f dc                	jg     592 <memmove+0x14>
  return vdst;
 5b6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5b9:	c9                   	leave  
 5ba:	c3                   	ret    

000005bb <ps>:

void
ps(void)
{
 5bb:	55                   	push   %ebp
 5bc:	89 e5                	mov    %esp,%ebp
 5be:	57                   	push   %edi
 5bf:	56                   	push   %esi
 5c0:	53                   	push   %ebx
 5c1:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable psinfo;
  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 5c7:	c7 44 24 04 70 0c 00 	movl   $0xc70,0x4(%esp)
 5ce:	00 
 5cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5d6:	e8 7f 02 00 00       	call   85a <printf>
  int i;
  for (i = 0; i < NPROC; i++)
 5db:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 5e2:	e9 ce 00 00 00       	jmp    6b5 <ps+0xfa>
  {
    if (psinfo[i].inuse)
 5e7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 5ea:	89 d0                	mov    %edx,%eax
 5ec:	c1 e0 03             	shl    $0x3,%eax
 5ef:	01 d0                	add    %edx,%eax
 5f1:	c1 e0 02             	shl    $0x2,%eax
 5f4:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 5f7:	01 d8                	add    %ebx,%eax
 5f9:	2d 04 09 00 00       	sub    $0x904,%eax
 5fe:	8b 00                	mov    (%eax),%eax
 600:	85 c0                	test   %eax,%eax
 602:	0f 84 a9 00 00 00    	je     6b1 <ps+0xf6>
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
         psinfo[i].pid,
         psinfo[i].tickets,
         psinfo[i].ticks,
         psinfo[i].state,
         psinfo[i].name);
 608:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 60e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 611:	89 d0                	mov    %edx,%eax
 613:	c1 e0 03             	shl    $0x3,%eax
 616:	01 d0                	add    %edx,%eax
 618:	c1 e0 02             	shl    $0x2,%eax
 61b:	83 c0 10             	add    $0x10,%eax
 61e:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
         psinfo[i].state,
 621:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 624:	89 d0                	mov    %edx,%eax
 626:	c1 e0 03             	shl    $0x3,%eax
 629:	01 d0                	add    %edx,%eax
 62b:	c1 e0 02             	shl    $0x2,%eax
 62e:	8d 75 e8             	lea    -0x18(%ebp),%esi
 631:	01 f0                	add    %esi,%eax
 633:	2d e4 08 00 00       	sub    $0x8e4,%eax
 638:	0f b6 00             	movzbl (%eax),%eax
       printf(1, "%d\t%d\t%d\t%c\t%s\n",
 63b:	0f be f0             	movsbl %al,%esi
 63e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 641:	89 d0                	mov    %edx,%eax
 643:	c1 e0 03             	shl    $0x3,%eax
 646:	01 d0                	add    %edx,%eax
 648:	c1 e0 02             	shl    $0x2,%eax
 64b:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 64e:	01 c8                	add    %ecx,%eax
 650:	2d f8 08 00 00       	sub    $0x8f8,%eax
 655:	8b 18                	mov    (%eax),%ebx
 657:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 65a:	89 d0                	mov    %edx,%eax
 65c:	c1 e0 03             	shl    $0x3,%eax
 65f:	01 d0                	add    %edx,%eax
 661:	c1 e0 02             	shl    $0x2,%eax
 664:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 667:	01 c8                	add    %ecx,%eax
 669:	2d 00 09 00 00       	sub    $0x900,%eax
 66e:	8b 08                	mov    (%eax),%ecx
 670:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 673:	89 d0                	mov    %edx,%eax
 675:	c1 e0 03             	shl    $0x3,%eax
 678:	01 d0                	add    %edx,%eax
 67a:	c1 e0 02             	shl    $0x2,%eax
 67d:	8d 55 e8             	lea    -0x18(%ebp),%edx
 680:	01 d0                	add    %edx,%eax
 682:	2d fc 08 00 00       	sub    $0x8fc,%eax
 687:	8b 00                	mov    (%eax),%eax
 689:	89 7c 24 18          	mov    %edi,0x18(%esp)
 68d:	89 74 24 14          	mov    %esi,0x14(%esp)
 691:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 695:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 699:	89 44 24 08          	mov    %eax,0x8(%esp)
 69d:	c7 44 24 04 89 0c 00 	movl   $0xc89,0x4(%esp)
 6a4:	00 
 6a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6ac:	e8 a9 01 00 00       	call   85a <printf>
  for (i = 0; i < NPROC; i++)
 6b1:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 6b5:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 6b9:	0f 8e 28 ff ff ff    	jle    5e7 <ps+0x2c>
    }
  }
}
 6bf:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 6c5:	5b                   	pop    %ebx
 6c6:	5e                   	pop    %esi
 6c7:	5f                   	pop    %edi
 6c8:	5d                   	pop    %ebp
 6c9:	c3                   	ret    

000006ca <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6ca:	b8 01 00 00 00       	mov    $0x1,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <exit>:
SYSCALL(exit)
 6d2:	b8 02 00 00 00       	mov    $0x2,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <wait>:
SYSCALL(wait)
 6da:	b8 03 00 00 00       	mov    $0x3,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <pipe>:
SYSCALL(pipe)
 6e2:	b8 04 00 00 00       	mov    $0x4,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <read>:
SYSCALL(read)
 6ea:	b8 05 00 00 00       	mov    $0x5,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <write>:
SYSCALL(write)
 6f2:	b8 10 00 00 00       	mov    $0x10,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <close>:
SYSCALL(close)
 6fa:	b8 15 00 00 00       	mov    $0x15,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <kill>:
SYSCALL(kill)
 702:	b8 06 00 00 00       	mov    $0x6,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <exec>:
SYSCALL(exec)
 70a:	b8 07 00 00 00       	mov    $0x7,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <open>:
SYSCALL(open)
 712:	b8 0f 00 00 00       	mov    $0xf,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <mknod>:
SYSCALL(mknod)
 71a:	b8 11 00 00 00       	mov    $0x11,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <unlink>:
SYSCALL(unlink)
 722:	b8 12 00 00 00       	mov    $0x12,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    

0000072a <fstat>:
SYSCALL(fstat)
 72a:	b8 08 00 00 00       	mov    $0x8,%eax
 72f:	cd 40                	int    $0x40
 731:	c3                   	ret    

00000732 <link>:
SYSCALL(link)
 732:	b8 13 00 00 00       	mov    $0x13,%eax
 737:	cd 40                	int    $0x40
 739:	c3                   	ret    

0000073a <mkdir>:
SYSCALL(mkdir)
 73a:	b8 14 00 00 00       	mov    $0x14,%eax
 73f:	cd 40                	int    $0x40
 741:	c3                   	ret    

00000742 <chdir>:
SYSCALL(chdir)
 742:	b8 09 00 00 00       	mov    $0x9,%eax
 747:	cd 40                	int    $0x40
 749:	c3                   	ret    

0000074a <dup>:
SYSCALL(dup)
 74a:	b8 0a 00 00 00       	mov    $0xa,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <getpid>:
SYSCALL(getpid)
 752:	b8 0b 00 00 00       	mov    $0xb,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <sbrk>:
SYSCALL(sbrk)
 75a:	b8 0c 00 00 00       	mov    $0xc,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <sleep>:
SYSCALL(sleep)
 762:	b8 0d 00 00 00       	mov    $0xd,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    

0000076a <uptime>:
SYSCALL(uptime)
 76a:	b8 0e 00 00 00       	mov    $0xe,%eax
 76f:	cd 40                	int    $0x40
 771:	c3                   	ret    

00000772 <getpinfo>:
SYSCALL(getpinfo)
 772:	b8 16 00 00 00       	mov    $0x16,%eax
 777:	cd 40                	int    $0x40
 779:	c3                   	ret    

0000077a <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 77a:	55                   	push   %ebp
 77b:	89 e5                	mov    %esp,%ebp
 77d:	83 ec 18             	sub    $0x18,%esp
 780:	8b 45 0c             	mov    0xc(%ebp),%eax
 783:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 786:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 78d:	00 
 78e:	8d 45 f4             	lea    -0xc(%ebp),%eax
 791:	89 44 24 04          	mov    %eax,0x4(%esp)
 795:	8b 45 08             	mov    0x8(%ebp),%eax
 798:	89 04 24             	mov    %eax,(%esp)
 79b:	e8 52 ff ff ff       	call   6f2 <write>
}
 7a0:	c9                   	leave  
 7a1:	c3                   	ret    

000007a2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7a2:	55                   	push   %ebp
 7a3:	89 e5                	mov    %esp,%ebp
 7a5:	56                   	push   %esi
 7a6:	53                   	push   %ebx
 7a7:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 7aa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 7b1:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 7b5:	74 17                	je     7ce <printint+0x2c>
 7b7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 7bb:	79 11                	jns    7ce <printint+0x2c>
    neg = 1;
 7bd:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 7c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 7c7:	f7 d8                	neg    %eax
 7c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7cc:	eb 06                	jmp    7d4 <printint+0x32>
  } else {
    x = xx;
 7ce:	8b 45 0c             	mov    0xc(%ebp),%eax
 7d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 7d4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 7db:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 7de:	8d 41 01             	lea    0x1(%ecx),%eax
 7e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7e4:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ea:	ba 00 00 00 00       	mov    $0x0,%edx
 7ef:	f7 f3                	div    %ebx
 7f1:	89 d0                	mov    %edx,%eax
 7f3:	0f b6 80 64 0f 00 00 	movzbl 0xf64(%eax),%eax
 7fa:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 7fe:	8b 75 10             	mov    0x10(%ebp),%esi
 801:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804:	ba 00 00 00 00       	mov    $0x0,%edx
 809:	f7 f6                	div    %esi
 80b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 812:	75 c7                	jne    7db <printint+0x39>
  if(neg)
 814:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 818:	74 10                	je     82a <printint+0x88>
    buf[i++] = '-';
 81a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81d:	8d 50 01             	lea    0x1(%eax),%edx
 820:	89 55 f4             	mov    %edx,-0xc(%ebp)
 823:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 828:	eb 1f                	jmp    849 <printint+0xa7>
 82a:	eb 1d                	jmp    849 <printint+0xa7>
    putc(fd, buf[i]);
 82c:	8d 55 dc             	lea    -0x24(%ebp),%edx
 82f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 832:	01 d0                	add    %edx,%eax
 834:	0f b6 00             	movzbl (%eax),%eax
 837:	0f be c0             	movsbl %al,%eax
 83a:	89 44 24 04          	mov    %eax,0x4(%esp)
 83e:	8b 45 08             	mov    0x8(%ebp),%eax
 841:	89 04 24             	mov    %eax,(%esp)
 844:	e8 31 ff ff ff       	call   77a <putc>
  while(--i >= 0)
 849:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 84d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 851:	79 d9                	jns    82c <printint+0x8a>
}
 853:	83 c4 30             	add    $0x30,%esp
 856:	5b                   	pop    %ebx
 857:	5e                   	pop    %esi
 858:	5d                   	pop    %ebp
 859:	c3                   	ret    

0000085a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 85a:	55                   	push   %ebp
 85b:	89 e5                	mov    %esp,%ebp
 85d:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 860:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 867:	8d 45 0c             	lea    0xc(%ebp),%eax
 86a:	83 c0 04             	add    $0x4,%eax
 86d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 870:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 877:	e9 7c 01 00 00       	jmp    9f8 <printf+0x19e>
    c = fmt[i] & 0xff;
 87c:	8b 55 0c             	mov    0xc(%ebp),%edx
 87f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 882:	01 d0                	add    %edx,%eax
 884:	0f b6 00             	movzbl (%eax),%eax
 887:	0f be c0             	movsbl %al,%eax
 88a:	25 ff 00 00 00       	and    $0xff,%eax
 88f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 892:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 896:	75 2c                	jne    8c4 <printf+0x6a>
      if(c == '%'){
 898:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 89c:	75 0c                	jne    8aa <printf+0x50>
        state = '%';
 89e:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 8a5:	e9 4a 01 00 00       	jmp    9f4 <printf+0x19a>
      } else {
        putc(fd, c);
 8aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8ad:	0f be c0             	movsbl %al,%eax
 8b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8b4:	8b 45 08             	mov    0x8(%ebp),%eax
 8b7:	89 04 24             	mov    %eax,(%esp)
 8ba:	e8 bb fe ff ff       	call   77a <putc>
 8bf:	e9 30 01 00 00       	jmp    9f4 <printf+0x19a>
      }
    } else if(state == '%'){
 8c4:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 8c8:	0f 85 26 01 00 00    	jne    9f4 <printf+0x19a>
      if(c == 'd'){
 8ce:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 8d2:	75 2d                	jne    901 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 8d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8d7:	8b 00                	mov    (%eax),%eax
 8d9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8e0:	00 
 8e1:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8e8:	00 
 8e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8ed:	8b 45 08             	mov    0x8(%ebp),%eax
 8f0:	89 04 24             	mov    %eax,(%esp)
 8f3:	e8 aa fe ff ff       	call   7a2 <printint>
        ap++;
 8f8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8fc:	e9 ec 00 00 00       	jmp    9ed <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 901:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 905:	74 06                	je     90d <printf+0xb3>
 907:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 90b:	75 2d                	jne    93a <printf+0xe0>
        printint(fd, *ap, 16, 0);
 90d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 910:	8b 00                	mov    (%eax),%eax
 912:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 919:	00 
 91a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 921:	00 
 922:	89 44 24 04          	mov    %eax,0x4(%esp)
 926:	8b 45 08             	mov    0x8(%ebp),%eax
 929:	89 04 24             	mov    %eax,(%esp)
 92c:	e8 71 fe ff ff       	call   7a2 <printint>
        ap++;
 931:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 935:	e9 b3 00 00 00       	jmp    9ed <printf+0x193>
      } else if(c == 's'){
 93a:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 93e:	75 45                	jne    985 <printf+0x12b>
        s = (char*)*ap;
 940:	8b 45 e8             	mov    -0x18(%ebp),%eax
 943:	8b 00                	mov    (%eax),%eax
 945:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 948:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 94c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 950:	75 09                	jne    95b <printf+0x101>
          s = "(null)";
 952:	c7 45 f4 99 0c 00 00 	movl   $0xc99,-0xc(%ebp)
        while(*s != 0){
 959:	eb 1e                	jmp    979 <printf+0x11f>
 95b:	eb 1c                	jmp    979 <printf+0x11f>
          putc(fd, *s);
 95d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 960:	0f b6 00             	movzbl (%eax),%eax
 963:	0f be c0             	movsbl %al,%eax
 966:	89 44 24 04          	mov    %eax,0x4(%esp)
 96a:	8b 45 08             	mov    0x8(%ebp),%eax
 96d:	89 04 24             	mov    %eax,(%esp)
 970:	e8 05 fe ff ff       	call   77a <putc>
          s++;
 975:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 979:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97c:	0f b6 00             	movzbl (%eax),%eax
 97f:	84 c0                	test   %al,%al
 981:	75 da                	jne    95d <printf+0x103>
 983:	eb 68                	jmp    9ed <printf+0x193>
        }
      } else if(c == 'c'){
 985:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 989:	75 1d                	jne    9a8 <printf+0x14e>
        putc(fd, *ap);
 98b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 98e:	8b 00                	mov    (%eax),%eax
 990:	0f be c0             	movsbl %al,%eax
 993:	89 44 24 04          	mov    %eax,0x4(%esp)
 997:	8b 45 08             	mov    0x8(%ebp),%eax
 99a:	89 04 24             	mov    %eax,(%esp)
 99d:	e8 d8 fd ff ff       	call   77a <putc>
        ap++;
 9a2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 9a6:	eb 45                	jmp    9ed <printf+0x193>
      } else if(c == '%'){
 9a8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 9ac:	75 17                	jne    9c5 <printf+0x16b>
        putc(fd, c);
 9ae:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9b1:	0f be c0             	movsbl %al,%eax
 9b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 9b8:	8b 45 08             	mov    0x8(%ebp),%eax
 9bb:	89 04 24             	mov    %eax,(%esp)
 9be:	e8 b7 fd ff ff       	call   77a <putc>
 9c3:	eb 28                	jmp    9ed <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9c5:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 9cc:	00 
 9cd:	8b 45 08             	mov    0x8(%ebp),%eax
 9d0:	89 04 24             	mov    %eax,(%esp)
 9d3:	e8 a2 fd ff ff       	call   77a <putc>
        putc(fd, c);
 9d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9db:	0f be c0             	movsbl %al,%eax
 9de:	89 44 24 04          	mov    %eax,0x4(%esp)
 9e2:	8b 45 08             	mov    0x8(%ebp),%eax
 9e5:	89 04 24             	mov    %eax,(%esp)
 9e8:	e8 8d fd ff ff       	call   77a <putc>
      }
      state = 0;
 9ed:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 9f4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 9f8:	8b 55 0c             	mov    0xc(%ebp),%edx
 9fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9fe:	01 d0                	add    %edx,%eax
 a00:	0f b6 00             	movzbl (%eax),%eax
 a03:	84 c0                	test   %al,%al
 a05:	0f 85 71 fe ff ff    	jne    87c <printf+0x22>
    }
  }
}
 a0b:	c9                   	leave  
 a0c:	c3                   	ret    

00000a0d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a0d:	55                   	push   %ebp
 a0e:	89 e5                	mov    %esp,%ebp
 a10:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a13:	8b 45 08             	mov    0x8(%ebp),%eax
 a16:	83 e8 08             	sub    $0x8,%eax
 a19:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a1c:	a1 90 0f 00 00       	mov    0xf90,%eax
 a21:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a24:	eb 24                	jmp    a4a <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a26:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a29:	8b 00                	mov    (%eax),%eax
 a2b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a2e:	77 12                	ja     a42 <free+0x35>
 a30:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a33:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a36:	77 24                	ja     a5c <free+0x4f>
 a38:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a3b:	8b 00                	mov    (%eax),%eax
 a3d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a40:	77 1a                	ja     a5c <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a42:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a45:	8b 00                	mov    (%eax),%eax
 a47:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a4a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a4d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a50:	76 d4                	jbe    a26 <free+0x19>
 a52:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a55:	8b 00                	mov    (%eax),%eax
 a57:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a5a:	76 ca                	jbe    a26 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a5c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a5f:	8b 40 04             	mov    0x4(%eax),%eax
 a62:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a69:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a6c:	01 c2                	add    %eax,%edx
 a6e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a71:	8b 00                	mov    (%eax),%eax
 a73:	39 c2                	cmp    %eax,%edx
 a75:	75 24                	jne    a9b <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 a77:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a7a:	8b 50 04             	mov    0x4(%eax),%edx
 a7d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a80:	8b 00                	mov    (%eax),%eax
 a82:	8b 40 04             	mov    0x4(%eax),%eax
 a85:	01 c2                	add    %eax,%edx
 a87:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a8a:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 a8d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a90:	8b 00                	mov    (%eax),%eax
 a92:	8b 10                	mov    (%eax),%edx
 a94:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a97:	89 10                	mov    %edx,(%eax)
 a99:	eb 0a                	jmp    aa5 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 a9b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a9e:	8b 10                	mov    (%eax),%edx
 aa0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aa3:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 aa5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aa8:	8b 40 04             	mov    0x4(%eax),%eax
 aab:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 ab2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab5:	01 d0                	add    %edx,%eax
 ab7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 aba:	75 20                	jne    adc <free+0xcf>
    p->s.size += bp->s.size;
 abc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 abf:	8b 50 04             	mov    0x4(%eax),%edx
 ac2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ac5:	8b 40 04             	mov    0x4(%eax),%eax
 ac8:	01 c2                	add    %eax,%edx
 aca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 acd:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 ad0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ad3:	8b 10                	mov    (%eax),%edx
 ad5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ad8:	89 10                	mov    %edx,(%eax)
 ada:	eb 08                	jmp    ae4 <free+0xd7>
  } else
    p->s.ptr = bp;
 adc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 adf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 ae2:	89 10                	mov    %edx,(%eax)
  freep = p;
 ae4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ae7:	a3 90 0f 00 00       	mov    %eax,0xf90
}
 aec:	c9                   	leave  
 aed:	c3                   	ret    

00000aee <morecore>:

static Header*
morecore(uint nu)
{
 aee:	55                   	push   %ebp
 aef:	89 e5                	mov    %esp,%ebp
 af1:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 af4:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 afb:	77 07                	ja     b04 <morecore+0x16>
    nu = 4096;
 afd:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b04:	8b 45 08             	mov    0x8(%ebp),%eax
 b07:	c1 e0 03             	shl    $0x3,%eax
 b0a:	89 04 24             	mov    %eax,(%esp)
 b0d:	e8 48 fc ff ff       	call   75a <sbrk>
 b12:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b15:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b19:	75 07                	jne    b22 <morecore+0x34>
    return 0;
 b1b:	b8 00 00 00 00       	mov    $0x0,%eax
 b20:	eb 22                	jmp    b44 <morecore+0x56>
  hp = (Header*)p;
 b22:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b25:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b28:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b2b:	8b 55 08             	mov    0x8(%ebp),%edx
 b2e:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b31:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b34:	83 c0 08             	add    $0x8,%eax
 b37:	89 04 24             	mov    %eax,(%esp)
 b3a:	e8 ce fe ff ff       	call   a0d <free>
  return freep;
 b3f:	a1 90 0f 00 00       	mov    0xf90,%eax
}
 b44:	c9                   	leave  
 b45:	c3                   	ret    

00000b46 <malloc>:

void*
malloc(uint nbytes)
{
 b46:	55                   	push   %ebp
 b47:	89 e5                	mov    %esp,%ebp
 b49:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b4c:	8b 45 08             	mov    0x8(%ebp),%eax
 b4f:	83 c0 07             	add    $0x7,%eax
 b52:	c1 e8 03             	shr    $0x3,%eax
 b55:	83 c0 01             	add    $0x1,%eax
 b58:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 b5b:	a1 90 0f 00 00       	mov    0xf90,%eax
 b60:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b63:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b67:	75 23                	jne    b8c <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 b69:	c7 45 f0 88 0f 00 00 	movl   $0xf88,-0x10(%ebp)
 b70:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b73:	a3 90 0f 00 00       	mov    %eax,0xf90
 b78:	a1 90 0f 00 00       	mov    0xf90,%eax
 b7d:	a3 88 0f 00 00       	mov    %eax,0xf88
    base.s.size = 0;
 b82:	c7 05 8c 0f 00 00 00 	movl   $0x0,0xf8c
 b89:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b8f:	8b 00                	mov    (%eax),%eax
 b91:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 b94:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b97:	8b 40 04             	mov    0x4(%eax),%eax
 b9a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 b9d:	72 4d                	jb     bec <malloc+0xa6>
      if(p->s.size == nunits)
 b9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ba2:	8b 40 04             	mov    0x4(%eax),%eax
 ba5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 ba8:	75 0c                	jne    bb6 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 baa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bad:	8b 10                	mov    (%eax),%edx
 baf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bb2:	89 10                	mov    %edx,(%eax)
 bb4:	eb 26                	jmp    bdc <malloc+0x96>
      else {
        p->s.size -= nunits;
 bb6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb9:	8b 40 04             	mov    0x4(%eax),%eax
 bbc:	2b 45 ec             	sub    -0x14(%ebp),%eax
 bbf:	89 c2                	mov    %eax,%edx
 bc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc4:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 bc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bca:	8b 40 04             	mov    0x4(%eax),%eax
 bcd:	c1 e0 03             	shl    $0x3,%eax
 bd0:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 bd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd6:	8b 55 ec             	mov    -0x14(%ebp),%edx
 bd9:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 bdc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bdf:	a3 90 0f 00 00       	mov    %eax,0xf90
      return (void*)(p + 1);
 be4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 be7:	83 c0 08             	add    $0x8,%eax
 bea:	eb 38                	jmp    c24 <malloc+0xde>
    }
    if(p == freep)
 bec:	a1 90 0f 00 00       	mov    0xf90,%eax
 bf1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 bf4:	75 1b                	jne    c11 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 bf6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bf9:	89 04 24             	mov    %eax,(%esp)
 bfc:	e8 ed fe ff ff       	call   aee <morecore>
 c01:	89 45 f4             	mov    %eax,-0xc(%ebp)
 c04:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c08:	75 07                	jne    c11 <malloc+0xcb>
        return 0;
 c0a:	b8 00 00 00 00       	mov    $0x0,%eax
 c0f:	eb 13                	jmp    c24 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c11:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c14:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c17:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c1a:	8b 00                	mov    (%eax),%eax
 c1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 c1f:	e9 70 ff ff ff       	jmp    b94 <malloc+0x4e>
}
 c24:	c9                   	leave  
 c25:	c3                   	ret    
