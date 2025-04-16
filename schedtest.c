#include "types.h"
#include "stat.h"
#include "user.h"

void infinite_loop() {
  while(1) ;
}

int main(int argc, char *argv[]) 
{
  // print usage
  if (argc < 3 || argc > 9) 
  {
    printf(2, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]\n");
    printf(2, "     loops must be greater than 0\n");
    printf(2, "     tickets must be greater than or equal to  10\n");
    printf(2, "     up to 7 tickets can be provided\n");
    exit();
  }
  
  // get loops out of cmdline
  // and validate
  int loops = atoi(argv[1]);
  if (loops <= 0)
  {
    printf(2, "loops must be greater than 0\n");
    exit();
  }

  // get tickets out of cmdline
  // and validate
  int num_proc = argc - 2;
  int pids[7];
  int i;
  for (i = 0; i < num_proc; i++)
  {
    int tickets = atoi(argv[i+2]);
    if (tickets < 10)
    {
      printf(2, "tickets must be greater than or equal to  10\n");
      exit();
    } 
   
    // fork the child procs
    // and set their tickets
    // then infinitly loop 
    int pid = fork();
    if (pid == 0)
    {
      settickets(tickets);
      infinite_loop();
    }
    // set the pid[i] to
    // the parent pid
    else if (pid > 0)
    {
      pids[i] = pid;
    }
    else
    {
      printf(2, "Fork failed\n");
      exit();
    }
  }

  // the parent calls ps() loops 
  // number of times
  // then sleeps
  for (i = 0; i < loops; i++)
  {
    ps();
    sleep(3);
  }
 
  // kill the child processes
  for (i = 0; i < num_proc; i++)
  {
    kill(pids[i]);
  }

  // reap the child processes
  for (i = 0; i < num_proc; i++)
  {
    wait();
  }

  exit();
} 
