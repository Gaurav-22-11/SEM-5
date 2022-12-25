#include<stdio.h>
#include<stdlib.h>
#define NODE 5
int graph[NODE][NODE] = {
    {0, 1, 1, 1, 1},
    {1, 0, 1, 1, 0},
    {1, 1, 0, 1, 0},
    {1, 1, 1, 0, 1},
    {1, 0, 0, 1, 0}
};
int temp[NODE][NODE];
int find_start_vertex()
{
   for(int i = 0; i<NODE; i++)
   {
      int deg = 0;
      for(int j = 0; j<NODE; j++)
      {
        if(temp[i][j])
        deg++;
      }
      if(deg % 2 != 0)
      return i;
   }
   return 0;
}
int bridge(int u, int v)
{
   int deg = 0;
   for(int i = 0; i<NODE; i++)
      if(temp[v][i])
         deg++;
      if(deg>1)
      {
         return 0; 
      }
   return 1; 
}
int edgeCount()
{
   int count = 0;
   for(int i = 0; i<NODE; i++)
      for(int j = i; j<NODE; j++)
         if(temp[i][j])
            count++;
   return count; 
}
void Fleury(int start)
{
   int edge = edgeCount();
   for(int v = 0; v<NODE; v++)
   {
      if(temp[start][v])
      { 
        if(edge <= 1 || !bridge(start, v))
        {
            printf("%d--%d\n",start,v);
            temp[start][v] = temp[v][start] = 0;
            edge--; 
            Fleury(v);
        }
      }
    }
}
int main()
{
   for(int i = 0; i<NODE; i++)
   for(int j = 0; j<NODE; j++)
   temp[i][j] = graph[i][j];
   printf("Eulers path/circuit\n");
   Fleury(find_start_vertex());
}
