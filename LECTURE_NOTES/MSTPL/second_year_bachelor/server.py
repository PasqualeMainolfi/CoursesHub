import socket

IP = "127.0.0.1"
PORT = 8000

# create socket
soc = socket.socket(family=socket.AF_INET, type=socket.SOCK_STREAM)

# bind ip and port
soc.bind((IP, PORT))

soc.listen(1)

print("[INFO] Waiting for connection...")

conn, addr = soc.accept()


with conn:
    print(f"[INFO] Connected to {addr}")
    while True:
        
        data = conn.recv(1024)
        
        if not data: break
        
        print(f"[CLIENT]: {data.decode()}")
        
        data = input("[SERVER] -> ")
        
        conn.send(data.encode())  

soc.close()  
    
