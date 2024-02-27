# import section
import time

# main scripts

def factorial(n: int) -> int:
    if n == 0: return 1
    return factorial(n - 1) * n

def fibonacci(n: int) -> int: # O(2ˆn)
    if n == 0: return 0
    if n == 1: return 1
    return fibonacci(n - 1) + fibonacci(n - 2)
    


# main function
def main() -> None:
    f = factorial(n=5)
    n = 40
    sec = 2**n / 10**10
    m = sec / 60
    ore = m / 60
    
    start = time.time()
    for i in range(n):
        fib = fibonacci(n=i)
        print(fib, end=" ")
    print()
    end = time.time() - start
    print(f"sec: {sec}\tminuti: {m}\t ore: {ore}")
    print(f"Elapsed time: {end}")


# [MAIN PROGRAM]: if the module is being run as the main program, it calls the "main()" function
if __name__ == "__main__":
    main()