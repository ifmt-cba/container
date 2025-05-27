#!/usr/bin/python3
import socket

HOST = '127.0.0.1'
PORT = 80

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    s.listen()
    print(f"Server listening on {HOST}:{PORT}")
    conn, addr = s.accept()
    with conn:
        print('Connected by', addr)
        while True:
            data = conn.recv(1024)
            if not data:
                break
            request_str = data.decode('utf-8')
            print(f"Received request:\n{request_str}")

            response = 'HTTP/1.1 200 OK\nContent-Type: text/html\n\n<html><body><h1>Servidor Web Python!</h1></body></html>'
            conn.sendall(response.encode('utf-8'))
            break # close after one request
