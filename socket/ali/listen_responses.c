#include "netcat.h"

int main(){
    while(1){
        nclisten(10001, 0); // nclisten listens on port 10001
    }
}