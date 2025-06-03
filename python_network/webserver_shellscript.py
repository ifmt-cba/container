#!/usr/bin/python3
import socket
import subprocess

HOST = '127.0.0.1'
PORT = 8080

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.bind((HOST, PORT))
    while True:
        s.listen()
        print(f"Server listening on {HOST}:{PORT}")
        conn, addr = s.accept()
        with conn:
            print('Connected by', addr)
            achou = False
            caminho = ''
            while True:
                data = conn.recv(1024)
                if not data:
                    break
                request_str = data.decode('utf-8')
                for linha in request_str.split("\n"):
                    for palavra in linha.split(" "):
                        if achou == True:
                            caminho = palavra
                            break
                        if palavra.casefold() == "GET".casefold():
                            achou = True
                    break
                print(f"Received request:\n{caminho}")
                resultado='<h1>Servidor Web Python!</h1>'
                if 'ls' in caminho:
                    comando=['ls','-l']
                    resultado = subprocess.run(comando, capture_output=True, text=True)
                    print(resultado.stdout)
                    print(f'Código de retorno: {resultado.returncode}')
                    resultado = resultado.stdout

                response = f'HTTP/1.1 200 OK\nContent-Type: text/html\n\n<html><body>{resultado}</body></html>'
                conn.sendall(response.encode('utf-8'))
                break # close after one request
