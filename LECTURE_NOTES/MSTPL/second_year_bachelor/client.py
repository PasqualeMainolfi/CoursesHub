import socket

IP = "127.0.0.1"
PORT = 8000

soc = socket.socket(family=socket.AF_INET, type=socket.SOCK_STREAM)

soc.connect((IP, PORT))

mes = input("[CLIENT] -> ")

while mes != "quit":
    
    soc.send(mes.encode())
    
    data = soc.recv(1024)
    
    print(f"[SERVER]: {data.decode()}")
    
    mes = input("[CLIENT] -> ")
    
soc.close()
    